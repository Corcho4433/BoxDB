import mysql.connector
from box.cliente import Cliente

class ClienteDAO:
    def __init__(self, password: str):
        # Contraseña del Huergo aula roja: i2i0L2aH1
        self.__db = mysql.connector.connect(user='root', password=password, host="localhost", database='boxdbmartindatabases')

    def listar_clientes(self):
        cnx = self.__db
        cursor = cnx.cursor()
        query = """SELECT idcliente, razonsocial,
        fechaingreso, estado FROM clientes;"""
        cursor.execute(query)
        clientes = cursor.fetchall()

        return [Cliente(id_cliente=row[0], nombre=row[1],
        fecha_ingreso=row[2], estado=row[3]) for row in clientes]
