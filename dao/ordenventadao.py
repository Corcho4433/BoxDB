import mysql.connector
from datetime import datetime

class OrdenVentaDAO:
    def __init__(self):
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def crear_orden_venta(self, id_cliente: int, id_usuario, id_direccion, id_tipo_entrega, subtotal, descuento, total, fecha_entrega, obs):
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("""INSERT INTO ordenesventascab (id_cliente, id_usuario, id_direccion, id_tipo_entrega, subtotal, descuento, total, fecha, fecha_entrega, obs) 
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""")

        values = (id_cliente, id_usuario, id_direccion, id_tipo_entrega, subtotal, descuento, total, datetime.today().strftime('%Y-%m-%d'), fecha_entrega, obs)

        cursor.execute(query, values)
        cnx.commit()
        cursor.close()

        return cursor.lastrowid
