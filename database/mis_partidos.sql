-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2019 a las 19:05:50
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

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
  `nombre` char(250) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`) VALUES
(1, 'EL PALO C.D.'),
(2, 'C.D. RINCON'),
(3, 'C.D. TORREÓN CALA MIJAS'),
(4, 'PUERTO DE LA TORRE LOS MORALES'),
(5, 'C.D. BENALMADENA'),
(6, 'PEÑA COMPADRES'),
(7, 'C.D. LA UNIDAD NUEVA MALAGA'),
(8, 'CANDOR C.F.'),
(9, 'CD UNION DEPORTIVA ANTEQUERA FEMENINO'),
(10, 'C.D. ALGAIDAS'),
(11, 'JUVENTUD FUENGIROLA CF \"A\"'),
(12, 'MARBELLA F.C.'),
(13, 'Descansa'),
(14, 'Equipo retirado');

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
(15, '2019-01-26', '19:30:00', '1-1', 1, 4),
(3, '2018-10-07', '10:00:00', '0-6', 2, 4),
(1, '2018-09-23', '12:00:00', '1-7', 3, 4),
(2, '2018-09-30', '13:15:00', '1-3', 4, 1),
(16, '2019-02-03', '11:30:00', '5-0', 4, 2),
(14, '2019-01-19', '18:00:00', '8-0', 4, 3),
(13, '2019-01-13', '13:15:00', '5-1', 4, 5),
(5, '2018-10-21', '13:00:00', '8-0', 4, 6),
(19, '2019-02-24', '13:45:00', '6-1', 4, 8),
(7, '2018-11-04', '13:30:00', '5-0', 4, 9),
(23, NULL, NULL, NULL, 4, 10),
(21, NULL, NULL, NULL, 4, 11),
(9, '2019-01-20', '11:10:00', '2-2', 4, 12),
(4, NULL, NULL, NULL, 4, 13),
(11, NULL, NULL, NULL, 4, 14),
(18, '2019-02-17', '18:00:00', '0-3', 6, 4),
(12, '2018-12-16', '11:30:00', '1-0', 7, 4),
(6, '2018-10-27', '20:00:00', '1-3', 8, 4),
(20, NULL, NULL, NULL, 9, 4),
(10, '2018-11-25', '12:30:00', '0-0', 10, 4),
(8, '2018-11-11', '12:30:00', '0-14', 11, 4),
(22, NULL, NULL, NULL, 12, 4),
(17, NULL, NULL, NULL, 13, 4),
(24, NULL, NULL, NULL, 14, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`equipo_local`,`equipo_visitante`),
  ADD KEY `equipo_visitante` (`equipo_visitante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `jornada_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
