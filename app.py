"""App de Flask para la interfaz web"""

from flask import Flask,redirect,url_for,render_template,request
from dao.clientedao import ClienteDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO, NoEsProcesableError
from dao.usuariodao import UsuarioDAO, EmpleadoNoExisteError
from box.crudmanager import CrudManager
import settings

app=Flask(__name__)

def crear_sistema():
    """Crea el sistema de reservas que se usara"""
    cliente_dao = ClienteDAO(settings.DB_PASSWORD)
    producto_dao = ProductoDAO(settings.DB_PASSWORD)
    orden_venta_dao = OrdenVentaDAO(settings.DB_PASSWORD)
    usuario_dao = UsuarioDAO(settings.DB_PASSWORD)
    sistema_crud = CrudManager(cliente_dao, usuario_dao, orden_venta_dao, producto_dao)
    return sistema_crud

sistema = crear_sistema()

@app.route('/', methods=['GET', 'POST'])
def home():
    """Define la lógica para la página principal (index)"""
    if request.method == 'POST':
        cliente = sistema.get_cliente_from_string(request.form["cliente"])
        sistema.agregar_cliente(cliente)
        return redirect(url_for('iniciar_sesion'))

    sistema.reiniciar()
    clientes = sistema.listar_clientes()
    return render_template('index.html', clientes=clientes, form={})

@app.route('/iniciar_sesion', methods=['GET', 'POST'])
def iniciar_sesion():
    if request.method == 'POST':
        try:
            nombre = request.form["nombre"]
            apellido = request.form["apellido"]
            usuario = sistema.cargar_usuario_from_credentials(nombre, apellido)
            sistema.agregar_usuario(usuario)
            return redirect(url_for("cargar_productos"))
        except EmpleadoNoExisteError as e:
            mensaje_error = f"Error: {e}"
            cliente = sistema.get_cliente_from_string(sistema.cliente)
            return render_template('iniciar_sesion.html', form={}, cliente=cliente.nombre,
            error=mensaje_error)

    cliente = sistema.get_cliente_from_string(sistema.cliente)
    return render_template('iniciar_sesion.html', form={}, cliente=cliente.nombre)

@app.route('/cargar_productos', methods=['GET', 'POST'])
def cargar_productos():
    if request.method == 'POST':
        return redirect(url_for("comprar", form={}))

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

            productos_filtrados = [(producto, cantidad) for producto,
            cantidad in productos_cantidades if cantidad != 0]
            sistema.check_stock(productos_filtrados)

            sistema.set_productos_cantidad(productos_filtrados)

            return redirect(url_for("confirmar_compra"))

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
            productos=productos, cliente=cliente.nombre, usuario=sistema.usuario)

    listado_productos,_= sistema.listar_productos()
    productos = []
    cliente = sistema.get_cliente_from_string(sistema.cliente)

    for producto in listado_productos:
        producto = sistema.get_producto_from_id(producto.id_producto)
        productos.append([producto.id_producto, producto.nombre, producto.tipo_producto,
        producto.precio_unitario])

    return render_template('comprar.html', form={}, productos=productos,
    cliente=cliente.nombre, usuario=sistema.usuario)

@app.route('/confirmar_compra', methods=['GET', 'POST'])
def confirmar_compra():
    if request.method == 'POST':
        tipo_entrega = eval(request.form["entrega"])
        id_entrega = int(tipo_entrega[0])
        tipo_pago = eval(request.form["pago"])
        id_pago = int(tipo_pago[0])
        id_o = sistema.realizar_orden_venta(id_entrega, id_pago)
        return redirect(url_for('exito_orden', id_orden=id_o))

    entregas = sistema.listar_metodos_entrega()
    pagos = sistema.listar_metodos_pago()
    cliente = sistema.get_cliente_from_string(sistema.cliente)

    return render_template('confirmar_compra.html', form={},
    entregas=entregas, usuario=sistema.usuario, cliente=cliente.nombre, pagos=pagos,
    productos_cantidad=sistema.productos_cantidad)

@app.route('/exito_orden/<int:id_orden>', methods=['GET', 'POST'])
def exito_orden(id_orden):
    return render_template("exito_orden.html", id_orden=id_orden)

if __name__ == '__main__':
    app.run(port=5000,debug=True)
