-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(30) NOT NULL,
  `Anio` date NOT NULL,
  `id_artista` int NOT NULL,
  `imagen_portada_album` blob NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `id_artista` (`id_artista`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (9,'BUTTERFLY','1997-12-12',121,''),(12,'FUTURE NOSTALGIA','2021-12-21',25,''),(15,'LUZ DE MI VIDA','1992-12-12',200,''),(23,'THRILLER','1982-12-12',69,''),(39,'ARTPOP','2013-12-12',158,''),(52,'EL MAESTRO','1996-12-12',251,''),(78,'BABY ONE MORE TIME','1998-12-12',12,''),(99,'FEVER','2020-12-12',2,''),(121,'SOLO PARA ENTENDIDOS','2007-12-12',98,''),(201,'IN UTERO','1993-12-12',198,'');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `album_de_patricia_sosa`
--

DROP TABLE IF EXISTS `album_de_patricia_sosa`;
/*!50001 DROP VIEW IF EXISTS `album_de_patricia_sosa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `album_de_patricia_sosa` AS SELECT 
 1 AS `titulo`,
 1 AS `Nombre_del_artista`,
 1 AS `Apellido_del_artista`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `Nombre_del_artista` varchar(30) NOT NULL,
  `Apellido_del_artista` varchar(30) NOT NULL,
  `imagen_del_artista` blob,
  `Nacionalidad` varchar(30) NOT NULL,
  `Fecha_de_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (2,'KYLIE','MINOGUE','','AUSTRALIA','1965-08-02'),(12,'BRITNEY','SPEARS','','EEUU','1985-12-02'),(25,'DUA','LIPA','','KOSOVO','1996-02-12'),(69,'MICHAEL','JACKSON','','EEUU','1970-05-14'),(98,'PABLO','LESCANO','','ARGENTINA','1969-08-25'),(121,'MARIAH','CAREY','','PUERTO RICO','1965-12-03'),(158,'LADY','GAGA','','EEUU','1983-08-25'),(198,'KURT','COBAIN','','EEUU','1971-09-21'),(200,'PATRICIA','SOSA','','ARGENTINA','1958-07-19'),(251,'ANTONIO','RIOS','','ARGENTINA','1950-06-07'),(458,'DIEGO','TORRES',NULL,'ARGENTINA','1963-11-25'),(999,'BON','JOVI',NULL,'EEUU','1959-12-25');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_artista_before` BEFORE UPDATE ON `artista` FOR EACH ROW BEGIN
-- Tabla en la cual se va a replicar la informacion
INSERT INTO NEW_ARTISTA(id_artista,nombre_del_artista,apellido_del_artista,Fecha_de_creacion, Usuario_creacion)
VALUES (
	NEW.id_artista, NEW.nombre_del_artista, NEW.apellido_del_artista,current_timestamp(), system_user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `id_cancion` int NOT NULL AUTO_INCREMENT,
  `Nombre_de_la_cancion` varchar(30) NOT NULL,
  `id_artista` int NOT NULL,
  `Duracion` time NOT NULL,
  `Numero_de_Reproducciones` int NOT NULL DEFAULT '0',
  `id_album` int NOT NULL,
  PRIMARY KEY (`id_cancion`),
  KEY `id_album` (`id_album`),
  KEY `id_artista` (`id_artista`),
  CONSTRAINT `cancion_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  CONSTRAINT `cancion_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` VALUES (2,'APPLASE',158,'03:58:00',1245787,39),(45,'FUTURE NOSTALGIA',25,'04:22:00',52000,12),(54,'MARCADA A FUEGO',200,'04:30:00',1201,15),(154,'MY ALL',121,'04:12:00',897885,9),(258,'LA HISTORIA',98,'02:59:00',39870,121),(369,'BILLIE JEAN',69,'04:54:00',233987,23),(789,'IN YOUR EYES',2,'03:18:00',548888,99),(1211,'VERY APE',198,'04:25:00',10287,201),(1245,'BABY ONE MORE TIME',12,'03:45:00',120000,78),(1854,'New Rules',25,'03:44:00',1524521,12),(2012,'ARRENPENTIDA',251,'04:11:00',98782,52);
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_cancion_after` AFTER INSERT ON `cancion` FOR EACH ROW BEGIN
-- Tabla en la cual se va a replicar la informacion
INSERT INTO NEW_CANCION (id_cancion, Nombre_de_la_cancion, Duracion, Numero_de_reproducciones,Fecha_de_creacion, Usuario_creacion)
VALUES (
	NEW.id_cancion, NEW.Nombre_de_la_cancion, NEW.Duracion, NEW.Numero_de_reproducciones,current_timestamp(), system_user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `canciones_de_dua_lipa`
--

DROP TABLE IF EXISTS `canciones_de_dua_lipa`;
/*!50001 DROP VIEW IF EXISTS `canciones_de_dua_lipa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `canciones_de_dua_lipa` AS SELECT 
 1 AS `Nombre_de_la_cancion`,
 1 AS `Nombre_del_artista`,
 1 AS `Apellido_del_artista`,
 1 AS `Numero_de_Reproducciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `duracion_de_canciones`
--

DROP TABLE IF EXISTS `duracion_de_canciones`;
/*!50001 DROP VIEW IF EXISTS `duracion_de_canciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `duracion_de_canciones` AS SELECT 
 1 AS `Nombre_de_la_cancion`,
 1 AS `duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `new_artista`
--

DROP TABLE IF EXISTS `new_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_artista` (
  `id_new_artista` int NOT NULL AUTO_INCREMENT,
  `id_artista` int DEFAULT NULL,
  `Nombre_del_artista` varchar(30) DEFAULT NULL,
  `Apellido_del_artista` varchar(30) DEFAULT NULL,
  `Fecha_de_creacion` timestamp NULL DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_new_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_artista`
--

LOCK TABLES `new_artista` WRITE;
/*!40000 ALTER TABLE `new_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_cancion`
--

DROP TABLE IF EXISTS `new_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_cancion` (
  `id_new_cancion` int NOT NULL AUTO_INCREMENT,
  `id_cancion` int DEFAULT NULL,
  `Nombre_de_la_cancion` varchar(50) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Numero_de_Reproducciones` int DEFAULT NULL,
  `Fecha_de_creacion` timestamp NULL DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_new_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_cancion`
--

LOCK TABLES `new_cancion` WRITE;
/*!40000 ALTER TABLE `new_cancion` DISABLE KEYS */;
INSERT INTO `new_cancion` VALUES (1,1854,'New Rules','03:44:00',1524521,'2023-01-15 21:08:25','root@localhost');
/*!40000 ALTER TABLE `new_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `Titulo` varchar(30) NOT NULL,
  `Fecha_de_creacion` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_cancion` int NOT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `playlist_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,1211,'POP REMIX','2022-05-25 00:00:00',1,2),(2,251,'DANCE REMIX','2021-01-10 00:00:00',1,45),(3,251,'LO MAS ESCUCHADO','2022-08-18 00:00:00',1,45),(4,12,'GIMNASIA','2022-09-03 00:00:00',1,789),(5,368,'BOLICHE','2022-10-14 00:00:00',1,258),(6,1782,'YOUNG AND CHILL','2020-02-04 00:00:00',1,789),(7,1782,'CHILL OUT','2021-05-26 00:00:00',1,154),(8,1782,'PARTY MIX','2020-09-23 00:00:00',0,258),(9,4021,'CUMBIAS','2018-12-12 00:00:00',0,54),(10,3697,'RELAX','2021-04-30 00:00:00',1,154);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `playlist_de_dua_lipa`
--

DROP TABLE IF EXISTS `playlist_de_dua_lipa`;
/*!50001 DROP VIEW IF EXISTS `playlist_de_dua_lipa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playlist_de_dua_lipa` AS SELECT 
 1 AS `Titulo`,
 1 AS `Nombre_de_la_cancion`,
 1 AS `Nombre_del_artista`,
 1 AS `Apellido_del_artista`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Genero` varchar(10) NOT NULL,
  `Fecha_de_nacimiento` date NOT NULL,
  `Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'CARLA','CARLA@GMAIL.COM','CARLA2023','FEMENINO','1988-12-15','ARGENTINA'),(2,'CARINA','CARINA@GMAIL.COM','CARINA2023','FEMENINO','1988-12-15','CHILE'),(3,'MARTIN','MARTIN@GMAIL.COM','MARTIN2023','MASCULINO','1988-12-15','PERU'),(4,'PEDRO','PEDRO@GMAIL.COM','PEDRO2023','MASCULINO','1988-12-15','COLOMBIA'),(5,'LORENA','LORENA@GMAIL.COM','LORENA2023','FEMENINO','1988-12-15','ARGENTINA'),(6,'MATIAS','MATIAS@GMAIL.COM','MATIAS023','MASCULINO','1988-12-15','ARGENTINA'),(7,'JOSE','JOSE@GMAIL.COM','JOSE2023','MASCULINO','1988-12-15','BRASIL'),(8,'EDUARDO','EDUARDO@GMAIL.COM','EDUARDO2023','MASCULINO','1988-12-15','ARGENTINA'),(12,'MARIA','MARIALOPEZ@CIUDAD.COM.AR','4547HOLA##','FEMENINO','1974-04-28','CHILE'),(222,'MARIO','MARIO@HOLA.COM','233TTT$$$$','MASCULINO','1985-03-06','MEXICO'),(251,'PEDRO','PEDRO@GMAIL.COM','454$$%%$','MASCULINO','1985-02-04','ARGENTINA'),(368,'LORENA','LORU@UOL.COM','LOL123$$','FEMENINO','1977-01-09','ARGENTINA'),(999,'ALEXIS','ALESFOT@GMAIL.COM','ALE234\"\"\"\"','OTRO','1984-02-09','CHILE'),(1211,'RAUL','RAUL@GMAIL.COM','123DFFD','MASCULINO','1975-02-12','ARGENTINA'),(1782,'PAMELA','PAMECROC@GMAIL.COM','POL%$54','FEMENINO','1987-07-17','BOLIVIA'),(3565,'LUCIANA','LUCIANACOS@HOTMAIL.COM.AR','UTYRY111##','FEMENINO','1998-11-13','URUGUAY'),(3697,'TATIANA','TATUIUZZO@GMAIL.COM','LOC65!','FEMENINO','1983-02-14','ARGENTINA'),(4021,'CARMEN','CARMENCALDE@HOTMAIL.COM','CARMEN20##$','FEMENINO','1969-09-19','PERU');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuarios_de_argentina`
--

DROP TABLE IF EXISTS `usuarios_de_argentina`;
/*!50001 DROP VIEW IF EXISTS `usuarios_de_argentina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuarios_de_argentina` AS SELECT 
 1 AS `nombre`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'spotify'
--

--
-- Dumping routines for database 'spotify'
--
/*!50003 DROP FUNCTION IF EXISTS `cant_discos_decada_menor_2000` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cant_discos_decada_menor_2000`(decada int) RETURNS int
    NO SQL
BEGIN
DECLARE Cant_discos_decada Int;
DECLARE anio_desde INT;
DECLARE anio_hasta INT;
DECLARE anio_album int;

set anio_desde = 1900 + decada; 
set anio_hasta = 1900 +  decada + 9; 

select count(*) into cant_discos_decada
from album
where year(album.anio) between anio_desde and anio_hasta;

RETURN Cant_discos_decada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cant_reproduccion_cancion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cant_reproduccion_cancion`(cancion varchar(50)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE reproducciones Int;

select Numero_de_reproducciones into reproducciones
from cancion
where upper (Nombre_de_la_cancion) = upper(cancion);

RETURN reproducciones;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_USER_SIN_PLAYLIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_USER_SIN_PLAYLIST`(IN p_id_usuario int)
BEGIN
set @can_reg_borrar= 0;

select count(*) into @can_reg_borrar from usuario where id_usuario = p_id_usuario;
delete from usuario where id_usuario = p_id_usuario ;

if @can_reg_borrar = 0 then 
select 'Elija otro id de usuario que sea valido para eliminar' from dual; 
else 
select 'Se elimina el usuario seleccionado' from dual; 
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDEN_ALBUM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDEN_ALBUM`(IN CAMPO varchar(10), IN ORDEN int)
BEGIN

IF upper(CAMPO) = 'ID_ALBUM' and ORDEN = 1 THEN 
SELECT * FROM ALBUM ORDER BY id_album ASC; 
END IF;

IF upper(CAMPO) = 'ID_ALBUM' and ORDEN = 2 THEN 
SELECT * FROM ALBUM ORDER BY id_album DESC; 
END IF;

IF upper(CAMPO) = 'TITULO' and ORDEN = 1 THEN 
SELECT * FROM ALBUM ORDER BY titulo ASC; 
END IF;

IF upper(CAMPO) = 'TITULO' and ORDEN = 2 THEN 
SELECT * FROM ALBUM ORDER BY titulo DESC; 
END IF;

IF upper(CAMPO) = 'ANIO' and ORDEN = 1 THEN 
SELECT * FROM ALBUM ORDER BY anio ASC; 
END IF;

IF upper(CAMPO) = 'ANIO' and ORDEN = 2 THEN 
SELECT * FROM ALBUM ORDER BY anio DESC; 
END IF;

if upper(campo) not in ('ID_ALBUM','TITULO','ANIO') 
then select 'Elija como campo para ordenar: id_album , titulo o anio' from dual; 
end if;

if orden not in (1,2) 
then select 'Elija como orden 1 para ascendente o 2 como descendente' from dual; 
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `album_de_patricia_sosa`
--

/*!50001 DROP VIEW IF EXISTS `album_de_patricia_sosa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `album_de_patricia_sosa` AS select `alb`.`Titulo` AS `titulo`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista` from (`album` `alb` join `artista` `art`) where ((upper(`art`.`Nombre_del_artista`) = 'PATRICIA') and (upper(`art`.`Apellido_del_artista`) = 'SOSA') and (`art`.`id_artista` = `alb`.`id_artista`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `canciones_de_dua_lipa`
--

/*!50001 DROP VIEW IF EXISTS `canciones_de_dua_lipa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `canciones_de_dua_lipa` AS select `can`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista`,`can`.`Numero_de_Reproducciones` AS `Numero_de_Reproducciones` from (`artista` `art` join `cancion` `can`) where ((upper(`art`.`Nombre_del_artista`) = 'DUA') and (upper(`art`.`Apellido_del_artista`) = 'LIPA') and (`art`.`id_artista` = `can`.`id_artista`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `duracion_de_canciones`
--

/*!50001 DROP VIEW IF EXISTS `duracion_de_canciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `duracion_de_canciones` AS select `cancion`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`cancion`.`Duracion` AS `duracion` from `cancion` order by `cancion`.`Nombre_de_la_cancion` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playlist_de_dua_lipa`
--

/*!50001 DROP VIEW IF EXISTS `playlist_de_dua_lipa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playlist_de_dua_lipa` AS select `play`.`Titulo` AS `Titulo`,`can`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista` from ((`artista` `art` join `cancion` `can`) join `playlist` `play`) where ((upper(`art`.`Nombre_del_artista`) = 'DUA') and (upper(`art`.`Apellido_del_artista`) = 'LIPA') and (`art`.`id_artista` = `can`.`id_artista`) and (`play`.`id_cancion` = `can`.`id_cancion`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_de_argentina`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_de_argentina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_de_argentina` AS select `us`.`Nombre` AS `nombre`,`us`.`Email` AS `Email` from `usuario` `us` where (`us`.`Pais` = 'ARGENTINA') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-15 10:33:48
