"""App de Flask para la interfaz web"""

from flask import Flask,redirect,url_for,render_template,request
from dao.clientedao import ClienteDAO
from dao.materialdao import MaterialDAO
from dao.ordenventadao import OrdenVentaDAO
from dao.productodao import ProductoDAO
from box.crudmanager import CrudManager
from box.cliente import Cliente
from box.usuario import Usuario


app=Flask(__name__)

def crear_sistema():
    """Crea el sistema de reservas que se usara"""
    cliente = None
    usuario = Usuario("root", "root")
    cliente_dao = ClienteDAO()
    producto_dao = ProductoDAO()
    material_dao = MaterialDAO()
    orden_venta_dao = OrdenVentaDAO()
    sistema_crud = CrudManager(usuario, cliente_dao, material_dao, orden_venta_dao, producto_dao)
    return sistema_crud

sistema = crear_sistema()

@app.route('/',methods=['GET','POST'])
def home():
    """Define la logica para la pagina principal (index)"""
    if request.method=='POST':
        cliente = sistema.get_cliente_from_string(request.form["cliente"])
        return render_template('index.html')

    clientes = sistema.listar_clientes()
    return render_template('index.html', clientes=clientes, form={})

@app.route('/iniciar_sesion',methods=['GET','POST'])
def iniciar_sesion():
    pass

if __name__ == '__main__':
    app.run(port=5000,debug=True)