delimiter $$
CREATE FUNCTION cant_reproduccion_cancion (cancion varchar(50))
RETURNS INT
deterministic
-- FUNCION QUE DEVUELVE LA CANTIDAD DE REPRODUCCIONES DE UNA CANCION QUE SE INGRESA POR PARAMETRO
BEGIN
DECLARE reproducciones Int;

select Numero_de_reproducciones into reproducciones
from cancion
where upper (Nombre_de_la_cancion) = upper(cancion);

RETURN reproducciones;
END
$$;

delimiter $$
CREATE FUNCTION cant_discos_decada_menor_2000 (decada int)
RETURNS INT
no sql
-- FUNCION QUE DEVUELVE LA CANTIDAD DE DISCOS DE UNA DECADA QUE SE PASA POR PARAMETRO, SIENDO LA DECADA MENOR AL 2000
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
END
$$;