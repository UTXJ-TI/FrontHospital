CREATE DATABASE  IF NOT EXISTS `direccion_general_hospital_210237` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `direccion_general_hospital_210237`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: direccion_general_hospital_210237
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `aprobaciones_servicios`
--

DROP TABLE IF EXISTS `aprobaciones_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprobaciones_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Servicio_Paciente_ID` int unsigned NOT NULL COMMENT 'Esta es una Referencia con la llave forane a la tabla Servicios Hospitalarios ',
  `Departamento_Solicitante` int unsigned NOT NULL COMMENT 'Esta es una Referencia con la llave forane a la tabla Departamentos',
  `Fecha_Solicitud` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Se expide la fecha de solicitud del la aproblacion del sevicio o intervion a la Direccion General del Hospital\n',
  `Estatus` enum('Aprobado','No Aprobado','En Proceso','Cancelado') DEFAULT 'En Proceso' COMMENT 'Permite Asignar el estado de soliciud entre las opcion de Aprobación, No Aprobado, En Proceso y Cancelado, por la Dirección General del Hopital',
  `Comentarios` text COMMENT 'El solicitante puede Hacer comentarios de la solicitud, dentro de esta mismo campo La direccion puede agregar comentarios en la solicitud. ',
  `Fecha_Aprobacion` datetime DEFAULT NULL COMMENT 'Al aprobarse la solicitud se asigna la fecha de aprobacion del servicio, en cado de ser negado el campo conservara el estado de Null ',
  PRIMARY KEY (`ID`),
  KEY `aprobaciones_servicios_ibfk_1` (`Departamento_Solicitante`),
  KEY `aprobaciones_servicios_ibfk_2` (`Servicio_Paciente_ID`),
  CONSTRAINT `aprobaciones_servicios_ibfk_1` FOREIGN KEY (`Departamento_Solicitante`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `aprobaciones_servicios_ibfk_2` FOREIGN KEY (`Servicio_Paciente_ID`) REFERENCES `servicios_hospitalarios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobaciones_servicios`
--

LOCK TABLES `aprobaciones_servicios` WRITE;
/*!40000 ALTER TABLE `aprobaciones_servicios` DISABLE KEYS */;
INSERT INTO `aprobaciones_servicios` VALUES (1,2,41,'2013-09-12 17:50:06','Aprobado','Comentarios sobre el servicio 2','2013-09-20 09:56:38'),(2,2,66,'2012-06-09 05:38:30','En Proceso','Comentarios sobre el servicio 2',NULL),(3,3,40,'2001-11-03 06:06:44','No Aprobado','Comentarios sobre el servicio 3',NULL),(4,4,15,'2010-11-03 09:35:45','Aprobado','Comentarios sobre el servicio 4','2010-11-03 10:46:23'),(5,3,20,'2022-06-16 09:17:10','Aprobado','Comentarios sobre el servicio 3','2022-06-22 15:40:15'),(6,2,51,'2008-07-31 20:12:28','En Proceso','Comentarios sobre el servicio 2',NULL),(7,1,26,'2004-04-09 21:58:11','Aprobado','Comentarios sobre el servicio 1','2004-04-16 03:03:58'),(8,3,27,'2024-03-22 10:14:49','No Aprobado','Comentarios sobre el servicio 3',NULL),(9,4,23,'2009-05-28 12:22:20','No Aprobado','Comentarios sobre el servicio 4',NULL),(10,3,36,'2011-11-13 07:06:35','En Proceso','Comentarios sobre el servicio 3',NULL),(13,3,23,'2012-12-10 19:27:49','En Proceso','Comentarios sobre el servicio 3',NULL),(14,3,54,'2014-10-17 04:08:05','Aprobado','Comentarios sobre el servicio 3','2014-10-18 14:55:42'),(15,4,24,'2018-08-07 22:23:07','No Aprobado','Comentarios sobre el servicio 4',NULL),(16,2,54,'2008-01-30 18:53:08','Aprobado','Comentarios sobre el servicio 2','2008-02-07 10:59:37'),(17,4,3,'2021-07-12 17:03:02','Aprobado','Comentarios sobre el servicio 4','2021-07-14 04:58:17'),(18,5,14,'2010-03-19 00:46:51','Cancelado','Comentarios sobre el servicio 5',NULL),(19,1,62,'2016-06-16 20:15:42','En Proceso','Comentarios sobre el servicio 1',NULL),(20,2,70,'2018-01-07 15:56:46','Aprobado','Comentarios sobre el servicio 2','2018-01-07 18:12:51'),(21,2,11,'2016-09-29 21:28:38','Cancelado','Comentarios sobre el servicio 2',NULL),(22,4,31,'2009-01-19 11:17:59','Aprobado','Servicio Aprobado','2024-03-24 20:15:30');
/*!40000 ALTER TABLE `aprobaciones_servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Aprobaciones_Servicios_Bitacora` AFTER INSERT ON `aprobaciones_servicios` FOR EACH ROW BEGIN
    DECLARE descripcion_texto TEXT;
    
    -- Construir la descripción
    SET descripcion_texto = CONCAT(
        'Nuevo registro insertado en Aprobaciones_Servicios:', CHAR(10),
        'ID: ', NEW.ID, CHAR(10),
        'Servicio_Paciente_ID: ', NEW.Servicio_Paciente_ID, CHAR(10),
        'Departamento_Solicitante: ', NEW.Departamento_Solicitante, CHAR(10),
        'Fecha_Solicitud: ', NEW.Fecha_Solicitud, CHAR(10),
        'Estatus: ', NEW.Estatus, CHAR(10),
        'Comentarios: ', COALESCE(NEW.Comentarios, 'Sin comentarios'), CHAR(10),
        'Fecha_Aprobacion: ', COALESCE(NEW.Fecha_Aprobacion, 'Sin fecha de aprobación')
    );
    
    -- Insertar en la tabla bitacora_DG
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES ('Aprobaciones_Servicios', USER(), 'Insert', descripcion_texto);
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Aprobaciones_Servicios_Bitacora_Update` AFTER UPDATE ON `aprobaciones_servicios` FOR EACH ROW BEGIN
    DECLARE descripcion_texto TEXT;
    
    -- Construir la descripción de los cambios
    SET descripcion_texto = CONCAT(
        'Registro actualizado en Aprobaciones_Servicios:', CHAR(10),
        'ID antiguo: ', OLD.ID, CHAR(10),
        'ID nuevo: ', NEW.ID, CHAR(10),
        'Servicio_Paciente_ID antiguo: ', OLD.Servicio_Paciente_ID, CHAR(10),
        'Servicio_Paciente_ID nuevo: ', NEW.Servicio_Paciente_ID, CHAR(10),
        'Departamento_Solicitante antiguo: ', OLD.Departamento_Solicitante, CHAR(10),
        'Departamento_Solicitante nuevo: ', NEW.Departamento_Solicitante, CHAR(10),
        'Fecha_Solicitud antigua: ', OLD.Fecha_Solicitud, CHAR(10),
        'Fecha_Solicitud nueva: ', NEW.Fecha_Solicitud, CHAR(10),
        'Estatus antiguo: ', OLD.Estatus, CHAR(10),
        'Estatus nuevo: ', NEW.Estatus, CHAR(10),
        'Comentarios antiguos: ', COALESCE(OLD.Comentarios, 'Sin comentarios'), CHAR(10),
        'Comentarios nuevos: ', COALESCE(NEW.Comentarios, 'Sin comentarios'), CHAR(10),
        'Fecha_Aprobacion antigua: ', COALESCE(OLD.Fecha_Aprobacion, 'Sin fecha de aprobación'), CHAR(10),
        'Fecha_Aprobacion nueva: ', COALESCE(NEW.Fecha_Aprobacion, 'Sin fecha de aprobación')
    );
    
    -- Insertar en la tabla bitacora_DG
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES ('Aprobaciones_Servicios', USER(), 'Update', descripcion_texto);
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Aprobaciones_Servicios_Bitacora_Delete` AFTER DELETE ON `aprobaciones_servicios` FOR EACH ROW BEGIN
    DECLARE descripcion_texto TEXT;
    
    -- Construir la descripción de la eliminación
    SET descripcion_texto = CONCAT(
        'Registro eliminado en Aprobaciones_Servicios:', CHAR(10),
        'ID: ', OLD.ID, CHAR(10),
        'Servicio_Paciente_ID: ', OLD.Servicio_Paciente_ID, CHAR(10),
        'Departamento_Solicitante: ', OLD.Departamento_Solicitante, CHAR(10),
        'Fecha_Solicitud: ', OLD.Fecha_Solicitud, CHAR(10),
        'Estatus: ', OLD.Estatus, CHAR(10),
        'Comentarios: ', COALESCE(OLD.Comentarios, 'Sin comentarios'), CHAR(10),
        'Fecha_Aprobacion: ', COALESCE(OLD.Fecha_Aprobacion, 'Sin fecha de aprobación')
    );
    
    -- Insertar en la tabla bitacora_DG
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES ('Aprobaciones_Servicios', USER(), 'Delete', descripcion_texto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `areas_medicas`
--

DROP TABLE IF EXISTS `areas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL COMMENT 'Describe las areas Medicas Principales del Hospital.',
  `Descripcion` text COMMENT 'Describe brebe mente las funcioines del area a la que hace mención.\n',
  `Estatus` tinyint(1) DEFAULT '1' COMMENT 'Designa el estatus Activo o Inactivo.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Permite asignar una fecha de registro del área medica en función.',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Si el area se ha actulizado el sistema permitira llevar un registro de cuando fue el cambio. ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_medicas`
--

LOCK TABLES `areas_medicas` WRITE;
/*!40000 ALTER TABLE `areas_medicas` DISABLE KEYS */;
INSERT INTO `areas_medicas` VALUES (1,'Servicios Médicos','Por definir',1,'2024-01-19 13:45:45',NULL),(2,'Servicios de Apoyo','Por definir',1,'2024-01-19 13:47:14',NULL),(3,'Servicios Médico - Administrativos','Por definir',1,'2024-01-19 13:47:14',NULL),(4,'Servicios de Enfermería','Por definir',1,'2024-01-19 13:47:14',NULL),(5,'Departamentos Administrativos','Por definir',1,'2024-01-19 13:47:14',NULL);
/*!40000 ALTER TABLE `areas_medicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_areas_medicas_insert` AFTER INSERT ON `areas_medicas` FOR EACH ROW BEGIN
INSERT INTO bitacora VALUES (
   DEFAULT, "areas_medicas", user(), 
   "Insert",
   CONCAT_WS(" ","Se ha agregado una nueva AREA_MEDICA con el ID:",
   NEW.id,", con los siguientes datos; Nombre:",
   NEW.nombre,", Descripción:",NEW.descripcion, 
   ", Estatus:", NEW.estatus), 
   now());
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_areas_medicas_update` AFTER UPDATE ON `areas_medicas` FOR EACH ROW BEGIN
INSERT INTO bitacora VALUES (
   DEFAULT, "areas_medicas", user(), 
   "Update",
   CONCAT_WS(" ","Se ha modificado una AREA_MEDICA con  ID:", OLD.id,", con los siguientes cambios: ----",
   "NOMBRE:", OLD.nombre,"-", NEW.nombre, ",",
   "DESCRIPCIÓN:", OLD.descripcion,"-",NEW.descripcion, ",", 
   "ESTATUS:", OLD.estatus,"-",NEW.estatus), 
   now());
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_areas_medicas_delete` AFTER DELETE ON `areas_medicas` FOR EACH ROW BEGIN
INSERT INTO bitacora VALUES (
   DEFAULT, "areas_medicas", user(), 
   "Delete",
   CONCAT_WS(" ","Se eliminado los datos del AREA_MEDICA con ID:",
   OLD.id),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bitacora_dg`
--

DROP TABLE IF EXISTS `bitacora_dg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_dg` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL COMMENT 'Describe el nombre de la tabla a la que hace referencia con el movimento de solicitudes.',
  `Usuario` varchar(80) NOT NULL COMMENT 'permite identificar el usuario que relizo la solicitud de insercion, actulizacion y eliminación.',
  `Operacion` enum('Insert','Update','Delete') NOT NULL COMMENT 'designa el tipo de operaicon realizado Insert, Update o Delete',
  `Descripcion` text NOT NULL COMMENT 'Describe los movimeinto realizados en la peticion de la solicitud realizada.',
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'determina la fecha de la peticion realizada y los cambios dados de la solicitud.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_dg`
--

LOCK TABLES `bitacora_dg` WRITE;
/*!40000 ALTER TABLE `bitacora_dg` DISABLE KEYS */;
INSERT INTO `bitacora_dg` VALUES (1,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 13\nServicio_Paciente_ID: 3\nDepartamento_Solicitante: 23\nFecha_Solicitud: 2012-12-10 19:27:49\nEstatus: En Proceso\nComentarios: Comentarios sobre el servicio 3\nFecha_Aprobacion: Sin fecha de aprobación','2024-03-24 20:26:19'),(2,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 14\nServicio_Paciente_ID: 3\nDepartamento_Solicitante: 54\nFecha_Solicitud: 2014-10-17 04:08:05\nEstatus: Aprobado\nComentarios: Comentarios sobre el servicio 3\nFecha_Aprobacion: 2014-10-18 14:55:42','2024-03-24 20:26:19'),(3,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 15\nServicio_Paciente_ID: 4\nDepartamento_Solicitante: 24\nFecha_Solicitud: 2018-08-07 22:23:07\nEstatus: No Aprobado\nComentarios: Comentarios sobre el servicio 4\nFecha_Aprobacion: Sin fecha de aprobación','2024-03-24 20:26:19'),(4,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 16\nServicio_Paciente_ID: 2\nDepartamento_Solicitante: 54\nFecha_Solicitud: 2008-01-30 18:53:08\nEstatus: Aprobado\nComentarios: Comentarios sobre el servicio 2\nFecha_Aprobacion: 2008-02-07 10:59:37','2024-03-24 20:26:19'),(5,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 17\nServicio_Paciente_ID: 4\nDepartamento_Solicitante: 3\nFecha_Solicitud: 2021-07-12 17:03:02\nEstatus: Aprobado\nComentarios: Comentarios sobre el servicio 4\nFecha_Aprobacion: 2021-07-14 04:58:17','2024-03-24 20:26:19'),(6,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 18\nServicio_Paciente_ID: 5\nDepartamento_Solicitante: 14\nFecha_Solicitud: 2010-03-19 00:46:51\nEstatus: Cancelado\nComentarios: Comentarios sobre el servicio 5\nFecha_Aprobacion: Sin fecha de aprobación','2024-03-24 20:26:19'),(7,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 19\nServicio_Paciente_ID: 1\nDepartamento_Solicitante: 62\nFecha_Solicitud: 2016-06-16 20:15:42\nEstatus: En Proceso\nComentarios: Comentarios sobre el servicio 1\nFecha_Aprobacion: Sin fecha de aprobación','2024-03-24 20:26:19'),(8,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 20\nServicio_Paciente_ID: 2\nDepartamento_Solicitante: 70\nFecha_Solicitud: 2018-01-07 15:56:46\nEstatus: Aprobado\nComentarios: Comentarios sobre el servicio 2\nFecha_Aprobacion: 2018-01-07 18:12:51','2024-03-24 20:26:19'),(9,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 21\nServicio_Paciente_ID: 2\nDepartamento_Solicitante: 11\nFecha_Solicitud: 2016-09-29 21:28:38\nEstatus: Cancelado\nComentarios: Comentarios sobre el servicio 2\nFecha_Aprobacion: Sin fecha de aprobación','2024-03-24 20:26:19'),(10,'Aprobaciones_Servicios','root@localhost','Insert','Nuevo registro insertado en Aprobaciones_Servicios:\nID: 22\nServicio_Paciente_ID: 4\nDepartamento_Solicitante: 31\nFecha_Solicitud: 2009-01-19 11:17:59\nEstatus: Aprobado\nComentarios: Comentarios sobre el servicio 4\nFecha_Aprobacion: 2009-01-26 02:44:13','2024-03-24 20:26:19'),(11,'Aprobaciones_Servicios','root@localhost','Update','Registro actualizado en Aprobaciones_Servicios:\nID antiguo: 16\nID nuevo: 16\nServicio_Paciente_ID antiguo: 2\nServicio_Paciente_ID nuevo: 2\nDepartamento_Solicitante antiguo: 54\nDepartamento_Solicitante nuevo: 54\nFecha_Solicitud antigua: 2008-01-30 18:53:08\nFecha_Solicitud nueva: 2008-01-30 18:53:08\nEstatus antiguo: Aprobado\nEstatus nuevo: Aprobado\nComentarios antiguos: Comentarios sobre el servicio 2\nComentarios nuevos: Comentarios sobre el servicio 2\nFecha_Aprobacion antigua: 2008-02-07 10:59:37\nFecha_Aprobacion nueva: 2008-02-07 10:59:37','2024-03-24 20:29:38'),(12,'Aprobaciones_Servicios','root@localhost','Update','Registro actualizado en Aprobaciones_Servicios:\nID antiguo: 22\nID nuevo: 22\nServicio_Paciente_ID antiguo: 4\nServicio_Paciente_ID nuevo: 4\nDepartamento_Solicitante antiguo: 31\nDepartamento_Solicitante nuevo: 31\nFecha_Solicitud antigua: 2009-01-19 11:17:59\nFecha_Solicitud nueva: 2009-01-19 11:17:59\nEstatus antiguo: Aprobado\nEstatus nuevo: Aprobado\nComentarios antiguos: Comentarios sobre el servicio 4\nComentarios nuevos: Servicio Aprobado\nFecha_Aprobacion antigua: 2009-01-26 02:44:13\nFecha_Aprobacion nueva: 2024-03-24 20:15:30','2024-03-24 20:34:01');
/*!40000 ALTER TABLE `bitacora_dg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL COMMENT 'Describe el nombre de los departamentos involucrados dentro del la estrucutura del Hospital General ',
  `AreaMedica_id` int unsigned DEFAULT NULL COMMENT 'Asigna el area Medica con un realcion Foranea a la tabla Areas Medicas',
  `Departamento_Superior_id` int unsigned DEFAULT NULL COMMENT 'Asigna el departamento con un realcion Foranea a la tabla Departamentos',
  `Responsable_id` int unsigned DEFAULT NULL COMMENT 'Identifica el responsable de Area dentro de lagerarquia del hospital.\n',
  `Estatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'permite asignar un estado de actividad entre Activo e Inactivo',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Asigna una fecha en la que se dio el registro',
  `fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Asigna la fecha de actilizacion del registro dado.',
  PRIMARY KEY (`id`),
  KEY `fk_area_medica_1` (`AreaMedica_id`),
  KEY `fk_departamento_1` (`Departamento_Superior_id`),
  CONSTRAINT `fk_area_media_1` FOREIGN KEY (`AreaMedica_id`) REFERENCES `areas_medicas` (`ID`),
  CONSTRAINT `fk_departamento_1` FOREIGN KEY (`Departamento_Superior_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Dirección General',NULL,NULL,NULL,1,'2024-01-27 13:11:40',NULL),(2,'Junta de Gobierno',NULL,1,NULL,1,'2024-01-27 13:12:53',NULL),(3,'Comiés Hospitalarios',NULL,1,NULL,1,'2024-01-27 13:13:36',NULL),(4,'Comiés de Transplantes',NULL,1,NULL,1,'2024-01-27 13:13:36',NULL),(5,'Departamento de Calidad',NULL,1,NULL,1,'2024-01-27 13:13:36',NULL),(6,'Autenticacion a Quejas',NULL,5,NULL,1,'2024-01-27 13:15:01',NULL),(7,'Seguridad paciente',NULL,5,NULL,1,'2024-01-27 13:15:01',NULL),(8,'Programacion Quirurgica',NULL,5,NULL,1,'2024-01-27 13:15:01',NULL),(9,'Sub - Dirección Medica',NULL,1,NULL,1,'2024-01-27 13:15:58',NULL),(10,'Sub - Administrativa',NULL,1,NULL,1,'2024-01-27 13:15:58',NULL),(11,'División de Medicina Interna',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(12,'División de Pediatía',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(13,'Servicio de Traumatología',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(14,'División de Cirugía',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(15,'Servicio de Urgencias Adultos',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(16,'Terapia Intensiva',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(17,'Quirófano y Anestesiología',1,9,NULL,1,'2024-01-27 13:17:49',NULL),(18,'Terapia Intermedia',1,11,NULL,1,'2024-01-27 13:18:30',NULL),(19,'Servicio de Urgencias Pediátricas',1,12,NULL,1,'2024-01-27 13:18:30',NULL),(20,'Centro de Mezclas',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(21,'Radiología e imagen',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(22,'Genética',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(23,'Laboratorio de Análisis Clinicos',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(24,'Hemodialisis',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(25,'Laboratorio de Patología',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(26,'Rehabilitación Pulmonar',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(27,'Medicina Genómica',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(28,'Banco de Sangre',2,9,NULL,1,'2024-01-27 13:23:05',NULL),(29,'Laboratorio Histocompatibilidad',2,23,NULL,1,'2024-01-27 13:24:15',NULL),(30,'Aféresis',2,28,NULL,1,'2024-01-27 13:24:15',NULL),(31,'Tele-Robotica',NULL,9,NULL,1,'2024-01-27 13:25:15',NULL),(32,'Jefatura de Enseñanza Médica',NULL,9,NULL,1,'2024-01-27 13:25:15',NULL),(33,'Ética e Investigacion',NULL,9,NULL,1,'2024-01-27 13:25:15',NULL),(34,'Consulta Externa',NULL,9,NULL,1,'2024-01-27 13:25:15',NULL),(35,'Terapia y Rehabilitacion Fisica',NULL,34,NULL,1,'2024-01-27 13:26:31',NULL),(36,'Medicina Legal',3,9,NULL,1,'2024-01-27 13:29:24',NULL),(37,'Trabajo Social',3,9,NULL,1,'2024-01-27 13:29:24',NULL),(38,'UVEH',3,9,NULL,1,'2024-01-27 13:29:24',NULL),(39,'CIES',3,9,NULL,1,'2024-01-27 13:29:24',NULL),(40,'Comunicacion Social',3,9,NULL,1,'2024-01-27 13:29:24',NULL),(41,'Violencia Intrafamiliar',3,36,NULL,1,'2024-01-27 13:30:15',NULL),(42,'Jefatura de Enfermeria',4,9,NULL,1,'2024-01-27 13:30:48',NULL),(43,'Sub-jefatura de Enfermeria',4,9,NULL,1,'2024-01-27 13:30:48',NULL),(44,'Supervisoras de Turno',4,9,NULL,1,'2024-01-27 13:30:48',NULL),(45,'Coordinación Enseñanza Enfermeria',4,42,NULL,1,'2024-01-27 13:32:51',NULL),(46,'Jefas de Servicio',4,44,NULL,1,'2024-01-27 13:32:51',NULL),(47,'Clinicas y Programas',4,44,NULL,1,'2024-01-27 13:32:51',NULL),(48,'Recursos Humanos',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(49,'Dietética',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(50,'Farmacia Intrahospitalaria',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(51,'Coordinación de Asuntos Jurídicos y Administrativos',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(52,'Biomédica, Conservación y Mantenimiento',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(53,'Validación',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(54,'Recursos Materiales',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(55,'Servicios Generales',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(56,'Recursos Financieros',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(57,'Departamento Adtvo. Hemodinamia',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(58,'Relaciones Públicas',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(59,'Farmacia HGC Seguro Popular',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(60,'Enlace Administrativo',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(61,'Informatica',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(62,'Registros Médicos',5,10,NULL,1,'2024-01-27 13:36:10',NULL),(63,'Archivo y Correspondencia',5,48,NULL,1,'2024-01-27 13:40:31',NULL),(64,'Vigilancia',5,51,NULL,1,'2024-01-27 13:40:31',NULL),(65,'Almacen',5,54,NULL,1,'2024-01-27 13:40:31',NULL),(66,'Insumos Especializados',5,54,NULL,1,'2024-01-27 13:40:31',NULL),(67,'Intendencia',5,55,NULL,1,'2024-01-27 13:40:31',NULL),(68,'Ropería',5,55,NULL,1,'2024-01-27 13:40:31',NULL),(69,'Nivel 7',5,58,NULL,1,'2024-01-27 13:40:31',NULL),(70,'Control Gastos Catastroficos',5,60,NULL,1,'2024-01-27 13:40:31',NULL),(71,'Tecnologia en la Salud',5,61,NULL,1,'2024-01-27 13:40:31',NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_insert` AFTER INSERT ON `departamentos` FOR EACH ROW BEGIN
   DECLARE nombre_aream VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus VARCHAR(50) DEFAULT NULL;
   
   SET nombre_aream = (SELECT IFNULL((SELECT Nombre FROM areas_medicas WHERE id = NEW.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto = (SELECT IFNULL((SELECT Nombre FROM departamentos WHERE id = NEW.Departamento_Superior_ID), "Sin Departamento Superior"));
   SET nombre_resp = (SELECT IFNULL((SELECT p.Nombre FROM personal_medico pm 
   JOIN personas p ON p.id = p.id WHERE pm.persona_id = NEW.Responsable_ID), "Sin Responsable"));
   
   IF NEW.estatus THEN
		SET val_estatus = "Activo";
   ELSE
        SET val_estatus = "Inactivo";
	END IF;
   
INSERT INTO bitacora VALUES (
   DEFAULT, "departamentos", user(), 
   "Insert",
   CONCAT_WS(" ","Se ha agregado un nuevo DEPARTAMENTO con el ID:", NEW.id,",",
   "con los siguientes datos; NOMBRE:", NEW.nombre,",",
   "AREA_MEDICA:", nombre_aream,",",
   "DEPARTAMENTO_SUPERIOR:", nombre_depto,",",
   "RESPONSABLE:", nombre_resp,",",
   "ESTATUS:", val_estatus), 
   now());
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `departamentos_BEFORE_UPDATE` BEFORE UPDATE ON `departamentos` FOR EACH ROW BEGIN
    SET NEW.Fecha_Actualizacion = current_timestamp();
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_update` AFTER UPDATE ON `departamentos` FOR EACH ROW BEGIN
   DECLARE nombre_aream VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus VARCHAR(50) DEFAULT NULL;
   DECLARE nombre_aream2 VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto2 VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp2 VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus2 VARCHAR(50) DEFAULT NULL;
   
   
   SET nombre_aream = (SELECT IFNULL((SELECT Nombre FROM areas_medicas WHERE id = NEW.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto = (SELECT IFNULL((SELECT Nombre FROM departamentos WHERE id = NEW.Departamento_Superior_ID), "Sin Departamento Superior"));
   SET nombre_resp = (SELECT IFNULL((SELECT CONCAT_Ws(" ", p.titulo, p.Nombre, p.primer_apellido, p.segundo_apellido) FROM personal_medico pe JOIN personas p ON p.id = pe.persona_id WHERE id = NEW.Responsable_ID), "Sin Responsable"));
   
   SET nombre_aream2= (SELECT IFNULL((SELECT Nombre FROM areas_medicas WHERE id = OLD.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto2 = (SELECT IFNULL((SELECT Nombre FROM departamentos WHERE id = OLD.Departamento_Superior_ID), "Sin Departamento Superior"));
   SET nombre_resp2 = (SELECT IFNULL((SELECT CONCAT_Ws(" ", p.titulo, p.Nombre, p.primer_apellido, p.segundo_apellido) FROM personal_medico pe JOIN personas p ON p.id = pe.persona_id WHERE id = OLD.Responsable_ID), "Sin Responsable"));
   
   IF NEW.estatus THEN
		SET val_estatus = "Activo";
   ELSE
        SET val_estatus = "Inactivo";
	END IF;
    
    IF OLD.estatus THEN
		SET val_estatus2 = "Activo";
   ELSE
        SET val_estatus2 = "Inactivo";
	END IF;
   
   
INSERT INTO bitacora VALUES (
   DEFAULT, "departamentos", user(), 
   "Update",
   CONCAT_WS(" ","Se ha modificado el  DEPARTAMENTO con el ID:", NEW.id,",",
   "con los siguientes datos; NOMBRE:", OLD.nombre," - ",  NEW.nombre ,",",
   "AREA_MEDICA:", nombre_aream2," - ", nombre_aream, ",",
   "DEPARTAMENTO_SUPERIOR:", nombre_depto2," - ", nombre_depto ,",",
   "RESPONSABLE:", nombre_resp2," - ", nombre_resp,",",
   "ESTATUS:", val_estatus2," - ", val_estatus), 
   now());
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_delete` AFTER DELETE ON `departamentos` FOR EACH ROW BEGIN
INSERT INTO bitacora VALUES (
	DEFAULT, "departamentos", user(), 
   "Delete",
   CONCAT_WS(" ","Se eliminado los datos del DEPARTAMENTO con ID:",
   OLD.id),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `instalaciones`
--

DROP TABLE IF EXISTS `instalaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL COMMENT 'La Clave Permitira Identificar de Manera Abreviada el departamento, area,consultorio,  unidad, laboratorio, quirofano, edificio, piso, sala y  banco que integra el hospital general. ',
  `nombre` varchar(100) NOT NULL COMMENT 'Este recurso permitira asignar el nombre del area solicitada, departamento, unidad que opera el Hospital General.',
  `Descripcion` varchar(200) NOT NULL COMMENT 'Describe brevemente el departamento, área, consultorio, unidad, laboratorio etc. que integra el Hospital General. ',
  `Tipo` varchar(100) NOT NULL COMMENT 'Permite Clasificar el Area Designada entre Sala,  Unidad, Laboratorio, Banco, Consultorio, Edificio, Estación, que Integra el Hospital General.\n',
  `Departamento_id` int unsigned NOT NULL COMMENT 'Identifica el Departamente al que pertenece el area de atencion dentro del Hospiral general.\n',
  `Instalacion_superior_id` int unsigned DEFAULT NULL COMMENT 'Indentifica el AreaSuperior a la que pertenece dentro de su gerarquia dentro de los primcipales departamentos que dan atención en el hospital.',
  `Estatus` enum('Activo','Mantenimiento','Fuera de Servicio','Suspendida') DEFAULT NULL COMMENT 'Permite asignar si el area esta activa, inactiva o suspendida.',
  PRIMARY KEY (`ID`),
  KEY `instalaciones_ibfk_1` (`Departamento_id`),
  KEY `instalaciones_ibfk_2` (`Instalacion_superior_id`),
  CONSTRAINT `instalaciones_ibfk_1` FOREIGN KEY (`Departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `instalaciones_ibfk_2` FOREIGN KEY (`Instalacion_superior_id`) REFERENCES `instalaciones` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalaciones`
--

LOCK TABLES `instalaciones` WRITE;
/*!40000 ALTER TABLE `instalaciones` DISABLE KEYS */;
INSERT INTO `instalaciones` VALUES (1,'HGP','Hospital General de Puebla','Hospital de Alta Especialidad','Hospital General',1,NULL,'Activo'),(2,'EESP','Edificio de Especialidades','Edificio Central de Alta Especialidad','Edificio',1,1,'Activo'),(3,'EMAT','Edificio de Maternidad','Edificio Primario de Atención Materna','Edificio',1,1,'Activo'),(4,'EAD','Edificio Administrativo','Edificio Secundario de Aministración Hospitalaria','Edificio',1,1,'Activo'),(5,'ELAB','Edificio Laboratorios','Edificio de Laboratorio y Gabinete del Hospital General de Alta Especialidad','Edificio',1,1,'Activo'),(6,'EURG','Edificio Urgencias','Edificio Central Ugencias Hospitalaria','Edificio',1,1,'Activo'),(7,'P1','Piso 1 - Consultorios ','Edificio Central Area de Consultorios ','Piso',1,2,'Activo'),(8,'P2','Piso 2 - Terapia Intesiva','Edificio Central Area de Terapia Intensiva','Piso',1,2,'Activo'),(9,'P3','Piso 3 - Quirofano','Edificio Central Area de Quirofanos','Piso',1,2,'Activo'),(10,'P4','Piso 4 - Hospitalización','Edificio Central Area de Hospitalizaciónn','Piso',1,2,'Activo'),(11,'C-A','Consultorio A','Edificio Centrar De Especialidad ','Consultorio',1,7,'Activo'),(12,'ATI1','Apartado TI 1','Edificio Central Area de Terapio intensiva 1','Area Hispitalización',1,10,'Activo'),(13,'S-OB','Sala de Observación','Edificio Central Area de Observacion ','Sala',1,10,'Activo'),(14,'P1','Piso 1 - Acceso y Recepción','Edificio Central Area de Atencion','Edificio',1,4,'Activo'),(15,'P1','Piso 1 - Consulta Extena','Edificio Central - Consultas Ambulatorias y Atencion Primaria','Edificio',1,1,'Activo'),(16,'P1','Piso 1 - Consulta de Especialidad','Edificio de Especialidad - Consulta de Especiadad de Derechohabientes','Edifico',1,2,'Activo'),(17,'P4','Piso 4 - Area de Diagnostico por Imagne','Edificio de Hospitalizacion - Recursos de Imagenologia y Radiologia Hospitalaria','Edificio',1,6,'Activo'),(18,'C-MG','Consultorio Médico General','Consulta medica General','Consultorio',1,7,'Activo'),(19,'C-GO','Consultorio Gineco-Obstetra','Consulta General de Gineco Obstetricia','Consultorio',1,7,'Activo'),(20,'C-OA','Consultorio Odontología - A','Consulta General de Odontología ','Consultorio',1,7,'Activo'),(21,'C-OdB','Consultorio Odontología - B','Consulta General de Odontología','Consultorio',1,7,'Activo'),(22,'C-Of-A',' Consultorio Oftamología A ','Consulta General de Oftamología','Consultorio',1,7,'Activo'),(23,'C-Of-B',' Consultorio Oftamología B','Consulta General de Oftamología','Consultorio',1,7,'Activo'),(24,'C-Of-C',' Consultorio Oftamología B','Consulta General de Oftamología','Consultorio',1,7,'Activo'),(25,'C-E','Consultorio de Ecografía','Consulta General de Ecografia e Imagen','Consultorio',1,7,'Activo'),(26,'C-P','Consultorio de Psicología','Consulta General de Psicología','Consultorio',1,7,'Activo'),(27,'C-G','Consultorio de Geriatría','Cosnulta General de Geriatría','Consultorio',1,7,'Activo'),(28,'C-P','Consultorio de Pediatría','Consulta General de Pediatría','Consultorio',1,7,'Activo'),(29,'TRA','Piso 2 - Traumatología','Área de Traumatología','Edificio ',1,6,'Activo'),(30,'S-TY','Sala de Yeso','Área de Intervencion Tramatología','Sala',1,29,'Activo'),(31,'PGO','Sala de Procedimientos Ginecológicos y Obstetricia','Área de Procedimientos Obstetricos ','Sala',1,3,'Activo'),(32,'PCM','Sala de Procedimientos Cirugía Menor','Área de Procedimeintos menores de Cirugía','Sala',1,6,'Activo'),(33,'EDE-A','Estación de Enfermeras - A','Área de rotacion de personal de Enfermeria ','Estación',1,2,'Activo'),(34,'EDE-B','Estación de Enfermeras - B','Área de rotacion de personal de Enfermeria ','Estación',1,3,'Activo'),(35,'EDE-C','Estación de Enfermeras - C','Área de rotacion de personal de Enfermeria ','Estación ',1,6,'Activo'),(36,'S-H1','Sala de Hospitalización con una cama','Área de Pacientes en recuperacioin con equipo especializado','Sala',1,8,'Activo'),(40,'S-H2','Sala de Hospitalización con dos camas','Área de Pacientes en recuperacioin de pacientes de Cirugía','Sala',1,10,'Activo'),(41,'S-AN','Sala de Adapatación Neonatal','Área de Atención Nenatal','Sala',1,3,'Activo'),(42,'S-ELM','Sala de Extracción de Leche Materna','Área de Extracion de Material Biologico Materno','Sala',1,3,'Activo'),(43,'U-TD','Unidad de Toma de Muestras','Unidad de toma de muestras biologicas','Unidad',1,5,'Activo'),(44,'U-DT','Unidad de Toxicología ','Unidad de analisis Toxicologicos','Unidad',1,5,'Activo'),(45,'U-P','Unidad de Parasitología','Unidad de Estudio parasitologico','Unidad',1,5,'Activo'),(46,'U-U','Unidad de Uroanálisis','Unidad de Muestras ','Unidad',1,5,'Activo'),(47,'U-BQ','Unidad de Bioquímica Clínica','Unidad Procedimientos y Plicacioanes Bioqiomicas ','Unidad',1,5,'Activo'),(48,'U-H','Unidad de Hematología','Unidad de Estudio de Sangre','Unidad',1,5,'Activo'),(49,'U-B','Unidad de Básico','Unidad de Anasis primarios ','Unidad',1,5,'Activo'),(50,'U-BMC','Unidad de Bacteriología y Medios de Cultivo','Unidad de Cultivos Bacteriologicos ','Unidad',1,5,'Activo'),(51,'U-RTS-A','Unidad de Reanimación Trauma Shock - A','Unidad de Atención de Emergencia ','Unidad',1,6,'Activo'),(52,'U-RTS-B','Unidad de Reanimación Trauma Shock - B','Unidad de Atención de Emergencia ','Unidad',1,6,'Activo'),(53,'TMG','Tomografía','Unidad de Imagenologia Tomografica','Unidad',1,17,'Activo'),(54,'S-RX-ET','Sala de Rayos X - Equipo de Techo','Unidad de Rayos X','Sala',1,17,'Activo'),(55,'S-RX-EP','Sala de Rayos X - Equipo de Piso','Unidad de Rayos X','Sala',1,17,'Activo'),(56,'S-DO','Sala de Densitometría Ósea','Unidad de Rayos X','Sala',1,17,'Activo'),(57,'S-RM','Sala de Resonancia Magnética','Unidad de Rayos X','Sala',1,17,'Activo'),(58,'S-MA','Sala de Mamografías - A','Unidad de Rayos X','Sala ',1,17,'Activo'),(59,'S-MB','Sala de Mamografías - B','Unidad de Rayos X','Sala',1,17,'Activo'),(60,'B-ARN','Baños de Atesia para Recién Nacidos','Unidad de Maternidad y Nacimeintos','Baño',1,3,'Activo'),(61,'U-EM','Unidad de Emergencia ','Unidad de Atencion de Emergencias','Unidad',1,6,'Activo'),(62,'C-GIN','Consultorio de Ginecología','Cosulta de Especialidad Ginecología ','Consultorio',1,3,'Activo'),(63,'S-NB','Sala de Nebulización de Adultos','Sala de Intervencion y Terapia respiratoria','Sala',1,2,'Activo'),(64,'Q-A','Quirófano A','Sala de Prosedimeintos Quirugicos','Quirofano',1,9,'Activo'),(65,'Q-B','Quirófano B','Sala de Prosedimeintos Quirugicos','Quirofano',1,9,'Activo'),(67,'S-P','Sala de Partos','Sala de Pos Partos','Sala',1,3,'Activo'),(68,'S-RPD','Sala de Recuperación para dos Camas','Sala de Recupercion de Paciente no Asintomaticos','Sala',1,9,'Activo'),(69,'S-RPC','Sala de Recuperación para cuatro Camas ','Sala general de atencion de pacientes en recupecion ','Sala',1,10,'Activo'),(70,'U-CIN','Unidad de Cuidados Intensivos Neonatal','Unidad de Cuiddos intensivos del Recien Nacido','Unidad',1,3,'Activo'),(71,'S-AUN','Sala de Aislamiento UCI Neonatal','Sala de Aislamiento de Cuidados Intensivos del Recien Nacido','Unidad',1,3,'Activo'),(72,'U-CIA','Unidad de Cuidados Intensivos A','Unidad Primaria de Cuidados Intencivos','Unidad',1,8,'Activo'),(73,'U-CIB','Unidad de Cuidados Intensivos B','Unidad Secundaria de Cuidados Intensivos ','Unidad ',1,10,'Activo'),(74,'TR-A','Tratamiento de Residuos Biologicos - A','Laboratorio de Manejos se Biologicos','Laboratorio',1,5,'Activo'),(75,'TR-B','Tratamiento de Residuos - B','Laboratorio de Tratameinto de sustancias Biologicas','Laboratorio',1,5,'Activo'),(76,'U-SV1','Unidad de Servicio de Vacunación 1','Unidad de Vacunacion Primaria','Unidad',1,14,'Activo'),(77,'U-SV2','Unidad de Servicio de Vacunación 2','Unidad de Vacunacion Primaria','Unidad',1,14,'Activo'),(78,'BLM','Bancon de Leche Materna ','Banco de extraccion de leche materna','Banco',1,3,'Activo'),(79,'U-HD','Unidad de Hemodiálisis ','Unidad de Hemodialsisi ','Unidad',1,2,'Activo'),(80,'U-AN','Unidad de Alimentacion y Nutción ','Unidad de Asistencia Nutricional ','Unidad',1,2,'Activo'),(81,'U-ES','Unidad de Esterilización','Unidad de Manejo de material medico para su esterilizacion','Unidad ',1,5,'Activo'),(82,'U-RF','Unidad de Rehabilitación Fisica ','Unidad de rehabilitación fisica para pacientes en recuperación','Unidad ',1,2,'Activo'),(83,'S-N','Sala de Necropcias','Sala de Procediemntos de Necropcia para el diagnostico medico','Sala ',1,2,'Activo'),(84,'U-E','Unidad de Endoscopia','Unidad de estudio e imagen de Especialidad ','Unidad',1,2,'Activo'),(85,'BS-LI','Laboratorio de InmunoHematología - Banco de Sangre','Banco de Sangre ','Banco',1,5,'Activo'),(86,'BS-AES','Área de Extracción - Banco de Sangre','Banco de Sangre','Banco',1,5,'Activo'),(87,'BS-AF','Área de Fraccionamiento - Banco de Sangre','Banco de Sangre','Banco',1,5,'Activo'),(88,'BS-CCS','Cuarto de Conservación de Sangre - Banco de Sangre','Banco de Sangre','Banco',1,5,'Activo');
/*!40000 ALTER TABLE `instalaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Insertar_Instalaciones_Bitacora` AFTER INSERT ON `instalaciones` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Instalaciones', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Insert', -- Operacion: El tipo de operación realizada ('Insert')
        CONCAT(
            'Se ha insertado un nuevo registro en la tabla Instalaciones con los siguientes detalles:',
            'Clave: ', NEW.clave,
            'Nombre: ', NEW.nombre,
            'Descripción: ', NEW.Descripcion,
            'Tipo: ', NEW.Tipo,
            'Departamento_id: ', NEW.Departamento_id,
            'Instalacion_superior_id: ', NEW.Instalacion_superior_id,
            'Estatus: ', NEW.Estatus
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Actualizar_Instalaciones_Bitacora` AFTER UPDATE ON `instalaciones` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Instalaciones', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Update', -- Operacion: El tipo de operación realizada ('Update')
        CONCAT(
            'Se ha actualizado el registro en la tabla Instalaciones con ID: ', NEW.ID,
            '\nLos siguientes campos han sido modificados:',
            IF(OLD.clave != NEW.clave, CONCAT('\n - Clave: ', OLD.clave, ' (Antes) -> ', NEW.clave, ' (Después)'), ''),
            IF(OLD.nombre != NEW.nombre, CONCAT('\n - Nombre: ', OLD.nombre, ' (Antes) -> ', NEW.nombre, ' (Después)'), ''),
            IF(OLD.Descripcion != NEW.Descripcion, CONCAT('\n - Descripción: ', OLD.Descripcion, ' (Antes) -> ', NEW.Descripcion, ' (Después)'), ''),
            IF(OLD.Tipo != NEW.Tipo, CONCAT('\n - Tipo: ', OLD.Tipo, ' (Antes) -> ', NEW.Tipo, ' (Después)'), ''),
            IF(OLD.Departamento_id != NEW.Departamento_id, CONCAT('\n - Departamento_id: ', OLD.Departamento_id, ' (Antes) -> ', NEW.Departamento_id, ' (Después)'), ''),
            IF(OLD.Instalacion_superior_id != NEW.Instalacion_superior_id, CONCAT('\n - Instalacion_superior_id: ', OLD.Instalacion_superior_id, ' (Antes) -> ', NEW.Instalacion_superior_id, ' (Después)'), ''),
            IF(OLD.Estatus != NEW.Estatus, CONCAT('\n - Estatus: ', OLD.Estatus, ' (Antes) -> ', NEW.Estatus, ' (Después)'), '')
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Eliminar_Instalaciones_Bitacora` AFTER DELETE ON `instalaciones` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Instalaciones', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Delete', -- Operacion: El tipo de operación realizada ('Delete')
        CONCAT(
            'Se ha eliminado el registro en la tabla Instalaciones con ID: ', OLD.ID,
            'Clave: ', OLD.clave,
            'Nombre: ', OLD.nombre,
            'Descripción: ', OLD.Descripcion,
            'Tipo: ', OLD.Tipo,
            'Departamento_id: ', OLD.Departamento_id,
            'Instalacion_superior_id: ', OLD.Instalacion_superior_id,
            'Estatus: ', OLD.Estatus
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personal_medico`
--

DROP TABLE IF EXISTS `personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_medico` (
  `Persona_ID` int unsigned NOT NULL,
  `Departamento_ID` int unsigned NOT NULL COMMENT 'vincula con una llave foranea a Departamanetos donde laboara el personal',
  `Especialidad` varchar(50) DEFAULT NULL COMMENT 'Designa la especialidad del medico o profesional de la salud.',
  `Tipo` enum('Médico','Enfermero','Administrativo','Directivo','Apoyo','Residente','Interno') NOT NULL COMMENT 'Permite asignar el Rol dentro de las activades laborales dentro del hospital.',
  `Cedula_Profesional` int(8) unsigned zerofill DEFAULT NULL COMMENT 'Designa la cedula profesional de la saluda como identificaicon para el ejercicio de la medicina',
  `Estatus` enum('Activo','Inactivo','Jubilado','Permiso') NOT NULL DEFAULT 'Activo' COMMENT 'Permite asiganar si el personal de saluda se encuentra Activo, Inactivo, Jubilado o Permiso.',
  `Fecha_Contratacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Asigna la fecha de contratacion del personal que labora dentro del hospital',
  `Fecha_Terminacion_Contrato` datetime DEFAULT NULL COMMENT 'Permite asignar una fecha de terminacion del contrato del personal que labora en el hospital.',
  PRIMARY KEY (`Persona_ID`),
  UNIQUE KEY `Cedula_Profesional_UNIQUE` (`Cedula_Profesional`),
  KEY `fk_area_medica` (`Departamento_ID`),
  CONSTRAINT `fk_departamento_2` FOREIGN KEY (`Departamento_ID`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `fk_personas_1` FOREIGN KEY (`Persona_ID`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_medico`
--

LOCK TABLES `personal_medico` WRITE;
/*!40000 ALTER TABLE `personal_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(45) DEFAULT NULL COMMENT 'Describe el titulo si la persona es profesionista ',
  `Nombre` varchar(80) NOT NULL COMMENT 'Designa el nombre de la persona',
  `Primer_Apellido` varchar(80) NOT NULL COMMENT 'Designa el Apellido Paterno de la persona',
  `Segundo_Apellido` varchar(80) DEFAULT NULL COMMENT 'Designa el Apellido Materno de la Persona',
  `CURP` varchar(20) DEFAULT NULL COMMENT 'General el CURP de la Persona',
  `Genero` enum('M','F','N/B') NOT NULL COMMENT 'Destemina el Genero de la Persona',
  `Grupo_Sanguineo` enum('A','B','AB','O') NOT NULL COMMENT 'Permite Asignar el grupo sanguineo de la persona',
  `Tipo_Sanguineo` enum('+','-') NOT NULL COMMENT 'Determina sin el grupo sanguineo al que pertenece es positivo o negativo',
  `Fecha_Nacimiento` date NOT NULL COMMENT 'Determina la fecha de nacimiento de la persona',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Asigna el estatus si esta activo o inactivo',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Genera la fecha de registro dentro del hospitla general',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Permite actulizar el registro de la persona',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_hospitalarios`
--

DROP TABLE IF EXISTS `servicios_hospitalarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_hospitalarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL COMMENT 'Describe los servicios que brinda El hospital General para la Atención Medica.',
  `Tipo` enum('Médico','Administrativo') NOT NULL COMMENT 'Permite Asignar quien esta solicitando el servicio medico por lo quie medicos y personal administrativo tienen el privilegio.\n',
  `Tipo_Intervencion` enum('Cirugia','Servicio de Emergencia','Hospitalización','Consulta Externa','Servicio Maternidad','Laboratorio','Palitativos','Rehabilitacion','Psiquiatria','Farmacia','Traslados') DEFAULT NULL COMMENT 'Permite selccionar los servicios ofrecidos dentro del Hospital General para su solicitud por el personal medico y administrativo.\n',
  `Descripcion` text COMMENT 'Permite describir la solicitud del servicio medico.',
  `Departamento_Responsable_ID` int unsigned NOT NULL COMMENT 'Todas las solicitudes provienende un departamento responsable que solicita el servicio a la Direccion General.',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Permite saber el estatus del servicio si se encuentra activo o inactivo.',
  PRIMARY KEY (`ID`),
  KEY `fk_departamento_solicitante` (`Departamento_Responsable_ID`),
  CONSTRAINT `fk_departamento_solicitante` FOREIGN KEY (`Departamento_Responsable_ID`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_hospitalarios`
--

LOCK TABLES `servicios_hospitalarios` WRITE;
/*!40000 ALTER TABLE `servicios_hospitalarios` DISABLE KEYS */;
INSERT INTO `servicios_hospitalarios` VALUES (1,'Alergología e Inmunología','Médico','Psiquiatria','Descripción del servicio medico solicitado por el departamento1',1,_binary ''),(2,'Consulta Externa','Médico','Traslados','Descripción del servicio medico solicitado por el departamento2',1,_binary ''),(3,'Cardiología','Médico','Cirugia','Descripción del servicio medico solicitado por el departamento3',1,_binary ''),(4,'Psiquiatria y Salud Mental','Médico','Traslados','Descripción del servicio medico solicitado por el departamento4',1,_binary ''),(5,'Psiquiatria y Salud Mental','Médico','Hospitalización','Descripción del servicio medico solicitado por el departamento5',1,_binary ''),(6,'Medicina Física y Rehabilitación','Médico','Farmacia','Descripción del servicio medico solicitado por el departamento1',1,_binary ''),(7,'Neurología','Médico','Consulta Externa','Descripción del servicio medico solicitado por el departamento2',1,_binary ''),(8,'Medicina Preventiva y Salud Pública','Médico','Traslados','Descripción del servicio medico solicitado por el departamento3',1,_binary ''),(9,'Infectología','Médico','Cirugia','Descripción del servicio medico solicitado por el departamento4',1,_binary ''),(10,'Otorrinología','Médico','Consulta Externa','Descripción del servicio medico solicitado por el departamento5',1,_binary ''),(11,'Hospitalización','Médico','Palitativos','Descripción del servicio médico solicitado por el departamento 1',1,_binary ''),(12,'Hospitalización','Médico','Servicio Maternidad','Descripción del servicio médico solicitado por el departamento 2',1,_binary ''),(13,'Urgencias','Administrativo','Traslados','Descripción del servicio médico solicitado por el departamento 3',1,_binary ''),(14,'Cuidados Intensivos','Médico','Rehabilitacion','Descripción del servicio médico solicitado por el departamento 4',1,_binary ''),(15,'Urgencias','Médico','Servicio de Emergencia','Descripción del servicio médico solicitado por el departamento 5',1,_binary '');
/*!40000 ALTER TABLE `servicios_hospitalarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Insertar_Servicios_Hospitalarios_Bitacora` AFTER INSERT ON `servicios_hospitalarios` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Servicios_Hospitalarios', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Insert', -- Operacion: El tipo de operación realizada ('Insert')
        CONCAT(
            'Se ha insertado un nuevo registro en la tabla Servicios_Hospitalarios con los siguientes detalles:',
            'ID: ', NEW.ID,
            'Nombre: ', NEW.Nombre,
            'Tipo: ', NEW.Tipo,
            'Tipo_Intervencion: ', NEW.Tipo_Intervencion,
            'Descripción: ', NEW.Descripcion,
            'Departamento_Responsable_ID: ', NEW.Departamento_Responsable_ID,
            'Estatus: ', NEW.Estatus
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Actualizar_Servicios_Hospitalarios_Bitacora` AFTER UPDATE ON `servicios_hospitalarios` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Servicios_Hospitalarios', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Update', -- Operacion: El tipo de operación realizada ('Update')
        CONCAT(
            'Se ha actualizado el registro en la tabla Servicios_Hospitalarios con ID: ', OLD.ID,
            '\nLos siguientes campos han sido modificados:',
            IF(OLD.Nombre != NEW.Nombre, CONCAT('\n - Nombre: ', OLD.Nombre, ' (Antes) -> ', NEW.Nombre, ' (Después)'), ''),
            IF(OLD.Tipo != NEW.Tipo, CONCAT('\n - Tipo: ', OLD.Tipo, ' (Antes) -> ', NEW.Tipo, ' (Después)'), ''),
            IF(OLD.Tipo_Intervencion != NEW.Tipo_Intervencion, CONCAT('\n - Tipo_Intervencion: ', OLD.Tipo_Intervencion, ' (Antes) -> ', NEW.Tipo_Intervencion, ' (Después)'), ''),
            IF(OLD.Descripcion != NEW.Descripcion, CONCAT('\n - Descripción: ', OLD.Descripcion, ' (Antes) -> ', NEW.Descripcion, ' (Después)'), ''),
            IF(OLD.Departamento_Responsable_ID != NEW.Departamento_Responsable_ID, CONCAT('\n - Departamento_Responsable_ID: ', OLD.Departamento_Responsable_ID, ' (Antes) -> ', NEW.Departamento_Responsable_ID, ' (Después)'), ''),
            IF(OLD.Estatus != NEW.Estatus, CONCAT('\n - Estatus: ', OLD.Estatus, ' (Antes) -> ', NEW.Estatus, ' (Después)'), '')
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Eliminar_Servicios_Hospitalarios_Bitacora` AFTER DELETE ON `servicios_hospitalarios` FOR EACH ROW BEGIN
    INSERT INTO bitacora_DG (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'Servicios_Hospitalarios', -- Nombre_Tabla: El nombre de la tabla en la que se realizó la operación
        USER(), -- Usuario: El nombre de usuario que realiza la operación
        'Delete', -- Operacion: El tipo de operación realizada ('Delete')
        CONCAT(
            'Se ha eliminado el registro en la tabla Servicios_Hospitalarios con ID: ', OLD.ID,
            'Nombre: ', OLD.Nombre,
            'Tipo: ', OLD.Tipo,
            'Tipo_Intervencion: ', OLD.Tipo_Intervencion,
            'Descripción: ', OLD.Descripcion,
            'Departamento_Responsable_ID: ', OLD.Departamento_Responsable_ID,
            'Estatus: ', OLD.Estatus
        ), -- Descripcion: Una descripción detallada de la operación
        NOW() -- Fecha_Hora: La fecha y hora actuales
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'direccion_general_hospital_210237'
--

--
-- Dumping routines for database 'direccion_general_hospital_210237'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN
	declare v_numero_generado int
    default Floor(rand()*(v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    set @numero_generado = v_numero_generado;

RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generar_fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generar_fechas`() RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE fecha_inicio DATE DEFAULT '2000-01-01';
    DECLARE fecha_fin DATE DEFAULT CURDATE();
    DECLARE diferencia_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET diferencia_dias = DATEDIFF(fecha_fin, fecha_inicio);
    SET dias_aleatorios = FLOOR(1 + RAND() * diferencia_dias);
    SET fecha_aleatoria = DATE_ADD(fecha_inicio, INTERVAL dias_aleatorios DAY);
    
    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `genera_estatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_estatus`() RETURNS enum('Aprobado','No Aprobado','En Proceso','Cancelado') CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE genera_estatus ENUM('Aprobado', 'No Aprobado', 'En Proceso', 'Cancelado');
    DECLARE random_num INT;

    -- Genera un número aleatorio entre 1 y 100
    SET random_num = FLOOR(1 + RAND() * 100);

    -- Asigna el estado en función del número aleatorio
    IF random_num <= 40 THEN
        SET genera_estatus = 'Aprobado';
    ELSEIF random_num <= 60 THEN
        SET genera_estatus = 'No Aprobado';
    ELSEIF random_num <= 80 THEN
        SET genera_estatus = 'En Proceso';
    ELSE
        SET genera_estatus = 'Cancelado';
    END IF;

    RETURN genera_estatus;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `genera_fechas_aleatorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_fechas_aleatorias`(fecha_inicio Date, fecha_fin date) RETURNS date
    DETERMINISTIC
BEGIN
    declare min_dias int;
    declare max_dias int;
    declare dias_aleatorios int;
    declare fecha_aleatoria date;
    
    set min_dias = datediff(fecha_inicio, '2000-01-01');
    set max_dias = datediff(fecha_fin, now());
    set dias_aleatorios  = fn_numero_aleatorio_rangos (min_dias, max_dias);
    set fecha_aleatoria = date_add('2000-01-01', interval dias_aleatorios day);
    
    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `genera_intervencion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_intervencion`(v_intervencion  CHAR(1)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE genera_intervencion VARCHAR(50) DEFAULT NULL;

    IF v_intervencion = 'I' THEN
        SET genera_intervencion  = ELT(FLOOR(1 + RAND() * 11), 
					   'Cirugia', 'Servicio de Emergencia', 'Hospitalización', 'Consulta Externa', 
					   'Servicio Maternidad', 'Laboratorio', 'Palitativos', 'Rehabilitacion', 
                       'Psiquiatria', 'Farmacia','Traslados'
        );

    END IF;

    RETURN genera_intervencion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `genera_servicio_medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_servicio_medico`(v_servicio CHAR(1)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE especialidad_generada VARCHAR(50) DEFAULT NULL;

    IF v_servicio = 'S' THEN
        SET especialidad_generada  = ELT(FLOOR(1 + RAND() * 32), 
            "Urgencias", "Consulta Externa", "Hospitalización", "Cirugia", "Laboratorio Clínico", "Radiología", "Farmacia",
            "Rehabilitación", "Cuidados Intensivos", "Atención Pediática", "Atencion Materno-Infantil", "Atencion Geriatrica",
            "Psiquiatria y Salud Mental", "Banco de Sangre", "Ginecologia y Obstetricia", "Quirofano", "Tanatologia", "Infectología",
            "Cardiología", "Neurología", "Endocrinología", "Oftamología", "Otorrinología", "Gastroenterología", "Nefrología", "Dermatología",
            "Hematología", "Oncología", "Alergología e Inmunología", "Medicina Física y Rehabilitación", "Medicina Interna", "Medicina Preventiva y Salud Pública"
        );

    END IF;

    RETURN especialidad_generada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `genera_tipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_tipo`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE tipo VARCHAR(50) DEFAULT NULL;

    SET tipo = CASE 
                WHEN RAND() < 0.8 THEN 'Médico'  -- 80% de probabilidad para 'Médico'
                ELSE 'Administrativo'           -- 20% de probabilidad para 'Administrativo'
              END;

    RETURN tipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEspecialidadesHospitalarias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEspecialidadesHospitalarias`(IN cantidad INT)
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE nombre_servicio VARCHAR(100);
    DECLARE tipo VARCHAR(50); -- Variable para almacenar el tipo generado aleatoriamente
    DECLARE tipo_intervencion VARCHAR(50);
    DECLARE descripcion_servicio TEXT;

    WHILE contador < cantidad DO

        -- Generar valores aleatorios para Nombre, Tipo_Intervencion y Descripcion
        SET nombre_servicio = genera_servicio_medico('S');
        SET tipo = genera_tipo(); -- Generar el tipo aleatoriamente
        SET tipo_intervencion = genera_intervencion('I');
        SET descripcion_servicio = CONCAT('Descripción del servicio médico solicitado por el departamento ', contador + 1);

        -- Insertar el registro en la tabla Servicios_Hospitalarios
        INSERT INTO Servicios_Hospitalarios (Nombre, Tipo, Tipo_Intervencion, Descripcion, Departamento_Responsable_ID)
        VALUES (nombre_servicio, tipo, tipo_intervencion, descripcion_servicio, 1); -- Suponiendo un ID de departamento responsable

        -- Incrementar el contador
        SET contador = contador + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEspecialidadHospitalaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEspecialidadHospitalaria`(IN v_servicio CHAR(1))
BEGIN
    DECLARE especialidad_generada VARCHAR(50);

    -- Generar la especialidad médica utilizando la función genera_servicio_medico
    SET especialidad_generada = genera_servicio_medico(v_servicio);

    -- Insertar la especialidad médica en la tabla Servicios_Hospitalarios
    INSERT INTO Servicios_Hospitalarios (Nombre, Tipo, Tipo_Intervencion, Descripcion, Departamento_Responsable_ID)
    VALUES (especialidad_generada, 'Médico', 'Consulta Externa', 'Descripción de la especialidad médica', 1); -- Reemplaza el ID del departamento responsable según corresponda

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_Aprobaciones_Servicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Aprobaciones_Servicios`(IN cantidad INT)
BEGIN
    DECLARE contador INT DEFAULT 0;
    
    -- Generar valores aleatorios
    DECLARE servicio_paciente_id INT;
    DECLARE departamento_solicitante_id INT;
    DECLARE fecha_solicitud DATETIME;
    DECLARE estatus VARCHAR(50);
    DECLARE comentarios TEXT;
    DECLARE fecha_aprobacion DATETIME;

    WHILE contador < cantidad DO
        -- Asignar valores aleatorios
        SET servicio_paciente_id = (SELECT ID FROM Servicios_Hospitalarios ORDER BY RAND() LIMIT 1);
        SET departamento_solicitante_id = (SELECT ID FROM departamentos ORDER BY RAND() LIMIT 1);
        SET fecha_solicitud = CONCAT(generar_fechas(), ' ', LPAD(FLOOR(RAND() * 24), 2, '0'), ':', LPAD(FLOOR(RAND() * 60), 2, '0'), ':', LPAD(FLOOR(RAND() * 60), 2, '0'));
        SET estatus = genera_estatus();
        SET comentarios = CONCAT('Comentarios sobre el servicio ', servicio_paciente_id);
        
        -- Determinar la fecha de aprobación según el estado
        IF estatus = 'Aprobado' THEN
            SET fecha_aprobacion = fecha_solicitud + INTERVAL FLOOR(RAND() * 10) DAY + INTERVAL FLOOR(RAND() * 24) HOUR + INTERVAL FLOOR(RAND() * 60) MINUTE + INTERVAL FLOOR(RAND() * 60) SECOND;
        ELSE
            SET fecha_aprobacion = NULL; -- Establece NULL para la fecha de aprobación si el estado no es 'Aprobado'
        END IF;

        -- Insertar el registro en la tabla Aprobaciones_Servicios
        INSERT INTO Aprobaciones_Servicios (Servicio_Paciente_ID, Departamento_Solicitante, Fecha_Solicitud, Estatus, Comentarios, Fecha_Aprobacion)
        VALUES (servicio_paciente_id, departamento_solicitante_id, fecha_solicitud, estatus, comentarios, fecha_aprobacion);

        -- Incrementar el contador
        SET contador = contador + 1;
    END WHILE;
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

-- Dump completed on 2024-03-25  3:06:39
