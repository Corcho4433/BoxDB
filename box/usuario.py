class Usuario:
    def __init__(self, nombre: str, apellido: str) -> None:
        self.__nombre = nombre
        self.__apellido = apellido
        self.__id_usuario = 0