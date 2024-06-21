-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2024 a las 06:33:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baseconocimiento_pc`
--
CREATE DATABASE IF NOT EXISTS `baseconocimiento_pc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `baseconocimiento_pc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema`
--

CREATE TABLE `problema` (
  `id_prob` int(5) NOT NULL,
  `nom_prob` varchar(100) DEFAULT NULL,
  `desc_prob` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `problema`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sintoma`
--

CREATE TABLE `sintoma` (
  `id_sint` int(5) NOT NULL,
  `nom_sint` varchar(100) DEFAULT NULL,
  `id_prob` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sintoma`
--

INSERT INTO `sintoma` (`id_sint`, `nom_sint`, `id_prob`) VALUES
(1, 'No hay luces ni sonidos', 1),
(2, 'Luces parpadean pero no arranca', 1),
(3, 'Pantalla azul con código de error', 2),
(4, 'Reinicios aleatorios', 2),
(5, 'Aplicaciones tardan en abrir', 3),
(6, 'Respuesta lenta del sistema', 3),
(7, 'Reinicio durante el uso', 4),
(8, 'Reinicio al iniciar un programa', 4),
(9, 'No se escucha nada', 5),
(10, 'Altavoces funcionan en otra computadora', 5),
(11, 'No se encuentra la red Wi-Fi', 6),
(12, 'Conexión Wi-Fi inestable', 6),
(13, 'Dispositivo USB no reconocido', 7),
(14, 'Puertos USB dañados físicamente', 7),
(15, 'Teclas no responden', 8),
(16, 'Teclado funciona en otra computadora', 8),
(17, 'Pantalla está encendida pero no muestra nada', 9),
(18, 'Pantalla no se ilumina en absoluto', 9),
(19, 'Ruido constante del ventilador', 10),
(20, 'Ruido solo al usar programas exigentes', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solucion`
--

CREATE TABLE `solucion` (
  `id_sol` int(5) NOT NULL,
  `desc_sol` varchar(500) DEFAULT NULL,
  `id_prob` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `solucion`
--

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `problema`
--
ALTER TABLE `problema`
  ADD PRIMARY KEY (`id_prob`);

--
-- Indices de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  ADD PRIMARY KEY (`id_sint`),
  ADD KEY `id_prob` (`id_prob`);

--
-- Indices de la tabla `solucion`
--
ALTER TABLE `solucion`
  ADD PRIMARY KEY (`id_sol`),
  ADD KEY `id_prob` (`id_prob`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `problema`
--
ALTER TABLE `problema`
  MODIFY `id_prob` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  MODIFY `id_sint` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `solucion`
--
ALTER TABLE `solucion`
  MODIFY `id_sol` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sintoma`
--
ALTER TABLE `sintoma`
  ADD CONSTRAINT `sintoma_ibfk_1` FOREIGN KEY (`id_prob`) REFERENCES `problema` (`id_prob`);

--
-- Filtros para la tabla `solucion`
--
ALTER TABLE `solucion`
  ADD CONSTRAINT `solucion_ibfk_1` FOREIGN KEY (`id_prob`) REFERENCES `problema` (`id_prob`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
