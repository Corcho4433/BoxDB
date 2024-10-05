from box.cliente import Cliente
from box.producto import Producto
from box.material import Material
from box.usuario import Usuario
from dao.clientedao import ClienteDAO
from dao.materialdao import MaterialDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO

class CrudManager:
    def __init__(self, usuario: Usuario, cliente_dao: ClienteDAO, material_dao: MaterialDAO, orden_venta_dao: OrdenVentaDAO, producto_dao: ProductoDAO):
        self.__cliente : Cliente = None
        self.__cliente_dao = cliente_dao
        self.__material_dao = material_dao
        self.__orden_venta_dao = orden_venta_dao
        self.__producto_dao = producto_dao
        self.__productos : list = []
        self.__materiales : list = []
        self.__clientes : list = []
        self.__cargar_clientes()

    def __cargar_productos(self):
        self.__productos = self.__producto_dao.listar_productos(self.__cliente.id_cliente)

    def __cargar_clientes(self):
        self.__clientes = self.__cliente_dao.listar_clientes()

    def listar_clientes(self):
        clientes_disponibles = []
        for cliente in self.__clientes:
            clientes_disponibles.append(cliente)
        return clientes_disponibles
