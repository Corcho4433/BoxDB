from box.cliente import Cliente
from box.producto import Producto
from box.material import Material
from box.usuario import Usuario
from dao.clientedao import ClienteDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO
from dao.usuariodao import UsuarioDAO


class CrudManager:
    def __init__(self, cliente_dao: ClienteDAO, usuario_dao: UsuarioDAO, orden_venta_dao: OrdenVentaDAO, producto_dao: ProductoDAO):
        self.__cliente : Cliente = None
        self.__usuario : Usuario = None
        self.__cliente_dao = cliente_dao
        self.__orden_venta_dao = orden_venta_dao
        self.__producto_dao = producto_dao
        self.__usuario_dao = usuario_dao
        self.__productos : list = []
        self.__productos_baja : list = []
        self.__materiales : list = []
        self.__clientes : list = []
        self.__cargar_clientes()

    def __cargar_productos(self, id_cliente: int):
        self.__productos, self.__productos_baja = self.__producto_dao.listar_productos(id_cliente)

    def __cargar_clientes(self):
        self.__clientes = self.__cliente_dao.listar_clientes()

    @property
    def cliente(self) -> str:
        return self.__cliente.nombre
    
    @property
    def usuario(self) -> str:
        return f"{str(self.__usuario)}"

    def listar_clientes(self):
        clientes_disponibles = []
        for cliente in self.__clientes:
            clientes_disponibles.append(str(cliente))
        return clientes_disponibles

    def get_cliente_from_string(self, cliente: str) -> Cliente:
        for c in self.__clientes:
            if str(cliente) == str(c):
                return c
        return None

    def cargar_usuario_from_credentials(self, nombre: str, apellido: str):
        return self.__usuario_dao.get_empleado_from_nombre(nombre, apellido)
    
    def get_producto_from_id(self, id: str):
        for p in self.__productos:
            if id == p.id_producto:
                return p
        return None
    
    def agregar_usuario(self, usuario: Usuario):
        self.__usuario = usuario

    def agregar_cliente(self, cliente: Cliente):
        self.__cliente = cliente
        self.__cargar_productos(cliente.id_cliente)

    def listar_productos(self):
        productos = []
        for producto in self.__productos:
            productos.append(producto)
        return productos, self.__productos_baja

    def check_stock(self, producto_cantidad: tuple):
        return self.__producto_dao.check_stock(producto_cantidad)
