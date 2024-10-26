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
  `IdItem` varchar(45) NOT NULL,
  `Detalle` varchar(45) NOT NULL,
  `IdTipoItem` int NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `IdClase` int NOT NULL,
  `IdUnidadMedida` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Stock` decimal(8,2) NOT NULL,
  `StockMinimo` decimal(8,2) NOT NULL,
  `FechaAlta` date NOT NULL,
  PRIMARY KEY (`IdItem`),
  KEY `FKIdTipoAlmacen_idx` (`IdTipoItem`),
  KEY `FKIdTipoClaseArt_idx` (`IdClase`),
  KEY `FKIdUnidadMedidaAlmacen_idx` (`IdUnidadMedida`),
  CONSTRAINT `FKIdTipoAlmacen` FOREIGN KEY (`IdTipoItem`) REFERENCES `mastertipo` (`IdTipo`),
  CONSTRAINT `FKIdTipoClaseArt` FOREIGN KEY (`IdClase`) REFERENCES `clasesarticulos` (`IdClaseArticulo`),
  CONSTRAINT `FKIdUnidadMedidaAlmacen` FOREIGN KEY (`IdUnidadMedida`) REFERENCES `unidadesmedida` (`IdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES ('AGUA','Agua',6,100.00,25,'LTS','A',0.00,0.00,'2007-01-01'),('b','a',4,20.00,12,'CM3','A',222.00,2222.00,'2019-08-01'),('BC10038-25','Base Cerejeira 100x38x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('BICAZ1','Birome BIC AZUL GRUESO',5,25.00,5,'CU','A',35.00,5.00,'2007-01-01'),('BICNG1','Birome BIC NEGRO GRUESO',5,25.00,5,'CU','A',21.00,5.00,'2007-01-01'),('BICRO1','Birome BIC ROJO GRUESO',5,25.00,5,'CU','A',18.00,5.00,'2007-01-01'),('BICTGAZUL','Bic trazo grueso Azul ',5,15.00,5,'CU','A',8.00,15.00,'2021-10-10'),('BICTGNEGRA','Bic trazo grueso Negra',5,15.00,5,'CU','A',30.00,15.00,'2021-11-10'),('BICTGROJO','Bic trazo grueso Rojo',5,15.00,5,'CU','A',55.00,15.00,'2021-10-10'),('BOGLOGO','Logo Bogner',4,0.00,20,'CU','A',30.00,15.00,'2018-02-08'),('BP10038-25','Base Pino 100x38x2,5',4,250.00,2,'CU','A',15.00,5.00,'2010-08-01'),('BP11038-25','Base Pino 110x38x2,5',4,120.00,2,'CU','A',30.00,5.00,'2010-08-02'),('BP12038-25','Base Pino 120x38x2,5',4,220.00,2,'CU','A',20.00,5.00,'2010-04-20'),('BROCHES10','Broches 10',5,11.00,5,'CU','A',5.00,5.00,'2021-11-10'),('BROCHES15','Broches 15',5,11.80,5,'CU','A',16.00,5.00,'2021-10-20'),('CHAPF-P1000','Chapa Apoyo Sup. Fender P1000',4,380.00,21,'CU','A',40.00,5.00,'2010-04-10'),('CHAPFDER-HR','Chapa Apoyo Sup. Fender HR',4,280.00,21,'CU','A',100.00,20.00,'2019-04-10'),('CHAPMBHN','Chapa Apoyo Sup. MB Head - Negro',4,400.00,21,'CU','A',33.00,5.00,'2010-04-10'),('COLA_MADERA','Cola Madera ',4,90.00,3,'CM3','A',16000.00,4000.00,'2013-08-02'),('CUAD-ESPIRAL-CUA-80','CUADERNO Espiralado 80h Cuadriculado',5,80.00,5,'CU','A',10.00,10.00,'2018-08-08'),('CUAD-ESPIRAL-RAY-80','CUADERNO Espiralado 80h Rayado',5,85.00,5,'CU','A',12.00,10.00,'2018-08-08'),('CUEFDER-BK','Cuerina Fender Negro',4,150.00,16,'M2','A',180.00,10.00,'2010-11-03'),('CUEMBC','Cuerina MB Caoba',4,320.00,16,'M2','A',38.50,10.00,'2010-03-08'),('CUEMBCREAM','Cuerina MB Cream',4,350.00,16,'M2','A',45.00,10.00,'2010-10-02'),('CUEMBN','Cuerina MB Negro',4,150.00,16,'M2','A',180.00,10.00,'2010-11-03'),('CUEVIB SLO','Cuerina Vibora Soldano Custom 1',4,600.00,16,'M2','A',80.00,20.00,'2020-01-01'),('ENERGIA','Energía Electrica',6,1200.00,24,'KWH','A',0.00,0.00,'2007-01-01'),('ESQUIFDERA-BK','Esquinas Fender Acetato - Negro',4,60.00,2,'CU','A',100.00,20.00,'2018-08-04'),('ESQUIMBAHN','Esquinas MB Acetato Head - Negro',4,600.00,2,'CU','A',100.00,20.00,'2018-08-04'),('FC9520-25','Fondo Cerejerira 95x20x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('FDERLOGO1','Logo Fender 1',4,0.00,20,'CU','A',130.00,40.00,'2018-08-02'),('FDERLOGO2','Logo Fender 2',4,0.00,20,'CU','A',50.00,10.00,'2018-08-02'),('FDERLOGO3','Logo Fender 3',4,0.00,20,'CU','A',1000.00,200.00,'2018-08-02'),('FP10535-25','Fondo Pino 105x30x2,5',4,100.00,2,'CU','A',14.00,5.00,'2018-04-08'),('FP11525-25','Fondo Pino 115x25x2,5',4,100.00,2,'CU','A',13.00,5.00,'2018-08-08'),('FP1557225','Frente Pino 1x12 W 155x72x2,5',4,200.00,2,'CU','A',16.00,5.00,'2010-08-08'),('FP9520-25','Fondo Pino 95x20x2,5',4,400.00,2,'CU','A',13.00,5.00,'2012-08-08'),('FREZ1506N','Frezado 1,5x0,6 - Negro',4,0.30,1,'CU','A',98.00,150.00,'2012-08-08'),('FREZ1506P','Frezado 1,5x0,6 - Plata',4,0.40,1,'CU','A',480.00,150.00,'2012-08-08'),('FREZ206P','Frezado 2x0,6 - Plata',4,0.35,1,'CU','A',500.00,100.00,'2012-08-08'),('FTEC9520-25','Frente Cerejerira 95x20x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('FTEP1210545-25','Frente Pino 1x12 105x45x2,5',4,100.00,1,'CU','A',11.00,5.00,'2012-08-08'),('FTEP1211550-25','Frente Pino 1x12 115x50x2,5',4,220.00,2,'CU','A',12.00,5.00,'2018-06-08'),('FTEP9520-25','Frente Pino 95x20x2,5',4,130.00,2,'CU','A',19.00,5.00,'2010-07-08'),('GAS','Gas',6,900.00,25,'CM3','A',0.00,0.00,'2007-01-01'),('HP12A ','TONER 12A HP',5,3000.00,17,'CU','A',5.00,5.00,'2018-08-08'),('HP78A ','TONER 78A HP',5,3000.00,17,'CU','A',5.00,1.00,'2021-10-08'),('LACA-MR-BR','Laca Marina Brillante',4,205.00,14,'CM3','A',1920.00,4000.00,'2019-08-05'),('LACA-MR-SM','Laca Marina Semi-Mate',4,134.00,14,'CM3','A',8000.00,4000.00,'2019-03-01'),('LCD3840-25','Lateral Der Cerejeira Forma 38x40x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('LCI3840-25','Lateral Izq Cerejerira Forma 38x40x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('LPD3840-25','Lateral Der Pino Forma 38x40x2,5',4,370.00,2,'CU','A',20.00,5.00,'2010-08-08'),('LPD3855-25','Lateral Der Pino Forma 38x55x2,5',4,300.00,2,'CU','A',19.00,5.00,'2010-09-08'),('LPI3840-25','Lateral Izq Pino Forma 38x40x2,5',4,120.00,2,'CU','A',18.00,5.00,'2012-08-08'),('LPI3855-25','Lateral Izq Pino Forma 38x55x2,5',4,140.00,2,'CU','A',22.00,5.00,'2012-08-08'),('MANITFDER-BK','Manija Transp. Fender - Negro',4,140.00,8,'CU','A',60.00,20.00,'2018-08-08'),('MANITMBCN','Manija Transp. Heavy MB - Negro',4,450.00,8,'CU','A',35.00,15.00,'2012-08-08'),('MANITMBN','Manija Transp. MB - Negro',4,340.00,8,'CU','A',30.00,15.00,'2018-08-08'),('MARLOGO','Logo Marshall',4,0.00,20,'CU','A',200.00,50.00,'2017-08-03'),('MBLOGO1','Logo Boogie',4,0.00,20,'CU','A',20.00,20.00,'2018-02-06'),('MBLOGO2','Logo Boogie Cream',4,0.00,20,'CU','A',150.00,30.00,'2013-08-02'),('MECHAMAD10','Mecha madera 10mm',5,45.00,4,'CU','A',3.00,5.00,'2018-01-10'),('MECHAMAD4','Mecha madera 4mm',5,35.00,4,'CU','A',12.00,5.00,'2018-08-03'),('MECHAMAD5','Mecha madera 5mm',5,35.00,4,'CU','A',8.00,5.00,'2018-01-12'),('MECHAMAD6','Mecha madera 6mm',5,35.00,4,'CU','A',14.00,5.00,'2018-08-03'),('PARK205N','Parker 2x0,5 - Negro',4,400.00,1,'CU','A',220.00,100.00,'2013-08-08'),('PARK2505N','Parker 2,5x0,5 - Negro',4,350.00,1,'CU','A',250.00,120.00,'2018-08-06'),('PEGA-CTO','Pegamento de Contacto ',4,295.00,3,'CM3','A',12000.00,2000.00,'2020-08-12'),('PEGA-CTO_TR','Pegamento de Contacto Tranparente',4,290.00,3,'CM3','A',20000.00,2000.00,'2020-10-03'),('PLASTICOLA 200GRS','Plasticola 200 gramos blanca',5,145.00,5,'CU','A',12.00,10.00,'2019-08-08'),('REGAFDERSTD-BKN','Regaton Fender STD - Negro',4,22.00,9,'CU','A',180.00,50.00,'2018-08-06'),('REGAMBHN','Regaton MB Head - Negro',4,122.00,9,'CU','A',97.00,50.00,'2018-08-06'),('REGUNV35','Regaton UNIV 35mm- Negro',4,75.00,9,'CU','A',650.00,100.00,'2018-08-06'),('REGUNV40','Regaton UNIV 40mm- Negro',4,80.00,9,'CU','A',450.00,100.00,'2018-08-06'),('RESMA-A4-75GR','Resma A4 500 x 75grs',5,455.00,5,'CU','A',25.00,20.00,'2020-08-08'),('RESMA-CARTA-80GR','Resma CARTA 500 x 80grs',5,498.00,5,'CU','A',15.00,15.00,'2020-08-08'),('RESMAA480G','Resma A4 80grs',5,90.00,5,'CU','A',25.00,15.00,'2021-10-10'),('RESMALT80G','Resma LT 80grs',5,95.00,5,'CU','A',15.00,10.00,'2021-10-10'),('RIVLOGO','Logo Rivera',4,0.00,20,'CU','A',100.00,30.00,'2020-10-03'),('RUED 45-AZUL','Ruedas 45mm diam Azul',4,230.00,18,'CU','A',80.00,20.00,'2017-08-10'),('RUED 60-BK','Ruedas 60mm diam Negra',4,268.00,18,'CU','A',120.00,20.00,'2017-08-10'),('SEGURIDAD','Servicio de Seguridad',6,1050.00,25,'CU','A',0.00,0.00,'2007-01-01'),('SEGUROS','Seguros',6,3000.00,25,'CU','A',0.00,0.00,'2007-01-01'),('SLOLOGO','Logo Soldano',4,0.00,20,'CU','A',78.00,20.00,'2019-03-14'),('TARM1020','Tarugos Mad. 10x20',4,8.00,19,'CU','A',405.00,150.00,'2014-02-05'),('TARM1030','Tarugos Mad. 10x30',4,8.00,19,'CU','A',605.00,150.00,'2014-08-04'),('TC10028-25','Tapa Cerejeira 100x28x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('TELAFDER-BD','Tela Blues Deville Fender',4,125.80,13,'M2','A',100.00,40.00,'2019-08-02'),('TOPFONC20-25x25','Tope Fondo Cerejerira 20x2,5x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('TOPFONP20-25x25','Tope Fondo Pino 20x2,5x2,5',4,270.00,2,'CU','A',12.00,10.00,'2014-08-08'),('TOPFONP25-25x25','Tope Fondo Pino 25x2,5x2,5',4,290.00,2,'CU','A',14.00,10.00,'2014-08-02'),('TOPFONP30-25x25','Tope Fondo Pino 30x2,5x2,5',4,400.00,2,'CU','A',16.00,10.00,'2014-08-10'),('TOPFREC20-25x25','Tope Frente Cerejerira 20x2,5x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-10-03'),('TOPFREP20-25x25','Tope Frente Pino 20x2,5x2,5',4,300.00,2,'CU','A',12.00,10.00,'2014-08-10'),('TOPFREP38-25x25','Tope Frente Pino 38x2,5x2,5',4,210.00,2,'CU','A',14.00,10.00,'2017-08-18'),('TOPFREP50-25x25','Tope Frente Pino 50x2,5x2,5',4,125.00,2,'CU','A',16.00,15.00,'2017-08-10'),('TP10028-25','Tapa Pino 100x28x2,5',4,189.00,2,'CU','A',24.00,15.00,'2017-08-04'),('TP11028-25','Tapa Pino 110x28x2,5',4,167.00,2,'CU','A',23.00,15.00,'2017-08-03'),('TP12038-25','Tapa Pino 120x38x2,5',4,380.00,2,'CU','A',22.00,15.00,'2017-08-03'),('VINIL','Peg. Vinilico Contacto',4,124.00,12,'CM3','A',5000.00,1500.00,'2018-08-02'),('VINIL-ESP','Peg. Vinilico Contacto Especial',4,450.00,12,'CM3','A',2500.30,5000.00,'2019-08-02'),('VINIL-NG','Peg. Vinilico Contacto Negro',4,100.00,12,'CM3','A',4560.00,5000.00,'2019-08-01');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `almacen_AFTER_INSERT` AFTER INSERT ON `almacen` FOR EACH ROW BEGIN
    DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "ALTA";
    set v_tabla = "almacen";
    set v_idmov = 1;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `almacen_AFTER_UPDATE` AFTER UPDATE ON `almacen` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "MODIFICACION";
    set v_tabla = "almacen";
    set v_idmov = 3;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `almacen_AFTER_DELETE` AFTER DELETE ON `almacen` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "BAJA";
    set v_tabla = "almacen";
    set v_idmov = 2;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `idEvent` int NOT NULL AUTO_INCREMENT,
  `idMov` int NOT NULL,
  `DetMov` varchar(80) NOT NULL,
  `Fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idUsr` int NOT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `FKIdMovAudit_idx` (`idMov`),
  CONSTRAINT `FKIdMovAudit` FOREIGN KEY (`idMov`) REFERENCES `audmov` (`idMov`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1,1,'ALTA','2024-08-30','20:38:00',1,'almacen'),(2,3,'MODIFICACION','2024-08-30','20:39:40',1,'almacen'),(3,2,'BAJA','2024-08-30','20:41:56',1,'almacen'),(4,1,'ALTA','2024-08-30','20:42:45',1,'almacen'),(5,1,'ALTA','2024-08-30','20:42:45',1,'almacen'),(6,2,'BAJA','2024-08-30','20:43:29',1,'almacen'),(7,1,'ALTA','2024-08-30','21:27:02',1,'almacen'),(8,3,'MODIFICACION','2024-08-30','21:34:00',1,'ordenfabricacioncab'),(9,3,'MODIFICACION','2024-08-30','21:34:21',1,'ordenfabricacioncab'),(10,3,'MODIFICACION','2024-08-30','21:34:45',1,'productos'),(11,3,'MODIFICACION','2024-08-30','21:35:02',1,'productos'),(12,1,'ALTA','2024-08-31','10:54:33',1,'ordenfabricacioncab'),(13,1,'ALTA','2024-08-31','12:17:35',1,'remitoscab'),(14,2,'BAJA','2024-08-31','12:38:27',1,'remitoscab'),(15,1,'ALTA','2024-08-31','12:49:37',1,'remitoscab'),(16,1,'ALTA','2024-08-31','12:50:14',1,'remitoscab'),(17,2,'BAJA','2024-08-31','12:51:35',1,'remitoscab'),(18,2,'BAJA','2024-08-31','12:51:35',1,'remitoscab'),(19,1,'ALTA','2024-08-31','12:51:45',1,'remitoscab'),(20,2,'BAJA','2024-08-31','12:52:14',1,'remitoscab'),(21,1,'ALTA','2024-08-31','12:53:12',1,'remitoscab'),(22,2,'BAJA','2024-08-31','12:53:31',1,'remitoscab'),(23,1,'ALTA','2024-08-31','12:57:55',1,'remitoscab'),(24,2,'BAJA','2024-08-31','12:59:25',1,'remitoscab'),(25,1,'ALTA','2024-08-31','13:00:01',1,'remitoscab'),(26,2,'BAJA','2024-08-31','13:01:51',1,'remitoscab'),(27,1,'ALTA','2024-08-31','13:02:18',1,'remitoscab'),(28,2,'BAJA','2024-09-05','19:53:26',1,'remitoscab'),(29,1,'ALTA','2024-09-05','20:01:18',1,'remitoscab'),(30,2,'BAJA','2024-09-05','20:04:59',1,'remitoscab'),(31,1,'ALTA','2024-09-05','20:32:52',1,'remitoscab'),(32,2,'BAJA','2024-09-05','20:37:45',1,'remitoscab'),(33,1,'ALTA','2024-09-05','20:37:49',1,'remitoscab'),(34,1,'ALTA','2024-09-05','20:38:00',1,'remitoscab'),(35,2,'BAJA','2024-09-05','20:38:36',1,'remitoscab'),(36,2,'BAJA','2024-09-05','20:38:36',1,'remitoscab'),(37,1,'ALTA','2024-09-05','20:39:49',1,'remitoscab'),(38,2,'BAJA','2024-09-05','20:42:20',1,'remitoscab'),(39,1,'ALTA','2024-09-05','21:02:03',1,'remitoscab'),(40,1,'ALTA','2024-09-05','21:02:16',1,'remitoscab'),(41,1,'ALTA','2024-09-05','21:15:34',1,'remitoscab'),(42,1,'ALTA','2024-09-05','21:15:44',1,'remitoscab'),(43,2,'BAJA','2024-09-05','21:16:04',1,'remitoscab'),(44,2,'BAJA','2024-09-05','21:16:04',1,'remitoscab'),(45,2,'BAJA','2024-09-05','21:16:04',1,'remitoscab'),(46,1,'ALTA','2024-09-05','21:16:21',1,'remitoscab'),(47,2,'BAJA','2024-09-05','21:17:14',1,'remitoscab'),(48,2,'BAJA','2024-09-05','21:17:14',1,'remitoscab'),(49,1,'ALTA','2024-09-05','21:19:32',1,'remitoscab'),(50,2,'BAJA','2024-09-05','21:20:53',1,'remitoscab'),(51,1,'ALTA','2024-09-05','21:22:01',1,'remitoscab'),(52,3,'MODIFICACION','2024-09-06','01:33:44',1,'productos'),(53,3,'MODIFICACION','2024-09-06','01:34:06',1,'productos'),(54,3,'MODIFICACION','2024-09-06','01:34:19',1,'productos'),(55,1,'ALTA','2024-09-06','01:58:26',1,'facturascab'),(56,2,'BAJA','2024-09-06','01:58:57',1,'facturascab'),(57,1,'ALTA','2024-09-06','01:59:09',1,'facturascab'),(58,2,'BAJA','2024-09-06','01:59:24',1,'facturascab'),(59,1,'ALTA','2024-09-06','02:01:58',1,'facturascab'),(60,2,'BAJA','2024-09-06','02:02:12',1,'facturascab'),(61,1,'ALTA','2024-09-06','02:04:58',1,'facturascab'),(62,2,'BAJA','2024-09-06','02:07:35',1,'facturascab'),(63,1,'ALTA','2024-09-06','02:09:28',1,'facturascab'),(64,3,'MODIFICACION','2024-10-24','13:48:47',1,'productos'),(65,3,'MODIFICACION','2024-10-24','13:48:47',1,'productos'),(66,3,'MODIFICACION','2024-10-24','13:48:47',1,'productos'),(67,3,'MODIFICACION','2024-10-24','14:48:37',1,'productos'),(68,3,'MODIFICACION','2024-10-24','14:48:37',1,'productos'),(69,3,'MODIFICACION','2024-10-24','14:48:37',1,'productos'),(70,3,'MODIFICACION','2024-10-24','14:50:11',1,'productos'),(71,3,'MODIFICACION','2024-10-24','14:50:11',1,'productos'),(72,3,'MODIFICACION','2024-10-24','14:50:11',1,'productos'),(73,3,'MODIFICACION','2024-10-24','14:52:01',1,'productos'),(74,3,'MODIFICACION','2024-10-24','14:52:01',1,'productos'),(75,3,'MODIFICACION','2024-10-24','14:52:01',1,'productos'),(76,3,'MODIFICACION','2024-10-24','14:54:05',1,'productos'),(77,3,'MODIFICACION','2024-10-24','14:54:05',1,'productos'),(78,3,'MODIFICACION','2024-10-24','14:54:05',1,'productos'),(79,3,'MODIFICACION','2024-10-24','14:54:14',1,'productos'),(80,3,'MODIFICACION','2024-10-24','14:54:14',1,'productos'),(81,3,'MODIFICACION','2024-10-24','14:54:14',1,'productos'),(82,3,'MODIFICACION','2024-10-24','14:55:06',1,'productos'),(83,3,'MODIFICACION','2024-10-24','14:55:06',1,'productos'),(84,3,'MODIFICACION','2024-10-24','14:55:06',1,'productos'),(85,3,'MODIFICACION','2024-10-24','14:57:19',1,'productos'),(86,3,'MODIFICACION','2024-10-24','14:57:19',1,'productos'),(87,3,'MODIFICACION','2024-10-24','14:57:19',1,'productos'),(88,3,'MODIFICACION','2024-10-24','15:21:57',1,'productos'),(89,3,'MODIFICACION','2024-10-24','15:21:57',1,'productos'),(90,3,'MODIFICACION','2024-10-24','15:21:57',1,'productos'),(91,3,'MODIFICACION','2024-10-24','15:23:32',1,'productos'),(92,3,'MODIFICACION','2024-10-24','15:23:32',1,'productos'),(93,3,'MODIFICACION','2024-10-24','15:23:32',1,'productos'),(94,3,'MODIFICACION','2024-10-24','15:24:45',1,'productos'),(95,3,'MODIFICACION','2024-10-24','15:24:45',1,'productos'),(96,3,'MODIFICACION','2024-10-24','15:24:45',1,'productos'),(97,3,'MODIFICACION','2024-10-24','15:25:09',1,'productos'),(98,3,'MODIFICACION','2024-10-24','15:25:09',1,'productos'),(99,3,'MODIFICACION','2024-10-24','15:25:09',1,'productos'),(100,3,'MODIFICACION','2024-10-24','15:27:20',1,'productos'),(101,3,'MODIFICACION','2024-10-24','15:27:20',1,'productos'),(102,3,'MODIFICACION','2024-10-24','15:27:20',1,'productos'),(103,3,'MODIFICACION','2024-10-24','15:31:37',1,'productos'),(104,3,'MODIFICACION','2024-10-24','15:31:37',1,'productos'),(105,3,'MODIFICACION','2024-10-24','15:31:37',1,'productos'),(106,3,'MODIFICACION','2024-10-24','15:35:59',1,'productos'),(107,3,'MODIFICACION','2024-10-24','15:35:59',1,'productos'),(108,3,'MODIFICACION','2024-10-24','15:35:59',1,'productos'),(109,3,'MODIFICACION','2024-10-24','15:37:36',1,'productos'),(110,3,'MODIFICACION','2024-10-24','15:37:36',1,'productos'),(111,3,'MODIFICACION','2024-10-24','15:37:36',1,'productos'),(112,3,'MODIFICACION','2024-10-24','15:38:12',1,'productos'),(113,3,'MODIFICACION','2024-10-24','15:38:12',1,'productos'),(114,3,'MODIFICACION','2024-10-24','15:38:12',1,'productos'),(115,3,'MODIFICACION','2024-10-24','15:40:00',1,'productos'),(116,3,'MODIFICACION','2024-10-24','15:40:00',1,'productos'),(117,3,'MODIFICACION','2024-10-24','15:40:00',1,'productos'),(118,3,'MODIFICACION','2024-10-24','15:53:56',1,'productos'),(119,3,'MODIFICACION','2024-10-24','15:53:56',1,'productos'),(120,3,'MODIFICACION','2024-10-24','15:53:56',1,'productos'),(121,3,'MODIFICACION','2024-10-24','15:57:10',1,'productos'),(122,3,'MODIFICACION','2024-10-24','15:57:10',1,'productos'),(123,3,'MODIFICACION','2024-10-24','15:57:10',1,'productos'),(124,3,'MODIFICACION','2024-10-24','15:59:00',1,'productos'),(125,3,'MODIFICACION','2024-10-24','15:59:00',1,'productos'),(126,3,'MODIFICACION','2024-10-24','15:59:00',1,'productos'),(127,3,'MODIFICACION','2024-10-24','16:01:14',1,'productos'),(128,3,'MODIFICACION','2024-10-24','16:01:14',1,'productos'),(129,3,'MODIFICACION','2024-10-24','16:01:14',1,'productos'),(130,3,'MODIFICACION','2024-10-24','16:02:10',1,'productos'),(131,3,'MODIFICACION','2024-10-24','16:02:10',1,'productos'),(132,3,'MODIFICACION','2024-10-24','16:02:10',1,'productos'),(133,3,'MODIFICACION','2024-10-24','16:08:42',1,'productos'),(134,3,'MODIFICACION','2024-10-24','16:08:42',1,'productos'),(135,3,'MODIFICACION','2024-10-24','16:08:42',1,'productos'),(136,3,'MODIFICACION','2024-10-24','16:09:20',1,'productos'),(137,3,'MODIFICACION','2024-10-24','16:09:20',1,'productos'),(138,3,'MODIFICACION','2024-10-24','16:09:20',1,'productos'),(139,3,'MODIFICACION','2024-10-24','16:10:32',1,'productos'),(140,3,'MODIFICACION','2024-10-24','16:10:32',1,'productos'),(141,3,'MODIFICACION','2024-10-24','16:10:32',1,'productos'),(142,3,'MODIFICACION','2024-10-24','16:11:47',1,'productos'),(143,3,'MODIFICACION','2024-10-24','16:11:47',1,'productos'),(144,3,'MODIFICACION','2024-10-24','16:11:47',1,'productos'),(145,3,'MODIFICACION','2024-10-24','16:12:28',1,'productos'),(146,3,'MODIFICACION','2024-10-24','16:12:28',1,'productos'),(147,3,'MODIFICACION','2024-10-24','16:12:28',1,'productos'),(148,3,'MODIFICACION','2024-10-24','16:18:10',1,'productos'),(149,3,'MODIFICACION','2024-10-24','16:18:10',1,'productos'),(150,3,'MODIFICACION','2024-10-24','16:18:10',1,'productos'),(151,3,'MODIFICACION','2024-10-24','16:18:41',1,'productos'),(152,3,'MODIFICACION','2024-10-24','16:18:41',1,'productos'),(153,3,'MODIFICACION','2024-10-24','16:18:41',1,'productos'),(154,3,'MODIFICACION','2024-10-24','16:20:01',1,'productos'),(155,3,'MODIFICACION','2024-10-24','16:20:01',1,'productos'),(156,3,'MODIFICACION','2024-10-24','16:20:01',1,'productos'),(157,3,'MODIFICACION','2024-10-24','16:22:13',1,'productos'),(158,3,'MODIFICACION','2024-10-24','16:22:13',1,'productos'),(159,3,'MODIFICACION','2024-10-24','16:22:13',1,'productos'),(160,3,'MODIFICACION','2024-10-24','16:22:56',1,'productos'),(161,3,'MODIFICACION','2024-10-24','16:22:56',1,'productos'),(162,3,'MODIFICACION','2024-10-24','16:22:56',1,'productos'),(163,3,'MODIFICACION','2024-10-24','16:23:09',1,'productos'),(164,3,'MODIFICACION','2024-10-24','16:23:09',1,'productos'),(165,3,'MODIFICACION','2024-10-24','16:23:09',1,'productos'),(166,3,'MODIFICACION','2024-10-24','16:25:10',1,'productos'),(167,3,'MODIFICACION','2024-10-24','16:25:10',1,'productos'),(168,3,'MODIFICACION','2024-10-24','16:25:10',1,'productos'),(169,3,'MODIFICACION','2024-10-24','16:26:29',1,'productos'),(170,3,'MODIFICACION','2024-10-24','16:26:29',1,'productos'),(171,3,'MODIFICACION','2024-10-24','16:26:29',1,'productos'),(172,3,'MODIFICACION','2024-10-24','16:31:37',1,'productos'),(173,3,'MODIFICACION','2024-10-24','16:31:37',1,'productos'),(174,3,'MODIFICACION','2024-10-24','16:31:37',1,'productos'),(175,3,'MODIFICACION','2024-10-24','16:32:59',1,'productos'),(176,3,'MODIFICACION','2024-10-24','16:32:59',1,'productos'),(177,3,'MODIFICACION','2024-10-24','16:32:59',1,'productos'),(178,3,'MODIFICACION','2024-10-24','16:33:10',1,'productos'),(179,3,'MODIFICACION','2024-10-24','16:33:10',1,'productos'),(180,3,'MODIFICACION','2024-10-24','16:33:10',1,'productos'),(181,3,'MODIFICACION','2024-10-24','16:33:18',1,'productos'),(182,3,'MODIFICACION','2024-10-24','16:33:18',1,'productos'),(183,3,'MODIFICACION','2024-10-24','16:33:18',1,'productos'),(184,3,'MODIFICACION','2024-10-24','16:33:29',1,'productos'),(185,3,'MODIFICACION','2024-10-24','16:33:29',1,'productos'),(186,3,'MODIFICACION','2024-10-24','16:33:29',1,'productos'),(187,3,'MODIFICACION','2024-10-24','16:33:37',1,'productos'),(188,3,'MODIFICACION','2024-10-24','16:33:37',1,'productos'),(189,3,'MODIFICACION','2024-10-24','16:33:37',1,'productos'),(190,3,'MODIFICACION','2024-10-24','16:33:40',1,'productos'),(191,3,'MODIFICACION','2024-10-24','16:33:40',1,'productos'),(192,3,'MODIFICACION','2024-10-24','16:33:40',1,'productos'),(193,3,'MODIFICACION','2024-10-24','16:33:46',1,'productos'),(194,3,'MODIFICACION','2024-10-24','16:33:46',1,'productos'),(195,3,'MODIFICACION','2024-10-24','16:33:46',1,'productos'),(196,3,'MODIFICACION','2024-10-24','16:36:11',1,'productos'),(197,3,'MODIFICACION','2024-10-24','16:36:11',1,'productos'),(198,3,'MODIFICACION','2024-10-24','16:36:11',1,'productos'),(199,3,'MODIFICACION','2024-10-24','16:36:36',1,'productos'),(200,3,'MODIFICACION','2024-10-24','16:36:36',1,'productos'),(201,3,'MODIFICACION','2024-10-24','16:36:36',1,'productos'),(202,3,'MODIFICACION','2024-10-24','16:39:00',1,'productos'),(203,3,'MODIFICACION','2024-10-24','16:39:00',1,'productos'),(204,3,'MODIFICACION','2024-10-24','16:39:00',1,'productos'),(205,3,'MODIFICACION','2024-10-24','16:39:30',1,'productos'),(206,3,'MODIFICACION','2024-10-24','16:39:30',1,'productos'),(207,3,'MODIFICACION','2024-10-24','16:39:30',1,'productos'),(208,3,'MODIFICACION','2024-10-24','16:40:57',1,'productos'),(209,3,'MODIFICACION','2024-10-24','16:40:57',1,'productos'),(210,3,'MODIFICACION','2024-10-24','16:40:57',1,'productos'),(211,3,'MODIFICACION','2024-10-24','16:41:22',1,'productos'),(212,3,'MODIFICACION','2024-10-24','16:41:22',1,'productos'),(213,3,'MODIFICACION','2024-10-24','16:41:22',1,'productos'),(214,3,'MODIFICACION','2024-10-24','16:42:43',1,'productos'),(215,3,'MODIFICACION','2024-10-24','16:42:43',1,'productos'),(216,3,'MODIFICACION','2024-10-24','16:42:43',1,'productos'),(217,3,'MODIFICACION','2024-10-24','16:50:45',1,'productos'),(218,3,'MODIFICACION','2024-10-24','16:50:45',1,'productos'),(219,3,'MODIFICACION','2024-10-24','16:50:45',1,'productos'),(220,3,'MODIFICACION','2024-10-24','16:51:17',1,'productos'),(221,3,'MODIFICACION','2024-10-24','16:51:17',1,'productos'),(222,3,'MODIFICACION','2024-10-24','16:51:17',1,'productos'),(223,3,'MODIFICACION','2024-10-24','16:52:36',1,'productos'),(224,3,'MODIFICACION','2024-10-24','16:52:36',1,'productos'),(225,3,'MODIFICACION','2024-10-24','16:52:36',1,'productos'),(226,3,'MODIFICACION','2024-10-24','16:57:18',1,'productos'),(227,3,'MODIFICACION','2024-10-24','16:57:18',1,'productos'),(228,3,'MODIFICACION','2024-10-24','16:57:18',1,'productos'),(229,3,'MODIFICACION','2024-10-24','16:58:19',1,'productos'),(230,3,'MODIFICACION','2024-10-24','16:58:19',1,'productos'),(231,3,'MODIFICACION','2024-10-24','16:58:19',1,'productos'),(232,3,'MODIFICACION','2024-10-24','16:58:28',1,'productos'),(233,3,'MODIFICACION','2024-10-24','16:58:28',1,'productos'),(234,3,'MODIFICACION','2024-10-24','16:58:28',1,'productos'),(235,3,'MODIFICACION','2024-10-24','16:59:18',1,'productos'),(236,3,'MODIFICACION','2024-10-24','16:59:18',1,'productos'),(237,3,'MODIFICACION','2024-10-24','16:59:18',1,'productos'),(238,3,'MODIFICACION','2024-10-24','17:00:08',1,'productos'),(239,3,'MODIFICACION','2024-10-24','17:00:08',1,'productos'),(240,3,'MODIFICACION','2024-10-24','17:00:08',1,'productos'),(241,3,'MODIFICACION','2024-10-24','17:01:44',1,'productos'),(242,3,'MODIFICACION','2024-10-24','17:01:44',1,'productos'),(243,3,'MODIFICACION','2024-10-24','17:01:44',1,'productos'),(244,3,'MODIFICACION','2024-10-24','17:11:05',1,'productos'),(245,3,'MODIFICACION','2024-10-24','17:11:05',1,'productos'),(246,3,'MODIFICACION','2024-10-24','17:11:05',1,'productos'),(247,3,'MODIFICACION','2024-10-24','17:11:50',1,'productos'),(248,3,'MODIFICACION','2024-10-24','17:11:50',1,'productos'),(249,3,'MODIFICACION','2024-10-24','17:11:50',1,'productos'),(250,3,'MODIFICACION','2024-10-24','17:14:02',1,'productos'),(251,3,'MODIFICACION','2024-10-24','17:14:02',1,'productos'),(252,3,'MODIFICACION','2024-10-24','17:14:02',1,'productos'),(253,3,'MODIFICACION','2024-10-24','17:14:44',1,'productos'),(254,3,'MODIFICACION','2024-10-24','17:14:44',1,'productos'),(255,3,'MODIFICACION','2024-10-24','17:14:44',1,'productos'),(256,3,'MODIFICACION','2024-10-24','17:19:59',1,'productos'),(257,3,'MODIFICACION','2024-10-24','17:19:59',1,'productos'),(258,3,'MODIFICACION','2024-10-24','17:19:59',1,'productos'),(259,3,'MODIFICACION','2024-10-24','17:21:37',1,'productos'),(260,3,'MODIFICACION','2024-10-24','17:21:37',1,'productos'),(261,3,'MODIFICACION','2024-10-24','17:21:37',1,'productos'),(262,3,'MODIFICACION','2024-10-24','17:24:36',1,'productos'),(263,3,'MODIFICACION','2024-10-24','17:24:36',1,'productos'),(264,3,'MODIFICACION','2024-10-24','17:24:36',1,'productos'),(265,3,'MODIFICACION','2024-10-24','17:25:57',1,'productos'),(266,3,'MODIFICACION','2024-10-24','17:25:57',1,'productos'),(267,3,'MODIFICACION','2024-10-24','17:25:57',1,'productos'),(268,3,'MODIFICACION','2024-10-24','17:34:01',1,'productos'),(269,3,'MODIFICACION','2024-10-24','17:34:01',1,'productos'),(270,3,'MODIFICACION','2024-10-24','17:34:01',1,'productos'),(271,3,'MODIFICACION','2024-10-24','17:36:42',1,'productos'),(272,3,'MODIFICACION','2024-10-24','17:36:42',1,'productos'),(273,3,'MODIFICACION','2024-10-24','17:36:42',1,'productos'),(274,3,'MODIFICACION','2024-10-24','17:37:18',1,'productos'),(275,3,'MODIFICACION','2024-10-24','17:37:18',1,'productos'),(276,3,'MODIFICACION','2024-10-24','17:37:18',1,'productos'),(277,3,'MODIFICACION','2024-10-24','18:39:51',1,'productos'),(278,3,'MODIFICACION','2024-10-24','18:39:51',1,'productos'),(279,3,'MODIFICACION','2024-10-24','18:39:51',1,'productos'),(280,3,'MODIFICACION','2024-10-24','18:49:40',1,'productos'),(281,3,'MODIFICACION','2024-10-24','18:49:40',1,'productos'),(282,3,'MODIFICACION','2024-10-24','18:49:40',1,'productos'),(283,3,'MODIFICACION','2024-10-24','18:51:44',1,'productos'),(284,3,'MODIFICACION','2024-10-24','18:51:44',1,'productos'),(285,3,'MODIFICACION','2024-10-24','18:51:44',1,'productos'),(286,3,'MODIFICACION','2024-10-24','18:52:35',1,'productos'),(287,3,'MODIFICACION','2024-10-24','18:52:35',1,'productos'),(288,3,'MODIFICACION','2024-10-24','18:52:35',1,'productos'),(289,3,'MODIFICACION','2024-10-24','18:53:31',1,'productos'),(290,3,'MODIFICACION','2024-10-24','18:53:31',1,'productos'),(291,3,'MODIFICACION','2024-10-24','18:53:31',1,'productos'),(292,3,'MODIFICACION','2024-10-24','18:54:01',1,'productos'),(293,3,'MODIFICACION','2024-10-24','18:54:01',1,'productos'),(294,3,'MODIFICACION','2024-10-24','18:54:01',1,'productos'),(295,3,'MODIFICACION','2024-10-24','18:58:15',1,'productos'),(296,3,'MODIFICACION','2024-10-24','18:58:15',1,'productos'),(297,3,'MODIFICACION','2024-10-24','18:58:15',1,'productos'),(298,3,'MODIFICACION','2024-10-24','19:11:16',1,'productos'),(299,3,'MODIFICACION','2024-10-24','19:11:16',1,'productos'),(300,3,'MODIFICACION','2024-10-24','19:11:16',1,'productos'),(301,3,'MODIFICACION','2024-10-24','19:14:08',1,'productos'),(302,3,'MODIFICACION','2024-10-24','19:14:08',1,'productos'),(303,3,'MODIFICACION','2024-10-24','19:14:08',1,'productos'),(304,3,'MODIFICACION','2024-10-24','19:15:16',1,'productos'),(305,3,'MODIFICACION','2024-10-24','19:15:16',1,'productos'),(306,3,'MODIFICACION','2024-10-24','19:15:16',1,'productos'),(307,3,'MODIFICACION','2024-10-24','19:16:39',1,'productos'),(308,3,'MODIFICACION','2024-10-24','19:16:39',1,'productos'),(309,3,'MODIFICACION','2024-10-24','19:16:39',1,'productos'),(310,3,'MODIFICACION','2024-10-24','19:18:04',1,'productos'),(311,3,'MODIFICACION','2024-10-24','19:18:04',1,'productos'),(312,3,'MODIFICACION','2024-10-24','19:18:04',1,'productos'),(313,3,'MODIFICACION','2024-10-24','19:18:58',1,'productos'),(314,3,'MODIFICACION','2024-10-24','19:18:58',1,'productos'),(315,3,'MODIFICACION','2024-10-24','19:18:58',1,'productos'),(316,3,'MODIFICACION','2024-10-24','19:20:25',1,'productos'),(317,3,'MODIFICACION','2024-10-24','19:20:25',1,'productos'),(318,3,'MODIFICACION','2024-10-24','19:20:25',1,'productos'),(319,3,'MODIFICACION','2024-10-24','23:11:25',1,'productos'),(320,3,'MODIFICACION','2024-10-24','23:11:25',1,'productos'),(321,3,'MODIFICACION','2024-10-24','23:11:25',1,'productos'),(322,3,'MODIFICACION','2024-10-24','23:12:47',1,'productos'),(323,3,'MODIFICACION','2024-10-24','23:12:47',1,'productos'),(324,3,'MODIFICACION','2024-10-24','23:12:47',1,'productos'),(325,3,'MODIFICACION','2024-10-24','23:14:22',1,'productos'),(326,3,'MODIFICACION','2024-10-24','23:14:22',1,'productos'),(327,3,'MODIFICACION','2024-10-24','23:14:22',1,'productos'),(328,3,'MODIFICACION','2024-10-24','23:18:17',1,'productos'),(329,3,'MODIFICACION','2024-10-24','23:18:17',1,'productos'),(330,3,'MODIFICACION','2024-10-24','23:18:17',1,'productos'),(331,3,'MODIFICACION','2024-10-24','23:21:35',1,'productos'),(332,3,'MODIFICACION','2024-10-24','23:21:35',1,'productos'),(333,3,'MODIFICACION','2024-10-24','23:21:35',1,'productos'),(334,3,'MODIFICACION','2024-10-24','23:23:27',1,'productos'),(335,3,'MODIFICACION','2024-10-24','23:23:27',1,'productos'),(336,3,'MODIFICACION','2024-10-24','23:23:27',1,'productos'),(337,3,'MODIFICACION','2024-10-24','23:31:01',1,'productos'),(338,3,'MODIFICACION','2024-10-24','23:31:01',1,'productos'),(339,3,'MODIFICACION','2024-10-24','23:31:01',1,'productos'),(340,3,'MODIFICACION','2024-10-24','23:31:53',1,'productos'),(341,3,'MODIFICACION','2024-10-24','23:31:53',1,'productos'),(342,3,'MODIFICACION','2024-10-24','23:31:53',1,'productos'),(343,3,'MODIFICACION','2024-10-24','23:40:25',1,'productos'),(344,3,'MODIFICACION','2024-10-24','23:40:25',1,'productos'),(345,3,'MODIFICACION','2024-10-24','23:40:25',1,'productos'),(346,3,'MODIFICACION','2024-10-24','23:42:15',1,'productos'),(347,3,'MODIFICACION','2024-10-24','23:42:15',1,'productos'),(348,3,'MODIFICACION','2024-10-24','23:42:15',1,'productos'),(349,3,'MODIFICACION','2024-10-24','23:43:57',1,'productos'),(350,3,'MODIFICACION','2024-10-24','23:43:57',1,'productos'),(351,3,'MODIFICACION','2024-10-24','23:43:57',1,'productos'),(352,3,'MODIFICACION','2024-10-24','23:45:11',1,'productos'),(353,3,'MODIFICACION','2024-10-24','23:45:11',1,'productos'),(354,3,'MODIFICACION','2024-10-24','23:45:11',1,'productos'),(355,3,'MODIFICACION','2024-10-24','23:47:55',1,'productos'),(356,3,'MODIFICACION','2024-10-24','23:47:55',1,'productos'),(357,3,'MODIFICACION','2024-10-24','23:47:55',1,'productos'),(358,3,'MODIFICACION','2024-10-25','10:38:17',1,'productos'),(359,3,'MODIFICACION','2024-10-25','10:38:17',1,'productos'),(360,3,'MODIFICACION','2024-10-25','10:38:17',1,'productos'),(361,3,'MODIFICACION','2024-10-25','10:38:24',1,'productos'),(362,3,'MODIFICACION','2024-10-25','10:38:24',1,'productos'),(363,3,'MODIFICACION','2024-10-25','10:38:24',1,'productos'),(364,3,'MODIFICACION','2024-10-25','10:40:21',1,'productos'),(365,3,'MODIFICACION','2024-10-25','10:40:21',1,'productos'),(366,3,'MODIFICACION','2024-10-25','10:40:21',1,'productos'),(367,3,'MODIFICACION','2024-10-25','10:41:23',1,'productos'),(368,3,'MODIFICACION','2024-10-25','10:41:23',1,'productos'),(369,3,'MODIFICACION','2024-10-25','10:41:23',1,'productos'),(370,3,'MODIFICACION','2024-10-25','10:47:21',1,'productos'),(371,3,'MODIFICACION','2024-10-25','10:47:21',1,'productos'),(372,3,'MODIFICACION','2024-10-25','10:47:21',1,'productos'),(373,3,'MODIFICACION','2024-10-25','10:48:37',1,'productos'),(374,3,'MODIFICACION','2024-10-25','10:48:37',1,'productos'),(375,3,'MODIFICACION','2024-10-25','10:48:37',1,'productos'),(376,3,'MODIFICACION','2024-10-25','10:54:38',1,'productos'),(377,3,'MODIFICACION','2024-10-25','10:54:38',1,'productos'),(378,3,'MODIFICACION','2024-10-25','10:54:38',1,'productos'),(379,3,'MODIFICACION','2024-10-25','11:04:41',1,'productos'),(380,3,'MODIFICACION','2024-10-25','11:04:41',1,'productos'),(381,3,'MODIFICACION','2024-10-25','11:04:41',1,'productos'),(382,3,'MODIFICACION','2024-10-25','11:07:15',1,'productos'),(383,3,'MODIFICACION','2024-10-25','11:07:15',1,'productos'),(384,3,'MODIFICACION','2024-10-25','11:07:15',1,'productos'),(385,3,'MODIFICACION','2024-10-25','11:49:21',1,'productos'),(386,3,'MODIFICACION','2024-10-25','11:49:21',1,'productos'),(387,3,'MODIFICACION','2024-10-25','11:49:21',1,'productos'),(388,3,'MODIFICACION','2024-10-25','11:52:59',1,'productos'),(389,3,'MODIFICACION','2024-10-25','11:52:59',1,'productos'),(390,3,'MODIFICACION','2024-10-25','11:52:59',1,'productos'),(391,3,'MODIFICACION','2024-10-25','12:02:39',1,'productos'),(392,3,'MODIFICACION','2024-10-25','12:02:39',1,'productos'),(393,3,'MODIFICACION','2024-10-25','12:02:39',1,'productos'),(394,3,'MODIFICACION','2024-10-25','15:33:26',1,'productos'),(395,3,'MODIFICACION','2024-10-25','15:33:26',1,'productos'),(396,3,'MODIFICACION','2024-10-25','15:33:26',1,'productos'),(397,3,'MODIFICACION','2024-10-25','15:34:18',1,'productos'),(398,3,'MODIFICACION','2024-10-25','15:34:18',1,'productos'),(399,3,'MODIFICACION','2024-10-25','15:34:18',1,'productos'),(400,3,'MODIFICACION','2024-10-25','15:36:31',1,'productos'),(401,3,'MODIFICACION','2024-10-25','15:36:31',1,'productos'),(402,3,'MODIFICACION','2024-10-25','15:36:31',1,'productos'),(403,3,'MODIFICACION','2024-10-25','15:41:15',1,'productos'),(404,3,'MODIFICACION','2024-10-25','15:41:15',1,'productos'),(405,3,'MODIFICACION','2024-10-25','15:41:15',1,'productos'),(406,3,'MODIFICACION','2024-10-25','15:42:56',1,'productos'),(407,3,'MODIFICACION','2024-10-25','15:42:56',1,'productos'),(408,3,'MODIFICACION','2024-10-25','15:42:56',1,'productos'),(409,3,'MODIFICACION','2024-10-25','15:46:41',1,'almacen'),(410,3,'MODIFICACION','2024-10-25','15:47:17',1,'productos'),(411,3,'MODIFICACION','2024-10-25','15:47:17',1,'productos'),(412,3,'MODIFICACION','2024-10-25','15:47:17',1,'productos'),(413,3,'MODIFICACION','2024-10-25','16:14:44',1,'productos'),(414,3,'MODIFICACION','2024-10-25','16:14:44',1,'productos'),(415,3,'MODIFICACION','2024-10-25','16:14:44',1,'productos'),(416,3,'MODIFICACION','2024-10-25','16:21:01',1,'productos'),(417,3,'MODIFICACION','2024-10-25','16:21:01',1,'productos'),(418,3,'MODIFICACION','2024-10-25','16:21:01',1,'productos'),(419,3,'MODIFICACION','2024-10-25','16:23:40',1,'productos'),(420,3,'MODIFICACION','2024-10-25','16:23:40',1,'productos'),(421,3,'MODIFICACION','2024-10-25','16:23:40',1,'productos'),(422,3,'MODIFICACION','2024-10-25','16:26:12',1,'productos'),(423,3,'MODIFICACION','2024-10-25','16:26:12',1,'productos'),(424,3,'MODIFICACION','2024-10-25','16:26:12',1,'productos'),(425,3,'MODIFICACION','2024-10-25','16:27:48',1,'productos'),(426,3,'MODIFICACION','2024-10-25','16:27:48',1,'productos'),(427,3,'MODIFICACION','2024-10-25','16:27:48',1,'productos'),(428,3,'MODIFICACION','2024-10-25','19:13:41',1,'productos'),(429,3,'MODIFICACION','2024-10-25','19:13:41',1,'productos'),(430,3,'MODIFICACION','2024-10-25','19:13:41',1,'productos'),(431,3,'MODIFICACION','2024-10-25','19:26:07',1,'productos'),(432,3,'MODIFICACION','2024-10-25','19:26:07',1,'productos'),(433,3,'MODIFICACION','2024-10-25','19:26:07',1,'productos'),(434,3,'MODIFICACION','2024-10-25','20:02:51',1,'productos'),(435,3,'MODIFICACION','2024-10-25','20:02:51',1,'productos'),(436,3,'MODIFICACION','2024-10-25','20:02:51',1,'productos'),(437,3,'MODIFICACION','2024-10-25','20:12:58',1,'productos'),(438,3,'MODIFICACION','2024-10-25','20:12:58',1,'productos'),(439,3,'MODIFICACION','2024-10-25','20:12:58',1,'productos'),(440,3,'MODIFICACION','2024-10-25','20:23:08',1,'productos'),(441,3,'MODIFICACION','2024-10-25','20:23:08',1,'productos'),(442,3,'MODIFICACION','2024-10-25','20:23:08',1,'productos'),(443,3,'MODIFICACION','2024-10-25','20:27:35',1,'productos'),(444,3,'MODIFICACION','2024-10-25','20:27:35',1,'productos'),(445,3,'MODIFICACION','2024-10-25','20:27:35',1,'productos'),(446,3,'MODIFICACION','2024-10-25','20:33:44',1,'productos'),(447,3,'MODIFICACION','2024-10-25','20:33:44',1,'productos'),(448,3,'MODIFICACION','2024-10-25','20:33:44',1,'productos'),(449,3,'MODIFICACION','2024-10-25','21:42:27',1,'productos'),(450,3,'MODIFICACION','2024-10-25','21:42:27',1,'productos'),(451,3,'MODIFICACION','2024-10-25','21:42:27',1,'productos'),(452,3,'MODIFICACION','2024-10-26','08:31:51',1,'productos'),(453,3,'MODIFICACION','2024-10-26','08:31:51',1,'productos'),(454,3,'MODIFICACION','2024-10-26','08:31:51',1,'productos'),(455,3,'MODIFICACION','2024-10-26','08:31:51',1,'productos'),(456,3,'MODIFICACION','2024-10-26','08:31:51',1,'productos');
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audmov`
--

DROP TABLE IF EXISTS `audmov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audmov` (
  `idMov` int NOT NULL,
  `Movimiento` varchar(100) NOT NULL,
  PRIMARY KEY (`idMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audmov`
--

LOCK TABLES `audmov` WRITE;
/*!40000 ALTER TABLE `audmov` DISABLE KEYS */;
INSERT INTO `audmov` VALUES (1,'ALTA'),(2,'BAJA'),(3,'MODIFICACION');
/*!40000 ALTER TABLE `audmov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasesarticulos`
--

DROP TABLE IF EXISTS `clasesarticulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasesarticulos` (
  `IdClaseArticulo` int NOT NULL AUTO_INCREMENT,
  `Clase` varchar(45) NOT NULL,
  PRIMARY KEY (`IdClaseArticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasesarticulos`
--

LOCK TABLES `clasesarticulos` WRITE;
/*!40000 ALTER TABLE `clasesarticulos` DISABLE KEYS */;
INSERT INTO `clasesarticulos` VALUES (1,'TORNILLOS'),(2,'MADERAS'),(3,'PEGAMENTOS'),(4,'HERRAMIENTAS'),(5,'LIBRERIA'),(6,'MAQUINAS ELECT.'),(7,'CLAVOS'),(8,'MANIJAS'),(9,'REGATONES'),(10,'ESQUINEROS'),(11,'CUERINA'),(12,'VINILICOS'),(13,'TELAS'),(14,'LACAS'),(15,'PINTURAS'),(16,'CUEROS'),(17,'TONERS'),(18,'RUEDAS'),(19,'TARUGOS'),(20,'LOGOS'),(21,'CHAPA APOYO'),(22,'CURTIEMBRE'),(23,'MADERA ESPECIAL'),(24,'ELECTRICIDAD'),(25,'VARIOS');
/*!40000 ALTER TABLE `clasesarticulos` ENABLE KEYS */;
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
  `RazonSocial` varchar(20) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Estado` varchar(1) NOT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `FKIdEmpleado_idx` (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  CONSTRAINT `FKIdContactoClientes` FOREIGN KEY (`IdContacto`) REFERENCES `contactos` (`IdContacto`),
  CONSTRAINT `FKIdDireccionClientes` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoClientes` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,1,1,'Fender LLC','Fender','2015-01-01','A'),(2,2,2,2,'Marshall Inc','Marshall','2014-02-10','A'),(3,3,3,3,'Mesa LLC','Mesa Boogie','2014-01-08','A'),(4,4,4,4,'Soldano','Soldano','2019-10-10','A'),(5,5,5,5,'Bogner Amp Inc','Bogner','2018-09-10','A'),(6,6,6,6,'Rivera Music LLC','Rivera','2017-10-01','A');
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
  `Telefono1` varchar(45) DEFAULT NULL,
  `Telefono2` varchar(45) DEFAULT NULL,
  `Telefono3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,'fenderllc@fender.com','1111-2222','1111-2223','1111-2224'),(2,'Marshall@marshall.com','2222-1111','2222-1112','2222-1113'),(3,'mesa@mesa.com','3333-2211','3333-2222',NULL),(4,'soldano@soldano.com','1111-2254','1111-8989',NULL),(5,'bogneramp@bogneramp.com','2223-5454',NULL,NULL),(6,'riverainfo@rivera.com','2233-4455','2233-5544',NULL);
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
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL,
  `Cargo` varchar(20) DEFAULT NULL,
  `SexEmp` varchar(1) DEFAULT NULL,
  `FecNac` date DEFAULT NULL,
  `FecInc` date DEFAULT NULL,
  `SalEmp` decimal(8,2) DEFAULT NULL,
  `Comision` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  KEY `FKIdContacto_idx` (`IdContacto`),
  KEY `FkIdSector_idx` (`IdSector`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,1,1,'root','root','Vendedor','X',NULL,NULL,NULL,NULL),(2,2,2,1,'Mariano','Del Moral','Vendedor','M',NULL,NULL,NULL,NULL),(3,3,3,1,'Skibidi','Toilet','Vendedor','M',NULL,NULL,NULL,NULL),(4,4,4,1,'Hawk','Tuah','Vendedor','F',NULL,NULL,NULL,NULL),(5,5,5,1,'Charly','Garcia','Vendedor','M',NULL,NULL,NULL,NULL),(6,6,6,1,'Javier','Milei','Vendedor','F',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturascab`
--

DROP TABLE IF EXISTS `facturascab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturascab` (
  `IdFactura` int NOT NULL,
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
INSERT INTO `facturascab` VALUES (1,3,1,1,3,'2024-09-06','2024-09-05',402429.43,0.00,402429.43,84510.18,486939.61,'2024-10-06',NULL);
/*!40000 ALTER TABLE `facturascab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturascab_AFTER_INSERT` AFTER INSERT ON `facturascab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "ALTA";
    set v_tabla = "facturascab";
    set v_idmov = 1;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturascab_AFTER_UPDATE` AFTER UPDATE ON `facturascab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "MODIFICACION";
    set v_tabla = "facturascab";
    set v_idmov = 3;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturascab_AFTER_DELETE` AFTER DELETE ON `facturascab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "BAJA";
    set v_tabla = "facturascab";
    set v_idmov = 2;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `Importe` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdFacturaDet`),
  KEY `FKIdFactura_idx` (`IdFactura`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  CONSTRAINT `FKIdFacturaFactDet` FOREIGN KEY (`IdFactura`) REFERENCES `facturascab` (`IdFactura`),
  CONSTRAINT `FKIdProductoFactDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasdet`
--

LOCK TABLES `facturasdet` WRITE;
/*!40000 ALTER TABLE `facturasdet` DISABLE KEYS */;
INSERT INTO `facturasdet` VALUES (2,1,'MVCBO1',10.00,NULL,155569.31,1555693.10),(3,1,'MVCAB1+',15.00,NULL,103370.41,1550556.15),(4,1,'CT1X12WIDE23',5.00,NULL,143489.71,717448.55);
/*!40000 ALTER TABLE `facturasdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojasruta`
--

DROP TABLE IF EXISTS `hojasruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojasruta` (
  `IdProducto` varchar(45) NOT NULL,
  `IdSecuencia` varchar(20) NOT NULL,
  `Secuencia` varchar(20) NOT NULL,
  `Duracion` time NOT NULL,
  `IdRuta` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdRuta`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdSecuencia_idx` (`IdSecuencia`),
  CONSTRAINT `FKIdProductoHojRut` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdSecuenciaHojRut` FOREIGN KEY (`IdSecuencia`) REFERENCES `secuenciasproduccion` (`IdSecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojasruta`
--

LOCK TABLES `hojasruta` WRITE;
/*!40000 ALTER TABLE `hojasruta` DISABLE KEYS */;
INSERT INTO `hojasruta` VALUES ('BLUED4X10','AC1','1','35:00:00',1),('BLUED4X10','EN1','2','45:00:00',2),('BLUED4X10','AC2','3','28:00:00',3),('BLUED4X10','EN2','5','25:00:00',4),('BLUED4X10','CC','6','15:00:00',5),('MVCAB1+','AC1','1','35:00:00',6),('MVCAB1+','EN1','2','40:00:00',7),('MVCAB1+','AC2','3','15:00:00',8),('MVCAB1+','EN2','5','25:00:00',9),('MVCBO1','AC1','1','35:00:00',10),('MVCBO1','EN1','2','45:00:00',11),('MVCBO1','AC2','3','28:00:00',12),('MVCBO1','EN2','5','25:00:00',13),('MVCBO1','CC','6','15:00:00',14),('FHOTRODDX3','AC1','1','20:00:00',15),('FHOTRODDX3','EN1','2','35:00:00',16),('FHOTRODDX3','TAP','4','68:00:00',17),('FHOTRODDX3','AC2','3','30:00:00',18),('FHOTRODDX3','EN2','5','25:00:00',19),('BLUED4X10','TAP','4','15:00:00',20),('MVCBO1','TAP','4','78:00:00',21),('MVCAB1+','TAP','4','68:00:00',22),('CT1X12WIDE23','AC1','1','15:00:00',23),('CT1X12WIDE23','EN1','2','35:00:00',24),('CT1X12WIDE23','AC2','3','15:00:00',25),('CT1X12WIDE23','TAP','4','56:00:00',26),('CT1X12WIDE23','EN2','5','14:00:00',27),('CT1X12WIDE23','CC','6','15:00:00',28);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasproduccion`
--

LOCK TABLES `lineasproduccion` WRITE;
/*!40000 ALTER TABLE `lineasproduccion` DISABLE KEYS */;
INSERT INTO `lineasproduccion` VALUES (1,2,'AC1','e'),(2,2,'AC2','e'),(3,2,'ENS1','e'),(4,2,'ENS2','e'),(5,2,'CC','e'),(6,2,'TAP','e');
/*!40000 ALTER TABLE `lineasproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mastertipo`
--

DROP TABLE IF EXISTS `mastertipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mastertipo` (
  `IdTipo` int NOT NULL AUTO_INCREMENT,
  `TipoDetalle` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastertipo`
--

LOCK TABLES `mastertipo` WRITE;
/*!40000 ALTER TABLE `mastertipo` DISABLE KEYS */;
INSERT INTO `mastertipo` VALUES (1,'COMBO'),(2,'CABEZAL'),(3,'CAJA'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `mastertipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialesreservadosprod`
--

DROP TABLE IF EXISTS `materialesreservadosprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialesreservadosprod` (
  `IdReservado` int NOT NULL AUTO_INCREMENT,
  `IdOrdenVenta` int NOT NULL,
  `IdItem` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Detalle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`IdReservado`),
  KEY `FKIdItem_idx` (`IdItem`),
  KEY `FKIdOrdenVentaMatReser_idx` (`IdOrdenVenta`),
  CONSTRAINT `FKIdItemMaterialesReser` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`),
  CONSTRAINT `FKIdOrdenVentaMatReser` FOREIGN KEY (`IdOrdenVenta`) REFERENCES `ordenesventascab` (`IdOrdenVenta`)
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
  KEY `FKIdProductoModProds_idx` (`IdProducto`),
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
  `IdItem` varchar(45) NOT NULL,
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
  `IdTipoEntrega` int DEFAULT NULL,
  `FechaEntrega` date NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Item` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Pendientes` decimal(8,2) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `IdOrdenFabricacion` int NOT NULL,
  PRIMARY KEY (`IdNotificacion`),
  KEY `FKIdVendedor_idx` (`IdVendedor`),
  KEY `FKIdJefeLinea_idx` (`IdJefeLinea`),
  KEY `FKIdLineaProd_idx` (`IdLineaProd`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdTipoEntrega_idx` (`IdTipoEntrega`),
  KEY `FKIdOrdenFabricacionNotCab_idx` (`IdOrdenFabricacion`),
  CONSTRAINT `FKIdClienteNotCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdJefeLineaNotCab` FOREIGN KEY (`IdJefeLinea`) REFERENCES `lineasproduccion` (`IdJefeLinea`),
  CONSTRAINT `FKIdLineaProdNotCab` FOREIGN KEY (`IdLineaProd`) REFERENCES `lineasproduccion` (`IdLineaProd`),
  CONSTRAINT `FKIdOrdenNotCabLolo` FOREIGN KEY (`IdOrdenFabricacion`) REFERENCES `ordenfabricacioncab` (`IdOrdenFabricacion`),
  CONSTRAINT `FKIdProductoNotCab` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdTipoEntregaNotCab` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`),
  CONSTRAINT `FKIdVendedorNotCab` FOREIGN KEY (`IdVendedor`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionescab`
--

LOCK TABLES `notificacionescab` WRITE;
/*!40000 ALTER TABLE `notificacionescab` DISABLE KEYS */;
INSERT INTO `notificacionescab` VALUES (1,1,2,1,3,'MVCBO1',NULL,'2025-01-01','2024-02-02','OFP',1,10,10.00,0.00,NULL,1),(2,1,2,1,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(3,1,2,2,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(4,1,2,3,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(5,1,2,4,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(6,1,2,5,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(7,1,2,6,3,'MVCBO1',NULL,'2025-04-01','2024-05-02','OFF',1,10,10.00,NULL,NULL,2),(8,1,2,1,3,'MVCAB1+',NULL,'2025-04-01','2024-05-02','OFF',2,15,15.00,NULL,NULL,2),(9,1,2,2,3,'MVCAB1+',NULL,'2025-04-01','2024-05-02','OFF',2,15,15.00,NULL,NULL,2),(10,1,2,3,3,'MVCAB1+',NULL,'2025-04-01','2024-05-02','OFF',2,15,15.00,NULL,NULL,2),(11,1,2,4,3,'MVCAB1+',NULL,'2025-04-01','2024-05-02','OFF',2,15,15.00,NULL,NULL,2),(12,1,2,6,3,'MVCAB1+',NULL,'2025-04-01','2024-05-02','OFF',2,15,15.00,NULL,NULL,2),(13,1,2,1,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2),(14,1,2,2,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2),(15,1,2,3,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2),(16,1,2,4,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2),(17,1,2,5,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2),(18,1,2,6,3,'CT1X12WIDE23',NULL,'2025-04-01','2024-05-02','OFF',3,5,5.00,NULL,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionesdet`
--

LOCK TABLES `notificacionesdet` WRITE;
/*!40000 ALTER TABLE `notificacionesdet` DISABLE KEYS */;
INSERT INTO `notificacionesdet` VALUES (1,1,1,'2022-03-14','09:30:00',2.00),(2,1,1,'2022-03-15','08:15:00',1.00),(3,1,1,'2022-03-15','14:45:00',3.00),(4,1,1,'2022-03-16','08:55:00',1.00),(5,1,1,'2022-03-17','16:35:00',1.00),(6,1,1,'2022-03-17','14:50:00',2.00),(7,2,1,'2024-02-02','14:50:00',10.00),(8,3,1,'2024-02-02','14:50:00',10.00),(9,4,1,'2024-02-02','14:50:00',10.00),(10,5,1,'2024-02-02','14:50:00',10.00),(11,6,1,'2024-02-02','14:50:00',10.00),(12,7,1,'2024-02-02','14:50:00',10.00),(13,8,1,'2024-02-02','14:50:00',15.00),(14,9,1,'2024-02-02','14:50:00',15.00),(15,10,1,'2024-02-02','14:50:00',15.00),(16,11,1,'2024-02-02','14:50:00',15.00),(17,12,1,'2024-02-02','14:50:00',15.00),(18,13,1,'2024-02-02','14:50:00',5.00),(19,14,1,'2024-02-02','14:50:00',5.00),(20,15,1,'2024-02-02','14:50:00',5.00),(21,16,1,'2024-02-02','14:50:00',5.00),(22,17,1,'2024-02-02','14:50:00',5.00),(23,18,1,'2024-02-02','14:50:00',5.00);
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
  `IdItem` varchar(45) NOT NULL,
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
  `IdItem` varchar(45) NOT NULL,
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
  `IdTipoPago` int NOT NULL,
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
  KEY `FkIdTipoPagoOrdVenCab_idx` (`IdTipoPago`),
  CONSTRAINT `FKIdClienteOrdVenCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionOrdVenCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoOrdVenCab` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FkIdTipoEntregaOrdVenCab` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`),
  CONSTRAINT `FkIdTipoPagoOrdVenCab` FOREIGN KEY (`IdTipoPago`) REFERENCES `tipospago` (`IdTipoPago`)
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
-- Table structure for table `ordenfabricacioncab`
--

DROP TABLE IF EXISTS `ordenfabricacioncab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenfabricacioncab` (
  `IdOrdenFabricacion` int NOT NULL,
  `IdCliente` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `IdTipoEntrega` int DEFAULT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdOrdenFabricacion`),
  KEY `FKIdClienteOrdenFabDet_idx` (`IdCliente`),
  KEY `FKIdEmpleadoOrdenFabDet_idx` (`IdEmpleado`),
  KEY `FKIdDireccionOrdenFabDet_idx` (`IdDireccion`),
  KEY `FKIdTipoEntregaFabDet_idx` (`IdTipoEntrega`),
  CONSTRAINT `FKIdClienteOrdenFabDet` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionOrdenFabDet` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`),
  CONSTRAINT `FKIdEmpleadoOrdenFabDet` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `FKIdTipoEntregaFabDet` FOREIGN KEY (`IdTipoEntrega`) REFERENCES `tiposentrega` (`IdTipoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenfabricacioncab`
--

LOCK TABLES `ordenfabricacioncab` WRITE;
/*!40000 ALTER TABLE `ordenfabricacioncab` DISABLE KEYS */;
INSERT INTO `ordenfabricacioncab` VALUES (1,3,1,3,NULL,'2024-02-02','2025-01-01',NULL),(2,3,1,3,NULL,'2024-05-02','2025-04-01',NULL);
/*!40000 ALTER TABLE `ordenfabricacioncab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenfabricacioncab_AFTER_INSERT` AFTER INSERT ON `ordenfabricacioncab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "ALTA";
    set v_tabla = "ordenfabricacioncab";
    set v_idmov = 1;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenfabricacioncab_AFTER_UPDATE` AFTER UPDATE ON `ordenfabricacioncab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "MODIFICACION";
    set v_tabla = "ordenfabricacioncab";
    set v_idmov = 3;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenfabricacioncab_AFTER_DELETE` AFTER DELETE ON `ordenfabricacioncab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "BAJA";
    set v_tabla = "ordenfabricacioncab";
    set v_idmov = 2;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ordenfabricaciondet`
--

DROP TABLE IF EXISTS `ordenfabricaciondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenfabricaciondet` (
  `IdOrdenFabricacionDet` int NOT NULL AUTO_INCREMENT,
  `IdOrdenFabricacion` int NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `Item` int NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdOrdenFabricacionDet`),
  KEY `FKIdOrdenFabricacion-det_idx` (`IdOrdenFabricacion`),
  KEY `FKIdProductoOrdenFabDet_idx` (`IdProducto`),
  CONSTRAINT `FKIdOrdenFabricacion-det` FOREIGN KEY (`IdOrdenFabricacion`) REFERENCES `ordenfabricacioncab` (`IdOrdenFabricacion`),
  CONSTRAINT `FKIdProductoOrdenFabDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenfabricaciondet`
--

LOCK TABLES `ordenfabricaciondet` WRITE;
/*!40000 ALTER TABLE `ordenfabricaciondet` DISABLE KEYS */;
INSERT INTO `ordenfabricaciondet` VALUES (1,1,'MVCBO1',1,10.00,'MARK V - Combo 1x12'),(2,1,'MVCAB1+',2,15.00,'MARK V+ - Head'),(3,1,'CT1X12WIDE23',3,5.00,'California Tweed1X12 CALIFORNIA TWEED 23'),(4,2,'MVCBO1',1,10.00,'MARK V - Combo 1x12'),(5,2,'MVCAB1+',2,15.00,'MARK V+ - Head'),(6,2,'CT1X12WIDE23',3,5.00,'California Tweed1X12 CALIFORNIA TWEED 23');
/*!40000 ALTER TABLE `ordenfabricaciondet` ENABLE KEYS */;
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
  `Producto` varchar(45) NOT NULL,
  `IdTipoProducto` int NOT NULL,
  `Costo` decimal(8,2) NOT NULL,
  `Margen` decimal(8,2) NOT NULL,
  `PUnitario` decimal(8,2) NOT NULL,
  `Ganancia` int NOT NULL,
  `Estado` varchar(1) NOT NULL,
  `FechaAlta` date NOT NULL,
  PRIMARY KEY (`IdProducto`),
  UNIQUE KEY `Producto_UNIQUE` (`Producto`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdTipoProd_idx` (`IdTipoProducto`),
  KEY `FKProducto_idx` (`Producto`),
  CONSTRAINT `FKIdClienteProd` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdTipoProd` FOREIGN KEY (`IdTipoProducto`) REFERENCES `mastertipo` (`IdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('BLUED4X10',1,'Blues Deville 4x10 Reissue',1,100865.34,38.00,131124.94,30,'A','2008-10-10'),('BOGECS-100',5,'Bogner Ecstasy 100-watt Tube Head',2,0.00,29.80,0.00,30,'B','2011-10-10'),('CT1X12WIDE23',3,'California Tweed1X12 CALIFORNIA TWEED 23',3,110376.70,35.00,143489.71,30,'A','2010-02-14'),('FHOTRODDX3',1,'Hot Rod Deluxe III',1,100176.70,37.00,130229.71,30,'A','2018-12-08'),('MJCM900',2,'JCM900 4100',2,0.00,41.00,0.00,30,'B','2008-03-17'),('MVCAB1+',3,'MARK V+ - Head',2,79515.70,35.00,103370.41,30,'A','2012-04-03'),('MVCBO1',3,'MARK V - Combo 1x12',1,119668.70,30.00,155569.31,30,'A','2012-04-03'),('MVS8080',2,'Marshall Valvestate 8080',1,0.00,35.50,0.00,30,'B','2008-01-10'),('PERF1000',1,'Performer 1000 - Black',1,108340.70,40.00,140842.91,30,'A','2009-08-14'),('RIV_VENUS 5x12H',6,'Rivera Venus 5 1x12\" 35-watt Tube Combo Amp',2,0.00,43.60,0.00,30,'B','2015-09-15'),('SLO-100 SO',4,'Soldano SLO-100 Super Lead Overdrive',2,0.00,37.00,0.00,30,'B','2010-12-18');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "ALTA";
    set v_tabla = "productos";
    set v_idmov = 1;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "MODIFICACION";
    set v_tabla = "productos";
    set v_idmov = 3;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_DELETE` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "BAJA";
    set v_tabla = "productos";
    set v_idmov = 2;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `IdItem` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `IdUnidadMedida` varchar(20) NOT NULL,
  `IdSecuencia` varchar(20) NOT NULL,
  PRIMARY KEY (`IdReceta`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdItem_idx` (`IdItem`),
  KEY `FKIdSecuencia_idx` (`IdSecuencia`),
  KEY `FKIdUnidadMedidaReceta_idx` (`IdUnidadMedida`),
  CONSTRAINT `FKIdItem` FOREIGN KEY (`IdItem`) REFERENCES `almacen` (`IdItem`),
  CONSTRAINT `FKIdProducto` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdSecuencia` FOREIGN KEY (`IdSecuencia`) REFERENCES `secuenciasproduccion` (`IdSecuencia`),
  CONSTRAINT `FKIdUnidadMedidaReceta` FOREIGN KEY (`IdUnidadMedida`) REFERENCES `unidadesmedida` (`IdUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetamateriales`
--

LOCK TABLES `recetamateriales` WRITE;
/*!40000 ALTER TABLE `recetamateriales` DISABLE KEYS */;
INSERT INTO `recetamateriales` VALUES (1,'MVCAB1+','TP10028-25',1.00,'CU','AC1'),(2,'MVCAB1+','BP10038-25',1.00,'CU','AC1'),(3,'MVCAB1+','LPD3840-25',1.00,'CU','AC1'),(4,'MVCAB1+','LPI3840-25',1.00,'CU','AC1'),(5,'MVCAB1+','FP9520-25',1.00,'CU','AC2'),(6,'MVCAB1+','FTEP9520-25',1.00,'CU','AC2'),(7,'MVCAB1+','TOPFREP20-25x25',2.00,'CU','AC2'),(8,'MVCAB1+','TOPFONP20-25x25',2.00,'CU','AC2'),(9,'MVCAB1+','REGAMBHN',4.00,'CU','AC1'),(10,'MVCAB1+','ESQUIMBAHN',6.00,'CU','AC1'),(11,'MVCAB1+','MANITMBN',1.00,'CU','AC2'),(12,'MVCAB1+','TARM1020',8.00,'CU','AC2'),(13,'MVCAB1+','PARK205N',4.00,'CU','AC2'),(14,'MVCAB1+','PARK2505N',4.00,'CU','AC2'),(15,'MVCAB1+','FREZ206P',2.00,'CU','AC2'),(16,'MVCAB1+','CHAPMBHN',2.00,'CU','AC1'),(17,'MVCAB1+','FREZ1506P',4.00,'CU','AC1'),(18,'MVCAB1+','CUEMBN',2.80,'M2','AC1'),(19,'MVCAB1+','VINIL',550.00,'CM3','AC1'),(20,'MVCAB1+','FREZ1506N',8.00,'CU','AC1'),(21,'MVCAB1+','MBLOGO1',1.00,'CU','AC1'),(22,'MVCBO1','TP11028-25',1.00,'CU','AC1'),(23,'MVCBO1','BP11038-25',1.00,'CU','AC1'),(24,'MVCBO1','LPD3855-25',1.00,'CU','AC1'),(25,'MVCBO1','LPI3855-25',1.00,'CU','AC1'),(26,'MVCBO1','FP10535-25',1.00,'CU','AC2'),(27,'MVCBO1','TOPFONP30-25x25',2.00,'CU','AC2'),(28,'MVCBO1','FTEP1210545-25',1.00,'CU','AC2'),(29,'MVCBO1','TOPFREP38-25x25',2.00,'CU','AC2'),(30,'MVCBO1','REGAMBHN',4.00,'CU','AC1'),(31,'MVCBO1','ESQUIMBAHN',5.00,'CU','AC1'),(32,'MVCBO1','MANITMBN',1.00,'CU','AC2'),(33,'MVCBO1','TARM1020',8.00,'CU','AC2'),(34,'MVCBO1','PARK205N',4.00,'CU','AC2'),(35,'MVCBO1','PARK2505N',4.00,'CU','AC2'),(36,'MVCBO1','FREZ206P',2.00,'CU','AC2'),(37,'MVCBO1','CHAPMBHN',2.00,'CU','AC1'),(38,'MVCBO1','FREZ1506P',4.00,'CU','AC1'),(39,'MVCBO1','CUEMBN',4.70,'M2','AC1'),(40,'MVCBO1','VINIL',880.00,'CM3','AC1'),(41,'MVCBO1','FREZ1506N',8.00,'CU','AC1'),(42,'MVCBO1','MBLOGO1',1.00,'CU','AC1'),(43,'CT1X12WIDE23','TP12038-25',1.00,'CU','AC1'),(44,'CT1X12WIDE23','BP12038-25',1.00,'CU','AC1'),(45,'CT1X12WIDE23','LPD3855-25',1.00,'CU','AC1'),(46,'CT1X12WIDE23','LPI3855-25',1.00,'CU','AC1'),(47,'CT1X12WIDE23','FP11525-25',1.00,'CU','AC2'),(48,'CT1X12WIDE23','TOPFONP25-25x25',2.00,'CU','AC2'),(49,'CT1X12WIDE23','TOPFREP50-25x25',2.00,'CU','AC2'),(50,'CT1X12WIDE23','FTEP1211550-25',1.00,'CU','AC2'),(51,'CT1X12WIDE23','REGAMBHN',4.00,'CU','AC1'),(52,'CT1X12WIDE23','ESQUIMBAHN',6.00,'CU','AC1'),(53,'CT1X12WIDE23','MANITMBCN',1.00,'CU','AC2'),(54,'CT1X12WIDE23','TARM1020',8.00,'CU','AC2'),(55,'CT1X12WIDE23','PARK205N',8.00,'CU','AC2'),(56,'CT1X12WIDE23','PARK2505N',4.00,'CU','AC2'),(57,'CT1X12WIDE23','FREZ206P',2.00,'CU','AC2'),(58,'CT1X12WIDE23','CHAPMBHN',2.00,'CU','AC2'),(59,'CT1X12WIDE23','FREZ1506P',4.00,'CU','AC1'),(60,'CT1X12WIDE23','CUEMBCREAM',3.60,'M2','AC1'),(61,'CT1X12WIDE23','VINIL',780.00,'CM3','AC1'),(62,'CT1X12WIDE23','FREZ1506N',8.00,'CU','AC1'),(63,'CT1X12WIDE23','FP1557225',1.00,'CU','AC1'),(64,'CT1X12WIDE23','MBLOGO2',1.00,'CU','AC1'),(65,'BLUED4X10','TP10028-25',1.00,'CU','AC1'),(66,'BLUED4X10','BP10038-25',1.00,'CU','AC1'),(67,'BLUED4X10','LPD3840-25',1.00,'CU','AC1'),(68,'BLUED4X10','LPI3840-25',1.00,'CU','AC1'),(69,'BLUED4X10','FP9520-25',1.00,'CU','AC2'),(70,'BLUED4X10','FTEP9520-25',1.00,'CU','AC2'),(71,'BLUED4X10','TOPFREP20-25x25',2.00,'CU','AC2'),(72,'BLUED4X10','TOPFONP20-25x25',2.00,'CU','AC2'),(73,'BLUED4X10','REGAFDERSTD-BKN',4.00,'CU','AC1'),(74,'BLUED4X10','MANITFDER-BK',1.00,'CU','AC2'),(75,'BLUED4X10','TARM1020',8.00,'CU','AC2'),(76,'BLUED4X10','PARK205N',4.00,'CU','AC2'),(77,'BLUED4X10','PARK2505N',4.00,'CU','AC2'),(78,'BLUED4X10','FREZ206P',2.00,'CU','AC2'),(79,'BLUED4X10','FREZ1506P',4.00,'CU','AC1'),(80,'BLUED4X10','TELAFDER-BD',5.80,'M2','AC1'),(81,'BLUED4X10','VINIL',760.00,'CM3','AC1'),(82,'BLUED4X10','FREZ1506N',8.00,'CU','AC1'),(83,'BLUED4X10','FDERLOGO1',1.00,'CU','AC1'),(105,'FHOTRODDX3','TC10028-25',1.00,'CU','AC1'),(106,'FHOTRODDX3','BC10038-25',1.00,'CU','AC1'),(107,'FHOTRODDX3','LCD3840-25',1.00,'CU','AC1'),(108,'FHOTRODDX3','LCI3840-25',1.00,'CU','AC1'),(109,'FHOTRODDX3','FC9520-25',1.00,'CU','AC1'),(110,'FHOTRODDX3','FTEC9520-25',1.00,'CU','AC1'),(111,'FHOTRODDX3','TOPFREC20-25x25',2.00,'CU','AC1'),(112,'FHOTRODDX3','TOPFONC20-25x25',2.00,'CU','AC1'),(113,'FHOTRODDX3','REGAFDERSTD-BKN',4.00,'CU','AC2'),(114,'FHOTRODDX3','ESQUIFDERA-BK',6.00,'CU','AC2'),(115,'FHOTRODDX3','MANITFDER-BK',1.00,'CU','AC2'),(116,'FHOTRODDX3','TARM1020',8.00,'CU','AC2'),(117,'FHOTRODDX3','PARK205N',4.00,'CU','AC2'),(118,'FHOTRODDX3','PARK2505N',4.00,'CU','AC2'),(119,'FHOTRODDX3','FREZ206P',2.00,'CU','AC2'),(120,'FHOTRODDX3','CHAPFDER-HR',2.00,'CU','AC2'),(121,'FHOTRODDX3','FREZ1506P',4.00,'CU','AC1'),(122,'FHOTRODDX3','CUEFDER-BK',4.80,'M2','AC2'),(123,'FHOTRODDX3','VINIL',760.00,'CM3','AC2'),(124,'FHOTRODDX3','FREZ1506N',8.00,'CU','AC1'),(125,'FHOTRODDX3','FDERLOGO2',1.00,'CU','AC2'),(126,'PERF1000','TP10028-25',1.00,'CU','AC1'),(127,'PERF1000','BP10038-25',1.00,'CU','AC1'),(128,'PERF1000','LPD3840-25',1.00,'CU','AC1'),(129,'PERF1000','LPI3840-25',1.00,'CU','AC1'),(130,'PERF1000','FP9520-25',1.00,'CU','AC1'),(131,'PERF1000','FTEP9520-25',1.00,'CU','AC1'),(132,'PERF1000','TOPFREP20-25x25',2.00,'CU','AC1'),(133,'PERF1000','TOPFONP20-25x25',2.00,'CU','AC1'),(134,'PERF1000','REGAFDERSTD-BKN',4.00,'CU','AC2'),(135,'PERF1000','MANITFDER-BK',1.00,'CU','AC2'),(136,'PERF1000','TARM1020',8.00,'CU','AC1'),(137,'PERF1000','PARK205N',4.00,'CU','AC2'),(138,'PERF1000','PARK2505N',4.00,'CU','AC2'),(139,'PERF1000','FREZ206P',2.00,'CU','AC2'),(140,'PERF1000','FREZ1506P',4.00,'CU','AC2'),(141,'PERF1000','CUEFDER-BK',5.10,'M2','AC2'),(142,'PERF1000','VINIL',820.00,'CM3','AC2'),(143,'PERF1000','FREZ1506N',8.00,'CU','AC2'),(144,'PERF1000','FDERLOGO3',1.00,'CU','AC2');
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
  `Fecha` date NOT NULL,
  PRIMARY KEY (`IdReciboPago`),
  KEY `FKIdCliente_idx` (`IdCliente`),
  KEY `FKIdDireccion_idx` (`IdDireccion`),
  CONSTRAINT `FKIdClienteRecPagoCab` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `FKIdDireccionRecPagoCab` FOREIGN KEY (`IdDireccion`) REFERENCES `direcciones` (`IdDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibospagocab`
--

LOCK TABLES `recibospagocab` WRITE;
/*!40000 ALTER TABLE `recibospagocab` DISABLE KEYS */;
INSERT INTO `recibospagocab` VALUES (1,3,3,486839.61,'S','2024-10-01');
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
  `Importe` decimal(8,2) NOT NULL,
  `IdFactura` int NOT NULL,
  PRIMARY KEY (`IdReciboPagoDet`),
  KEY `FKIdReciboPago_idx` (`IdReciboPago`),
  KEY `FKIdTipoPago_idx` (`IdTipoPago`),
  KEY `FKIdFacturaRPDet_idx` (`IdFactura`),
  CONSTRAINT `FKIdReciboPago` FOREIGN KEY (`IdReciboPago`) REFERENCES `recibospagocab` (`IdReciboPago`),
  CONSTRAINT `FKIdTipoPago` FOREIGN KEY (`IdTipoPago`) REFERENCES `tipospago` (`IdTipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibospagodet`
--

LOCK TABLES `recibospagodet` WRITE;
/*!40000 ALTER TABLE `recibospagodet` DISABLE KEYS */;
INSERT INTO `recibospagodet` VALUES (1,1,1,162279.87,1),(2,1,2,162279.87,1),(3,1,3,162279.87,1);
/*!40000 ALTER TABLE `recibospagodet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitoscab`
--

DROP TABLE IF EXISTS `remitoscab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitoscab` (
  `IdRemito` int NOT NULL,
  `IdCliente` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `IdDireccion` int NOT NULL,
  `IdTipoEntrega` int DEFAULT NULL,
  `Fecha` date NOT NULL,
  `PesoTotal` decimal(8,2) DEFAULT NULL,
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
INSERT INTO `remitoscab` VALUES (1,3,1,3,NULL,'2024-09-05',NULL,30.00,'S',NULL);
/*!40000 ALTER TABLE `remitoscab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_INSERT` AFTER INSERT ON `remitoscab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "ALTA";
    set v_tabla = "remitoscab";
    set v_idmov = 1;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_UPDATE` AFTER UPDATE ON `remitoscab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "MODIFICACION";
    set v_tabla = "remitoscab";
    set v_idmov = 3;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_DELETE` AFTER DELETE ON `remitoscab` FOR EACH ROW BEGIN
	DECLARE v_idusr INT;
    DECLARE v_movimiento VARCHAR(50);
    DECLARE v_tabla VARCHAR(50);
    DECLARE v_idmov INT;
    
    set v_idusr = 1;
    set v_movimiento = "BAJA";
    set v_tabla = "remitoscab";
    set v_idmov = 2;
    

    CALL AuditCentralizado(v_idmov, v_movimiento, v_idusr, v_tabla);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `Peso` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`IdRemitoDet`),
  KEY `FKIdProducto_idx` (`IdProducto`),
  KEY `FKIdRemito_idx` (`IdRemito`),
  CONSTRAINT `FKIdProductoRemDet` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdRemito` FOREIGN KEY (`IdRemito`) REFERENCES `remitoscab` (`IdRemito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitosdet`
--

LOCK TABLES `remitosdet` WRITE;
/*!40000 ALTER TABLE `remitosdet` DISABLE KEYS */;
INSERT INTO `remitosdet` VALUES (1,1,'MVCBO1',10.00,NULL,2,NULL),(2,1,'MVCAB1+',15.00,NULL,2,NULL),(3,1,'CT1X12WIDE23',5.00,NULL,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectores`
--

LOCK TABLES `sectores` WRITE;
/*!40000 ALTER TABLE `sectores` DISABLE KEYS */;
INSERT INTO `sectores` VALUES (1,2,'Ventas'),(2,2,'Produccion');
/*!40000 ALTER TABLE `sectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuenciasproduccion`
--

DROP TABLE IF EXISTS `secuenciasproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuenciasproduccion` (
  `IdSecuencia` varchar(20) NOT NULL,
  `Detalle` varchar(20) NOT NULL,
  `Tiempo` time NOT NULL,
  PRIMARY KEY (`IdSecuencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuenciasproduccion`
--

LOCK TABLES `secuenciasproduccion` WRITE;
/*!40000 ALTER TABLE `secuenciasproduccion` DISABLE KEYS */;
INSERT INTO `secuenciasproduccion` VALUES ('AC1','ACOPIO 1','35:00:00'),('AC2','ACOPIO 2','28:00:00'),('CC','CONTROL CALIDAD','15:00:00'),('EN1','ENSAMBLADO 1','60:00:00'),('EN2','ENSAMBLADO 2','40:00:00'),('LUS','LUSTRADO','04:00:00'),('PIN','PINTURA','06:00:00'),('TAP','TAPICERIA','01:30:00');
/*!40000 ALTER TABLE `secuenciasproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_check_temporal`
--

DROP TABLE IF EXISTS `stock_check_temporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_check_temporal` (
  `iditem` varchar(50) NOT NULL,
  `total_cantidad` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_check_temporal`
--

LOCK TABLES `stock_check_temporal` WRITE;
/*!40000 ALTER TABLE `stock_check_temporal` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_check_temporal` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposentrega`
--

LOCK TABLES `tiposentrega` WRITE;
/*!40000 ALTER TABLE `tiposentrega` DISABLE KEYS */;
INSERT INTO `tiposentrega` VALUES (1,'Retira el cliente'),(2,'Envio'),(3,'Didi moto'),(4,'Uber eats');
/*!40000 ALTER TABLE `tiposentrega` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospago`
--

LOCK TABLES `tipospago` WRITE;
/*!40000 ALTER TABLE `tipospago` DISABLE KEYS */;
INSERT INTO `tipospago` VALUES (1,'Galicia','Efectivo',1,1),(2,'BBVA','Credito',6,15),(3,'Santander','Debito',12,30);
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
-- Dumping routines for database 'boxdbmartindatabases'
--
/*!50003 DROP FUNCTION IF EXISTS `OF_FINALIZADA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `OF_FINALIZADA`(PIdOrdenFabricacion int) RETURNS char(1) CHARSET utf8mb3
    DETERMINISTIC
BEGIN

	declare cantidad decimal(8,2);
    declare cantidad2 decimal(8,2);
    DECLARE resultado CHAR(1);

	SELECT SUM(ofd.cantidad * hr.product_count) into cantidad
	FROM ordenfabricaciondet ofd
	JOIN (
		SELECT idproducto, COUNT(idproducto) AS product_count
		FROM hojasruta
		GROUP BY idproducto
	) hr ON ofd.idproducto = hr.idproducto
	WHERE ofd.idordenfabricacion = PIdOrdenFabricacion;
    
    SELECT SUM(notdet.cantidad) into cantidad2
	FROM notificacionescab notcab
	INNER JOIN notificacionesdet notdet ON notcab.idnotificacion = notdet.idnotificacion
	LEFT JOIN (
		SELECT DISTINCT idproducto
		FROM ordenfabricaciondet
	) ofdet ON notcab.idproducto = ofdet.idproducto
	WHERE notcab.idordenfabricacion = PIdOrdenFabricacion;
    
	IF cantidad = cantidad2 THEN
        SET resultado = 'F';
    ELSE
        SET resultado = 'P';
    END IF;
	
    RETURN resultado;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Positivo_Negativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Positivo_Negativo`(lolo decimal(8,2)) RETURNS varchar(45) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	RETURN IF(lolo > 0, 'Positivo', 'Negativo');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Saldo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Saldo`()
BEGIN
	declare contador int;
    DECLARE nuevo_saldo DECIMAL(10,2);
    DECLARE debe_actual DECIMAL(10,2);
    DECLARE haber_actual DECIMAL(10,2);

	set contador = 1;
    set nuevo_saldo = 0.00;
    
    WHILE contador <= (SELECT MAX(linea) FROM CCtemp) DO
        SELECT debe, haber INTO debe_actual, haber_actual
        FROM CCtemp
        WHERE linea = contador;
        SET nuevo_saldo = nuevo_saldo + debe_actual - haber_actual;
        UPDATE CCtemp
        SET saldo = nuevo_saldo
        WHERE linea = contador;
        SET contador = contador + 1;
    END WHILE;

	SELECT comprobante, tipo, fecha, debe, haber, saldo FROM `CCtemp`
    order by fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AuditCentralizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AuditCentralizado`(in Pidmov int, Pdetmov varchar(100), Pidusr int, Ptabla varchar(100))
BEGIN
	INSERT INTO audit (idMov, DetMov, Fecha, hora, idUsr, tabla)
    VALUES (pidmov, PdetMov, curdate(), curtime(), Pidusr, Ptabla);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Calcular_Precio_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Calcular_Precio_Producto`(in PIDProducto varchar(45))
BEGIN
	select IdProducto AS "Producto", sum(a.Valor) as "Precio"
	from recetamateriales r
	join almacen a on a.IdItem = r.IdItem
	where r.IdProducto = PIDProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CC_Cliente_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CC_Cliente_2`(in PIDcliente int)
BEGIN
	

	DROP TEMPORARY TABLE IF EXISTS `CCtemp`;
	CREATE TEMPORARY TABLE `CCtemp` (
		`Comprobante` INT NOT NULL DEFAULT 0,
		`Tipo` CHAR(2),
		`Fecha` DATE,
		`Debe` DECIMAL(8,2),
		`Haber` DECIMAL(8,2),
		`Saldo` DECIMAL(8,2),
        `Linea` int not null auto_increment key,
		INDEX `idx_fecha` (`Fecha`)
	);
	INSERT INTO `CCtemp` (Comprobante, Tipo, Fecha, Debe, Haber, Saldo)
	SELECT idfactura,'FC', fecha, total, 0.00, total
	from facturascab
	WHERE idcliente = PIDcliente
    union all
	SELECT rpd.idfactura, 'RP', rpc.fecha, 0.00, SUM(rpd.importe), 0.00
	from recibospagocab rpc
    inner join recibospagodet rpd on rpc.idrecibopago = rpd.idrecibopago
    inner join facturascab fc on rpd.idfactura = fc.idfactura
	WHERE fc.idcliente = PIDcliente;

    
    #saldo - haber + debe
    call Actualizar_Saldo();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto`(in PidProducto varchar(45), in PCantidad decimal(8,2))
BEGIN
    select r.iditem as Componente, (r.cantidad * PCantidad) as "Qty Necesaria", a.stock as Stock, (a.stock - (r.cantidad * PCantidad)) as Dif, if(Positivo_Negativo(a.stock - (r.cantidad * PCantidad)) = "Positivo", "Stock OK", "Sin Stock") as Estado
    from recetamateriales r
    join almacen a on r.iditem = a.iditem
    where r.idproducto = PidProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto_2`(in PIDProducto varchar(45), PCantidad int)
BEGIN
	SELECT r.idproducto as Producto,
    CASE 
        WHEN SUM(IF(Positivo_Negativo(a.stock - (r.cantidad * PCantidad)) = "Positivo", 0, 1)) > 0 
        THEN 'N'
        ELSE 'S'
    END AS Procesable
	FROM recetamateriales r
	JOIN almacen a ON r.iditem = a.iditem
	WHERE r.idproducto = PidProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item`(in PIdOrdenFabricacion int, PIDProducto varchar(45))
BEGIN
	select nc.idordenfabricacion, nc.item, nc.idproducto, nc.cantidad, nc.estado, nc.idlineaprod, nt.cantidad, nt.fecha, nt.hora, nt.idoperario
    from notificacionescab nc
    join notificacionesdet nt on nc.idnotificacion = nt.idnotificacion
    where nc.idordenfabricacion = PIdOrdenFabricacion and nc.idproducto = PIDProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item_CT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item_CT`(IN PIDOrdenFabricacion INT)
BEGIN
	SELECT nc.idordenfabricacion AS Orden, nc.item, nc.idproducto AS Producto, nc.cantidad AS QtyOrdenada, l.centrotrabajo AS Centro, SUM(nd.cantidad) AS QtyProcesada, (nc.cantidad - SUM(nd.cantidad)) AS Pendiente
    FROM notificacionescab nc
    INNER JOIN notificacionesdet nd ON nd.idnotificacion = nc.idnotificacion
    INNER JOIN lineasproduccion l ON l.idlineaprod = nc.idlineaprod
    WHERE nc.idordenfabricacion = PIDOrdenFabricacion
    GROUP BY nc.idordenfabricacion, nc.item, nc.idproducto, nc.cantidad, l.centrotrabajo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FACTURA_REMITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FACTURA_REMITO`(in PIDRemito int, PIDUsr int)
BEGIN
	declare idfacturaencab int;

	if not exists(select idremito from facturascab where idremito = PIDRemito) then
    
		SELECT (idfactura + 1) INTO idfacturaencab
		FROM facturascab
		ORDER BY idfactura DESC LIMIT 1;
		
		IF idfacturaencab IS NULL THEN
			SET idfacturaencab = 1;
		END IF;
    
		insert into facturascab (idfactura ,idcliente, idempleado, idremito, iddireccion, fecha, fechaentrega, subtotal, descuento, neto, IVA, total, fechavencimiento)
		select idfacturaencab, rc.idcliente, PIDUsr, rc.idremito, rc.iddireccion, curdate(), rc.fecha, sum(p.punitario), 0, sum(p.punitario), (sum(p.punitario) * 0.21), (sum(p.punitario) + (sum(p.punitario) * 0.21)), DATE_ADD(CURDATE(), INTERVAL 1 MONTH)
		from remitoscab rc
		inner join remitosdet rd on rc.idremito = rd.idremito
		inner join productos p on rd.idproducto = p.idproducto
		where rc.idremito = PIDRemito
        group by rc.idcliente, PIDUsr, rc.idremito, rc.iddireccion, rc.fecha;

		insert into facturasdet (idfactura, idproducto, cantidad, precio, importe)
		select idfacturaencab, rd.idproducto, rd.cantidad, p.punitario, (p.punitario * rd.cantidad)
		from remitosdet rd
		join productos p on rd.idproducto = p.idproducto
		where rd.idremito = PIDRemito;
	else
		select "Este remito ya fue facturado";
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Costo`(in PIDProducto varchar(45))
BEGIN
	select IdProducto AS "Producto", sum(a.Valor * Cantidad) as "Costo"
	from recetamateriales r
	join almacen a on a.IdItem = r.IdItem
	where r.IdProducto = PIDProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Put_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Put_Costo`(in PIDProducto varchar(45))
BEGIN
	
    declare costofinal decimal(8,2);
    
    select sum(a.Valor * Cantidad) into costofinal
	from recetamateriales r
	join almacen a on a.IdItem = r.IdItem
	where r.IdProducto = PIDProducto;

	UPDATE productos
	SET costo = costofinal, PUnitario = costofinal * 1.3
	WHERE idproducto = PIDProducto;
	
	
	select p.idproducto, p.idcliente, p.producto as Detalle, p.idtipoproducto, p.costo, p.margen, p.PUnitario, p.Estado, p.fechaalta
    from productos p
    where idproducto = PIDProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Realizar_orden_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Realizar_orden_venta`(in PIDcliente int, PIDempleado int, PIDtipoentrega int, PIDtipopago int, subtotal decimal(8,2), descuento decimal(8,2), total decimal(8,2), obs varchar(24), out last_id int)
BEGIN
	
	declare id_direccion int;
    declare fecha date;
    declare fecha_entrega date;
    
    select IdDireccion into id_direccion from clientes
    where idcliente = PIDcliente;
    
	SET fecha = CURDATE();
	SET fecha_entrega = DATE_ADD(CURDATE(), INTERVAL 1 MONTH);

	INSERT INTO `ordenesventascab` (`IdCliente`, `IdEmpleado`, `IdDireccion`, `IdTipoEntrega`, `IdTipoPago`, `Subtotal`, `Descuento`, `Total`, `Fecha`, `FechaEntrega`, `Observaciones`) 
    VALUES (pidcliente, pidempleado, id_direccion, pidtipoentrega, pidtipopago, subtotal, descuento, total, fecha, fecha_entrega, obs);
    
    commit;

	set last_id = last_insert_id();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Realizar_orden_venta_det` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Realizar_orden_venta_det`(PIDordenventa int, PIDproducto varchar(45), Pitem varchar(20), Pcantidad decimal(8,2))
BEGIN
	
    declare descripcion varchar(45);
    declare unitario decimal(8,2);
    declare importe decimal(8,2);
    
    select producto into descripcion from productos
    where idproducto = PIDproducto;
    
    select punitario into unitario from productos
    where idproducto = PIDproducto;
    
    set importe = unitario * Pcantidad;
    
    INSERT INTO `ordenesventasdet` (`IdOrdenVenta`, `IdProducto`, `Item`, `Cantidad`, `Descripcion`, `Unitario`, `Importe`)
    VALUES (PIDordenventa, PIDproducto, Pitem, Pcantidad, descripcion, unitario, importe);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Receta_Mat_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Receta_Mat_Producto`(in PIDProducto varchar(45))
BEGIN
	select a.IdItem AS "Articulo", r.Cantidad, a.Valor, a.Stock
    from recetamateriales r
    join almacen a on a.IdItem = r.IdItem
    where r.IdProducto = PIDProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMITO_OF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMITO_OF`(PIDOrdenFabricacion int, PIDUsr int)
BEGIN
	
    DECLARE cliente INT;
    DECLARE direccion INT;
    DECLARE bultos INT;
    DECLARE idremitoencab INT DEFAULT 1;
    
    SELECT idcliente INTO cliente
    FROM ordenfabricacioncab
    WHERE idordenfabricacion = PIDOrdenFabricacion;
    
    SELECT iddireccion INTO direccion
    FROM ordenfabricacioncab
    WHERE idordenfabricacion = PIDOrdenFabricacion;
    
    SELECT sum(od.cantidad) INTO bultos
    FROM ordenfabricacioncab oc
    JOIN ordenfabricaciondet od ON oc.idordenfabricacion = od.idordenfabricacion
    WHERE oc.idordenfabricacion = PIDOrdenFabricacion;
    
    SELECT (idremito + 1) INTO idremitoencab
    FROM remitoscab
    ORDER BY idremito DESC LIMIT 1;
    
    IF idremitoencab IS NULL THEN
        SET idremitoencab = 1;
    END IF;

	if OF_FINALIZADA(PIDOrdenFabricacion) = "F" then
		if not exists(select idremito from remitosdet where numeroorden = PIDOrdenFabricacion) then
			INSERT INTO remitoscab (idremito, idcliente, idempleado, iddireccion, fecha, cantidadbultos, conformado) 
			VALUES (idremitoencab, cliente, PIDUsr, direccion, CURDATE(), bultos, "S");
		
			INSERT INTO remitosdet (idremito, idproducto, cantidad, numeroorden)
			SELECT idremitoencab, idproducto, cantidad, PIDOrdenFabricacion
			FROM ordenfabricaciondet
			WHERE idordenfabricacion = PIDOrdenFabricacion;
		else
			select "El remito ya se hizo para esta orden de fabricacion";
		end if;
	else
		select "La orden de fabricacion no esta terminada";
	end if;
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Saldos_Facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Saldos_Facturas`(in PIDcliente int)
BEGIN
	
    select rpc.idcliente as Cliente, rpd.idfactura as Comprobante, fc.total as Importe, sum(rpd.importe) as Pagos, (fc.total - sum(rpd.importe)) as Saldo
    from recibospagocab rpc
    inner join recibospagodet rpd on rpc.idrecibopago = rpd.idrecibopago
    inner join facturascab fc on rpd.idfactura = fc.idfactura
    where rpc.idcliente = PIDcliente;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TruncateStockCheckTemporal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TruncateStockCheckTemporal`()
BEGIN
    IF EXISTS (SELECT * FROM information_schema.tables 
               WHERE table_schema = DATABASE() 
               AND table_name = 'stock_check_temporal') THEN

        TRUNCATE TABLE stock_check_temporal;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26  8:32:32
