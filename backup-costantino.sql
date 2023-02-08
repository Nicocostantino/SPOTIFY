-- TABLAS INCLUIDAS EN EL BACKUP

-- ALBUM
-- ARTISTA
-- CANCION
-- PLAYLIST
-- USUARIO
-- NEW_ARTISTA
-- NEW_CANCION

-- INICIO DEL BACKUP




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
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (9,'BUTTERFLY','1997-12-12',121,''),(12,'FUTURE NOSTALGIA','2021-12-21',25,''),(15,'LUZ DE MI VIDA','1992-12-12',200,''),(23,'THRILLER','1982-12-12',69,''),(39,'ARTPOP','2013-12-12',158,''),(52,'EL MAESTRO','1996-12-12',251,''),(78,'BABY ONE MORE TIME','1998-12-12',12,''),(99,'FEVER','2020-12-12',2,''),(121,'SOLO PARA ENTENDIDOS','2007-12-12',98,''),(201,'IN UTERO','1993-12-12',198,'');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `new_artista`
--

LOCK TABLES `new_artista` WRITE;
/*!40000 ALTER TABLE `new_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `new_cancion`
--

LOCK TABLES `new_cancion` WRITE;
/*!40000 ALTER TABLE `new_cancion` DISABLE KEYS */;
INSERT INTO `new_cancion` VALUES (1,1854,'New Rules','03:44:00',1524521,'2023-01-15 21:08:25','root@localhost');
/*!40000 ALTER TABLE `new_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,1211,'POP REMIX','2022-05-25 00:00:00',1,2),(2,251,'DANCE REMIX','2021-01-10 00:00:00',1,45),(3,251,'LO MAS ESCUCHADO','2022-08-18 00:00:00',1,45),(4,12,'GIMNASIA','2022-09-03 00:00:00',1,789),(5,368,'BOLICHE','2022-10-14 00:00:00',1,258),(6,1782,'YOUNG AND CHILL','2020-02-04 00:00:00',1,789),(7,1782,'CHILL OUT','2021-05-26 00:00:00',1,154),(8,1782,'PARTY MIX','2020-09-23 00:00:00',0,258),(9,4021,'CUMBIAS','2018-12-12 00:00:00',0,54),(10,3697,'RELAX','2021-04-30 00:00:00',1,154);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'CARLA','CARLA@GMAIL.COM','CARLA2023','FEMENINO','1988-12-15','ARGENTINA'),(2,'CARINA','CARINA@GMAIL.COM','CARINA2023','FEMENINO','1988-12-15','CHILE'),(3,'MARTIN','MARTIN@GMAIL.COM','MARTIN2023','MASCULINO','1988-12-15','PERU'),(4,'PEDRO','PEDRO@GMAIL.COM','PEDRO2023','MASCULINO','1988-12-15','COLOMBIA'),(5,'LORENA','LORENA@GMAIL.COM','LORENA2023','FEMENINO','1988-12-15','ARGENTINA'),(6,'MATIAS','MATIAS@GMAIL.COM','MATIAS023','MASCULINO','1988-12-15','ARGENTINA'),(7,'JOSE','JOSE@GMAIL.COM','JOSE2023','MASCULINO','1988-12-15','BRASIL'),(8,'EDUARDO','EDUARDO@GMAIL.COM','EDUARDO2023','MASCULINO','1988-12-15','ARGENTINA'),(12,'MARIA','MARIALOPEZ@CIUDAD.COM.AR','4547HOLA##','FEMENINO','1974-04-28','CHILE'),(222,'MARIO','MARIO@HOLA.COM','233TTT$$$$','MASCULINO','1985-03-06','MEXICO'),(251,'PEDRO','PEDRO@GMAIL.COM','454$$%%$','MASCULINO','1985-02-04','ARGENTINA'),(368,'LORENA','LORU@UOL.COM','LOL123$$','FEMENINO','1977-01-09','ARGENTINA'),(999,'ALEXIS','ALESFOT@GMAIL.COM','ALE234\"\"\"\"','OTRO','1984-02-09','CHILE'),(1211,'RAUL','RAUL@GMAIL.COM','123DFFD','MASCULINO','1975-02-12','ARGENTINA'),(1782,'PAMELA','PAMECROC@GMAIL.COM','POL%$54','FEMENINO','1987-07-17','BOLIVIA'),(3565,'LUCIANA','LUCIANACOS@HOTMAIL.COM.AR','UTYRY111##','FEMENINO','1998-11-13','URUGUAY'),(3697,'TATIANA','TATUIUZZO@GMAIL.COM','LOC65!','FEMENINO','1983-02-14','ARGENTINA'),(4021,'CARMEN','CARMENCALDE@HOTMAIL.COM','CARMEN20##$','FEMENINO','1969-09-19','PERU');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-30 15:56:49
