import mysql.connector

class OrdenVentaDAO:
    def __init__(self):
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def crear_orden_venta(self, id_cliente: int, id_usuario: int, id_tipo_entrega: int, subtotal: float, total: float, descuento: float, obs: str):
        cnx = self.__db
        cursor = cnx.cursor()
        cursor.execute("SET @last_id = 0;")
        call_proc_query = """
            CALL Realizar_orden_venta(%s, %s, %s, %s, %s, %s, %s, @last_id);
        """
        cursor.execute(call_proc_query, [id_cliente, id_usuario, id_tipo_entrega, subtotal, descuento, total, obs])
        cursor.execute("SELECT @last_id;")
        last_id = cursor.fetchone()[0]
        cnx.commit()
        cursor.close()
        return last_id #TODO: Acordarse de mostrarlo en pantalla :3
    
    def crear_orden_det(self, id_orden: int, item: int, id_producto: str, cantidad: int):
        cnx = self.__db
        cursor = cnx.cursor()
        call_proc_query = """
            CALL Realizar_orden_venta_det(%s, %s, %s, %s);
        """
        cursor.execute(call_proc_query, [id_orden, id_producto, item, cantidad])
        cnx.commit()

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

        