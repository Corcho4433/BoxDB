class Cliente:
    def __init__(self, id_cliente: int):
        self.__id_cliente = id_cliente

    @property
    def id_cliente(self) -> int:
        return self.__id_cliente