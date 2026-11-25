-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2026 a las 18:13:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `otomi_julieta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(5) NOT NULL,
  `idioma` char(6) NOT NULL,
  `descripción` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `idioma`, `descripción`) VALUES
(100, 'Otomi', 'Curso básico de Otomi Valle del Estado de México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `Id_ejercicio` int(5) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `pregunta` varchar(30) NOT NULL,
  `respuesta_correcta` varchar(25) NOT NULL,
  `id_unidad` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`Id_ejercicio`, `tipo`, `pregunta`, `respuesta_correcta`, `id_unidad`) VALUES
(1, 'Opcion multiple', '¿Cuál de estos es gato?', 'Mixtu', 1),
(2, 'Opción múltiple', '¿Cuál de estos es un pato?', 'Badu', 1),
(3, 'Opción múltiple', '¿Cuál de estos es burro?', 'Juiji', 1),
(4, 'Completa la frase', '¿El ______ toma leche?', 'Mixtu', 1),
(5, 'Completa la frase', '¿El _____ pone huevos?', 'hñahñu', 1),
(6, 'Opcion multiple', 'Selecciona Buenos Días en Otom', 'Jaxia´me', 1),
(7, 'Opción múltiple', '¿Cuál es mamá en Otomí?', 'M´e', 1),
(8, 'Opción múltiple', 'Selecciona T´a en español', 'papa', 1),
(9, 'Completa la frase ', 'Completa la frase \"Buenos Dias', 'Jaxia´me', 1),
(10, 'Completa la frase ', 'Completa la frase \" _______ pa', 'Jaxia´me', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int(5) NOT NULL,
  `porcentaje` decimal(2,0) NOT NULL,
  `experiencia` int(5) NOT NULL,
  `racha` int(2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `id_curso` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `porcentaje`, `experiencia`, `racha`, `fecha_registro`, `id_usuario`, `id_curso`) VALUES
(1, 0, 100, 1, '2026-10-19', 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_usuario`
--

CREATE TABLE `respuesta_usuario` (
  `id_respuesta` int(5) NOT NULL,
  `respuesta_de_usuario` varchar(25) NOT NULL,
  `respuesta_correcta` varchar(25) NOT NULL,
  `fecha_respuesta` date NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `id_leccion` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id-unidad` int(5) NOT NULL,
  `Titulo` varchar(20) DEFAULT NULL,
  `Descripcion` varchar(30) DEFAULT NULL,
  `id_curso` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id-unidad`, `Titulo`, `Descripcion`, `id_curso`) VALUES
(1, 'Animales', 'Conoce animales en Otomi', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad2`
--

CREATE TABLE `unidad2` (
  `id_unidad` int(5) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad2`
--

INSERT INTO `unidad2` (`id_unidad`, `Titulo`, `Descripcion`) VALUES
(2, 'Saludos', 'Saludos en Otomí en el Estado ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nombre` varchar(30) NOT NULL,
  `contraseña` varchar(8) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_nac` date NOT NULL,
  `pais` varchar(15) NOT NULL,
  `nivel` smallint(2) NOT NULL,
  `Id_usuario` int(5) NOT NULL,
  `Email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `contraseña`, `fecha_registro`, `fecha_nac`, `pais`, `nivel`, `Id_usuario`, `Email`) VALUES
('Julieta', '123456', '2026-11-09', '2008-07-13', 'Mexico', 1, 1, 'july@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`Id_ejercicio`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id-unidad`);

--
-- Indices de la tabla `unidad2`
--
ALTER TABLE `unidad2`
  ADD PRIMARY KEY (`id_unidad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
