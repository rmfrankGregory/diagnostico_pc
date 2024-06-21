
START TRANSACTION;

CREATE DATABASE  `baseconocimiento_pc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `baseconocimiento_pc`;

CREATE TABLE `problema` (
  `id_prob` int(5) NOT NULL,
  `nom_prob` varchar(100) DEFAULT NULL,
  `desc_prob` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `sintoma` (
  `id_sint` int(5) NOT NULL,
  `nom_sint` varchar(100) DEFAULT NULL,
  `id_prob` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `solucion` (
  `id_sol` int(5) NOT NULL,
  `desc_sol` varchar(500) DEFAULT NULL,
  `id_prob` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `problema`
  ADD PRIMARY KEY (`id_prob`);


ALTER TABLE `sintoma`
  ADD PRIMARY KEY (`id_sint`),
  ADD KEY `id_prob` (`id_prob`);


ALTER TABLE `solucion`
  ADD PRIMARY KEY (`id_sol`),
  ADD KEY `id_prob` (`id_prob`);


ALTER TABLE `problema`
  MODIFY `id_prob` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `sintoma`
  MODIFY `id_sint` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


ALTER TABLE `solucion`
  MODIFY `id_sol` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `sintoma`
  ADD CONSTRAINT `sintoma_ibfk_1` FOREIGN KEY (`id_prob`) REFERENCES `problema` (`id_prob`);


ALTER TABLE `solucion`
  ADD CONSTRAINT `solucion_ibfk_1` FOREIGN KEY (`id_prob`) REFERENCES `problema` (`id_prob`);



INSERT INTO `problema` (`id_prob`, `nom_prob`, `desc_prob`) VALUES
(1, 'No enciende', 'La computadora no enciende cuando se presiona el botón de encendido.'),
(2, 'Pantalla azul', 'La computadora muestra una pantalla azul de error (BSOD).'),
(3, 'Lentitud', 'La computadora está funcionando muy lenta.'),
(4, 'Reinicio inesperado', 'La computadora se reinicia de forma inesperada.'),
(5, 'No hay sonido', 'La computadora no emite sonido.'),
(6, 'Wi-Fi no se conecta', 'La computadora no se conecta a la red Wi-Fi.'),
(7, 'USB no funciona', 'Los puertos USB no funcionan.'),
(8, 'Teclado no responde', 'El teclado no responde.'),
(9, 'Pantalla negra', 'La pantalla está negra aunque la computadora está encendida.'),
(10, 'Ventilador ruidoso', 'El ventilador hace mucho ruido.');


INSERT INTO `sintoma` (`id_sint`, `nom_sint`, `id_prob`) VALUES
(1, 'No hay luces ni sonidos', 1),
(2, 'Luces parpadean pero no arranca', 1),
(3, 'No hay ventilación del ventilador', 1),
(4, 'No se escucha ningún sonido de arranque', 1),
(5, 'La batería no carga', 1),

(6, 'Pantalla azul con código de error', 2),
(7, 'Reinicios aleatorios', 2),
(8, 'Se congela al arrancar', 2),
(9, 'Errores frecuentes en aplicaciones', 2),
(10, 'Archivos del sistema dañados', 2),

(11, 'Aplicaciones tardan en abrir', 3),
(12, 'Respuesta lenta del sistema', 3),
(13, 'Arranque lento del sistema', 3),
(14, 'Retraso al escribir o usar el mouse', 3),
(15, 'Archivos tardan en abrir', 3),

(16, 'Reinicio durante el uso', 4),
(17, 'Reinicio al iniciar un programa', 4),
(18, 'Reinicio al conectar un dispositivo USB', 4),
(19, 'Reinicio al abrir múltiples aplicaciones', 4),
(20, 'Reinicio después de una actualización', 4),

(21, 'No se escucha nada', 5),
(22, 'Altavoces funcionan en otra computadora', 5),
(23, 'Salida de audio no funciona', 5),
(24, 'Sonido distorsionado o entrecortado', 5),
(25, 'Volumen muy bajo aunque esté al máximo', 5),

(26, 'No se encuentra la red Wi-Fi', 6),
(27, 'Conexión Wi-Fi inestable', 6),
(28, 'Baja velocidad de internet', 6),
(29, 'Wi-Fi se desconecta frecuentemente', 6),
(30, 'No puede conectarse a redes seguras', 6),

(31, 'Dispositivo USB no reconocido', 7),
(32, 'Puertos USB dañados físicamente', 7),
(33, 'Transferencia de datos lenta en USB', 7),
(34, 'Dispositivos USB se desconectan aleatoriamente', 7),
(35, 'Error de energía en puertos USB', 7),

(36, 'Teclas no responden', 8),
(37, 'Teclado funciona en otra computadora', 8),
(38, 'Algunas teclas no funcionan', 8),
(39, 'Teclado escribe caracteres incorrectos', 8),
(40, 'Teclado responde con retraso', 8),

(41, 'Pantalla está encendida pero no muestra nada', 9),
(42, 'Pantalla no se ilumina en absoluto', 9),
(43, 'Pantalla muestra líneas o artefactos', 9),
(44, 'Pantalla parpadea', 9),
(45, 'Pantalla se apaga al mover la tapa', 9),

(46, 'Ruido constante del ventilador', 10),
(47, 'Ruido solo al usar programas exigentes', 10),
(48, 'Ventilador se enciende y apaga constantemente', 10),
(49, 'Ventilador no se enciende en absoluto', 10),
(50, 'Ruido de ventilador más fuerte de lo normal', 10);



INSERT INTO `solucion` (`id_sol`, `desc_sol`, `id_prob`) VALUES
(1, 'Revisar la conexión de la fuente de poder.', 1),
(2, 'Reemplazar la fuente de poder.', 1),
(3, 'Actualizar o reinstalar los controladores.', 2),
(4, 'Revisar la memoria RAM.', 2),
(5, 'Eliminar programas innecesarios.', 3),
(6, 'Revisar el disco duro para errores.', 3),
(7, 'Actualizar BIOS.', 4),
(8, 'Revisar el suministro de energía.', 4),
(9, 'Revisar controladores de sonido.', 5),
(10, 'Verificar configuración de sonido.', 5),
(11, 'Reiniciar router.', 6),
(12, 'Actualizar controladores de red.', 6),
(13, 'Revisar configuración de energía USB.', 7),
(14, 'Actualizar controladores USB.', 7),
(15, 'Reemplazar teclado.', 8),
(16, 'Reinstalar controladores de teclado.', 8),
(17, 'Verificar conexiones de pantalla.', 9),
(18, 'Reemplazar pantalla.', 9),
(19, 'Limpiar ventilador.', 10),
(20, 'Reemplazar ventilador.', 10);


  
COMMIT;


