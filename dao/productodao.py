from box.producto import Producto
import mysql.connector

class ProductoDAO:
    def __init__(self):
        self.__db = mysql.connector.connect(user='root', password="i2i0L2aH1", host="localhost", database='boxdbmartindatabases')

    def listar_productos(self, id_cliente: int):
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("""SELECT IdProducto, producto, tipodetalle, PUnitario, Estado, FechaAlta
                    FROM productos
                    JOIN mastertipo ON IdTipoProducto = IdTipo
                    WHERE IdCliente = %s;""")
        cursor.execute(query, id_cliente)
        productos = cursor.fetchall()

        return [Producto(idproducto=row[0], nombre=row[1], tipo_producto=row[2], precio_unitario=row[3], estado=row[4], fecha_alta=row[5]) for row in productos]
