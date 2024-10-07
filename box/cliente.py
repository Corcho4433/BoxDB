class Cliente:
    def __init__(self, id_cliente: int, nombre: str, fecha_ingreso: str, estado: str):
        self.__id_cliente = id_cliente
        self.__nombre = nombre
        self.__fecha_ingreso = fecha_ingreso
        self.__estado = estado

    def __str__(self):
        return f"Cliente con Id {self.__id_cliente} de nombre {self.__nombre}"

    @property
    def id_cliente(self) -> int:
        return self.__id_cliente

    @property
    def nombre(self) -> str:
        return self.__nombre
    
    @property
    def fecha_ingreso(self):
        return self.__fecha_ingreso
    
    @property
    def estado(self):
        return self.__estado