"""App de Flask para la interfaz web"""

from flask import Flask,redirect,url_for,render_template,request
from dao.clientedao import ClienteDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO
from box.crudmanager import CrudManager
from dao.usuariodao import UsuarioDAO
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
        if 'cliente' in request.form:
            cliente = sistema.get_cliente_from_string(request.form["cliente"])
            sistema.agregar_cliente(cliente)
            return render_template('iniciar_sesion.html', cliente=cliente.nombre, form={})

        return render_template('index.html', clientes=sistema.listar_clientes(), form={},
        mensaje="Por favor, selecciona un cliente.")

    clientes = sistema.listar_clientes()
    return render_template('index.html', clientes=clientes, form={})

@app.route('/iniciar_sesion',methods=['GET','POST'])
def iniciar_sesion():
    if request.method=='POST':
        nombre = request.form["nombre"]
        apellido = request.form["apellido"]
        usuario = sistema.cargar_usuario_from_credentials(nombre, apellido)
        sistema.agregar_usuario(usuario)
        return render_template("cargar_productos.html", usuario=str(usuario))

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

    return render_template('cargar_productos.html', form={}, productos=productos,
    productos_baja=productos_baja, cliente=sistema.cliente)

@app.route('/comprar', methods=['GET', 'POST'])
def comprar():
    if request.method == 'POST':
        productos_cantidades = []
        for key in request.form:
            if key.startswith('cantidad_'):
                producto_id = key.split('_')[1]
                cantidad = request.form[key]
                productos_cantidades.append((producto_id, int(cantidad)))

        return render_template("comprar.html")
    
    listado_productos,_= sistema.listar_productos()
    productos = []

    for producto in listado_productos:
        producto = sistema.get_producto_from_id(producto.id_producto)
        productos.append([producto.id_producto, producto.nombre, producto.tipo_producto,
        producto.precio_unitario])

    return render_template('comprar.html', form={}, productos=productos, cliente=sistema.cliente)

if __name__ == '__main__':
    app.run(port=5000,debug=True)
