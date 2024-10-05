import mysql.connector

class DataBase:
    def __init__(self, host, user, password, database):
        self.connection = None
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
            )
