DELIMITER $$
CREATE PROCEDURE SP_ORDEN_ALBUM (IN CAMPO varchar(10), IN ORDEN int)
/* SP que permite ordenar los albumes por los primeros 2 campos de la tabla, de manera ascendente con 1 o descendente con 2 */

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

END
$$



DELIMITER $$
CREATE PROCEDURE SP_DELETE_USER_SIN_PLAYLIST (IN p_id_usuario int)
/* SP que permite borrar los usuarios que no posean playlist, ejemplo id= 222 */
BEGIN
set @can_reg_borrar= 0;

select count(*) into @can_reg_borrar from usuario where id_usuario = p_id_usuario;
delete from usuario where id_usuario = p_id_usuario ;

if @can_reg_borrar = 0 then 
select 'Elija otro id de usuario que sea valido para eliminar' from dual; 
else 
select 'Se elimina el usuario seleccionado' from dual; 
end if;

END
$$