class Producto:
    def __init__(self, idproducto: str, nombre: str, tipo_producto: str, precio_unitario: str, estado: str, fecha_alta: str):
        self.__idproducto = idproducto
        self.__nombre = nombre
        self.__tipo_producto = tipo_producto
        self.__precio_unitario = precio_unitario
        self.__estado = estado
        self.__fecha_alta = fecha_alta

    @property
    def id_producto(self):
        return self.__idproducto
    
    @property
    def nombre(self):
        return self.__nombre
    
    @property
    def tipo_producto(self):
        return self.__tipo_producto
    
    @property
    def precio_unitario(self):
        return self.__precio_unitario
    
    @property
    def estado(self):
        return self.__estado
    
    @property
    def fecha_alta(self):
        return self.__fecha_alta
