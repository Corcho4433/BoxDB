class Usuario:
    def __init__(self, nombre: str, apellido: str) -> None:
        self.__nombre = nombre
        self.__apellido = apellido

    def __str__(self):
        return f"{self.__nombre} {self.__apellido}"

