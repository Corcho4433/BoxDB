
import mysql.connector
from box.producto import Producto

class NoEsProcesableError(Exception):
    pass

class ProductoDAO:
    def __init__(self, password: str):
        self.__db = mysql.connector.connect(user='root', password=password, host="localhost", database='boxdbmartindatabases')

    def listar_productos(self, id_cliente: int) -> list[Producto]:
        cnx = self.__db
        cursor = cnx.cursor()
        query = """SELECT IdProducto, producto, tipodetalle, PUnitario, Estado, FechaAlta
                    FROM productos
                    JOIN mastertipo ON IdTipoProducto = IdTipo
                    WHERE IdCliente = %s and Estado = %s;"""
        cursor.execute(query, (id_cliente, "A",))
        productos_inicial = cursor.fetchall()
        productos_final = []

        if productos_inicial:
            for row in productos_inicial:
                self.__actualizar_precios_unitarios(row[0])
                productos_final.append(Producto(
                    idproducto=row[0],
                nombre=row[1],
                    tipo_producto=row[2],
                    precio_unitario=row[3],
                    estado=row[4],
                    fecha_alta=row[5]
                ))

        productos_baja = self.__conseguir_bajas(id_cliente)
        return productos_final, productos_baja

    def check_stock(self, productos_cantidad: tuple):
        print(productos_cantidad)
        cnx = self.__db
        cursor = cnx.cursor()
        self.__crear_tabla_temporal(cursor, cnx)
        consulta_receta = """
            SELECT iditem, SUM(cantidad * %s) AS total_cantidad
            FROM recetamateriales
            WHERE idproducto = %s
            GROUP BY iditem;
        """
        for idproducto, cantidad in productos_cantidad:
            cursor.execute(consulta_receta, (cantidad, idproducto))
            recetas = cursor.fetchall()
            for receta in recetas:
                id_item, total_cantidad = receta
                cursor.execute("SELECT total_cantidad FROM stock_check_temporal WHERE iditem = %s", 
                (id_item,))
                resultado = cursor.fetchone()

                if resultado:
                    cursor.execute("""
                        UPDATE stock_check_temporal 
                        SET total_cantidad = total_cantidad + %s 
                        WHERE iditem = %s
                    """, (total_cantidad, id_item))
                else:
                    cursor.execute("""
                        INSERT INTO stock_check_temporal (iditem, total_cantidad)
                        VALUES (%s, %s)
                    """, (id_item, total_cantidad))

        cnx.commit()
        resultados = self.__comparar_tablas_stock(cursor)
        if resultados:
            for fila in resultados:
                print(f"ID Item: {fila[0]} No alcanza el stock")
            cursor.execute("DROP TABLE IF EXISTS stock_check_temporal;")
            raise NoEsProcesableError("No alcanzan los materiales para esa orden!")
        print("Stock en orden.")
        return None

    def __comparar_tablas_stock(self, cursor):
        cursor.execute("""
            SELECT temp.iditem
            FROM stock_check_temporal temp
            JOIN almacen a ON temp.iditem = a.iditem
            WHERE (a.stock - temp.total_cantidad) < 0
            GROUP BY temp.iditem;
            """)
        return cursor.fetchall()

    def __crear_tabla_temporal(self, cursor, cnx):
        cursor.callproc("TruncateStockCheckTemporal")
        crear_tabla_temporal = """
        CREATE TABLE IF NOT EXISTS stock_check_temporal (
            iditem VARCHAR(50) PRIMARY KEY,
            total_cantidad decimal(8,2)
        );
        """
        cursor.execute(crear_tabla_temporal)
        cnx.commit()

    def __conseguir_bajas(self, id_cliente: str):
        cnx = self.__db
        cursor = cnx.cursor()
        query = """SELECT IdProducto, producto, tipodetalle
                    FROM productos
                    JOIN mastertipo ON IdTipoProducto = IdTipo
                    WHERE IdCliente = %s AND Estado = %s;"""
        cursor.execute(query, (id_cliente, "B",))
        productos = cursor.fetchall()
        return [ 
            [row[0], row[1], row[2]] for row in productos
        ]

    def __actualizar_precios_unitarios(self, idproducto: str):
        cnx = self.__db
        cursor = cnx.cursor()
        cursor.callproc('Put_Costo', (idproducto,))
        cnx.commit()
