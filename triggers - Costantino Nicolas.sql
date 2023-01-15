-- ***************************************************************************************
-- Creacion  de TRIGGER con AFTER
-- ****************************************************************************************

-- Creacion de la tabla para monitorear los nuevos registros de la tabla cancion

CREATE TABLE NEW_CANCION (
id_new_cancion INT auto_increment primary key,
id_cancion INT,
Nombre_de_la_cancion varchar (50),
Duracion time,
Numero_de_Reproducciones int, 
Fecha_de_creacion timestamp,
usuario_creacion varchar (50));



DELIMITER $$
CREATE TRIGGER tr_insert_new_cancion_after
/* Este trigger genera un registro en la tabla de log de nuevas canciones con la fecha y usuario que realizo el insert en cancion. */
-- Tabla la cual se va a monitorear
AFTER INSERT ON  cancion 
FOR EACH row
BEGIN
-- Tabla en la cual se va a replicar la informacion
INSERT INTO NEW_CANCION (id_cancion, Nombre_de_la_cancion, Duracion, Numero_de_reproducciones,Fecha_de_creacion, Usuario_creacion)
VALUES (
	NEW.id_cancion, NEW.Nombre_de_la_cancion, NEW.Duracion, NEW.Numero_de_reproducciones,current_timestamp(), system_user());
END
$$ 


-- Prueba para verificar el correcto funcionamiento del trigger.
/* Al crear un nuevo registro en la tabla cancion se crea el registro en new_cancion con la fecha y usuario que realizo el insert. */

INSERT INTO cancion (id_cancion, Nombre_de_la_cancion, id_artista, Duracion, Numero_de_Reproducciones, id_album)
VALUES (1854, 'New Rules', 25 , time('03:44'),1524521,12);


-- ***************************************************************************************
-- Creacion  de TRIGGER con BEFORE
-- ****************************************************************************************

-- Creacion de la tabla para monitorear los nuevos registros de la tabla artista

CREATE TABLE NEW_ARTISTA (
id_new_artista INT auto_increment primary key,
id_artista INT,
Nombre_del_artista varchar (30),
Apellido_del_artista varchar (30),
Fecha_de_creacion timestamp,
usuario_creacion varchar (50));



DELIMITER $$
CREATE TRIGGER tr_insert_new_artista_before
/* Este trigger genera un registro en la tabla de log de modificaciones de artistas existentes con la fecha y usuario que realizo dicho cambio. */
-- Tabla la cual se va a monitorear
BEFORE UPDATE ON  artista
FOR EACH row
BEGIN
-- Tabla en la cual se va a replicar la informacion
INSERT INTO NEW_ARTISTA(id_artista,nombre_del_artista,apellido_del_artista,Fecha_de_creacion, Usuario_creacion)
VALUES (
	NEW.id_artista, NEW.nombre_del_artista, NEW.apellido_del_artista,current_timestamp(), system_user());
END
$$ 


-- Prueba para verificar el correcto funcionamiento del trigger.
/* Al hacer un update en un registro en la tabla artista se crea el registro en new_artista con la fecha y usuario que realizo el update. */
Update artista set nombre_del_artista = 'PABLITO' where id_artista = 98;