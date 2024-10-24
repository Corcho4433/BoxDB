import mysql.connector
from box.usuario import Usuario

#TODO: Error de usuario inexistente

class UsuarioDAO:
    def __init__(self):
        # Contraseña del Huergo: i2i0L2aH1
        self.__db = mysql.connector.connect(user='root', password="racing1996", host="localhost", database='boxdbmartindatabases')

    def get_empleado_from_nombre(self, nombre: str, apellido: str) -> Usuario:
        cnx = self.__db
        cursor = cnx.cursor()
        
        # Imprimir la consulta y los parámetros
        print(f"Consultando empleado con nombre: {nombre} y apellido: {apellido}")

        query = ("""SELECT nombre, apellido FROM empleados
                    WHERE nombre = %s AND apellido = %s;""")
        cursor.execute(query, (nombre, apellido))
        
        empleados = cursor.fetchall()

        # Imprimir el resultado de la consulta
        print(f"Resultados de la consulta: {empleados}")
        
        if not empleados:
            return None

        # Suponiendo que solo habrá un empleado con ese nombre y apellido
        for row in empleados:
            name = row[0]
            surname = row[1]
            print(f"Empleado encontrado: {name} {surname}")

        return Usuario(name, surname)

