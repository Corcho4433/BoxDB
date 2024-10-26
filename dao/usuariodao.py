import mysql.connector
from box.usuario import Usuario

#TODO: Error de usuario inexistente

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
            name = row[0]
            surname = row[1]

        return Usuario(name, surname)
    
    def get_id_from_usuario(self, usuario: Usuario):
        cnx = self.__db
        cursor = cnx.cursor()

        query = ("""SELECT idempleado FROM empleados
                    WHERE nombre = %s AND apellido = %s;""")
        cursor.execute(query, (usuario.nombre, usuario.apellido))

        id_usuario = cursor.fetchall()
        
        for row in id_usuario:
            usr_id = row[0]

        return usr_id