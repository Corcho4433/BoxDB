from box.cliente import Cliente
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
        self.__clientes : list = []
        self.__productos_cantidad : list = []
        self.__cargar_clientes()

    def __cargar_productos(self, id_cliente: int):
        self.__productos, self.__productos_baja = self.__producto_dao.listar_productos(id_cliente)

    def __cargar_clientes(self):
        self.__clientes = self.__cliente_dao.listar_clientes()

    @property
    def cliente(self) -> str:
        return str(self.__cliente)

    @property
    def usuario(self) -> str:
        return str(self.__usuario)

    @property
    def productos_cantidad(self) -> list:
        return self.__productos_cantidad

    def set_productos_cantidad(self, productos_cantidad: list):
        self.__productos_cantidad = productos_cantidad

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
        self.__producto_dao.check_stock(producto_cantidad)

    def listar_metodos_entrega(self):
        return self.__orden_venta_dao.listar_tipos_entrega()

    def listar_metodos_pago(self):
        return self.__orden_venta_dao.listar_tipos_pago()

    def realizar_orden_venta(self, id_entrega: int, id_pago: int) -> int:
        subtotal = 0.00
        id_cliente = self.__cliente.id_cliente
        id_usuario = self.__usuario_dao.get_id_from_usuario(self.__usuario)

        for par in self.__productos_cantidad:
            producto = self.get_producto_from_id(par[0])
            subtotal += producto.precio_unitario * par[1]

        if id_entrega == 1:
            obs = "Descuento por retiro"
            descuento = 20000.00
            total = subtotal - 20000.00
        elif id_entrega == 2:
            obs = "Suma costo de envio"
            descuento = 0.00
            total = subtotal + 20000.00
        else:
            obs = "Envio de terceros"
            descuento = 0.00
            total = subtotal

        last_id = self.__orden_venta_dao.crear_orden_venta(id_cliente, id_usuario,
        id_entrega, id_pago, subtotal, total, descuento, obs)

        item_number = 1
        for producto, cantidad in self.__productos_cantidad:
            if cantidad > 0:
                self.__orden_venta_dao.crear_orden_det(last_id, item_number, producto, cantidad)
                item_number += 1

        return last_id

    def reiniciar(self):
        self.__cliente = None
        self.__usuario = None
        self.__productos_cantidad = []
        self.__productos = []
        self.__productos_baja = []
