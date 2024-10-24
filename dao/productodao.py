from box.producto import Producto
import mysql.connector

class NoEsProcesableError(Exception):
    pass

class ProductoDAO:
    def __init__(self):
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def listar_productos(self, id_cliente: int) -> list[Producto]:
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("""SELECT IdProducto, producto, tipodetalle, PUnitario, Estado, FechaAlta
                    FROM productos
                    JOIN mastertipo ON IdTipoProducto = IdTipo
                    WHERE IdCliente = %s and Estado = %s;""")
        cursor.execute(query, (id_cliente, "A",))
        productos_inicial = cursor.fetchall()
        productos_final = []

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
    
    def check_stock(self, producto_cantidad: tuple):
        cnx = self.__db
        cursor = cnx.cursor()
        id_producto = producto_cantidad[0]
        cantidad = producto_cantidad[1]
        if cantidad != 0:
            cursor.callproc('Check_Stock_Producto_2', (id_producto, cantidad))
            for result in cursor.stored_results():
                resultado = result.fetchall()
            procesable = resultado[0][1]
            if procesable == "N":
                raise NoEsProcesableError("""No se pueden hacer las
                cantidades solicitadas en uno de los productos""")
        return None

    def __conseguir_bajas(self, id_cliente: str):
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("""SELECT IdProducto, producto, tipodetalle
                    FROM productos
                    JOIN mastertipo ON IdTipoProducto = IdTipo
                    WHERE IdCliente = %s AND Estado = %s;""")
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
