import datetime

class OrdenVenta:
    def __init__(self, id_cliente: int, id_usuario: int, id_direccion: int, id_tipo_entrega: int, subtotal: str, descuento: str, total: str, fecha: datetime, fecha_entrega: datetime, obs: str):
        self.__id_cliente = id_cliente
        self.__id_usuario = id_usuario
        self.__id_direccion = id_direccion
        self.__id_tipo_entrega = id_tipo_entrega
        self.__subtotal = subtotal
        self.__descuento = descuento
        self.__total = total
        self.__fecha = fecha
        self.__fecha_entrega = fecha_entrega
        self.__obs = obs
