class Producto:
    def __init__(self, idproducto: str, nombre: str, tipo_producto: str, precio_unitario: str, estado: str, fecha_alta: str):
        self.__idproducto = idproducto
        self.__nombre = nombre
        self.__tipo_producto = tipo_producto
        self.__precio_unitario = precio_unitario
        self.__estado = estado
        self.__fecha_alta = fecha_alta
