import mysql.connector
from datetime import datetime

class OrdenVentaDAO:
    def __init__(self):
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def crear_orden_venta(self, id_cliente: int, id_usuario: int, id_tipo_entrega: int, subtotal: float, total: float, descuento: float, obs: str):
        cnx = self.__db
        cursor = cnx.cursor()
        cursor.callproc('Realizar_orden_venta',(id_cliente,id_usuario,id_tipo_entrega,subtotal,descuento,total,obs,))
        cnx.commit()
        cursor.close()

        return cursor.lastrowid

    def listar_tipos_entrega(self):
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("SELECT * FROM tiposentrega;")
        cursor.execute(query)
        tipos_entrega = cursor.fetchall()
        
        return [[row[0], row[1]] for row in tipos_entrega]
    
    def listar_tipos_pago(self):
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("SELECT * FROM tipospago;")
        cursor.execute(query)
        tipos_pago = cursor.fetchall()
        
        return [[row[0], row[2]] for row in tipos_pago]

        