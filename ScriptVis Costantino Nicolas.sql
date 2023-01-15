CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `album_de_patricia_sosa` AS select `alb`.`Titulo` AS `titulo`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista` from (`album` `alb` join `artista` `art`) where ((upper(`art`.`Nombre_del_artista`) = 'PATRICIA') and (upper(`art`.`Apellido_del_artista`) = 'SOSA') and (`art`.`id_artista` = `alb`.`id_artista`));


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `canciones_de_dua_lipa` AS select `can`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista`,`can`.`Numero_de_Reproducciones` AS `Numero_de_Reproducciones` from (`artista` `art` join `cancion` `can`) where ((upper(`art`.`Nombre_del_artista`) = 'DUA') and (upper(`art`.`Apellido_del_artista`) = 'LIPA') and (`art`.`id_artista` = `can`.`id_artista`));


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `duracion_de_canciones` AS select `cancion`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`cancion`.`Duracion` AS `duracion` from `cancion` order by `cancion`.`Nombre_de_la_cancion` desc;


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `playlist_de_dua_lipa` AS select `play`.`Titulo` AS `Titulo`,`can`.`Nombre_de_la_cancion` AS `Nombre_de_la_cancion`,`art`.`Nombre_del_artista` AS `Nombre_del_artista`,`art`.`Apellido_del_artista` AS `Apellido_del_artista` from ((`artista` `art` join `cancion` `can`) join `playlist` `play`) where ((upper(`art`.`Nombre_del_artista`) = 'DUA') and (upper(`art`.`Apellido_del_artista`) = 'LIPA') and (`art`.`id_artista` = `can`.`id_artista`) and (`play`.`id_cancion` = `can`.`id_cancion`));


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuarios_de_argentina` AS select `us`.`Nombre` AS `nombre`,`us`.`Email` AS `Email` from `usuario` `us` where (`us`.`Pais` = 'ARGENTINA');
