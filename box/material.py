class Material:
    def __init__(self, id_item: str, nombre: str, tipo_item: str, stock: str, stock_min: str, unidad_medida: str):
        self.__id_item = id_item
        self.__nombre = nombre
        self.__tipo_item = tipo_item
        self.__stock = stock
        self.__stock_min = stock_min
        self.__unidad_medida = unidad_medida