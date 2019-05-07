-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2019 a las 18:11:06
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mis_partidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `nombre` char(250) COLLATE utf32_spanish2_ci NOT NULL,
  `id_estadio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `id_estadio`) VALUES
(1, 'EL PALO C.D.', 2),
(2, 'C.D. RINCON', 3),
(3, 'C.D. TORREÓN CALA MIJAS', 4),
(4, 'PUERTO DE LA TORRE LOS MORALES', 1),
(5, 'C.D. BENALMADENA', 5),
(6, 'PEÑA COMPADRES', 6),
(7, 'C.D. LA UNIDAD NUEVA MALAGA', 7),
(8, 'CANDOR C.F.', 8),
(9, 'CD UNION DEPORTIVA ANTEQUERA FEMENINO', 9),
(10, 'C.D. ALGAIDAS', 10),
(11, 'JUVENTUD FUENGIROLA CF \"A\"', 11),
(12, 'MARBELLA F.C.', 12),
(13, 'Descansa', 13),
(14, 'Equipo retirado', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id_estadio` int(11) NOT NULL,
  `estadio` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id_estadio`, `estadio`) VALUES
(1, 'Ángel Martos Luque Campo Municipal'),
(2, 'Estadio San Ignacio'),
(3, 'Francisco Romero Estadio Municipal'),
(4, 'Francisco Santana \"Paquirri\" Campo Municipal'),
(5, 'El Tomillar Campo Municipal '),
(6, 'Antonio Serrano Lima Complejo Deportivo Municipal'),
(7, 'La Unidad Campo Municipal'),
(8, 'Las Lagunas Ciudad Deportiva Campo 2'),
(9, 'Ciudad de Antequera Campo Municipal'),
(10, 'Estadio Municipal Nuevo El Duende'),
(11, 'Suel Campo Municipal '),
(12, 'Luís Teruel Campo Municipal'),
(13, 'Sin estadio definido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `numero_jornada` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `resultado` char(50) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `equipo_local` int(11) NOT NULL,
  `equipo_visitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`numero_jornada`, `fecha`, `hora`, `resultado`, `equipo_local`, `equipo_visitante`) VALUES
(1, '2018-09-23', '12:00:00', '1-7', 3, 4),
(2, '2018-09-30', '13:15:00', '1-3', 4, 1),
(3, '2018-10-07', '10:00:00', '0-6', 2, 4),
(4, NULL, NULL, NULL, 4, 13),
(5, '2018-10-21', '13:00:00', '8-0', 4, 6),
(6, '2018-10-27', '20:00:00', '1-3', 8, 4),
(7, '2018-11-04', '13:30:00', '5-0', 4, 9),
(8, '2018-11-11', '12:30:00', '0-14', 11, 4),
(9, '2019-01-20', '11:10:00', '2-2', 4, 12),
(10, '2018-11-25', '12:30:00', '0-0', 10, 4),
(11, NULL, NULL, NULL, 4, 14),
(12, '2018-12-16', '11:30:00', '1-0', 7, 4),
(13, '2019-01-13', '13:15:00', '5-1', 4, 5),
(14, '2019-01-19', '18:00:00', '8-0', 4, 3),
(15, '2019-01-26', '19:30:00', '1-1', 1, 4),
(16, '2019-02-03', '11:30:00', '5-0', 4, 2),
(17, NULL, NULL, NULL, 13, 4),
(18, '2019-02-17', '18:00:00', '0-3', 6, 4),
(19, '2019-02-24', '13:45:00', '6-1', 4, 8),
(20, '2019-03-03', '11:00:00', '2-1', 9, 4),
(21, '2019-03-10', '13:30:00', '23-0', 4, 11),
(22, '2019-03-16', '17:00:00', '1-1', 12, 4),
(23, NULL, NULL, NULL, 4, 10),
(24, NULL, NULL, NULL, 14, 4),
(25, '2019-04-06', '11:00:00', '8-0', 4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `contrasena`, `id_equipo`) VALUES
(1, 'laura', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 4),
(2, 'pepe', 'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 2),
(3, 'pepa', '321cb76b7d6e43ef6917ee54fd8fa0e7fa99ba97c7e0b6fc7866139e7cb8c9c3', 1),
(4, 'natalia', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estadio` (`id_estadio`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id_estadio`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`numero_jornada`),
  ADD KEY `equipo_local` (`equipo_local`),
  ADD KEY `equipo_visitante` (`equipo_visitante`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`);

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `jornada_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
