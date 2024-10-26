"""App de Flask para la interfaz web"""

from flask import Flask,redirect,url_for,render_template,request
from dao.clientedao import ClienteDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO, NoEsProcesableError
from dao.usuariodao import UsuarioDAO
from box.crudmanager import CrudManager
from box.cliente import Cliente
from box.usuario import Usuario

app=Flask(__name__)

def crear_sistema():
    """Crea el sistema de reservas que se usara"""
    cliente_dao = ClienteDAO()
    producto_dao = ProductoDAO()
    orden_venta_dao = OrdenVentaDAO()
    usuario_dao = UsuarioDAO()
    sistema_crud = CrudManager(cliente_dao, usuario_dao, orden_venta_dao, producto_dao)
    return sistema_crud

sistema = crear_sistema()

@app.route('/', methods=['GET', 'POST'])
def home():
    """Define la lógica para la página principal (index)"""
    if request.method == 'POST':
        cliente = sistema.get_cliente_from_string(request.form["cliente"])
        sistema.agregar_cliente(cliente)
        return render_template('iniciar_sesion.html', cliente=cliente.nombre, form={})

    clientes = sistema.listar_clientes()
    return render_template('index.html', clientes=clientes, form={})


@app.route('/iniciar_sesion', methods=['GET', 'POST'])
def iniciar_sesion():
    if request.method == 'POST':
        nombre = request.form["nombre"]
        apellido = request.form["apellido"]
        usuario = sistema.cargar_usuario_from_credentials(nombre, apellido)
        sistema.agregar_usuario(usuario)
        return redirect(url_for("cargar_productos"))

    return render_template('iniciar_sesion.html', form={})

@app.route('/cargar_productos', methods=['GET', 'POST'])
def cargar_productos():
    if request.method == 'POST':
        return render_template("comprar.html", form={})

    listado_productos, productos_baja = sistema.listar_productos()
    productos = []

    for producto in listado_productos:
        producto = sistema.get_producto_from_id(producto.id_producto)
        productos.append([producto.id_producto, producto.nombre, producto.tipo_producto,
        producto.precio_unitario, producto.estado, producto.fecha_alta])

    cliente = sistema.get_cliente_from_string(sistema.cliente)

    return render_template('cargar_productos.html', form={}, productos=productos,
    productos_baja=productos_baja, cliente=cliente.nombre, usuario=sistema.usuario)

@app.route('/comprar', methods=['GET', 'POST'])
def comprar():
    if request.method == 'POST':
        try:
            productos_cantidades = []
            for key in request.form:
                if key.startswith('cantidad_'):
                    producto_id = key.split('_')[1]
                    cantidad = request.form[key]
                    productos_cantidades.append((producto_id, int(cantidad)))

            productos_filtrados = [(producto, cantidad) for producto, cantidad in productos_cantidades if cantidad != 0]
            sistema.check_stock(productos_filtrados)

            sistema.set_productos_cantidad(productos_filtrados)

            return redirect(url_for("confirmar_compra", form={},
            productos_cantidades=productos_filtrados, usuario=sistema.usuario))

        except NoEsProcesableError as e:
            mensaje_error = f"Error: {e}"
            listado_productos,_= sistema.listar_productos()
            productos = []

            for producto in listado_productos:
                producto = sistema.get_producto_from_id(producto.id_producto)
                productos.append([producto.id_producto, producto.nombre, producto.tipo_producto,
                producto.precio_unitario])

            cliente = sistema.get_cliente_from_string(sistema.cliente)

            return render_template("comprar.html", error=mensaje_error,
            productos=productos, cliente=cliente.nombre)

    listado_productos,_= sistema.listar_productos()
    productos = []
    cliente = sistema.get_cliente_from_string(sistema.cliente)

    for producto in listado_productos:
        producto = sistema.get_producto_from_id(producto.id_producto)
        productos.append([producto.id_producto, producto.nombre, producto.tipo_producto,
        producto.precio_unitario])

    return render_template('comprar.html', form={}, productos=productos, cliente=cliente.nombre)

@app.route('/confirmar_compra', methods=['GET', 'POST'])
def confirmar_compra():
    if request.method == 'POST':
        tipo_entrega = eval(request.form["entrega"])
        id_entrega = int(tipo_entrega[0])
        id_o = sistema.realizar_orden_venta(id_entrega)
        return render_template('exito_orden.html', id_orden=id_o)

    entregas = sistema.listar_metodos_entrega()
    pagos = sistema.listar_metodos_pago()
    cliente = sistema.get_cliente_from_string(sistema.cliente)

    return render_template('confirmar_compra.html', form={},
    entregas=entregas, usuario=sistema.usuario, cliente=cliente.nombre, pagos=pagos)

@app.route('/cerrar_sesion', methods=['GET', 'POST'])
def cerrar_sesion():
    return render_template("index.html")

if __name__ == '__main__':
    app.run(port=5000,debug=True)
