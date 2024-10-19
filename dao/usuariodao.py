import mysql.connector
from box.usuario import Usuario

class UsuarioDAO:
    def __init__(self):
        # Contraseña del Huergo: i2i0L2aH1
        self.__db = mysql.connector.connect(user='root', password="i2i0L2aH1", host="localhost", database='boxdbmartindatabases')

    def get_empleado_from_nombre(self, nombre: str, apellido: str) -> Usuario:
        cnx = self.__db
        cursor = cnx.cursor()
        query = ("""SELECT nombre, apellido FROM empleados
                    WHERE nombre = %s AND apellido = %s;""")
        cursor.execute(query, (nombre, apellido))
        empleados = cursor.fetchall()
        
        if not empleados:
            return None 

        for row in empleados:
            nombre = row[0]
            apellido = row[1]
        return Usuario(nombre, apellido)

