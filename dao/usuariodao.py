import mysql.connector
from box.usuario import Usuario

class EmpleadoNoExisteError(Exception):
    pass

class UsuarioDAO:
    def __init__(self):
        # Contraseña del Huergo aula roja: i2i0L2aH1
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def get_empleado_from_nombre(self, nombre: str, apellido: str) -> Usuario:
        cnx = self.__db
        cursor = cnx.cursor()
        query = """SELECT nombre, apellido FROM empleados
                    WHERE nombre = %s AND apellido = %s;"""
        cursor.execute(query, (nombre, apellido))
        empleados = cursor.fetchall()
        if not empleados:
            raise EmpleadoNoExisteError("El empleado solicitado no existe en el sistema")
        for row in empleados:
            name = row[0]
            surname = row[1]
        
        
        return Usuario(name, surname)

    def get_id_from_usuario(self, usuario: Usuario):
        cnx = self.__db
        cursor = cnx.cursor()
        query = """SELECT idempleado FROM empleados
                    WHERE nombre = %s AND apellido = %s;"""
        cursor.execute(query, (usuario.nombre, usuario.apellido))
        id_usuario = cursor.fetchall()
        for row in id_usuario:
            usr_id = row[0]
        
        
        return usr_id
