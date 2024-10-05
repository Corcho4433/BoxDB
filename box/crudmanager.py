from box.cliente import Cliente
from box.producto import Producto
from box.material import Material
from box.usuario import Usuario

class CrudManager:
    def __init__(self, cliente: Cliente, usuario: Usuario):
        self.__cliente = cliente
        self.__productos : list = []
        self.__materiales : list = []
