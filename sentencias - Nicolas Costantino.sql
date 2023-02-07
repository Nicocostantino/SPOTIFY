use spotify;

-- Creacion de USUARIO 1 con respectiva contraseña

create user 'UsuarioSpotify1' identified by '1234';

-- Se le otorga solo permiso para hacer lecturas sobre las tablas

grant select on *.* to 'UsuarioSpotify1';

-- Muestra los permisos dados al usuario

show grants for 'UsuarioSpotify1';

-- # Grants for UsuarioSpotify1@%
-- GRANT SELECT ON *.* TO `UsuarioSpotify1`@`%`


-- Prueba loggeado con el UsuarioSpotify1 de que solo tiene permiso de lectura 

update album set titulo = 'prueba' where id_album = 9; 

-- Error Code: 1142. UPDATE command denied to user 'UsuarioSpotify1'@'localhost' for table 'album'




-- Creacion de USUARIO 2 con respectiva contraseña

create user 'UsuarioSpotify2' identified by '1234';

-- Se le otorga solo permiso para hacer lecturas, insercion y modificacion de datos

grant select, insert, update on *.* to 'UsuarioSpotify2';

-- Muestra los permisos dados al usuario

show grants for 'UsuarioSpotify2';

-- # Grants for UsuarioSpotify2@%
-- GRANT SELECT, INSERT, UPDATE ON *.* TO `UsuarioSpotify2`@`%`

-- Prueba loggeado con el UsuarioSpotify2 de que solo tiene permiso de lectura, insercion y modificacion de datos

Delete from album where id_album = 9;

-- Error Code: 1142. DELETE command denied to user 'UsuarioSpotify2'@'localhost' for table 'album'

-- Prueba loggeado con el UsuarioSpotify2 de que puede modificar datos

update album set titulo = 'prueba' where id_album = 9; 

-- 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0

