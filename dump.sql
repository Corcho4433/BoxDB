CREATE DATABASE  IF NOT EXISTS `boxdbmartindatabases` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `boxdbmartindatabases`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: boxdbmartindatabases
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `IdItem` int NOT NULL AUTO_INCREMENT,
  `IdTipoItem` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Detalle` varchar(45) NOT NULL,
  `Ubicacion` varchar(20) DEFAULT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`IdItem`),
  KEY `FKIdTipoItem_idx` (`IdTipoItem`),
  CONSTRAINT `FKIdTipoItem` FOREIGN KEY (`IdTipoItem`) REFERENCES `tipositems` (`IdTipoItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `IdContacto` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `RazonSocial` varchar(20) NOT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  CONSTRAINT `FKIdContactoClientes` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`),
  CONSTRAINT `FKIdDireccionClientes` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoClientes` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `IdCompra` int NOT NULL AUTO_INCREMENT,
  `IdProveedor` int NOT NULL,
  `IdItem` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdOrdenCompra` int NOT NULL,
  `IdTipoPago` int NOT NULL,
  `IdTipoItem` int NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdTipoPago_idx` (`IdTipoPago`),
  KEY `FKIdProveedor_idx` (`IdProveedor`),
  KEY `FKIdOrdenCompra_idx` (`IdOrdenCompra`),
  CONSTRAINT `FKIdEmpleadoCompras` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdOrdenCompraCompras` FOREIGN KEY (`IdOrdenCompra`) REFERENCES `ordenescompracab` (`IdOrdenCompra`),
  CONSTRAINT `FKIdProveedorCompras` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedores` (`IdProveedor`),
  CONSTRAINT `FKIdTipoPagoCompras` FOREIGN KEY (`IdTipoPago`) REFERENCES `tipospago` (`IdTipoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactocliente`
--

DROP TABLE IF EXISTS `contactocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactocliente` (
  `IdContactoCliente` int NOT NULL AUTO_INCREMENT,
  `IdContacto` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Sector` varchar(20) NOT NULL,
  PRIMARY KEY (`IdContactoCliente`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  CONSTRAINT `FKIdContactoContCliente` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactocliente`
--

LOCK TABLES `contactocliente` WRITE;
/*!40000 ALTER TABLE `contactocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `IdContacto` int NOT NULL AUTO_INCREMENT,
  `Correo` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `IdDireccion` int NOT NULL AUTO_INCREMENT,
  `Calle` varchar(20) NOT NULL,
  `Provincia` varchar(20) NOT NULL,
  `CodigoPostal` decimal(8,0) NOT NULL,
  `Altura` decimal(8,0) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  PRIMARY KEY (`IdDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Fleming ','BsAs',1234,1234,'Florida'),(2,'Corrientes','BsAs',1400,2233,'CABA'),(3,'Larrea','BsAs',1405,2211,'CABA'),(4,'Mitre','BsAs',2020,4550,'San Isidro'),(5,'Cordoba','BsAs',1300,6080,'CABA'),(6,'Pasteur','BsAs',1344,1200,'CABA');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `IdEmpleado` int NOT NULL AUTO_INCREMENT,
  `IdContacto` int NOT NULL,
  `IdSector` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Cargo` varchar(20) NOT NULL,
  `SexEmp` varchar(1) NOT NULL,
  `FecNac` date NOT NULL,
  `FecInc` date NOT NULL,
  `SalEmp` decimal(8,2) NOT NULL,
  `Comision` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  KEY `FkIdSector_idx` (`IdSector`),
  CONSTRAINT `FKIdContacto` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`),
  CONSTRAINT `FKIdDireccion` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FkIdSector` FOREIGN KEY (`IdSector`) REFERENCES `sectores` (`IdSector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturascab`
--

DROP TABLE IF EXISTS `facturascab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturascab` (
  `IdFactura` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdRemito` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Subtotal` decimal(8,2) NOT NULL,
  `Descuento` decimal(8,2) DEFAULT NULL,
  `Neto` decimal(8,2) NOT NULL,
  `IVA` decimal(8,2) NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdFactura`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdRemito_idx` (`IdRemito`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  CONSTRAINT `FKIdClienteFactCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionFactCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoFactCab` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdRemitoFactCab` FOREIGN KEY (`IdRemito`) REFERENCES `remitoscab` (`IdRemito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturascab`
--

LOCK TABLES `facturascab` WRITE;
/*!40000 ALTER TABLE `facturascab` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturascab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturasdet`
--

DROP TABLE IF EXISTS `facturasdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturasdet` (
  `IdFacturaDet` int NOT NULL AUTO_INCREMENT,
  `IdFactura` int NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Precio` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdFacturaDet`),
  KEY `FKIdFactura_idx` (`IdFactura`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  CONSTRAINT `FKIdFacturaFactDet` FOREIGN KEY (`IdFactura`) REFERENCES `facturascab` (`IdFactura`),
  CONSTRAINT `FKIdProductoFactDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasdet`
--

LOCK TABLES `facturasdet` WRITE;
/*!40000 ALTER TABLE `facturasdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojasruta`
--

DROP TABLE IF EXISTS `hojasruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojasruta` (
  `IdRuta` int NOT NULL AUTO_INCREMENT,
  `IdProducto` varchar(45) NOT NULL,
  `IdSecuencia` int NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Detalle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdRuta`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdSecuencia_idx` (`IdSecuencia`),
  CONSTRAINT `FKIdProductoHojRut` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdSecuenciaHojRut` FOREIGN KEY (`IdSecuencia`) REFERENCES `secuenciasproduccion` (`IdSecuencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojasruta`
--

LOCK TABLES `hojasruta` WRITE;
/*!40000 ALTER TABLE `hojasruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `hojasruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineasproduccion`
--

DROP TABLE IF EXISTS `lineasproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineasproduccion` (
  `IdLineaProd` int NOT NULL AUTO_INCREMENT,
  `IdJefeLinea` int NOT NULL,
  `CentroTrabajo` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`IdLineaProd`),
  KEY `FKIdEmpleadoJefeLinea_idx` (`IdJefeLinea`),
  CONSTRAINT `FKIdEmpleadoJefeLinea` FOREIGN KEY (`IdJefeLinea`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasproduccion`
--

LOCK TABLES `lineasproduccion` WRITE;
/*!40000 ALTER TABLE `lineasproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineasproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialesreservadosprod`
--

DROP TABLE IF EXISTS `materialesreservadosprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialesreservadosprod` (
  `IdReservado` int NOT NULL AUTO_INCREMENT,
  `IdItem` int NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdReservado`),
  KEY `FKIdItem_idx` (`IdItem`),
  CONSTRAINT `FKIdItemMaterialesReser` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialesreservadosprod`
--

LOCK TABLES `materialesreservadosprod` WRITE;
/*!40000 ALTER TABLE `materialesreservadosprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `materialesreservadosprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelosproductos`
--

DROP TABLE IF EXISTS `modelosproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelosproductos` (
  `IdModelo` int NOT NULL AUTO_INCREMENT,
  `IdProducto` varchar(45) NOT NULL,
  `ModeloImg` blob NOT NULL,
  PRIMARY KEY (`IdModelo`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  CONSTRAINT `FKIdProductoModProds` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelosproductos`
--

LOCK TABLES `modelosproductos` WRITE;
/*!40000 ALTER TABLE `modelosproductos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelosproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movalmacen`
--

DROP TABLE IF EXISTS `movalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movalmacen` (
  `IdMov` int NOT NULL AUTO_INCREMENT,
  `IdCompra` int NOT NULL,
  `IdItem` int NOT NULL,
  `IdTipoMov` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdSector` int NOT NULL,
  `IdSectorMovido` int NOT NULL,
  `Fecha` date NOT NULL,
  `CantidadAnterior` decimal(8,2) DEFAULT NULL,
  `CantidadMovida` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdMov`),
  KEY `FKIdItem_idx` (`IdItem`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdCompra_idx` (`IdCompra`),
  KEY `FKIdTipoMov_idx` (`IdTipoMov`),
  KEY `FKIdSector_idx` (`IdSector`),
  KEY `FKIdSectorMov_idx` (`IdSectorMovido`),
  CONSTRAINT `FKIdCompraMovs` FOREIGN KEY (`IdCompra`) REFERENCES `compras` (`IdCompra`),
  CONSTRAINT `FKIdEmpleadoMovs` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdItemMovs` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`),
  CONSTRAINT `FKIdSectorMovMovs` FOREIGN KEY (`IdSectorMovido`) REFERENCES `sectores` (`IdSector`),
  CONSTRAINT `FKIdSectorMovs` FOREIGN KEY (`IdSector`) REFERENCES `empleados` (`IdSector`),
  CONSTRAINT `FKIdTipoMovMovs` FOREIGN KEY (`IdTipoMov`) REFERENCES `tiposmovimientos` (`IdTipoMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movalmacen`
--

LOCK TABLES `movalmacen` WRITE;
/*!40000 ALTER TABLE `movalmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `movalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacionescab`
--

DROP TABLE IF EXISTS `notificacionescab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacionescab` (
  `IdNotificacion` int NOT NULL AUTO_INCREMENT,
  `IdVendedor` int NOT NULL,
  `IdJefeLinea` int NOT NULL,
  `IdLineaProd` int NOT NULL,
  `IdCliente` int NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `IdTipoEntrega` int NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Item` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Pendientes` decimal(8,2) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdNotificacion`),
  KEY `FKIdVendedor_idx` (`IdVendedor`),
  KEY `FKIdJefeLinea_idx` (`IdJefeLinea`),
  KEY `FKIdLineaProd_idx` (`IdLineaProd`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdTipoEntrega_idx` (`IdTipoEntrega`),
  CONSTRAINT `FKIdClienteNotCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdJefeLineaNotCab` FOREIGN KEY (`IdJefeLinea`) REFERENCES `lineasproduccion` (`IdJefeLinea`),
  CONSTRAINT `FKIdLineaProdNotCab` FOREIGN KEY (`IdLineaProd`) REFERENCES `lineasproduccion` (`IdLineaProd`),
  CONSTRAINT `FKIdProductoNotCab` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdTipoEntregaNotCab` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`),
  CONSTRAINT `FKIdVendedorNotCab` FOREIGN KEY (`IdVendedor`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionescab`
--

LOCK TABLES `notificacionescab` WRITE;
/*!40000 ALTER TABLE `notificacionescab` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacionescab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacionesdet`
--

DROP TABLE IF EXISTS `notificacionesdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacionesdet` (
  `IdNotificacionDet` int NOT NULL AUTO_INCREMENT,
  `IdNotificacion` int NOT NULL,
  `IdOperario` int NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdNotificacionDet`),
  KEY `FKIdNotificacion_idx` (`IdNotificacion`),
  KEY `FKIdEmpleadoOperario_idx` (`IdOperario`),
  CONSTRAINT `FKIdEmpleadoOperario` FOREIGN KEY (`IdOperario`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdNotificacion` FOREIGN KEY (`IdNotificacion`) REFERENCES `notificacionescab` (`IdNotificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionesdet`
--

LOCK TABLES `notificacionesdet` WRITE;
/*!40000 ALTER TABLE `notificacionesdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacionesdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenescompracab`
--

DROP TABLE IF EXISTS `ordenescompracab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenescompracab` (
  `IdOrdenCompra` int NOT NULL AUTO_INCREMENT,
  `IdPedido` int NOT NULL,
  `IdSolicitante` int NOT NULL,
  `IdCreadorOrden` int NOT NULL,
  `IdContacto` int NOT NULL,
  `IdProveedor` int NOT NULL,
  `IdTipoPago` int NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `AprobacionCreador` varchar(20) DEFAULT NULL,
  `AprobacionAutorizador` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdOrdenCompra`),
  KEY `FKIdPedido_idx` (`IdPedido`),
  KEY `FKIdSolicitante_idx` (`IdSolicitante`),
  KEY `FKIdCreadorOrden_idx` (`IdCreadorOrden`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  KEY `FKIdProveedor_idx` (`IdProveedor`),
  KEY `FKIdTipoPago_idx` (`IdTipoPago`),
  CONSTRAINT `FKIdContactoOrdComCab` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`),
  CONSTRAINT `FKIdCreadorOrdenOrdComCab` FOREIGN KEY (`IdCreadorOrden`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdPedidoOrdComCab` FOREIGN KEY (`IdPedido`) REFERENCES `ordenespedidocab` (`IdOrdenPedido`),
  CONSTRAINT `FKIdProveedorOrdComCab` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedores` (`IdProveedor`),
  CONSTRAINT `FKIdSolicitanteOrdComCab` FOREIGN KEY (`IdSolicitante`) REFERENCES `ordenespedidocab` (`IdEmpSolicitante`),
  CONSTRAINT `FKIdTipoPagoOrdComCab` FOREIGN KEY (`IdTipoPago`) REFERENCES `tipospago` (`IdTipoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenescompracab`
--

LOCK TABLES `ordenescompracab` WRITE;
/*!40000 ALTER TABLE `ordenescompracab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenescompracab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenescompradet`
--

DROP TABLE IF EXISTS `ordenescompradet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenescompradet` (
  `IdOrdenCompraDet` int NOT NULL AUTO_INCREMENT,
  `IdOrdenCompra` int NOT NULL,
  `IdItem` int NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Cantidad` int NOT NULL,
  `Descripcion` varchar(20) NOT NULL,
  `IVA` decimal(8,2) NOT NULL,
  `Unitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdOrdenCompraDet`),
  KEY `FKIdOrdenCompra_idx` (`IdOrdenCompra`),
  KEY `FKIdItem_idx` (`IdItem`),
  CONSTRAINT `FKIdItemOrdComDet` FOREIGN KEY (`IdItem`) REFERENCES `ordenespedidodet` (`IdItem`),
  CONSTRAINT `FKIdOrdenCompraOrdComDet` FOREIGN KEY (`IdOrdenCompra`) REFERENCES `ordenescompracab` (`IdOrdenCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenescompradet`
--

LOCK TABLES `ordenescompradet` WRITE;
/*!40000 ALTER TABLE `ordenescompradet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenescompradet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenespedidocab`
--

DROP TABLE IF EXISTS `ordenespedidocab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenespedidocab` (
  `IdOrdenPedido` int NOT NULL AUTO_INCREMENT,
  `IdEmpSolicitante` int NOT NULL,
  `IdSector` int NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Fecha` date NOT NULL,
  `Autorizado` varchar(20) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `AprobacionSolicitante` varchar(20) DEFAULT NULL,
  `AprobacionAutorizador` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdOrdenPedido`),
  KEY `FKIdEmpleado_idx` (`IdEmpSolicitante`),
  KEY `FKIdSector_idx` (`IdSector`),
  CONSTRAINT `FKIdEmpleadoOrdPedCab` FOREIGN KEY (`IdEmpSolicitante`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdSectorOrdPedCab` FOREIGN KEY (`IdSector`) REFERENCES `empleados` (`IdSector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenespedidocab`
--

LOCK TABLES `ordenespedidocab` WRITE;
/*!40000 ALTER TABLE `ordenespedidocab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenespedidocab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenespedidodet`
--

DROP TABLE IF EXISTS `ordenespedidodet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenespedidodet` (
  `IdOrdenPedidoDet` int NOT NULL AUTO_INCREMENT,
  `IdOrdenPedido` int NOT NULL,
  `IdItem` int NOT NULL,
  `Item` int NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdOrdenPedidoDet`),
  KEY `FKIdOrdenPedido_idx` (`IdOrdenPedido`),
  KEY `FKIdItem_idx` (`IdItem`),
  CONSTRAINT `FKIdItemOrdPedDet` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`),
  CONSTRAINT `FKIdOrdenPedidoOrdPedDet` FOREIGN KEY (`IdOrdenPedido`) REFERENCES `ordenespedidocab` (`IdOrdenPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenespedidodet`
--

LOCK TABLES `ordenespedidodet` WRITE;
/*!40000 ALTER TABLE `ordenespedidodet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenespedidodet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenesventascab`
--

DROP TABLE IF EXISTS `ordenesventascab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenesventascab` (
  `IdOrdenVenta` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `IdTipoEntrega` int NOT NULL,
  `Subtotal` decimal(8,2) NOT NULL,
  `Descuento` decimal(8,2) DEFAULT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdOrdenVenta`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FkIdTipoEntrega_idx` (`IdTipoEntrega`),
  CONSTRAINT `FKIdClienteOrdVenCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionOrdVenCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoOrdVenCab` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FkIdTipoEntregaOrdVenCab` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenesventascab`
--

LOCK TABLES `ordenesventascab` WRITE;
/*!40000 ALTER TABLE `ordenesventascab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenesventascab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenesventasdet`
--

DROP TABLE IF EXISTS `ordenesventasdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenesventasdet` (
  `IdOrdenVentaDet` int NOT NULL AUTO_INCREMENT,
  `IdOrdenVenta` int NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `Item` varchar(20) NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Unitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdOrdenVentaDet`),
  KEY `FKIdOrdenVenta_idx` (`IdOrdenVenta`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  CONSTRAINT `FKIdOrdenVentaOrdVentDet` FOREIGN KEY (`IdOrdenVenta`) REFERENCES `ordenesventascab` (`IdOrdenVenta`),
  CONSTRAINT `FKIdProductoOrdVentDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenesventasdet`
--

LOCK TABLES `ordenesventasdet` WRITE;
/*!40000 ALTER TABLE `ordenesventasdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenesventasdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `IdProducto` varchar(45) NOT NULL,
  `IdCliente` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `IdTipoProducto` int NOT NULL,
  `FechaAlta` date NOT NULL,
  `Margen` decimal(8,2) NOT NULL,
  `Estado` varchar(1) NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdTipoProductoProd_idx` (`IdTipoProducto`),
  CONSTRAINT `FKIdClienteProd` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdTipoProductoProd` FOREIGN KEY (`IdTipoProducto`) REFERENCES `tipoproducto` (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `IdProveedor` int NOT NULL AUTO_INCREMENT,
  `IdDireccion` int NOT NULL,
  `IdContacto` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `RazonSocial` varchar(20) NOT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  CONSTRAINT `FKIdContactoProv` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`),
  CONSTRAINT `FKIdDireccionProv` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetamateriales`
--

DROP TABLE IF EXISTS `recetamateriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetamateriales` (
  `IdReceta` int NOT NULL AUTO_INCREMENT,
  `IdProducto` varchar(45) NOT NULL,
  `IdItem` int NOT NULL,
  `IdSecuencia` int NOT NULL,
  `IdUnidadMedida` varchar(20) NOT NULL,
  `Detalle` varchar(20) DEFAULT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdReceta`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdItem_idx` (`IdItem`),
  KEY `FKIdSecuencia_idx` (`IdSecuencia`),
  KEY `FKIdUnidadMedida_idx` (`IdUnidadMedida`),
  CONSTRAINT `FKIdItem` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`),
  CONSTRAINT `FKIdProducto` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdSecuencia` FOREIGN KEY (`IdSecuencia`) REFERENCES `secuenciasproduccion` (`IdSecuencia`),
  CONSTRAINT `FKIdUnidadMedida` FOREIGN KEY (`IdUnidadMedida`) REFERENCES `unidadesmedida` (`IdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetamateriales`
--

LOCK TABLES `recetamateriales` WRITE;
/*!40000 ALTER TABLE `recetamateriales` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamateriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibopagodocs`
--

DROP TABLE IF EXISTS `recibopagodocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibopagodocs` (
  `IdReciboPagoDoc` int NOT NULL AUTO_INCREMENT,
  `IdReciboPago` int NOT NULL,
  `IdFactura` int NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdReciboPagoDoc`),
  KEY `FKIdReciboPago_idx` (`IdReciboPago`),
  KEY `FKIdFactura_idx` (`IdFactura`),
  CONSTRAINT `FKIdFacturaDocs` FOREIGN KEY (`IdFactura`) REFERENCES `facturascab` (`IdFactura`),
  CONSTRAINT `FKIdReciboPagoDocs` FOREIGN KEY (`IdReciboPago`) REFERENCES `recibospagocab` (`IdReciboPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibopagodocs`
--

LOCK TABLES `recibopagodocs` WRITE;
/*!40000 ALTER TABLE `recibopagodocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibopagodocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibospagocab`
--

DROP TABLE IF EXISTS `recibospagocab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibospagocab` (
  `IdReciboPago` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Conforme` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdReciboPago`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  CONSTRAINT `FKIdClienteRecPagoCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionRecPagoCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibospagocab`
--

LOCK TABLES `recibospagocab` WRITE;
/*!40000 ALTER TABLE `recibospagocab` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibospagocab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibospagodet`
--

DROP TABLE IF EXISTS `recibospagodet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibospagodet` (
  `IdReciboPagoDet` int NOT NULL AUTO_INCREMENT,
  `IdReciboPago` int NOT NULL,
  `IdTipoPago` int NOT NULL,
  `Banco` varchar(20) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdReciboPagoDet`),
  KEY `FKIdReciboPago_idx` (`IdReciboPago`),
  KEY `FKIdTipoPago_idx` (`IdTipoPago`),
  CONSTRAINT `FKIdReciboPago` FOREIGN KEY (`IdReciboPago`) REFERENCES `recibospagocab` (`IdReciboPago`),
  CONSTRAINT `FKIdTipoPago` FOREIGN KEY (`IdTipoPago`) REFERENCES `tipospago` (`IdTipoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibospagodet`
--

LOCK TABLES `recibospagodet` WRITE;
/*!40000 ALTER TABLE `recibospagodet` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibospagodet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitoscab`
--

DROP TABLE IF EXISTS `remitoscab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitoscab` (
  `IdRemito` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `IdTipoEntrega` int NOT NULL,
  `Fecha` date NOT NULL,
  `PesoTotal` decimal(8,2) NOT NULL,
  `CantidadBultos` decimal(8,2) NOT NULL,
  `Conformado` varchar(20) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdRemito`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdTipoEntrega_idx` (`IdTipoEntrega`),
  CONSTRAINT `FKIdClienteRemCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionRemCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoRemCab` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdTipoEntregaRemCab` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitoscab`
--

LOCK TABLES `remitoscab` WRITE;
/*!40000 ALTER TABLE `remitoscab` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitoscab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitosdet`
--

DROP TABLE IF EXISTS `remitosdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitosdet` (
  `IdRemitoDet` int NOT NULL AUTO_INCREMENT,
  `IdRemito` int NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `NumeroOrden` int NOT NULL,
  `Peso` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IdRemitoDet`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdRemito_idx` (`IdRemito`),
  CONSTRAINT `FKIdProductoRemDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdRemito` FOREIGN KEY (`IdRemito`) REFERENCES `remitoscab` (`IdRemito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitosdet`
--

LOCK TABLES `remitosdet` WRITE;
/*!40000 ALTER TABLE `remitosdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectores`
--

DROP TABLE IF EXISTS `sectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectores` (
  `IdSector` int NOT NULL AUTO_INCREMENT,
  `IdGerente` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`IdSector`),
  KEY `FKIdEmpleadoGerente_idx` (`IdGerente`),
  CONSTRAINT `FKIdEmpleadoGerente` FOREIGN KEY (`IdGerente`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectores`
--

LOCK TABLES `sectores` WRITE;
/*!40000 ALTER TABLE `sectores` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuenciasproduccion`
--

DROP TABLE IF EXISTS `secuenciasproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuenciasproduccion` (
  `IdSecuencia` int NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(20) NOT NULL,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdSecuencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuenciasproduccion`
--

LOCK TABLES `secuenciasproduccion` WRITE;
/*!40000 ALTER TABLE `secuenciasproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `secuenciasproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproducto` (
  `IdTipoProducto` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` VALUES (1,'COMBO'),(2,'CABEZAL'),(3,'CAJA'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposentrega`
--

DROP TABLE IF EXISTS `tiposentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposentrega` (
  `IdTipoEntrega` int NOT NULL AUTO_INCREMENT,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposentrega`
--

LOCK TABLES `tiposentrega` WRITE;
/*!40000 ALTER TABLE `tiposentrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipositems`
--

DROP TABLE IF EXISTS `tipositems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipositems` (
  `IdTipoItem` int NOT NULL AUTO_INCREMENT,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipoItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipositems`
--

LOCK TABLES `tipositems` WRITE;
/*!40000 ALTER TABLE `tipositems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipositems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposmovimientos`
--

DROP TABLE IF EXISTS `tiposmovimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposmovimientos` (
  `IdTipoMov` int NOT NULL AUTO_INCREMENT,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipoMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposmovimientos`
--

LOCK TABLES `tiposmovimientos` WRITE;
/*!40000 ALTER TABLE `tiposmovimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposmovimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipospago`
--

DROP TABLE IF EXISTS `tipospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipospago` (
  `IdTipoPago` int NOT NULL AUTO_INCREMENT,
  `Banco` varchar(20) NOT NULL,
  `MetodoPago` varchar(20) NOT NULL,
  `Cuotas` int NOT NULL,
  `ExtensionDias` int DEFAULT NULL,
  PRIMARY KEY (`IdTipoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospago`
--

LOCK TABLES `tipospago` WRITE;
/*!40000 ALTER TABLE `tipospago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadesmedida`
--

DROP TABLE IF EXISTS `unidadesmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidadesmedida` (
  `IdUnidadMedida` varchar(20) NOT NULL,
  `Detalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadesmedida`
--

LOCK TABLES `unidadesmedida` WRITE;
/*!40000 ALTER TABLE `unidadesmedida` DISABLE KEYS */;
INSERT INTO `unidadesmedida` VALUES ('CM3','CENTIMETROS CUBICOS'),('CU','CADA UNO'),('KG','KILOGRAMO'),('KWH','KILOWATS HORA'),('LTS','LITROS'),('M2','METROS CUADRADOS'),('ML','METROS LINEALES'),('MM','MILIMETROS');
/*!40000 ALTER TABLE `unidadesmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'boxdbmartindatabases'
--

--
-- Dumping routines for database 'boxdbmartindatabases'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-03  1:11:54
