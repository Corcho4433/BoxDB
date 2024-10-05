class Producto:
    def __init__(self, idproducto: str, nombre: str, tipo_producto: str, costo: str, precio_unitario: str):
        self.__idproducto = idproducto
        self.__nombre = nombre
        self.__tipo_producto = tipo_producto
        self.__costo = costo
        self.__precio_unitario = precio_unitario