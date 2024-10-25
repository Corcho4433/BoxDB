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

    # Solo renderiza la página principal si es un GET
    clientes = sistema.listar_clientes()
    return render_template('index.html', clientes=clientes, form={})


@app.route('/iniciar_sesion', methods=['GET', 'POST'])
def iniciar_sesion():
    if request.method == 'POST':
        nombre = request.form["nombre"]
        apellido = request.form["apellido"]
        usuario = sistema.cargar_usuario_from_credentials(nombre, apellido)
        sistema.agregar_usuario(usuario)
        print("lolo")  # This should now show in the console
        return redirect(url_for("cargar_productos"))  # Ensure this is not redirecting unexpectedly

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

            for producto_cantidad in productos_cantidades:
                sistema.check_stock(producto_cantidad)

            sistema.set_productos_cantidad(productos_cantidades)

            return redirect(url_for("confirmar_compra", form={},
            productos_cantidades=productos_cantidades, usuario=sistema.usuario))

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
        sistema.realizar_orden_venta(id_entrega)

    entregas = sistema.listar_metodos_entrega()
    pagos = sistema.listar_metodos_pago()
    cliente = sistema.get_cliente_from_string(sistema.cliente)

    return render_template('confirmar_compra.html', form={}, cliente=sistema.cliente,
    entregas=entregas, usuario=sistema.usuario, cliente=cliente.nombre, pagos=pagos)

if __name__ == '__main__':
    app.run(port=5000,debug=True)
