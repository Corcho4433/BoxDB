class Usuario:
    def __init__(self, nombre: str, apellido: str) -> None:
        self.__nombre = nombre
        self.__apellido = apellido

    @property
    def nombre(self):
        return self.__nombre
    
    @property
    def apellido(self):
        return self.__apellido

    def __str__(self):
        return f"{self.__nombre} {self.__apellido}"

