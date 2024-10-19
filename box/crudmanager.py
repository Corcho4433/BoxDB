from box.cliente import Cliente
from box.producto import Producto
from box.material import Material
from box.usuario import Usuario
from dao.clientedao import ClienteDAO
from dao.materialdao import MaterialDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO
from dao.usuariodao import UsuarioDAO

class CrudManager:
    def __init__(self, cliente_dao: ClienteDAO, usuario_dao: UsuarioDAO, material_dao: MaterialDAO, orden_venta_dao: OrdenVentaDAO, producto_dao: ProductoDAO):
        self.__cliente : Cliente = None
        self.__usuario : Usuario = None
        self.__cliente_dao = cliente_dao
        self.__material_dao = material_dao
        self.__orden_venta_dao = orden_venta_dao
        self.__producto_dao = producto_dao
        self.__usuario_dao = usuario_dao
        self.__productos : list = []
        self.__materiales : list = []
        self.__clientes : list = []
        self.__cargar_clientes()

    def __cargar_productos(self, id_cliente: int):
        self.__productos = self.__producto_dao.listar_productos(id_cliente)

    def __cargar_clientes(self):
        self.__clientes = self.__cliente_dao.listar_clientes()

    @property
    def cliente(self) -> Cliente:
        return self.__cliente

    def listar_clientes(self):
        clientes_disponibles = []
        for cliente in self.__clientes:
            clientes_disponibles.append(str(cliente))
        return clientes_disponibles

    def get_cliente_from_string(self, cliente: str) -> Cliente:
        for c in self.__clientes:
            if str(cliente) == str(c):
                return self.__cliente
        return None

    def cargar_usuario_from_credentials(self, nombre: str, apellido: str):
        usuario = self.__usuario_dao.get_empleado_from_nombre(nombre, apellido)
        return usuario
    
    def get_producto_from_id(self, id: str):
        for p in self.__productos:
            if id == p.id_producto:
                return p
        return None
    
    def agregar_usuario(self, usuario: Usuario):
        self.__usuario = usuario

    def agregar_cliente(self, cliente: Cliente):
        self.__cliente = cliente
        self.cargar_productos_cliente(cliente)

    def listar_productos(self):
        productos = []
        for producto in self.__productos:
            productos.append(producto.id_producto)
        return productos

    def cargar_productos_cliente(self, cliente: Cliente):
        self.__cargar_productos(cliente.id_cliente)
