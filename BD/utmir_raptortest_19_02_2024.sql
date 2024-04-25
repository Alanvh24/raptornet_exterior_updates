-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2024 a las 21:02:17
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
-- Base de datos: `utmir_raptortest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_mexico`
--

CREATE TABLE `estados_mexico` (
  `id_estado_mexico` bigint(20) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados_mexico`
--

INSERT INTO `estados_mexico` (`id_estado_mexico`, `estado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Coahuila de Zaragoza'),
(6, 'Colima'),
(7, 'Chiapas'),
(8, 'Chihuahua'),
(9, 'Distrito Federal'),
(10, 'Durango'),
(11, 'Guanajuato'),
(12, 'Guerrero'),
(13, 'Hidalgo'),
(14, 'Jalisco'),
(15, 'México'),
(16, 'Michoacán de Ocampo'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca de Juárez'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz de Ignacio de la Llave'),
(31, 'Yucatán'),
(32, 'Zacatecas'),
(33, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula_roles`
--

CREATE TABLE `matricula_roles` (
  `matricula_id` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `matricula_roles`
--

INSERT INTO `matricula_roles` (`matricula_id`, `role_id`) VALUES
('101', 1),
('102', 3),
('103', 3),
('104', 4),
('105', 5),
('110', 7),
('15', 4),
('160', 4),
('164', 1),
('198', 8),
('2303001', 6),
('2303002', 6),
('2303003', 6),
('2303005', 2),
('2303006', 2),
('2303007', 2),
('2303008', 2),
('2303009', 2),
('2303010', 2),
('2303011', 2),
('2303012', 2),
('2303013', 2),
('2303014', 2),
('2303015', 2),
('2303016', 2),
('2303017', 6),
('2303018', 2),
('2303019', 2),
('2303020', 6),
('2303021', 2),
('2303022', 2),
('2303023', 2),
('2303024', 2),
('2303025', 2),
('2303026', 2),
('2303027', 2),
('2403001', 2),
('2403002', 2),
('2403003', 2),
('2403004', 2),
('2403005', 2),
('2403006', 2),
('2403007', 2),
('2403008', 2),
('2403009', 2),
('2403010', 6),
('2403011', 2),
('2403012', 2),
('2403013', 2),
('2403014', 2),
('2403015', 2),
('2403016', 2),
('2403017', 2),
('2403018', 6),
('2403019', 2),
('2403020', 6),
('2403021', 2),
('2403022', 2),
('2403023', 2),
('2403024', 2),
('2403025', 6),
('2403026', 6),
('2403027', 2),
('2403028', 2),
('2403029', 2),
('2403030', 2),
('2403031', 2),
('2403032', 2),
('2403033', 2),
('2403034', 2),
('2403035', 2),
('2403036', 2),
('2403037', 2),
('2403038', 2),
('2403039', 2),
('2403040', 2),
('2403041', 2),
('2403042', 2),
('2403043', 2),
('2403044', 2),
('2403045', 2),
('2403046', 2),
('2403047', 2),
('2403048', 2),
('2403049', 2),
('2403050', 2),
('2403051', 2),
('2403052', 2),
('2403053', 2),
('2403054', 2),
('2403055', 2),
('2403056', 2),
('2403057', 2),
('2403058', 2),
('2403059', 2),
('2403060', 2),
('2403061', 2),
('2403062', 2),
('2403063', 2),
('2403064', 2),
('2403065', 2),
('2403066', 2),
('2403067', 2),
('2403068', 2),
('2403069', 2),
('2403070', 2),
('2403071', 2),
('2403072', 2),
('2403073', 2),
('2403074', 2),
('2403075', 2),
('2403076', 2),
('2403077', 2),
('2403078', 6),
('2403079', 2),
('2403080', 2),
('2403081', 2),
('2403082', 2),
('2403083', 2),
('2403084', 2),
('2403085', 2),
('2403086', 2),
('2403087', 2),
('2403088', 2),
('2403089', 2),
('2403090', 2),
('2403091', 2),
('2403092', 2),
('2403093', 2),
('2403094', 2),
('2403095', 2),
('2403096', 2),
('2403097', 2),
('2403098', 2),
('2403099', 2),
('2403100', 6),
('2403101', 2),
('2403102', 2),
('2403103', 2),
('2403104', 2),
('2403105', 2),
('2403106', 2),
('2403107', 2),
('2403108', 2),
('2403109', 2),
('2403110', 2),
('2403111', 2),
('2403112', 2),
('2403113', 2),
('2403114', 2),
('2403115', 2),
('2403116', 2),
('2403117', 2),
('2403118', 2),
('2403119', 2),
('2403120', 2),
('2403121', 2),
('2403122', 2),
('2403123', 2),
('2403124', 2),
('2403125', 2),
('2403126', 2),
('2403127', 2),
('2403128', 2),
('2403129', 6),
('2403130', 2),
('2403131', 6),
('2403132', 6),
('2403133', 2),
('2403134', 2),
('2403135', 2),
('2403136', 2),
('2403137', 2),
('2403138', 2),
('2403139', 6),
('2403140', 6),
('2403141', 2),
('2403142', 6),
('2403143', 2),
('66', 1),
('71', 8),
('91', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_antecedentes_academicos`
--

CREATE TABLE `utmir_antecedentes_academicos` (
  `id_antecedentes_academicos` bigint(20) NOT NULL,
  `nombre_bachillerato` varchar(255) DEFAULT NULL,
  `periodo_bachillerato` varchar(255) DEFAULT NULL,
  `promedio_bachillerato` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_carrera_1` bigint(20) DEFAULT NULL,
  `id_carrera_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_antecedentes_academicos`
--

INSERT INTO `utmir_antecedentes_academicos` (`id_antecedentes_academicos`, `nombre_bachillerato`, `periodo_bachillerato`, `promedio_bachillerato`, `matricula`, `id_carrera_1`, `id_carrera_2`) VALUES
(1, 'CECYTEH', '8.7', '2016-2019', '2303001', 12, 3),
(2, 'PRUEBA', 'Prueba', 'Prueba', '2303002', 3, 3),
(3, 'ELPE', 'ELPE', 'ELPE', '2303003', 4, 3),
(4, 'asee|', 'asee', 'asee', '2303005', 5, 4),
(5, 'TESTING', 'TESTING', 'TESTING', '2303007', 3, 1),
(6, 'as', 'as', 'as', '2303006', 3, 4),
(7, 'ELPEPE', 'ELPEPE', 'ELPEPE', '2303008', 4, 5),
(8, 'SAS', 'SAS', 'SASSAS', '2303009', 1, 3),
(9, 'ALA', 'ALA', 'ALA', '2303010', 1, 4),
(10, 'TITO', 'V', 'TITO', '2303011', 4, 1),
(11, 'PEPEPON', 'PEPEPON', 'PEPEPON', '2303012', 12, 3),
(12, 'fecha_registro', 'fecha_registro', 'fecha_registro', '2303013', 3, 9),
(13, 'as', 'as', 'as', '2303014', 4, 5),
(14, 'as', 'as', 'as', '2303015', 3, 4),
(15, 'sdfghjk', 'asdfgh', 'sdfgvbhjnkm', '2303016', 4, 9),
(16, 'REWTWE', 'REWTWE', 'REWTWE', '2303017', 12, 1),
(17, 'ENRIQUE', 'ENRIQUE', 'ENRIQUE', '2303018', 12, 3),
(18, 'CECYTEH', '9.0', '2016 - 2019', '2303019', 3, 5),
(19, 'EPE', 'EPE', 'EPE', '2303020', 1, 9),
(20, 'CECYTEH', '9.5', '2021', '2303021', 4, 12),
(21, 'CECYTEH', '9.3', '2021', '2303022', 12, 3),
(22, 'CECYTEH', '9.5', '2016-2025', '2303024', 9, 5),
(23, 'DURA', 'DURA', 'DURA', '2303025', 5, 4),
(24, 'CECYTEH', '9.8', '2015-2018', '2303023', 4, 5),
(25, 'CECYTEH', '9.5', '2016-2019', '2303026', 4, 5),
(26, 'ASV', 'asv', 'asv', '2303027', 4, 3),
(27, 'CECYTEH', '9.7', '2018-2019', '2403001', 4, 3),
(28, 'PEPADOR', 'PEPADOR', 'PEPADOR', '2403002', 3, 12),
(29, 'ELELE', 'ELELE', 'ELELE', '2403004', 5, 4),
(30, 'IJIJIA', 'IJIJIA', 'IJIJIA', '2403007', 5, 9),
(31, 'ASAS', 'ASAS', 'ASAS', '2403008', 3, 1),
(32, 'OSSS', 'OSSS', 'OSSS', '2403009', 3, 9),
(33, 'ASDFDAS', 'ASDFDAS', 'ASDFDAS', '2403010', 3, 5),
(34, 'ELELELEL', 'ELELELEL', 'ELELELEL', '2403011', 3, 5),
(35, 'NEW', 'NEW', 'NEW', '2403012', 5, 3),
(36, 'ASCSASCZZ', 'ASCSASCZZ', 'ASCSASCZZ', '2403006', 1, 5),
(37, 'AS', 'AS', 'AS', '2403013', 3, 4),
(38, 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', '2403014', 4, 5),
(39, 'GASTROO', 'GASTROO', 'GASTROO', '2403015', 5, 3),
(40, 'AGASFAO', 'AGASFAO', 'AGASFAO', '2403016', 4, 5),
(41, 'ALAM', 'ALAM', 'ALAM', '2403017', 4, 3),
(42, 'OTRO', 'OTRO', 'OTRO', '2403018', 1, 5),
(43, 'JEJE', 'JEJE', 'JEJE', '2403020', 3, 4),
(44, 'ASAS', 'ASAS', 'ASAS', '2403021', 3, 1),
(45, 'HH', 'u', '2222 5555', '2403038', 3, 4),
(46, 'ZOEBISCH', '8.5', '2013-2016', '2403042', 12, 9),
(47, 'CBTIS286', '9.5', '2020-2023', '2403037', 12, 1),
(48, 'CBTIS', '9', '2020-2023', '2403025', 4, 9),
(49, 'PREPA 1', '9.3', '2017-2020', '2403053', 12, 1),
(50, 'CONALEP ', '10', '2020-2023', '2403033', 1, 9),
(51, 'VOCACIONAL NUMERO 31', '9.6', '2018-2022', '2403032', 12, 1),
(52, 'CBTIS ', '9.8', '2023-2026', '2403026', 3, 5),
(53, 'CONALEP', '9.2', '2019-2022', '2403027', 12, 4),
(54, 'CEB54', '8', '2019', '2403051', 1, 5),
(55, 'CECYTE', '10', '2019', '2403049', 12, 1),
(56, 'COBAEH', '8.2', '2014-2017', '2403054', 4, 1),
(57, 'CONALEP PACHUCA II', '10', '2026-2019', '2403050', 12, 1),
(58, 'PREPARATORIA NUMERO 3', '8.5', '2016-2019', '2403039', 9, 3),
(59, 'COBACHO', '11', '2020-2901', '2403024', 12, 3),
(60, 'TEC DE MONTERREY', '8.9', '2016-2019', '2403045', NULL, 4),
(61, 'CONALEP', '11', '2017-2020', '2403028', NULL, NULL),
(62, 'CENTRO DE ESTUDIOS DE BACHILLERATO', '9.5', '2017-2020', '2403047', 3, 12),
(63, 'PREPA 1 ', '8', '2019-2022', '2403052', 1, 12),
(64, 'RTYGUHI9YED4', 'cvgbyhnujiokkjiuh', 'rftgyuhijhugy', '2403055', 12, 3),
(65, 'CENTRO BACHILLERATO TECNOOGICO INDUSTRIAL Y DE SERVICIOS', '9.0', '2020-2023', '2403034', 12, 4),
(66, 'CONALEP PACHUCA II', '9.2', '2020/2023', '2403029', 12, 3),
(67, 'COLEGIO IRLANDES', NULL, '2021', '2403041', 12, 5),
(68, 'COLEGIO JUAREZ', '10', '2020-2023', '2403048', 12, 1),
(69, NULL, NULL, NULL, '2403035', NULL, NULL),
(70, NULL, NULL, NULL, '2403046', NULL, NULL),
(71, 'PEPES', '1000000', '2018-2050', '2403044', 3, 4),
(72, 'EL PAPA FRANCISCO', 'EL PAPA FRANCISCO', 'EL PAPA FRANCISCO', '2403056', 3, 3),
(73, 'CONALEP', '9.1', '2017-2021', '2403071', 4, 5),
(74, 'COBAEH', '9.1', '2018-2020', '2403075', 5, 3),
(75, NULL, NULL, NULL, '2403064', NULL, NULL),
(76, 'CBTIS 222', '10', '2018 - 2021', '2403069', 4, 5),
(77, 'COBAEH ', '8.8', '2016-2019', '2403078', 4, 3),
(78, 'CBTIS NO. 8', '8.0', '2018-2021', '2403068', 5, 3),
(79, 'COBAEH PLANTEL ZEMPOALA', '8.5', '2018-2021', '2403076', 1, 3),
(80, 'COLEGIO DE ESTUDIOS CIENTÍFICOS Y TECNOLÓGICOS DEL ESTADO DE HIDALGO', '8.5', '2012-2015', '2403079', 12, 4),
(81, 'CTBTIS286', '8.2', '2014-2017', '2403074', 3, 5),
(82, 'COBAEH ', '9.2', '2019-2022', '2403065', 1, 5),
(83, 'NAGUACH', '7.2', '2000-2023', '2403077', 4, 1),
(84, 'CONALEP I', '10', '2016-2019', '2403062', 5, 4),
(85, 'PENAL NUMERO 5', '8.5', '2016-2019', '2403070', 1, 5),
(86, 'PREPA 3', '10', '2018-2021', '2403063', 4, 5),
(87, 'CBTIS8', '8', '2021', '2403066', 5, 4),
(88, 'CASA DE LA MUJER HIDALGUENSE', '8', '2017-2020', '2403067', 3, 5),
(89, 'PREPA 1', '10', '2002-1001', '2403082', 4, 1),
(90, 'CUC', '2021', '2018', '2403083', 1, 3),
(91, 'CEB 5/4', '8.5', '2013-2016', '2403081', 4, 3),
(92, 'CUC', '9', '2012-2015', '2403084', 12, 1),
(93, 'PREPA 1', '9.3', '2017-2020', '2403089', 12, 1),
(94, 'CONALEP I', '10', '2016-2019', '2403090', 12, 1),
(95, 'CONALEP', '8.4', '2017-2020', '2403086', 3, 5),
(96, 'TEC DE MONTERREY', '8.9', '2016-2019', '2403095', 4, 3),
(97, 'CBTIS', '9', '2020-2019', '2403100', 9, 1),
(98, 'COBAEH', '9.1', '2018-2020', '2403092', 1, 4),
(99, 'CCNYT', '9', '2020-2023', '2403097', 5, 3),
(100, 'SDF', 'gh', 'dfg', '2403099', 1, 3),
(101, 'CTBTIS8', '8.0', '2014-2017', '2403096', 5, 1),
(102, 'CENTRO BACHILLERATO TECNOOGICO INDUSTRIAL Y DE SERVICIOS', '8.5', '2020-2023', '2403098', 4, 9),
(103, 'CONALEP', '9.5', '2017-2020', '2403093', 1, 9),
(104, 'PREPARATORIA 3 ', '9.4', '2017-2020', '2403094', 4, 5),
(105, 'PREPA 1', '8.5', '2016-2019', '2403091', 1, 3),
(106, 'KJ', 'k', 'c', '2403111', 3, 1),
(107, 'PREPARATORIA NO. 15', '9.8', '2015-2018', '2403104', 3, 5),
(108, 'CBTIS', '9.4', '2016-2019', '2403106', 5, 12),
(109, 'CONALEP PACHUCA II', '10', '2026-2019', '2403108', 12, 9),
(110, 'PREPARATORIA4', '8.5', '20', '2403112', 12, 1),
(111, 'SOL DEL PRIMAVERA', '9.6', '2018-2022', '2403113', 3, 12),
(112, 'PREPARATORIA NUMERO 4', '9.8', '2015-2018', '2403118', 4, 3),
(113, 'COLEGIO JUAREZ', '10', '2020-2023', '2403116', 4, 5),
(114, 'COLEGIO IRLANDES', NULL, '2020-2021', '2403117', 12, 9),
(115, 'CONALEP PACHUCA II', '9.2', '2020/2023', '2403119', 4, 12),
(116, 'PREPARATORIA NO. 16', '9.8', '2015-2018', '2403121', 1, 3),
(117, 'CAS', 'asc', 'sac', '2403123', 12, 9),
(118, NULL, NULL, NULL, '2403122', NULL, NULL),
(119, 'AS', '9.2', '2016-2020', '2403022', 3, 4),
(120, 'SUERTE', '9.2', '2012-2008', '2403128', 9, 5),
(121, '2403129', '2403129', '2403129', '2403129', 3, 5),
(122, 'CYECYTEH', '9.0', '2017-2010', '2403131', 9, 4),
(123, 'YOCUI', '9.5', 'YOCUI', '2403132', 9, 4),
(124, 'ASDSDA', '9.2', 'sdadas', '2403138', 9, 5),
(125, 'ASDASSD', '9.6', 'asdasd', '2403139', 1, 5),
(126, 'ASDASD', '9.6', '2016-2019', '2403140', 3, 4),
(127, 'CECYTEH', '9.5', '2012-2023', '2403142', 1, 4),
(128, 'ASDDAS', '9.5', 'asdads', '2403143', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_asignacion_asignatura`
--

CREATE TABLE `utmir_asignacion_asignatura` (
  `id_asignacion_asignatura` bigint(20) NOT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_asignatura` bigint(20) DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_asignacion_asignatura`
--

INSERT INTO `utmir_asignacion_asignatura` (`id_asignacion_asignatura`, `matricula`, `id_asignatura`, `id_grupo`, `status`) VALUES
(70, '198', 299, 1, b'0'),
(71, '198', 300, 1, b'1'),
(72, '71', 299, 2, b'1'),
(73, '71', 300, 2, b'1'),
(74, '198', 299, 1, b'1'),
(75, '198', 17, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_asignatura`
--

CREATE TABLE `utmir_asignatura` (
  `id_asignaturas` bigint(20) NOT NULL,
  `nombre_asignatura` varchar(255) DEFAULT NULL,
  `total_horas` varchar(255) DEFAULT NULL,
  `id_carrera` bigint(20) DEFAULT NULL,
  `id_cuatrimestre` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_asignatura`
--

INSERT INTO `utmir_asignatura` (`id_asignaturas`, `nombre_asignatura`, `total_horas`, `id_carrera`, `id_cuatrimestre`) VALUES
(1, 'INTRODUCCIÓN A LA LENGUA INGLESA', NULL, 3, 1),
(2, 'WRITING', NULL, 3, 1),
(3, 'GRAMMAR', NULL, 3, 1),
(4, 'SPEAKING', NULL, 3, 1),
(5, 'READING ', NULL, 3, 1),
(6, 'LISTENING ', NULL, 3, 1),
(7, 'MATEMATICAS APLICADAS EN EL TURISMO', NULL, 3, 2),
(8, 'INTRODUCCIÓN A LAS TECNOLOGIAS DE LA INFORMACIÓN', NULL, 3, 2),
(9, 'INTRODUCCIÓN AL TURISMO', NULL, 3, 2),
(10, 'PATRIMONIO NATURAL Y CULTURAL', NULL, 3, 2),
(11, 'ADMINISTRACIÓN', NULL, 3, 2),
(12, 'INGLES I', NULL, 3, 2),
(13, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 3, 2),
(14, 'FORMACIÓN SOCIOCULTURAL I', NULL, 3, 2),
(15, 'ESTADISTICA', NULL, 3, 3),
(16, 'SUSTENTABILIDAD EN EL TURISMO', NULL, 3, 3),
(17, 'SERVICIOS DE TURISMO CULTURA Y DE NATURALEZA', NULL, 3, 3),
(18, 'SERVICIOS DE HOSPEDAJE Y ALIMENTOS Y BEBIDAS', NULL, 3, 3),
(19, 'GESTIÓN DE LA CALIDAD', NULL, 3, 3),
(20, 'INGLES II', NULL, 3, 3),
(21, 'FORMACIÓN SOCIOCULTURAL II', NULL, 3, 3),
(22, 'METODOS Y TECNICAS DE INVESTIGACIÓN', NULL, 3, 4),
(23, 'SERVICIOS DE VIAJE', NULL, 3, 4),
(24, 'CAPITAL HUMANO', NULL, 3, 4),
(25, 'OPERACIONES CONTABLES Y FINANCIERAS', NULL, 3, 4),
(26, 'MERCADOTECNIA DE PRODUCTOS Y SERVICIOS TURISTICOS', NULL, 3, 4),
(27, 'INTEGRADORA I', NULL, 3, 4),
(28, 'INGLES III', NULL, 3, 4),
(29, 'FORMACIÓN SOCIOCULTURAL III', NULL, 3, 4),
(30, 'RESERVACIONES', NULL, 3, 5),
(31, 'ADMINISTRACIÓN DE HABITACIONES', NULL, 3, 5),
(32, 'RECEPCIÓN', NULL, 3, 5),
(33, 'CALIDAD EN SERVICIOS DE HOSPITALIDAD', NULL, 3, 5),
(34, 'VENTAS Y COMERCIO DIGITAL', NULL, 3, 5),
(35, 'INGLES IV', NULL, 3, 5),
(36, 'FRANCES I', NULL, 3, 5),
(37, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 3, 5),
(38, 'RELACIONES PUBLICAS Y CONCIERGE', NULL, 3, 6),
(39, 'ANIMACIÓN TURISTICA Y SOCIOCULTURAL', NULL, 3, 6),
(40, 'LOGISTICA DE EVENTOS', NULL, 3, 6),
(41, 'CENTROS DE CONSUMO EN HOTELERIA', NULL, 3, 6),
(42, 'FORMACIÓN DEL CAPITAL HUMANO', NULL, 3, 6),
(43, 'INTEGRADORA II', NULL, 3, 6),
(44, 'INGLES V', NULL, 3, 6),
(45, 'FRANCES II', NULL, 3, 6),
(46, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 3, 6),
(47, 'ESTADIA ', NULL, 3, 7),
(48, 'ALGEBRA LINEAL', NULL, 12, 2),
(49, 'DESARROLLO DE HABILIDADES DEL PENSAMIENTO LOGICO', NULL, 12, 2),
(50, 'FUNDAMENTOS DE TI', NULL, 12, 2),
(51, 'FUNDAMENTOS DE REDES', NULL, 12, 2),
(52, 'METODOLOGIA DE LA PROGRAMACIÓN', NULL, 12, 2),
(53, 'INGLES I', NULL, 12, 2),
(54, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 12, 2),
(55, 'FORMACIÓN SOCIOCULTURAL I', NULL, 12, 2),
(56, 'FUNCIONES MATEMATICAS', NULL, 12, 3),
(57, 'METODOLOGIAS Y MODELADO DE DESARROLLO DE SOTFWARE', NULL, 12, 3),
(58, 'INTERCONEXIÓN DE REDES', NULL, 12, 3),
(59, 'PROGRAMACIÓN ORIENTADA A OBJETOS', NULL, 12, 3),
(60, 'INTRODUCCIÓN AL DISEÑO DIGITAL', NULL, 12, 3),
(61, 'BASE DE DATOS', NULL, 12, 3),
(62, 'INGLES II', NULL, 12, 3),
(63, 'FORMACIÓN SOCIOCULTURAL II', NULL, 12, 3),
(64, 'CALCULO DIFERENCIAL', NULL, 12, 4),
(65, 'MERCADOTECNIA DIGITAL', NULL, 12, 4),
(66, 'DISEÑO DIGITAL', NULL, 12, 4),
(67, 'SISTEMAS OPERATIVOS', NULL, 12, 4),
(68, 'APLICACIONES WEB', NULL, 12, 4),
(69, 'INTEGRADORA I', NULL, 12, 4),
(70, 'INGLES III', NULL, 12, 4),
(71, 'FORMACIÓN SOCIOCULTURAL III', NULL, 12, 4),
(72, 'PROBABILIDAD Y ESTADISTICA', NULL, 12, 5),
(73, 'ADMINISTRACIÓN DE PROYECTOS', NULL, 12, 5),
(74, 'MODELADO DIGITAL', NULL, 12, 5),
(75, 'DESARROLLO DE APLICACIONES DE REALIDAD AUMENTADA', NULL, 12, 5),
(76, 'FRAMEWORKS DE DESARROLLO WEB', NULL, 12, 5),
(77, 'INGLES IV', NULL, 12, 5),
(78, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 12, 5),
(79, 'PRODUCCIÓN AUDIOVISUAL', NULL, 12, 6),
(80, 'ANIMACIÓN 3D', NULL, 12, 6),
(81, 'DESARROLLO DE APLICACIONES DE REALIDAD VIRTUAL', NULL, 12, 6),
(82, 'DESARROLLO DE APLICACIONES PARA NEGOCIOS DIGITALES', NULL, 12, 6),
(83, 'INTEGRADORA II', NULL, 12, 6),
(84, 'INGLES V', NULL, 12, 6),
(85, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 12, 6),
(86, 'ESTADIA ', NULL, 12, 7),
(87, 'ALGEBRA LINEAL', NULL, 1, 2),
(88, 'QUIMICA BASICA', NULL, 1, 2),
(89, 'BIOLOGIA AGRICOLA', NULL, 1, 2),
(90, 'FISIOLOGIA VEGETAL', NULL, 1, 2),
(91, 'MICROBIOLOGIA', NULL, 1, 2),
(92, 'INGLES I', NULL, 1, 2),
(93, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 1, 2),
(94, 'FORMACIÓN SOCIOCULTURAL I', NULL, 1, 2),
(95, 'FUNCIONES MATEMATICAS', NULL, 1, 3),
(96, 'QUIMICA ORGANICA', NULL, 1, 3),
(97, 'GENETICA VEGETAL', NULL, 1, 3),
(98, 'EDAFOLOGIA', NULL, 1, 3),
(99, 'ECOLOGIA MICROBIANA', NULL, 1, 3),
(100, 'BOTANICA SISTEMATICA', NULL, 1, 3),
(101, 'INFORMATICA', NULL, 1, 3),
(102, 'INGLES II', NULL, 1, 3),
(103, 'FORMACIÓN SOCIOCULTURAL II', NULL, 1, 3),
(104, 'CALCULO DIFERENCIAL', NULL, 1, 4),
(105, 'QUIMICA ANALITICA', NULL, 1, 4),
(106, 'FISICA', NULL, 1, 4),
(107, 'BIOTECNOLOGIA VEGETAL', NULL, 1, 4),
(108, 'CONTROL DE PLAGAS Y MALEZAS', NULL, 1, 4),
(109, 'BIOQUIMICA', NULL, 1, 4),
(110, 'PROPAGACIÓN VEGETATIVA', NULL, 1, 4),
(111, 'INGLES III', NULL, 1, 4),
(112, 'FORMACIÓN SOCIOCULTURAL III', NULL, 1, 4),
(113, 'CALCULO INTEGRAL', NULL, 1, 5),
(114, 'PROBABILIDAD Y ESTADISTICA', NULL, 1, 5),
(115, 'INTEGRADORA I', NULL, 1, 5),
(116, 'HERRAMIENTAS DE PLANEACIÓN Y COSTOS', NULL, 1, 5),
(117, 'FITOPATOLOGIA', NULL, 1, 5),
(118, 'AGROBIOTECNOLOGIA', NULL, 1, 5),
(119, 'ABONOS ORGANICOS', NULL, 1, 5),
(120, 'AGROMETEOROLOGIA', NULL, 1, 5),
(121, 'INGLES IV', NULL, 1, 5),
(122, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 1, 5),
(123, 'ELECTRICIDAD Y MAGNETISMO', NULL, 1, 6),
(124, 'DISEÑOS EXPERIMENTALES', NULL, 1, 6),
(125, 'BIORREMEDIACIÓN', NULL, 1, 6),
(126, 'EXTRACCIÓN DE METABOLITOS', NULL, 1, 6),
(127, 'BIOFERTILIZANTES', NULL, 1, 6),
(128, 'CONTROL BIOLOGICO', NULL, 1, 6),
(129, 'INTEGRADORA II', NULL, 1, 6),
(130, 'AGRICULTURA SOSTENIBLE', NULL, 1, 6),
(131, 'INGLES V', NULL, 1, 6),
(132, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 1, 6),
(133, 'ESTADIAS ', NULL, 1, 7),
(134, 'MATEMATICAS APLICADAS A LA GASTRONOMIA', NULL, 4, 2),
(135, 'INFORMATICA', NULL, 4, 2),
(136, 'SEGURIDAD E HIGIENE EN LOS ALIMENTOS', NULL, 4, 2),
(137, 'INTRODUCCIÓN A LA GASTRONOMIA', NULL, 4, 2),
(138, 'BASES CULINARIAS', NULL, 4, 2),
(139, 'INGLES I', NULL, 4, 2),
(140, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 4, 2),
(141, 'FORMACIÓN SOCIOCULTURAL I', NULL, 4, 2),
(142, 'ESTADISTICA APLICADA A LA GASTRONOMIA', NULL, 4, 3),
(143, 'FUNDAMENTOS DE NUTRICIÓN', NULL, 4, 3),
(144, 'SERVICIOS DE ALIMENTOS Y BEBIDAS', NULL, 4, 3),
(145, 'METODOS Y TECNICAS CULINARIAS', NULL, 4, 3),
(146, 'PANADERIA', NULL, 4, 3),
(147, 'INGLES II', NULL, 4, 3),
(148, 'FORMACIÓN SOCIOCULTURAL II', NULL, 4, 3),
(149, 'COSTOS Y PRESUPUESTOS', NULL, 4, 4),
(150, 'OPERACIÓN DE BAR', NULL, 4, 4),
(151, 'ESTANDARIZACIÓN DE PLATILLOS', NULL, 4, 4),
(152, 'GESTIÓN DE COMPRAS Y ALMACÉN', NULL, 4, 4),
(153, 'PASTELERIA', NULL, 4, 4),
(154, 'INGLES III', NULL, 4, 4),
(155, 'FORMACIÓN SOCIOCULTURAL III', NULL, 4, 4),
(156, 'MERCADOTECNIA DE SERVICIOS GASTRONOMICOS', NULL, 4, 5),
(157, 'FUNDAMENTOS DE VITIVINICULTURA', NULL, 4, 5),
(158, 'ADMINISTRACIÓN DE ALIMENTOS Y BEBIDAS', NULL, 4, 5),
(159, 'REPOSTERIA', NULL, 4, 5),
(160, 'INTEGRADORA I', NULL, 4, 5),
(161, 'INGLES IV', NULL, 4, 5),
(162, 'FRANCES I', NULL, 4, 5),
(163, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 4, 5),
(164, 'METODOS Y TECNICAS DE INVESTIGACIÓN APLICADAS A LA GASTRONOMIA', NULL, 4, 6),
(165, 'EVALUACIÓN DE SERVICIOS GASTRONOMICOS', NULL, 4, 6),
(166, 'CONFORMACIÓN DE MENÚS', NULL, 4, 6),
(167, 'LOGISTICA DE EVENTOS', NULL, 4, 6),
(168, 'INTEGRADORA II', NULL, 4, 6),
(169, 'INGLES V', NULL, 4, 6),
(170, 'FRANCES II', NULL, 4, 6),
(171, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 4, 6),
(172, 'ESTADIA ', NULL, 4, 7),
(173, 'MATEMATICAS', NULL, 5, 2),
(174, 'INFORMATICA', NULL, 5, 2),
(175, 'ADMINISTRACIÓN DE ORGANIZACIONES', NULL, 5, 2),
(176, 'MERCADOTECNIA', NULL, 5, 2),
(177, 'CONTABILIDAD BASICA', NULL, 5, 2),
(178, 'INGLES I', NULL, 5, 2),
(179, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 5, 2),
(180, 'FORMACIÓN SOCIOCULTURAL I', NULL, 5, 2),
(181, 'MATEMATICAS FINANCIERAS', NULL, 5, 3),
(182, 'ESTADISTICA APLICADA A LA ADMINISTRACIÓN', NULL, 5, 3),
(183, 'MODELOS DE DESARROLLO ORGANIZACIONAL', NULL, 5, 3),
(184, 'METODOLOGIA DE INVESTIGACIÓN', NULL, 5, 3),
(185, 'CONTABILIDAD INTERMEDIA', NULL, 5, 3),
(186, 'FUNDAMENTOS DE ECONOMIA', NULL, 5, 3),
(187, 'DISEÑO DE PROCESOS Y GESTIÓN DE CALIDAD', NULL, 5, 3),
(188, 'INGLES II', NULL, 5, 3),
(189, 'FORMACIÓN SOCIOCULTURAL II', NULL, 5, 3),
(190, 'PLANEACIÓN ESTRATEGICA', NULL, 5, 4),
(191, 'TALENTO EMPRENDEDOR', NULL, 5, 4),
(192, 'ANALISIS E INTERPRETACIÓN DE ESTADOS FINANCIEROS', NULL, 5, 4),
(193, 'PLANEACIÓN FINANCIERA', NULL, 5, 4),
(194, 'DESARROLLO SUSTENTABLE', NULL, 5, 4),
(195, 'LEGISLACIÓN ORGANIZACIONAL', NULL, 5, 4),
(196, 'INTEGRADORA I', NULL, 5, 4),
(197, 'INGLES III', NULL, 5, 4),
(198, 'FORMACIÓN SOCIOCULTURAL III', NULL, 5, 4),
(199, 'COMPORTAMIENTO ORGANIZACIONAL I', NULL, 5, 5),
(200, 'SUELDOS Y SALARIOS I', NULL, 5, 5),
(201, 'INTEGRACIÓN DE CAPITAL HUMANO', NULL, 5, 5),
(202, 'DISEÑO Y VALUACIÓN DE PUESTOS', NULL, 5, 5),
(203, 'LEGISLACIÓN LABORAL', NULL, 5, 5),
(204, 'INGLES IV', NULL, 5, 5),
(205, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 5, 5),
(206, 'COMPORTAMIENTO ORGANIZACIONAL II', NULL, 5, 6),
(207, 'SUELDOS Y SALARIOS II', NULL, 5, 6),
(208, 'DESARROLLO DE CAPITAL HUMANO', NULL, 5, 6),
(209, 'EVALUACIÓN DEL DESEMPEÑO', NULL, 5, 6),
(210, 'HIGIENE Y SEGURIDAD LABORAL', NULL, 5, 6),
(211, 'INTEGRADORA II', NULL, 5, 6),
(212, 'INGLES V', NULL, 5, 6),
(213, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 5, 6),
(214, 'ESTADIA ', NULL, 5, 7),
(215, 'ALGEBRA LINEAL', NULL, 9, 2),
(216, 'QUIMICA BASICA', NULL, 9, 2),
(217, 'DIBUJO ARQUITECTONICO Y ESTRUCTURAL', NULL, 9, 2),
(218, 'INFORMATICA APLICADA', NULL, 9, 2),
(219, 'INTRODUCCIÓN A LA CONSTRUCCIÓN', NULL, 9, 2),
(220, 'INGLES I', NULL, 9, 2),
(221, 'EXPRESIÓN ORAL Y ESCRITA I', NULL, 9, 2),
(222, 'FORMACIÓN SOCIOCULTURAL I', NULL, 9, 2),
(223, 'FUNCIONES MATEMATICAS', NULL, 9, 3),
(224, 'ESTATICA', NULL, 9, 3),
(225, 'ADMINISTRACIÓN DE LA CONSTRUCCIÓN', NULL, 9, 3),
(226, 'TOPOGRAFIA I', NULL, 9, 3),
(227, 'EDIFICACIÓN', NULL, 9, 3),
(228, 'INSTALACIONES ELECTRICAS', NULL, 9, 3),
(229, 'INSTALACIONES ESPECIALES', NULL, 9, 3),
(230, 'INGLES II', NULL, 9, 3),
(231, 'FORMACIÓN SOCIOCULTURAL II', NULL, 9, 3),
(232, 'CALCULO DIFERENCIAL', NULL, 9, 4),
(233, 'ESTRUCTURA Y PROPIEDADES DE LOS MATERIALES', NULL, 9, 4),
(234, 'ANALISIS DE COSTOS I', NULL, 9, 4),
(235, 'TOPOGRAFIA II', NULL, 9, 4),
(236, 'MECANICA DE MATERIALES', NULL, 9, 4),
(237, 'INSTALACIONES HIDROSANITARIAS', NULL, 9, 4),
(238, 'INTEGRADORA I', NULL, 9, 4),
(239, 'INGLES III', NULL, 9, 4),
(240, 'FORMACIÓN SOCIOCULTURAL III', NULL, 9, 4),
(241, 'CALCULO INTEGRAL', NULL, 9, 5),
(242, 'ANALISIS DE COSTOS II', NULL, 9, 5),
(243, 'MECANICA DE SUELOS I', NULL, 9, 5),
(244, 'HIDRAULICA', NULL, 9, 5),
(245, 'MAQUINARIA PESADA Y MOVIMIENTOS DE TIERRA', NULL, 9, 5),
(246, 'INGLES IV', NULL, 9, 5),
(247, 'FORMACIÓN SOCIOCULTURAL IV', NULL, 9, 5),
(248, 'PROBABILIDAD Y ESTADISTICA', NULL, 9, 6),
(249, 'CONSTRUCCIÓN DE CAMINOS', NULL, 9, 6),
(250, 'MECANICA DE SUELOS II', NULL, 9, 6),
(251, 'TECNOLOGIA DEL CONCRETO', NULL, 9, 6),
(252, 'CONTROL Y SUPERVISIÓN DE OBRA', NULL, 9, 6),
(253, 'INTEGRADORA II', NULL, 9, 6),
(254, 'INGLES V', NULL, 9, 6),
(255, 'EXPRESIÓN ORAL Y ESCRITA II', NULL, 9, 6),
(256, 'ESTADIA', NULL, 9, 7),
(257, 'ECONOMIA PARA EL TURISMO', NULL, 7, 8),
(258, 'ANALISIS E INTERPRETACIÓN DE INFORMACIÓN PARA EL SECTOR TURISTICO', NULL, 7, 8),
(259, 'CALIDAD Y RESPONSABILIDAD SOCIAL', NULL, 7, 8),
(260, 'DESARROLLO DEL CAPITAL HUMANO EN LA ORGANIZACIÓN', NULL, 7, 8),
(261, 'INGLES VI', NULL, 7, 8),
(262, 'ADMINISTRACIÓN DEL TIEMPO', NULL, 7, 8),
(263, 'FINANZAS PARA EL TURISMO', NULL, 7, 9),
(264, 'GESTIÓN Y PLANEACIÓN TURISTICA', NULL, 7, 9),
(265, 'CONTROL ADMINISTRATIVO EN EL TURISMO', NULL, 7, 9),
(266, 'INGLES VII', NULL, 7, 9),
(267, 'PLANEACIÓN Y ORGANIZACIÓN DEL TRABAJO', NULL, 7, 9),
(268, 'DESARROLLO DE PROYECTOS PARA EL TURISMO I', NULL, 7, 10),
(269, 'INNOVACIÓN Y TURISMO RESPONSABLE', NULL, 7, 10),
(270, 'MERCADOTECNIA ESTRATEGICA', NULL, 7, 10),
(271, 'INGLES VIII', NULL, 7, 10),
(272, 'DIRECCIÓN DE EQUIPOS DE ALTO RENDIMIENTO', NULL, 7, 10),
(273, 'DESARROLLO DE PROYECTOS PARA EL TURISMO II', NULL, 7, 11),
(274, 'INSTRUMENTOS PARA EL DESARROLLO SUSTENTABLE', NULL, 7, 11),
(275, 'DESTINOS TURISTICOS INTELIGENTES', NULL, 7, 11),
(276, 'INTEGRADORA', NULL, 7, 11),
(277, 'INGLES IX', NULL, 7, 11),
(278, 'NEGOCIACIÓN EMPRESARIAL', NULL, 7, 11),
(279, 'ESTADIA ', NULL, 7, 12),
(280, 'MATEMATICAS PARA INGENIERIA I', NULL, 10, 8),
(281, 'ANIMACIÓN DIGITAL AVANZADA', NULL, 10, 8),
(282, 'PROGRAMACIÓN DE VIDEOJUEGOS I', NULL, 10, 8),
(283, 'PRODUCCIÓN DE EFECTOS VISUALES', NULL, 10, 8),
(284, 'INGLES VI', NULL, 10, 8),
(285, 'ADMINISTRACIÓN DEL TIEMPO', NULL, 10, 8),
(286, 'BASE DE DATOS PARA NEGOCIOS DIGITALES', NULL, 10, 9),
(287, 'PROGRAMACIÓN PARA ENTORNOS VIRTUALES', NULL, 10, 9),
(288, 'PROGRAMACIÓN DE VIDEOJUEGOS II', NULL, 10, 9),
(289, 'EMPRENDIMIENTO DIGITAL', NULL, 10, 9),
(290, 'INGLES VII', NULL, 10, 9),
(291, 'PLANEACIÓN Y ORGANIZACIÓN DEL TRABAJO', NULL, 10, 9),
(292, 'MATEMATICAS PARA INGENIERIA II', NULL, 10, 10),
(293, 'ANALITICA DE DATOS PARA NEGOCIOS DIGITALES', NULL, 10, 10),
(294, 'CIBERSEGURIDAD APLICADA A LOS NEGOCIOS DIGITALES', NULL, 10, 10),
(295, 'GESTIÓN DE PROYECTOS I', NULL, 10, 10),
(296, 'INGLES VIII', NULL, 10, 10),
(297, 'DIRECCIÓN DE EQUIPOS DE ALTO RENDIMIENTO', NULL, 10, 10),
(298, 'INTELIGENCIA DE NEGOCIOS', NULL, 10, 11),
(299, 'PROGRAMACIÓN DE APLICACIONES WEB PROGRESIVAS', NULL, 10, 11),
(300, 'INTEGRADORA', NULL, 10, 11),
(301, 'GESTIÓN DE PROYECTOS II', NULL, 10, 11),
(302, 'INGLES IX', NULL, 10, 11),
(303, 'NEGOCIACIÓN EMPRESARIAL', NULL, 10, 11),
(304, 'ESTADIA ', NULL, 10, 12),
(305, 'MATEMATICAS PARA INGENIERIA I', NULL, 8, 8),
(306, 'TERMODINAMICA', NULL, 8, 8),
(307, 'FISICOQUIMICA', NULL, 8, 8),
(308, 'METODOLOGIA DE LA INVESTIGACIÓN', NULL, 8, 8),
(309, 'ADMINISTRACIÓN DE LA PRODUCCIÓN AGROBIOTECNOLOGIA', NULL, 8, 8),
(310, 'INGLES VI', NULL, 8, 8),
(311, 'ADMINISTRACIÓN DEL TIEMPO', NULL, 8, 8),
(312, 'MATEMATICAS PARA INGENIERIA II', NULL, 8, 9),
(313, 'BIOESTADISTICA', NULL, 8, 9),
(314, 'OPERACIONES UNITARIAS I', NULL, 8, 9),
(315, 'ADMINISTRACIÓN DE LA CALIDAD', NULL, 8, 9),
(316, 'INGLES VII', NULL, 8, 9),
(317, 'PLANEACIÓN Y ORGANIZACIÓN DEL TRABAJO', NULL, 8, 9),
(318, 'OPERACIONES UNITARIAS II', NULL, 8, 10),
(319, 'BIOLOGIA MOLECULAR', NULL, 8, 10),
(320, 'CONSERVACIÓN DE BIOPRODUCTOS', NULL, 8, 10),
(321, 'BIOINGENIERIA', NULL, 8, 10),
(322, 'INGLES VIII', NULL, 8, 10),
(323, 'DIRECCIÓN DE EQUIPOS DE ALTO RENDIMIENTO', NULL, 8, 10),
(324, 'INGENIERIA GENETICA', NULL, 8, 11),
(325, 'INGENIERIA ECONOMICA', NULL, 8, 11),
(326, 'CARACTERIZACIÓN DE BIOPRODUCTOS', NULL, 8, 11),
(327, 'INTEGRADORA', NULL, 8, 11),
(328, 'INGLES IX', NULL, 8, 11),
(329, 'NEGOCIACIÓN EMPRESARIAL', NULL, 8, 11),
(330, 'ESTADIA ', NULL, 8, 12),
(331, 'COCINA MEXICANA I', NULL, 13, 8),
(332, 'PATRIMONIO CULINARIO DE MEXICO', NULL, 13, 8),
(333, 'ADMINISTRACIÓN DE PROCESOS GASTRONOMICOS', NULL, 13, 8),
(334, 'BEBIDAS DESTILADAS MEXICANAS', NULL, 13, 8),
(335, 'INGLÉS VI', NULL, 13, 8),
(336, 'ADMINISTRACIÓN DEL TIEMPO', NULL, 13, 8),
(337, 'COCINA MEXICANA II', NULL, 13, 9),
(338, 'COCINA EUROPEA', NULL, 13, 9),
(339, 'INGENIERIA DE MENÚ', NULL, 13, 9),
(340, 'INGLES VII', NULL, 13, 9),
(341, 'PLANEACIÓN Y ORGANIZACIÓN DEL TRABAJO', NULL, 13, 9),
(342, 'CONTABILIDAD', NULL, 13, 10),
(343, 'COCINA ASIATICA', NULL, 13, 10),
(344, 'CONCEPTOS GASTRONOMICOS', NULL, 13, 10),
(345, 'MIXOLOGIA', NULL, 13, 10),
(346, 'INGLES VIII', NULL, 13, 10),
(347, 'DIRECCIÓN DE EQUIPOS DE ALTO RENDIMIENTO', NULL, 13, 10),
(348, 'ANALISIS E INTERPRETACIÓN FINANCIERA', NULL, 13, 11),
(349, 'COCINA CONTEMPORANEA', NULL, 13, 11),
(350, 'GESTIÓN DE LA CALIDAD EN ESTABLECIMIENTOS DE ALIMENTOS Y BEBIDAS', NULL, 13, 11),
(351, 'DESARROLLO DE NEGOCIOS GASTRONOMICOS', NULL, 13, 11),
(352, 'INTEGRADORA', NULL, 13, 11),
(353, 'INGLES IX', NULL, 13, 11),
(354, 'NEGOCIACIÓN EMPRESARIAL', NULL, 13, 11),
(355, 'ESTADIA', NULL, 13, 12),
(356, 'SOCIOLOGIA DEL TRABAJO', NULL, 14, 8),
(357, 'PEDAGOGIA EMPRESARIAL', NULL, 14, 8),
(358, 'ADMINISTRACIÓN DE PROYECTOS DE CAPITAL HUMANO', NULL, 14, 8),
(359, 'INVESTIGACIÓN CUALITATIVA', NULL, 14, 8),
(360, 'INGLES VI', NULL, 14, 8),
(361, 'ADMINISTRACIÓN DEL TIEMPO', NULL, 14, 8),
(362, 'CAPACITACIÓN DEL CAPITAL HUMANO', NULL, 14, 9),
(363, 'CULTURA CORPORATIVA', NULL, 14, 9),
(364, 'INTELIGENCIA EMOCIONAL', NULL, 14, 9),
(365, 'INGLES VII', NULL, 14, 9),
(366, 'PLANEACIÓN Y ORGANIZACIÓN DEL TRABAJO', NULL, 14, 9),
(367, 'SISTEMA DE GESTIÓN DE LA CALIDAD', NULL, 14, 10),
(368, 'HERRAMIENTAS DE GESTIÓN DEL PERSONAL', NULL, 14, 10),
(369, 'GESTIÓN DEL CAMBIO ORGANIZACIONAL', NULL, 14, 10),
(370, 'INGLES VIII', NULL, 14, 10),
(371, 'DIRECCIÓN DE EQUIPOS DE ALTO RENDIMIENTO', NULL, 14, 10),
(372, 'AUDITORIA DE CALIDAD', NULL, 14, 11),
(373, 'CONSULTORIA EN CAPITAL HUMANO', NULL, 14, 11),
(374, 'RESPONSABILIDAD SOCIAL APLICADA', NULL, 14, 11),
(375, 'INTEGRADORA', NULL, 14, 11),
(376, 'INGLES IX', NULL, 14, 11),
(377, 'NEGOCIACIÓN EMPRESARIAL', NULL, 14, 11),
(378, 'ESTADIA ', NULL, 14, 12),
(379, 'LABORATORIO GASTRONOMIA ', NULL, NULL, NULL),
(380, 'DEPORTES', NULL, NULL, NULL),
(381, 'INVERNADERO ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_asistencias`
--

CREATE TABLE `utmir_asistencias` (
  `id_asistencias` bigint(20) NOT NULL,
  `fecha_asistencia` date DEFAULT NULL,
  `tipo_asistencia` int(11) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_asignaturas` bigint(20) DEFAULT NULL,
  `id_unidades_asignatura` bigint(20) DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_asistencias`
--

INSERT INTO `utmir_asistencias` (`id_asistencias`, `fecha_asistencia`, `tipo_asistencia`, `matricula`, `id_asignaturas`, `id_unidades_asignatura`, `id_grupo`, `id_asignacion_asignatura`) VALUES
(261, '2024-02-02', 1, '2303003', 299, 814, 1, 74),
(262, '2024-02-06', 1, '2303003', 299, 814, 1, 74),
(263, '2024-02-07', 1, '2303003', 299, 814, 1, 74),
(264, '2024-02-09', 1, '2303003', 299, 814, 1, 74),
(265, '2024-02-12', 1, '2303003', 299, 814, 1, 74),
(266, '2024-02-13', 1, '2303003', 299, 814, 1, 74),
(267, '2024-02-14', 1, '2303003', 299, 814, 1, 74),
(268, '2024-02-16', 1, '2303003', 299, 814, 1, 74),
(269, '2024-02-19', 1, '2303003', 299, 814, 1, 74),
(270, '2024-02-20', 1, '2303003', 299, 814, 1, 74),
(271, '2024-02-21', 4, '2303003', 299, 814, 1, 74),
(272, '2024-02-23', 1, '2303003', 299, 814, 1, 74),
(273, '2024-02-26', 1, '2303003', 299, 814, 1, 74),
(274, '2024-02-27', 4, '2303003', 299, 814, 1, 74),
(275, '2024-02-28', 4, '2303003', 299, 814, 1, 74),
(276, '2024-03-18', 1, '2303003', 300, 819, 1, 71),
(277, '2024-03-19', 1, '2303003', 300, 819, 1, 71),
(278, '2024-03-21', 1, '2303003', 300, 819, 1, 71),
(279, '2024-03-22', 1, '2303003', 300, 819, 1, 71),
(280, '2024-03-25', 1, '2303003', 300, 819, 1, 71),
(281, '2024-03-26', 1, '2303003', 300, 819, 1, 71),
(282, '2024-03-29', 1, '2303003', 300, 819, 1, 71),
(283, '2024-03-28', 1, '2303003', 300, 819, 1, 71),
(284, '2024-04-01', 1, '2303003', 300, 819, 1, 71),
(285, '2024-04-02', 1, '2303003', 300, 819, 1, 71),
(286, '2024-04-04', 1, '2303003', 300, 819, 1, 71),
(287, '2024-04-05', 1, '2303003', 300, 819, 1, 71),
(288, '2024-04-08', 2, '2303003', 300, 819, 1, 71),
(289, '2024-04-09', 2, '2303003', 300, 819, 1, 71),
(290, '2024-04-12', 2, '2303003', 300, 819, 1, 71),
(291, '2024-04-11', 2, '2303003', 300, 819, 1, 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_calificaciones`
--

CREATE TABLE `utmir_calificaciones` (
  `id_calificaciones` bigint(20) NOT NULL,
  `calificacion_ordinaria` int(11) DEFAULT NULL,
  `calificacion_remedial` int(11) DEFAULT NULL,
  `remedial` bit(1) NOT NULL,
  `matricula_alumno` varchar(255) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL,
  `id_informacion_academica` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_calificaciones`
--

INSERT INTO `utmir_calificaciones` (`id_calificaciones`, `calificacion_ordinaria`, `calificacion_remedial`, `remedial`, `matricula_alumno`, `id_asignacion_asignatura`, `id_informacion_academica`) VALUES
(1, 9, NULL, b'0', '2303003', 75, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_calificaciones_unidad`
--

CREATE TABLE `utmir_calificaciones_unidad` (
  `id_calificacion_unidad` bigint(20) NOT NULL,
  `calificacion_ordinaria` double DEFAULT NULL,
  `calificacion_recuperacion` double DEFAULT NULL,
  `recuperacion` bit(1) NOT NULL,
  `req_asistencias` bit(1) NOT NULL,
  `matricula_alumno` varchar(255) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL,
  `id_unidades_asignatura` bigint(20) DEFAULT NULL,
  `id_informacion_academica` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_calificaciones_unidad`
--

INSERT INTO `utmir_calificaciones_unidad` (`id_calificacion_unidad`, `calificacion_ordinaria`, `calificacion_recuperacion`, `recuperacion`, `req_asistencias`, `matricula_alumno`, `id_asignacion_asignatura`, `id_unidades_asignatura`, `id_informacion_academica`) VALUES
(2, 9.5, NULL, b'0', b'1', '2303003', 74, 814, 28),
(3, 9.4, NULL, b'0', b'1', '2303003', 74, 815, NULL),
(5, 9.5, NULL, b'0', b'1', '2303015', 75, 815, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_catalogo_carreras`
--

CREATE TABLE `utmir_catalogo_carreras` (
  `id_carrera` bigint(20) NOT NULL,
  `carrera` varchar(255) DEFAULT NULL,
  `status_carrera` varchar(255) DEFAULT NULL,
  `formato_numerico` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_catalogo_carreras`
--

INSERT INTO `utmir_catalogo_carreras` (`id_carrera`, `carrera`, `status_carrera`, `formato_numerico`) VALUES
(1, 'T.S.U en Agrobiotecnología', '1', '01'),
(2, 'T.S.U en Tecnologías de la Información y Comunicacion', '0', '02'),
(3, 'T.S.U en Turismo', '1', '03'),
(4, 'T.S.U en Gastronomía', '1', '04'),
(5, 'T.S.U en Administración', '1', '05'),
(6, 'Ingeniería en Tecnologías de la Información', '0', '06'),
(7, 'Licenciatura en Gestión y Desarrollo Turístico', '1', '07'),
(8, 'Ingeniería en Agrobiotecnología', '1', '08'),
(9, 'T.S.U en Construcción', '1', '09'),
(10, 'Ingeniería en Entornos Virtuales y Negocios Digitales', '1', '10'),
(11, 'T.S.U en Tecnologías de la Información y Comunicación', '0', '11'),
(12, 'T.S.U Tecnologías de la Información, Área Entornos Virtuales y Negocios Digitales', '1', '12'),
(13, 'Licenciatura en Gastronomia', '1', '13'),
(14, 'Licenciatura en Gestión del Capital Humano', '1', '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_clase_asignatura`
--

CREATE TABLE `utmir_clase_asignatura` (
  `id_horarios_clase` bigint(20) NOT NULL,
  `dia_clase` varchar(255) DEFAULT NULL,
  `hora_final` time(6) DEFAULT NULL,
  `hora_inicio` time(6) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_clase_asignatura`
--

INSERT INTO `utmir_clase_asignatura` (`id_horarios_clase`, `dia_clase`, `hora_final`, `hora_inicio`, `id_asignacion_asignatura`) VALUES
(39, 'Lunes', '12:00:00.000000', '08:00:00.000000', 70),
(40, 'Jueves', '11:00:00.000000', '08:00:00.000000', 70),
(41, 'Viernes', '10:23:00.000000', '10:23:00.000000', 71),
(42, 'Viernes', '11:23:00.000000', '09:23:00.000000', 72),
(43, 'Jueves', '01:23:00.000000', '10:23:00.000000', 72),
(44, 'Lunes', '09:26:00.000000', '09:26:00.000000', 74),
(45, 'Martes', '10:26:00.000000', '10:26:00.000000', 74),
(46, 'Miércoles', '10:26:00.000000', '09:26:00.000000', 74),
(47, 'Martes', '01:05:00.000000', '10:08:00.000000', 75),
(50, 'Martes', '04:01:00.000000', '11:01:00.000000', 71),
(51, 'Viernes', '00:03:00.000000', '11:03:00.000000', 74),
(52, 'Lunes', '05:08:00.000000', '11:08:00.000000', 71),
(53, 'Jueves', '10:45:00.000000', '08:45:00.000000', 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_contacto_emergencia`
--

CREATE TABLE `utmir_contacto_emergencia` (
  `id_contacto_emergencia` bigint(20) NOT NULL,
  `email_contacto_e` varchar(255) DEFAULT NULL,
  `nombre_contacto_e` varchar(255) DEFAULT NULL,
  `parentesco_contacto_e` varchar(255) DEFAULT NULL,
  `telefono_contacto_e` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_contacto_emergencia`
--

INSERT INTO `utmir_contacto_emergencia` (`id_contacto_emergencia`, `email_contacto_e`, `nombre_contacto_e`, `parentesco_contacto_e`, `telefono_contacto_e`, `matricula`) VALUES
(1, 'rosshzamora@gmail.com', 'ROCIO HERNANDEZ ZAMOR', 'MADRE', '7712913469', '2303001'),
(2, 'Prueba', 'PRUEBA', 'PRUEBA', 'Prueba', '2303002'),
(3, 'e', 'e', 'e', 'e', '2303003'),
(4, 'asee', 'as', 'asee', 'asee', '2303005'),
(5, 'TESTING', 'TESTING', 'TESTING', 'TESTING', '2303007'),
(6, 'as', 'as', 'as', 'as', '2303006'),
(7, 'ELPEPE', 'ELPEPE', 'ELPEPE', 'ELPEPE', '2303008'),
(8, 'SAS', 'SAS', 'SAS', 'SAS', '2303009'),
(9, 'ALA', 'ALA', 'ALA', 'ALA', '2303010'),
(10, 'V', 'TITO', 'TITO', 'TITO', '2303011'),
(11, 'VPEPEPON', 'PEPEPON', 'PEPEPON', 'PEPEPON', '2303012'),
(12, 'fecha_registro', 'fecha_registro', 'fecha_registro', 'fecha_registro', '2303013'),
(13, 'as', 'as', 'as', 'as', '2303014'),
(14, 'as', 'as', 'as', 'as', '2303015'),
(15, 'sdxcfgvhbjnkm', 'asdftgyhujk', 'azsxdcfvgbh', 'zsdxcfvgbhjnm', '2303016'),
(16, 'REWTWE', 'ASAA', 'REWTWE', 'REWTWE', '2303017'),
(17, 'ENRIQUE', 'ENRIQUE', 'ENRIQUE', 'ENRIQUE', '2303018'),
(18, 'akhaaA', 'ENRIQUE', '1727129U99', '7791129', '2303019'),
(19, 'EPE', 'EPE', 'EPE', 'EPE', '2303020'),
(20, 'ASOAS@AL.COM', 'NAME', 'PASMOD', 'TL', '2303021'),
(21, 'asdasd@cas.com', 'ASDAS', 'PAPA', 'asd', '2303022'),
(22, '', 'ALAN', 'MADRE', '7881561', '2303024'),
(23, 'DURA', 'DURA', 'DURA', 'DURA', '2303025'),
(24, 'chio@prueba.com', 'ROCIO HERNANDEZ ZAMORA', 'MADRES', '7712913696', '2303023'),
(25, 'alansda@com.com', 'LETICIA MAGUETZI', 'PADRE', '77166206', '2303026'),
(26, 'asv', 'VAS', 'ASV', 'vasd', '2303027'),
(27, 'asasm@hotmail.com', 'EL PAPA FRANCISCO', 'PADRE', 'segu', '2403001'),
(28, 'PEPADOR', 'PEPADOR', 'PEPADOR', 'PEPADOR', '2403002'),
(29, 'ELELE', 'ELELE', 'ELELE', 'ELELE', '2403004'),
(30, 'IJIJIA', 'IJIJIA', 'IJIJIA', 'IJIJIA', '2403007'),
(31, 'ASAS', 'ASAS', 'ASAS', 'ASAS', '2403008'),
(32, 'OSSS', 'OSSS', 'OSSS', 'OSSS', '2403009'),
(33, 'ASDFDAS', 'ASDFDAS', 'ASDFDAS', 'ASDFDAS', '2403010'),
(34, 'ELELELEL', 'ELELELEL', 'ELELELEL', 'ELELELEL', '2403011'),
(35, 'NEW', 'NEW', 'NEW', 'NEW', '2403012'),
(36, 'ASCSASCZZ', 'ASCSASCZZ', 'ASCSASCZZ', 'ASCSASCZZ', '2403006'),
(37, 'AS', 'AS', 'AS', 'AS', '2403013'),
(38, 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', '2403014'),
(39, 'GASTROO', 'GASTROO', 'GASTROO', 'GASTROO', '2403015'),
(40, 'AGASFAO', 'AGASFAO', 'AGASFAO', 'AGASFAO', '2403016'),
(41, 'ALAM', 'ALAM', 'ALAM', 'ALAM', '2403017'),
(42, 'OTRO', 'OTRO', 'OTRO', 'OTRO', '2403018'),
(43, 'JEJE', 'JEJE', 'JEJE', 'JEJE', '2403020'),
(44, 'ASAS', 'ASAS', 'ASAS', 'ASAS', '2403021'),
(45, NULL, 'RRRRRRRRRR', 'GGGG', 'ggg', '2403038'),
(46, 'msr@gmail.com', 'MAR LOPEZ PEREZ', 'MADRE', '77156565S5', '2403042'),
(47, 'maria antonieta', 'PEPE LOPEZ', '551640981', '5517640981', '2403037'),
(48, NULL, 'ANA PEREZ GARCIA ', '6398741', '1147896', '2403025'),
(49, '', 'JJFGGJHF', 'MAMÁ', '534663', '2403053'),
(50, 'ALMAMG@GMAIL.COM', 'ALMA MARIA GOZO ', 'MADRE', '7714568791', '2403033'),
(51, NULL, 'ADANAHI CASTILLO HERNANDEZ', 'MADRE', '9876543215', '2403032'),
(52, 'aasdjkfgwygba@gmail.com', 'FRANCISCO GERTE ', 'PADRINO', '5412978346', '2403026'),
(53, NULL, 'ALMA MARCELA SILVA DE ALEGRIA ', 'PADRE', '7733445590', '2403027'),
(54, NULL, 'ROSA GALINDO PEREZ', 'TIA', '7718963254', '2403051'),
(55, 'PENIS@GMAIL.COM', 'JORGUE NITALES', 'PADRE', '7724356143', '2403049'),
(56, 'meriguada10@gmail.com', 'ADRIANA ORTIZ SAMPERIO', 'COLLUNGE', '7711313724', '2403054'),
(57, 'sanchessanches@gmail.com', 'ERNANDES PERES SANCHES SANCHES', 'MADRE', '1298445232', '2403050'),
(58, '543D@GMAIL.COM', 'JUAN HERNANDEZ', 'PADRE', '7715546969', '2403039'),
(59, 'SALSATARTARA@GMAIL.COM', 'JIMENA LARA DE LA CRUZ', 'MI NOVIA', '771 444 2304', '2403024'),
(60, 'JUANCARLOS23@GMAIL.COM', 'JUAN CARLOS HERNANDEZ HERNANDEZ', 'PADRE', '7712625986', '2403045'),
(61, 'lopeztarzo345@gmail.com', 'JUANA LOPEZ GONSALEZ', 'MADRE', '771589634', '2403028'),
(62, NULL, 'FRIDA RIOS LOPEZ', 'MAMA', '7718964230', '2403047'),
(63, 'frasp@hotmail.com ', 'FRANCISCO PALACIOS HERNANDEZ ', 'PADRE ', '7712120890', '2403052'),
(64, 'esrdtfguyiojpklótytrfgh', 'WERTYUIOJP', '57474552312', '114515512502551', '2403055'),
(65, 'noaortega7819@gmail.com', 'NOE BENJAMIN ORTEGA RAMIREZ', 'TIO', '7759482619', '2403034'),
(66, NULL, 'OPERADORA', 'PADRE', '911', '2403029'),
(67, '-', 'ALEXIS DINEY ZARATE ZAMBRANO', 'PAREJA', '7713707189', '2403041'),
(68, 'ernestozedillo@gmail.com', '456412611', 'ESPOSA', '857651051', '2403048'),
(69, NULL, NULL, NULL, NULL, '2403035'),
(70, NULL, 'ISMERAI SMITH RODRIGUEZ', 'MADRE', '7719683140', '2403046'),
(71, 'momazosdiego@gmail.com', 'GUILLERMO ANTONIO', 'PADRE', '771123456', '2403044'),
(72, 'EL PAPA FRANCISCO', 'EL PAPA FRANCISCO', 'EL PAPA FRANCISCO', 'EL PAPA FRANCISCO', '2403056'),
(73, 'arturin02@hotmail.com', 'ARTURO HERNANDEZ SERNA', 'HERMANO', '7714589345', '2403071'),
(74, 'MARIA.235@hotmail.com', 'TRINIDAD CRUZ VERA', 'MADRE', '7714321320', '2403075'),
(75, NULL, NULL, NULL, NULL, '2403064'),
(76, 'a02103083@utmir.edu.mx', 'MARCO ANTONIO', 'PADRE', '7711133007', '2403069'),
(77, 'ce3leidj0ijrg@jfoj0p', 'JUNITO ', 'PAPA ', '868868587484', '2403078'),
(78, NULL, 'ROCIO CANO ', 'MADRE', '7713651425', '2403068'),
(79, NULL, 'FERNANDA CANO', 'MADRE', '7751649575', '2403076'),
(80, NULL, 'LUCRECIA PEREZ LICONA', 'PADRE', '7716754088', '2403079'),
(81, 'ajoseeduardomorit@gmail.com', 'JOSE EDUARDO MAORITIS', '7715237372', '7715237373', '2403074'),
(82, NULL, 'SUZETTE LINARTE CAMPOS', 'MADRE', '7724586932', '2403065'),
(83, 'hsdhdhdjhq@hdhd.com', 'JUANITI LOPES', 'MADRE', '89897654345', '2403077'),
(84, 'a02103056@utmir.edu.mx', 'SANTIAGO SIAM', 'PADRE', '771113337', '2403062'),
(85, 'holaaaa_1@gmail.com', 'MARIA', 'MADRE', '7714587898', '2403070'),
(86, 'CONCEPCION_@GMAIL.COM', 'MARIA CONCEPCION SANCHEZ ', 'TIA ', '7715631258', '2403063'),
(87, NULL, 'ARIANNA SALAS GARCIA', 'MADRE', '7711450738', '2403066'),
(88, 'solecito@gmail.com', 'MARIA HERNANDEZ LOZANO', 'MADRE', '7715567182', '2403067'),
(89, 'a02103151@utmir.edu.mx', 'MI MAMA', 'MAMA', '11177981911', '2403082'),
(90, NULL, 'ZACARIAS GILBERTO VILLEGAS CAMPUZANO', 'PADRE', '7716833527', '2403083'),
(91, 'sapitovolador@utmir.edu.mx', 'FELIPE HERNANDEZ PEREZ', 'PADRE', '7735241479', '2403081'),
(92, 'acd', 'ROSA', 'MADRE', '7777777777777777', '2403084'),
(93, NULL, 'GUYGYU', 'HFFH', '77757', '2403089'),
(94, 'gmgmgfhmy', 'GHGMG', 'SFGMGUKFY', 'hgfmddhkvhm', '2403090'),
(95, NULL, 'WENDY MESA CALZADA', 'MADRE', '7713274218', '2403086'),
(96, 'mariahernandezp@gmail.com', 'MARIA HERNANDEZ PEREZ ', 'MADRE', '7716524889', '2403095'),
(97, 'HHHHFHF@GMAIL.COM', 'OYOYOYOY', '5517640981', '5517640981', '2403100'),
(98, 'paco', 'JUANA', '67455354354', '7715353533', '2403092'),
(99, 'fhgjj', 'M C', 'NHGC', 'jt', '2403097'),
(100, 'wwer', 'QWER', 'ERT', 'wer', '2403099'),
(101, 'marguada@gmail.com', 'MARIA SUALES LEON', '7711313724', '7711006452', '2403096'),
(102, '123456789@gmail.com', 'JUAN LOPEZ PERES', 'TIO', '7715461918', '2403098'),
(103, 'ahauqhsw89@gmail.com', 'JUAN LOPEZ PEREZ ', 'PADRE', '7713559569', '2403093'),
(104, 'albcres@gmail.com', 'ALBERTO CRUZ ESPINOSA ', 'PADRE ', '7713450988', '2403094'),
(105, 'ros@gmail.com', 'ROSA LOPEZ LOPEZ', 'MADRE', '77111111111', '2403091'),
(106, 'lkl', 'HV', 'LKLK', 'kll', '2403111'),
(107, NULL, 'IGNIS OCTAVIUS MAYORGA', 'MADRE', '9876541258', '2403104'),
(108, 'hSDFKJWFK64@GMAIL.COM', 'FRANCISCO GERTS', 'PAPA', '7845219854', '2403106'),
(109, 'JIKAM@gmail.com', 'SANDRA JIKA MUROS', 'MI NOVIA', '911', '2403108'),
(110, 'hjbiifvefbef@gmail ', 'JUAN PEREZ ', 'PADRE ', '21546545465', '2403112'),
(111, NULL, 'TOMOE LOPEZ PEREZ', 'MADRE', '778597635', '2403113'),
(112, 'GATO98@GMAIL.COM', 'BRANDON PEREZ LOPEZ', 'MADRE', '7719978921', '2403118'),
(113, 'salinasrata@gmail.com', '1515156156156', '784512345645', '151566158974', '2403116'),
(114, '-', 'ALEXIS DINEY ZARATE ZAMBRANO', 'PAREJA', '7712358657', '2403117'),
(115, 'anutoedjfv@gmail.com', 'JUAN LOPEZ PEREZ', '7714562525', '7718562825', '2403119'),
(116, NULL, 'ROBERTO MARTINEZ PELCASTRE', 'MADRE', '4598264895', '2403121'),
(117, 'asddas', 'SADASDAS', 'ASDASD', 'as', '2403123'),
(118, NULL, NULL, NULL, NULL, '2403122'),
(119, 'N/A', 'ASDAS', 'PADRE', '751', '2403022'),
(120, 'correfake@gmail.coma', 'EL PAPA FRANCISCO', 'PADRE', '2403128', '2403128'),
(121, '2403129', '2403129', '2403129', '2403129', '2403129'),
(122, 'Kajajs', 'JAJS', 'JAJJS', '71717', '2403131'),
(123, '48YOCUI', 'YOCUI', 'YOCUI', '7478', '2403132'),
(124, 'asasdasd', 'SASADAS', 'ASDDASDAS', '1321312312', '2403138'),
(125, 'qamsasasd', 'KSADNMKASMDAK', 'ASDASDAS', '6478468486', '2403139'),
(126, 'dasasd', 'ASDDAS', 'A', '12312231', '2403140'),
(127, 'asdas', 'DFSDSDF', 'ASDASD', '4515156', '2403142'),
(128, '21asd', 'DASASD', 'ASDDAS', '12321231', '2403143');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_cuatrimestres`
--

CREATE TABLE `utmir_cuatrimestres` (
  `id` bigint(20) NOT NULL,
  `cuatrimestre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_cuatrimestres`
--

INSERT INTO `utmir_cuatrimestres` (`id`, `cuatrimestre`) VALUES
(1, '0'),
(2, '1'),
(3, '2'),
(4, '3'),
(5, '4'),
(6, '5'),
(7, '6'),
(8, '7'),
(9, '8'),
(10, '9'),
(11, '10'),
(12, '11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_cuotas`
--

CREATE TABLE `utmir_cuotas` (
  `id_cuota` bigint(20) NOT NULL,
  `cuota` varchar(255) DEFAULT NULL,
  `formato_numerico_cuota` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_cuotas`
--

INSERT INTO `utmir_cuotas` (`id_cuota`, `cuota`, `formato_numerico_cuota`, `costo`) VALUES
(1, 'Inscripción', '01', '1475.00'),
(2, 'Reinscripción', '02', '1473.00'),
(3, 'Readmisión', '03', '1473.00'),
(4, 'Trámite de equivalencia de estudios', '04', '122.00'),
(5, 'Examen de ingreso a la educación superior', '05', '295.00'),
(6, 'Examen remedial', '06', '258.00'),
(7, 'Examen de certificación de lengua extranjera', '07', '1228.00'),
(8, 'Credencial de identificación escolar', '08', '74.00'),
(9, 'Constancia escolar', '09', '55.00'),
(10, 'Historial Académico', '10', '49.00'),
(11, 'Certificado de estudios', '11', '246.00'),
(12, 'Seguro estudiantil contra accidentes', '12', '185.00'),
(13, 'Titulación', '13', '982.00'),
(14, 'Derecho por la validación electrónica de título profesional mediante medidas de seguridad (timbre holograma)', '14', '104.00'),
(15, 'Protocolo de titulación', '15', '429.00'),
(16, 'Expedición de Registro Estatal', '16', '415.00'),
(17, 'Curso propedéutico', '17', '614.00'),
(18, 'Servicios de Educación Continua Básico', '18', '21.00'),
(19, 'Servicios de Educación Continua Intermedio', '19', '33.00'),
(20, 'Servicios de Educación Continua Avanzado', '20', '46.00'),
(21, 'Servicios de Educación Continua Especializado', '21', '94.00'),
(22, 'Reposición de credencial', '22', '74.00'),
(23, 'Póliza de mantenimiento y servicio técnico', '23', '307.00'),
(24, 'Aportación mensual de cafetería', '24', '1228.00'),
(25, 'Aportación por publicidad', '25', '614.00'),
(26, 'Concesión de maquinas despachadoras de alimentos', '26', NULL),
(27, 'Copia fotostática', '27', '1.00'),
(28, 'Cuota de recuperación por impresión en blanco y negro', '28', '1.00'),
(29, 'Cuota por uso de la cancha de fútbol soccer', '29', '185.00'),
(30, 'Cuota de recuperación para el mantenimiento por el uso de espacios universitarios administrativos y usos múltiples. (Para eventos externos)', '30', '31.00'),
(31, 'Cuota de recuperación para el mantenimiento de uso de casillero', '31', '49.00'),
(32, 'Cuota por pago extemporáneo por inscripción o reinscripción', '32', '37.00'),
(33, 'Reposición de pase de estacionamiento', '33', '122.00'),
(34, 'Cuota por devolución extemporánea de acervo bibliográfico por día', '34', '5.00'),
(35, 'Paquete (1) Inscripción con recargos', '35', '1510.00'),
(36, 'Paquete (2) Reinscripción con recargos', '36', '1595.00'),
(37, 'mixta (varios pagos)', '37', NULL),
(38, 'Paquete (3) Titulación, Certificado, Derecho por la validación electrónica y expedición de registro', '38', '1747.00'),
(39, 'Paquete (4) Certificado y titulación', '39', '1228.00'),
(40, 'Paquete (5) inscripción ( inscripción, seguro, credencial, curso propedéutico', '40', '2348.00'),
(41, 'Paquete (6) inscripción (inscripción, seguro, credencial, curso propedéutico) (con recargos)', '41', '2383.00'),
(42, 'Paquete (7) Derecho val. Electrónica y expedición de registro estatal', '42', '519.00'),
(43, 'Paquete (8) Reinscripción, credencial, seguro estudiantil', '43', '1732.00'),
(44, 'Paquete (9) Paquete reinscripción, inscripción, credencial, seguro estudiantil (con recargo)', '44', '1769.00'),
(45, 'Paquete (10) Inscripcion y credencial', '45', '1547.00'),
(46, 'Paquete (11) Reinscripcion y certificado', '46', '1719.00'),
(47, 'Paquete (12) reinscripcion y certificado (con recargo)', '47', '1756.00'),
(48, 'Paquete (13) Titulacion,Validación y Registro', '48', '1501.00'),
(49, 'Paquete (14) INSCRIPCIÓN, CREDENCIAL, SEGURO Y CERTIFICADO', '49', '1978.00'),
(50, 'Paquete (15) PAGO DE TITULACIÓN (TITULACIÓN, PROTOCOLO DE TITULACIÓN, CERTIFICADO, VALIDACIÓN,REGISTRO)', '50', '2176.00'),
(51, 'Paquete (16) PAGO DE TITULACIÓN (protocolo, validación, registro)', '51', '948.00'),
(52, 'Paquete (17) TITULACIÓN (titulación,protocolo, validación, registro )', '52', '1930.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_datos_generales`
--

CREATE TABLE `utmir_datos_generales` (
  `id_datos_generales` bigint(20) NOT NULL,
  `discapacidad` varchar(255) DEFAULT NULL,
  `habla_indigena` varchar(255) DEFAULT NULL,
  `lengua_indigena` varchar(255) DEFAULT NULL,
  `tiene_discapacidad` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_datos_generales`
--

INSERT INTO `utmir_datos_generales` (`id_datos_generales`, `discapacidad`, `habla_indigena`, `lengua_indigena`, `tiene_discapacidad`, `matricula`) VALUES
(1, NULL, 'no', NULL, 'no', '2303001'),
(2, NULL, 'no', NULL, 'no', '2303002'),
(3, NULL, 'no', NULL, 'no', '2303003'),
(4, NULL, 'no', NULL, 'no', '2303005'),
(5, NULL, 'si', 'nose', 'no', '2303007'),
(6, NULL, 'no', NULL, 'no', '2303006'),
(7, NULL, 'no', NULL, 'no', '2303008'),
(8, NULL, 'no', NULL, 'no', '2303009'),
(9, NULL, 'no', NULL, 'no', '2303010'),
(10, NULL, 'no', NULL, 'no', '2303011'),
(11, NULL, 'no', NULL, 'no', '2303012'),
(12, NULL, 'no', NULL, 'no', '2303013'),
(13, NULL, 'no', NULL, 'no', '2303014'),
(14, NULL, 'no', NULL, 'no', '2303015'),
(15, 'visual', 'si', 'HOtomi', 'si', '2303016'),
(16, NULL, 'no', NULL, 'no', '2303017'),
(17, NULL, 'no', NULL, 'no', '2303018'),
(18, NULL, 'no', NULL, 'no', '2303019'),
(19, NULL, 'no', NULL, 'no', '2303020'),
(20, NULL, 'no', NULL, 'no', '2303021'),
(21, 'AS', 'si', 'ASDA', 'si', '2303022'),
(22, NULL, 'no', NULL, 'no', '2303024'),
(23, NULL, 'no', NULL, 'no', '2303025'),
(24, 'VISUAL', 'si', 'NAHUATL', 'si', '2303023'),
(25, 'VISUAL', 'no', '', 'si', '2303026'),
(26, NULL, 'no', NULL, 'no', '2303027'),
(27, NULL, 'no', NULL, 'no', '2403001'),
(28, NULL, 'no', NULL, 'no', '2403002'),
(29, NULL, 'no', NULL, 'no', '2403004'),
(30, NULL, 'no', NULL, 'no', '2403007'),
(31, NULL, 'no', NULL, 'no', '2403008'),
(32, NULL, 'no', NULL, 'no', '2403009'),
(33, NULL, 'no', NULL, 'no', '2403010'),
(34, NULL, 'no', NULL, 'no', '2403011'),
(35, NULL, 'no', NULL, 'no', '2403012'),
(36, NULL, 'no', NULL, 'no', '2403006'),
(37, NULL, 'no', NULL, 'no', '2403013'),
(38, NULL, 'no', NULL, 'no', '2403014'),
(39, NULL, 'no', NULL, 'no', '2403015'),
(40, NULL, 'no', NULL, 'no', '2403016'),
(41, NULL, 'no', NULL, 'no', '2403017'),
(42, NULL, 'no', NULL, 'no', '2403018'),
(43, NULL, 'no', NULL, 'no', '2403020'),
(44, NULL, 'no', NULL, 'no', '2403021'),
(45, 'GGGG', 'si', 'GGG', 'si', '2403038'),
(46, NULL, 'no', NULL, 'no', '2403042'),
(47, NULL, 'no', NULL, 'no', '2403037'),
(48, NULL, 'no', NULL, 'no', '2403025'),
(49, NULL, 'no', NULL, 'no', '2403053'),
(50, 'RETRASADO ', 'si', 'MAYA', 'si', '2403033'),
(51, 'INTELECTUAL', 'si', 'NÁHUATL', 'si', '2403032'),
(52, NULL, 'no', NULL, 'no', '2403026'),
(53, NULL, 'no', NULL, 'no', '2403027'),
(54, NULL, 'no', NULL, 'no', '2403051'),
(55, 'CANCER DE CULO', 'si', 'SIDA ESPACIAL', 'si', '2403049'),
(56, NULL, 'no', NULL, 'no', '2403054'),
(57, NULL, 'no', NULL, 'no', '2403050'),
(58, NULL, 'no', NULL, 'no', '2403039'),
(59, NULL, 'no', NULL, 'no', '2403024'),
(60, NULL, 'no', NULL, 'no', '2403045'),
(61, NULL, 'no', NULL, 'no', '2403028'),
(62, NULL, 'no', NULL, 'no', '2403047'),
(63, NULL, 'no', NULL, 'no', '2403052'),
(64, NULL, 'no', NULL, 'no', '2403055'),
(65, NULL, 'no', NULL, 'no', '2403034'),
(66, NULL, 'no', NULL, 'no', '2403029'),
(67, NULL, 'no', NULL, 'no', '2403041'),
(68, NULL, 'no', NULL, 'no', '2403048'),
(69, 'VISTA', 'si', 'TOTONACA', 'si', '2403035'),
(70, NULL, 'no', NULL, 'no', '2403046'),
(71, NULL, 'no', NULL, 'no', '2403044'),
(72, NULL, 'no', NULL, 'no', '2403056'),
(73, NULL, 'no', NULL, 'no', '2403071'),
(74, 'VISUAL', 'no', NULL, 'si', '2403075'),
(75, NULL, NULL, NULL, NULL, '2403064'),
(76, NULL, 'no', NULL, 'no', '2403069'),
(77, NULL, 'no', NULL, 'no', '2403078'),
(78, NULL, 'no', NULL, 'no', '2403068'),
(79, NULL, 'no', NULL, 'no', '2403076'),
(80, 'NO ESCUCHO DEL OIDO IZQUIERDO', 'no', NULL, 'si', '2403079'),
(81, NULL, 'no', NULL, 'no', '2403074'),
(82, NULL, 'si', 'NAHUATL', 'no', '2403065'),
(83, 'DAWN', 'no', NULL, 'si', '2403077'),
(84, NULL, 'no', NULL, 'no', '2403062'),
(85, 'OJOS', 'no', NULL, 'si', '2403070'),
(86, NULL, 'no', NULL, 'no', '2403063'),
(87, NULL, 'no', NULL, 'no', '2403066'),
(88, NULL, 'no', NULL, 'no', '2403067'),
(89, NULL, 'si', NULL, 'no', '2403082'),
(90, NULL, 'no', NULL, 'no', '2403083'),
(91, NULL, 'no', NULL, 'no', '2403081'),
(92, NULL, 'no', NULL, 'no', '2403084'),
(93, NULL, 'no', NULL, 'no', '2403089'),
(94, NULL, 'no', NULL, 'no', '2403090'),
(95, NULL, 'no', NULL, 'no', '2403086'),
(96, NULL, 'no', NULL, 'no', '2403095'),
(97, NULL, 'no', NULL, 'no', '2403100'),
(98, 'MI MENTE', 'no', NULL, 'si', '2403092'),
(99, NULL, 'no', NULL, 'no', '2403097'),
(100, NULL, 'no', NULL, 'no', '2403099'),
(101, NULL, 'no', NULL, 'no', '2403096'),
(102, 'DISLEXICO', 'si', 'MAYA', 'si', '2403098'),
(103, NULL, 'no', NULL, 'no', '2403093'),
(104, NULL, 'no', NULL, 'no', '2403094'),
(105, NULL, 'no', NULL, 'no', '2403091'),
(106, NULL, 'no', NULL, 'no', '2403111'),
(107, NULL, 'si', 'MAYA', 'no', '2403104'),
(108, NULL, 'no', NULL, 'no', '2403106'),
(109, NULL, 'no', NULL, 'no', '2403108'),
(110, NULL, 'no', NULL, 'no', '2403112'),
(111, 'FLOJERA', 'no', NULL, 'si', '2403113'),
(112, NULL, 'no', NULL, 'no', '2403118'),
(113, NULL, 'no', NULL, 'no', '2403116'),
(114, NULL, 'no', NULL, 'no', '2403117'),
(115, NULL, 'no', NULL, 'no', '2403119'),
(116, NULL, 'no', NULL, 'no', '2403121'),
(117, NULL, 'no', NULL, 'no', '2403123'),
(118, NULL, NULL, NULL, NULL, '2403122'),
(119, NULL, 'no', NULL, 'no', '2403022'),
(120, NULL, 'no', NULL, 'no', '2403128'),
(121, NULL, 'no', NULL, 'no', '2403129'),
(122, NULL, 'no', NULL, 'no', '2403131'),
(123, NULL, 'no', NULL, 'no', '2403132'),
(124, NULL, 'no', NULL, 'no', '2403138'),
(125, NULL, 'no', NULL, 'no', '2403139'),
(126, NULL, 'no', NULL, 'no', '2403140'),
(127, NULL, 'no', NULL, 'no', '2403142'),
(128, NULL, 'no', NULL, 'no', '2403143');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_estadistica_aspirantes`
--

CREATE TABLE `utmir_estadistica_aspirantes` (
  `id` bigint(20) NOT NULL,
  `anio` int(11) NOT NULL,
  `cantidad_aspirantes_completos` int(11) NOT NULL,
  `cantidad_aspirantes_no_completados` int(11) NOT NULL,
  `matriculas_generadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_estadistica_aspirantes`
--

INSERT INTO `utmir_estadistica_aspirantes` (`id`, `anio`, `cantidad_aspirantes_completos`, `cantidad_aspirantes_no_completados`, `matriculas_generadas`) VALUES
(4, 2024, 34, 100, 134);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_estadistica_aspirantes_carrera`
--

CREATE TABLE `utmir_estadistica_aspirantes_carrera` (
  `id` bigint(20) NOT NULL,
  `cantidad_aspirantes` int(11) NOT NULL,
  `cantidad_aspirantes_completos` int(11) NOT NULL,
  `cantidad_aspirantes_no_completados` int(11) NOT NULL,
  `id_carrera` bigint(20) DEFAULT NULL,
  `anio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_estadistica_aspirantes_carrera`
--

INSERT INTO `utmir_estadistica_aspirantes_carrera` (`id`, `cantidad_aspirantes`, `cantidad_aspirantes_completos`, `cantidad_aspirantes_no_completados`, `id_carrera`, `anio`) VALUES
(13, 21, 10, 11, 3, 2024),
(14, 18, 11, 7, 4, 2024),
(15, 8, 2, 6, 5, 2024),
(16, 17, 5, 12, 1, 2024),
(17, 2, 1, 1, 12, 2023),
(18, 2, 1, 1, 4, 2023),
(19, 20, 2, 18, 12, 2024),
(20, 6, 3, 3, 9, 2024);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_evaluacion_unidad`
--

CREATE TABLE `utmir_evaluacion_unidad` (
  `id_evaluacion_unidad` bigint(20) NOT NULL,
  `fecha_evaluacion` date DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL,
  `id_unidades_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_evaluacion_unidad`
--

INSERT INTO `utmir_evaluacion_unidad` (`id_evaluacion_unidad`, `fecha_evaluacion`, `id_asignacion_asignatura`, `id_unidades_asignatura`) VALUES
(26, '2024-02-02', 70, 814),
(27, '2024-03-28', 70, 815),
(28, '2024-04-15', 70, 816),
(29, '2024-02-24', 72, 814),
(30, '2024-02-17', 74, 814),
(31, '2024-02-16', 75, 635);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_examen_admision`
--

CREATE TABLE `utmir_examen_admision` (
  `id_examen_admision` bigint(20) NOT NULL,
  `aciertos` int(11) DEFAULT NULL,
  `calificacion` varchar(255) DEFAULT NULL,
  `total_aciertos` int(11) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_examen_admision`
--

INSERT INTO `utmir_examen_admision` (`id_examen_admision`, `aciertos`, `calificacion`, `total_aciertos`, `matricula`) VALUES
(1, 100, '8.33', 120, '2303002'),
(2, 132, '5.28', 250, '2303003'),
(3, 231, '9.24', 250, '2303005'),
(4, 175, '7.00', 250, '2303016'),
(5, 36, '3.00', 120, '2303017'),
(6, 85, '7.08', 120, '2303018'),
(7, 105, '8.75', 120, '2303019'),
(8, 220, '8.80', 250, '2303020'),
(9, 169, '6.76', 250, '2403001'),
(10, 121, '4.84', 250, '2303027'),
(11, 100, '8.33', 120, '2403002'),
(12, 200, '8.00', 250, '2303026'),
(13, 200, '8.00', 250, '2403004'),
(14, NULL, NULL, NULL, '2303025'),
(15, 24, '2.00', 120, '2303024'),
(16, 185, '7.40', 250, '2403007'),
(17, 102, '8.50', 120, '2403008'),
(18, 63, '5.25', 120, '2403009'),
(19, 61, '5.08', 120, '2403011'),
(20, 120, '10.00', 120, '2403012'),
(21, 150, '6.00', 250, '2403006'),
(22, 120, '10.00', 120, '2403010'),
(23, 103, '8.58', 120, '2403013'),
(24, 100, '8.33', 120, '2403016'),
(25, 200, '8.00', 250, '2403014'),
(26, 150, '6.00', 250, '2403015'),
(27, 100, '8.33', 120, '2403021'),
(28, 120, '10.00', 120, '2403020'),
(29, 111, '9.25', 120, '2403017'),
(30, NULL, NULL, NULL, '2403018'),
(31, 100, '8.33', 120, '2403047'),
(32, NULL, NULL, NULL, '2403048'),
(33, 5, '0.42', 120, '2403049'),
(34, NULL, NULL, NULL, '2403050'),
(35, NULL, NULL, NULL, '2403051'),
(36, NULL, NULL, NULL, '2403052'),
(37, NULL, NULL, NULL, '2403053'),
(38, NULL, NULL, NULL, '2403054'),
(39, NULL, NULL, NULL, '2403055'),
(40, 56, '4.67', 120, '2403062'),
(41, 120, '10.00', 120, '2403063'),
(42, NULL, NULL, NULL, '2403065'),
(43, NULL, NULL, NULL, '2403066'),
(44, NULL, NULL, NULL, '2403067'),
(45, 100, '8.33', 120, '2403071'),
(46, 98, '8.17', 120, '2403074'),
(47, NULL, NULL, NULL, '2403075'),
(48, 100, '8.33', 120, '2403076'),
(49, NULL, NULL, NULL, '2403068'),
(50, 105, '8.75', 120, '2403069'),
(51, 110, '9.17', 120, '2403070'),
(52, 100, '8.33', 120, '2403077'),
(53, NULL, NULL, NULL, '2403083'),
(54, 102, '8.50', 120, '2403078'),
(55, NULL, NULL, NULL, '2403079'),
(56, NULL, NULL, NULL, '2403081'),
(57, 100, '8.33', 120, '2403082'),
(58, NULL, NULL, NULL, '2403084'),
(59, NULL, NULL, NULL, '2403086'),
(60, NULL, NULL, NULL, '2403089'),
(61, NULL, NULL, NULL, '2403090'),
(62, NULL, NULL, NULL, '2403091'),
(63, NULL, NULL, NULL, '2403096'),
(64, NULL, NULL, NULL, '2403097'),
(65, NULL, NULL, NULL, '2403098'),
(66, NULL, NULL, NULL, '2403099'),
(68, NULL, NULL, NULL, '2403104'),
(69, NULL, NULL, NULL, '2403108'),
(70, 120, '10.00', 120, '2303001'),
(71, NULL, NULL, NULL, '2303021'),
(72, NULL, NULL, NULL, '2303022'),
(73, NULL, NULL, NULL, '2303023'),
(74, NULL, NULL, NULL, '2403128'),
(76, 95, '7.92', 120, '2403025'),
(77, 105, '8.75', 120, '2403026'),
(78, 52, '4.33', 120, '2403131'),
(79, 89, '7.42', 120, '2403132'),
(80, 100, '8.33', 120, '2303013'),
(81, NULL, NULL, NULL, '2403045'),
(82, 120, '10.00', 120, '2303014'),
(83, 87, '7.25', 120, '2303015'),
(84, NULL, NULL, NULL, '2403039'),
(85, NULL, NULL, NULL, '2403022'),
(86, NULL, NULL, NULL, '2403024'),
(87, NULL, NULL, NULL, '2403027'),
(88, NULL, NULL, NULL, '2403033'),
(89, NULL, NULL, NULL, '2403034'),
(90, NULL, NULL, NULL, '2403029'),
(91, NULL, NULL, NULL, '2403032'),
(92, NULL, NULL, NULL, '2403028'),
(93, NULL, NULL, NULL, '2403038'),
(94, NULL, NULL, NULL, '2403093'),
(96, 100, '8.33', 120, '2403139'),
(97, 85, '7.08', 120, '2403140'),
(98, 95, '7.92', 120, '2403142'),
(99, NULL, NULL, NULL, '2403041'),
(100, NULL, NULL, NULL, '2403044');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_fecha_unidades`
--

CREATE TABLE `utmir_fecha_unidades` (
  `id_fechas_unidades` bigint(20) NOT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_unidades_asignatura` bigint(20) DEFAULT NULL,
  `fecha_remedial` date DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `total_clases_unidad` int(11) DEFAULT NULL,
  `clases_activas` int(11) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_fecha_unidades`
--

INSERT INTO `utmir_fecha_unidades` (`id_fechas_unidades`, `fecha_cierre`, `fecha_inicio`, `status`, `matricula`, `id_unidades_asignatura`, `fecha_remedial`, `id_grupo`, `total_clases_unidad`, `clases_activas`, `id_asignacion_asignatura`) VALUES
(37, '2024-02-02', '2024-01-08', b'1', '198', 814, '2024-02-02', 1, NULL, 8, 70),
(38, '2024-03-28', '2024-02-06', b'1', '198', 815, '2024-02-16', 1, NULL, 14, 70),
(39, '2024-02-17', '2024-02-16', b'1', '198', 817, NULL, 1, NULL, 1, 71),
(40, '2024-02-17', '2024-02-11', b'1', '71', 814, NULL, 2, NULL, 2, 72),
(41, '2024-02-29', '2024-02-01', b'1', '198', 814, NULL, 1, NULL, 15, 74),
(42, '2024-02-29', '2024-02-12', b'1', '198', 635, '2024-02-17', 1, NULL, 3, 75),
(43, '2024-02-23', '2024-02-16', b'1', '198', 636, '2024-02-23', 1, NULL, 5, 75),
(44, '2024-04-12', '2024-03-18', b'1', '198', 819, NULL, 1, NULL, 12, 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_genero`
--

CREATE TABLE `utmir_genero` (
  `id_genero` bigint(20) NOT NULL,
  `genero` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_genero`
--

INSERT INTO `utmir_genero` (`id_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_grupos`
--

CREATE TABLE `utmir_grupos` (
  `id` bigint(20) NOT NULL,
  `grupo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_grupos`
--

INSERT INTO `utmir_grupos` (`id`, `grupo`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_informacion_academica`
--

CREATE TABLE `utmir_informacion_academica` (
  `id` bigint(20) NOT NULL,
  `correo_institucional` varchar(255) DEFAULT NULL,
  `turno` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_cuatrimestre` bigint(20) DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `id_periodo` bigint(20) DEFAULT NULL,
  `programa_educativo` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_informacion_academica`
--

INSERT INTO `utmir_informacion_academica` (`id`, `correo_institucional`, `turno`, `matricula`, `id_cuatrimestre`, `id_grupo`, `id_periodo`, `programa_educativo`, `id_status`) VALUES
(28, NULL, NULL, '2303003', 11, 1, NULL, 10, 1),
(30, NULL, NULL, '2303010', 11, 1, NULL, 10, 1),
(31, NULL, NULL, '2303011', 11, 2, NULL, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_informacion_medica`
--

CREATE TABLE `utmir_informacion_medica` (
  `id_info_medica` bigint(20) NOT NULL,
  `alergias` varchar(255) DEFAULT NULL,
  `tiene_alergias` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_tipo_sangre` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_informacion_medica`
--

INSERT INTO `utmir_informacion_medica` (`id_info_medica`, `alergias`, `tiene_alergias`, `matricula`, `id_tipo_sangre`) VALUES
(1, NULL, 'no', '2303001', 3),
(2, NULL, 'no', '2303002', 3),
(3, NULL, 'no', '2303003', 2),
(4, NULL, 'no', '2303005', 3),
(5, NULL, 'no', '2303007', 3),
(6, NULL, 'no', '2303006', 3),
(7, NULL, 'no', '2303008', 3),
(8, NULL, 'no', '2303009', 4),
(9, NULL, 'no', '2303010', 3),
(10, NULL, 'no', '2303011', 3),
(11, NULL, 'no', '2303012', 3),
(12, NULL, 'no', '2303013', 5),
(13, NULL, 'no', '2303014', 5),
(14, NULL, 'no', '2303015', 4),
(15, 'a los perros', 'si', '2303016', 1),
(16, NULL, 'no', '2303017', 6),
(17, NULL, 'no', '2303018', 4),
(18, 'SDUFGU QJWDHQB', 'si', '2303019', 3),
(19, NULL, 'no', '2303020', 3),
(20, NULL, 'no', '2303021', 4),
(21, NULL, 'no', '2303022', 4),
(22, NULL, 'no', '2303024', 3),
(23, NULL, 'no', '2303025', 5),
(24, 'POLVO', 'si', '2303023', 3),
(25, 'POLVO', 'si', '2303026', 3),
(26, NULL, 'no', '2303027', 4),
(27, NULL, 'no', '2403001', 4),
(28, NULL, 'no', '2403002', 4),
(29, NULL, 'no', '2403004', 2),
(30, NULL, 'no', '2403007', 4),
(31, NULL, 'no', '2403008', 5),
(32, NULL, 'no', '2403009', 2),
(33, NULL, 'no', '2403010', 3),
(34, NULL, 'no', '2403011', 4),
(35, NULL, 'no', '2403012', 5),
(36, NULL, 'no', '2403006', 1),
(37, NULL, 'no', '2403013', 3),
(38, NULL, 'no', '2403014', 5),
(39, NULL, 'no', '2403015', 2),
(40, NULL, 'no', '2403016', 5),
(41, NULL, 'no', '2403017', 8),
(42, NULL, 'si', '2403018', 5),
(43, NULL, 'no', '2403020', 3),
(44, NULL, 'no', '2403021', 2),
(45, 'KKKKK', 'si', '2403038', 8),
(46, NULL, 'no', '2403042', 1),
(47, NULL, 'no', '2403037', 1),
(48, NULL, 'no', '2403025', 1),
(49, 'AL POLVO', 'si', '2403053', 1),
(50, 'A LAS BALAS ', 'si', '2403033', 7),
(51, NULL, 'no', '2403032', 8),
(52, NULL, 'no', '2403026', 7),
(53, NULL, 'no', '2403027', 8),
(54, 'POLVO', 'si', '2403051', 1),
(55, 'AL PENE', 'si', '2403049', 1),
(56, NULL, 'no', '2403054', 7),
(57, NULL, 'no', '2403050', 5),
(58, NULL, 'no', '2403039', 3),
(59, NULL, 'no', '2403024', 1),
(60, NULL, 'no', '2403045', 1),
(61, NULL, 'si', '2403028', 1),
(62, NULL, 'no', '2403047', 7),
(63, NULL, 'no', '2403052', 3),
(64, NULL, 'no', '2403055', 1),
(65, NULL, 'no', '2403034', 1),
(66, NULL, 'no', '2403029', 7),
(67, NULL, 'no', '2403041', 1),
(68, NULL, 'no', '2403048', 7),
(69, 'SOL', 'si', '2403035', 1),
(70, NULL, 'no', '2403046', 7),
(71, NULL, 'no', '2403044', 1),
(72, NULL, 'no', '2403056', 3),
(73, 'RINITIS', 'no', '2403071', 1),
(74, NULL, 'no', '2403075', 7),
(75, NULL, NULL, '2403064', NULL),
(76, NULL, 'no', '2403069', 7),
(77, NULL, 'no', '2403078', 1),
(78, 'NUEZ', 'si', '2403068', 8),
(79, NULL, 'no', '2403076', 7),
(80, NULL, 'no', '2403079', 1),
(81, NULL, 'no', '2403074', 3),
(82, 'POLEN', 'si', '2403065', 2),
(83, 'A LAS BALAS', 'si', '2403077', 4),
(84, NULL, 'no', '2403062', 7),
(85, 'A LAS MUJERES', 'si', '2403070', 8),
(86, NULL, 'no', '2403063', 5),
(87, NULL, 'no', '2403066', 3),
(88, NULL, 'no', '2403067', 7),
(89, NULL, 'no', '2403082', 2),
(90, NULL, 'no', '2403083', 1),
(91, NULL, 'no', '2403081', 1),
(92, NULL, 'no', '2403084', 7),
(93, NULL, 'no', '2403089', 1),
(94, NULL, 'no', '2403090', 3),
(95, NULL, 'no', '2403086', 7),
(96, NULL, 'no', '2403095', 2),
(97, NULL, 'no', '2403100', 4),
(98, 'ESCUELA', 'si', '2403092', 2),
(99, NULL, 'no', '2403097', 2),
(100, NULL, 'no', '2403099', 3),
(101, NULL, 'no', '2403096', 5),
(102, 'A LA ESCUALA', 'si', '2403098', 5),
(103, NULL, 'no', '2403093', 8),
(104, NULL, 'no', '2403094', 3),
(105, NULL, 'no', '2403091', 2),
(106, NULL, 'no', '2403111', 2),
(107, 'PARACETAMOL', 'si', '2403104', 6),
(108, NULL, 'no', '2403106', 7),
(109, 'ERIK', 'si', '2403108', 1),
(110, NULL, 'no', '2403112', 7),
(111, NULL, 'no', '2403113', 1),
(112, NULL, 'no', '2403118', 3),
(113, NULL, 'no', '2403116', 8),
(114, NULL, 'no', '2403117', 1),
(115, NULL, 'no', '2403119', 5),
(116, NULL, 'no', '2403121', 2),
(117, NULL, 'no', '2403123', 3),
(118, NULL, NULL, '2403122', NULL),
(119, NULL, 'no', '2403022', 3),
(120, NULL, 'no', '2403128', 4),
(121, NULL, 'no', '2403129', 4),
(122, NULL, 'no', '2403131', 5),
(123, NULL, 'no', '2403132', 3),
(124, NULL, 'no', '2403138', 3),
(125, NULL, 'no', '2403139', 3),
(126, NULL, 'no', '2403140', 4),
(127, NULL, 'no', '2403142', 2),
(128, NULL, 'no', '2403143', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_info_personal`
--

CREATE TABLE `utmir_info_personal` (
  `matricula` varchar(20) NOT NULL,
  `ap_materno` varchar(100) DEFAULT NULL,
  `ap_paterno` varchar(100) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `edad` varchar(3) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `localidad_nacimiento` varchar(100) DEFAULT NULL,
  `municipio_nacimiento` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nss` varchar(30) DEFAULT NULL,
  `numero_telefonico` varchar(15) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `id_estados_mexico` bigint(20) DEFAULT NULL,
  `id_genero` bigint(20) DEFAULT NULL,
  `id_nacionalidad` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) DEFAULT NULL,
  `asp_etapa` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_info_personal`
--

INSERT INTO `utmir_info_personal` (`matricula`, `ap_materno`, `ap_paterno`, `curp`, `edad`, `email`, `fecha_nacimiento`, `localidad_nacimiento`, `municipio_nacimiento`, `nombre`, `nss`, `numero_telefonico`, `password`, `rfc`, `id_estados_mexico`, `id_genero`, `id_nacionalidad`, `id_status`, `asp_etapa`, `fecha_registro`) VALUES
('101', NULL, NULL, NULL, NULL, 'administrador@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$RH81gxiFIUATMaU4uIxIjeMQfRkOy3LStuZA7tskFy5N1d2CzEvl.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('102', NULL, NULL, NULL, NULL, 'vinculacion2@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$HcxrWeSXAc1HVp4ziTFS3OnKghTt1wZehv6uC1L0pavEXCvNzHvtS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('103', NULL, NULL, NULL, NULL, 'finan@admi.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$1FiwxFush6FCrM9IGtfbmOLoGUtJFEsavAC/3uP1dealk0wUhheJy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('104', NULL, NULL, NULL, NULL, 'vinc@utmir.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$GROuiKpw.n8fsl9oCqydnOz7yXME5o92bQiooMbaoLgLWySEUH84q', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('105', NULL, NULL, NULL, NULL, 'servicios.escolares@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$OPz3XKVdYY0quC08KIk20udEuEZEh6ZPfyYoYDk1WKY8mb0O3gkKW', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('110', NULL, NULL, NULL, NULL, 'direccion.academica@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$WfyghhkYfkHAlnqLoGnNY.xdLx6se/oOrLZrlU7vceK7CHnEhryly', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('15', NULL, NULL, NULL, NULL, 'vinc@edu.mc', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$WNiJxqpV/4G2VXT3CEaESeslEr22yfZz1OI7UDij70i6D.gQ.YH3m', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('160', NULL, NULL, NULL, NULL, 'vane.vane@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$3SiL36Ez/eWtq.ANgeX2XuDiGuFSLz4Id2T/QXQeiFcmhgww//Ejm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('164', NULL, NULL, 'VEHA', NULL, 'alanvelazquez@test.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$V8gDOL743qHtPkwc/iJ3EuYLZBsS.39LSwf9LJk.ClTFPi0/GtLrW', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('198', NULL, NULL, NULL, NULL, 'finanzasdeprueba@tet.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$imr35PolGk6/tNF3PXiIeuj5u9tVnWVYVgWop42bPopIgww.Tx0Ya', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2303001', 'HERNÁNDEZ', 'VELÁZQUEZ', 'VEHA011108HMCLRLA4', '22', 'alan.velazquez@utmir.edu.mx', '2001-11-09', 'SAN AGUSTIN', 'ECATEPEC DE MORELOS', 'ALAN', 'nss', '7713069010', '$2a$10$dnF..11g0y5kKwqssCGh/Omc0tMEr/9F9osq/QFzk5yuama01JW2q', 'RFC', 15, 1, 1, 1, '5', '2024-01-04'),
('2303002', 'REGISTRO', 'DE', 'HAHAHAHA', '25', 'aa@aa.com', '2001-11-08', 'HIDO', 'ELP', 'PRUEBA', 'nss02', '7713000', '$2a$10$7dB/jacfUUb88S2nBnKDAuptGBYoXoyUf69tolhKXhwR1qlvRZ29y', 'rfcdematricula02', 13, 1, 1, NULL, '5', '2023-11-30'),
('2303003', 'E', 'E', 'VEHA0110', '01', 'registro@registro.com', '2001-11-08', 'ASD', 'ASD', 'as', NULL, '7741', '$2a$10$WpQr.Z9JDn6UUS6NUojXouSwbElv2Oq.2GGFmCSHnSToeIxWiVOgi', NULL, 18, 2, 1, NULL, '101', '2023-12-07'),
('2303005', 'BETH', 'LI', 'yoli', '16', 'yolibethama@gmail.com', '2001-02-08', 'LELE', 'LELE', 'YOL', NULL, '77115', '$2a$10$mktcAjaoI397/GpYd.RwAumhS6uTHXEDBetGYmgysgJhVPM2BBAaK', NULL, 14, 1, 1, NULL, '3', '2023-12-16'),
('2303006', 'as', 'asd', '12312312123', '12', 'fecha@gech.com', '2001-11-08', '12', '12', 'as', NULL, '2134', '$2a$10$jll.YnGZNW6Hrh5vSF4LL.pY7YP9P3pv4j40XzbAghyqTDeH.bxHC', NULL, 18, 1, 1, NULL, NULL, '2023-11-30'),
('2303007', 'TESTING', 'TESTING', 'loney', '12', 'asas@lone.com', '2023-11-30', '21', '12', 'TESTING', NULL, '12', '$2a$10$6IGObzG3f6DkxkeilYGLGOrCqKeKO3K9iyCIGTMtEVHR8iwo.PaA6', NULL, 17, 1, 1, NULL, NULL, '2023-11-30'),
('2303008', 'ELPEPE', 'ELPEPE', '1231321123123', '12', 'ala@ala.com', '2001-07-08', 'ELPEPE', 'ELPEPE', 'ELPEPE', NULL, '879749', '$2a$10$4bT8PXQuo8L1Kwvzr/kJ1.GTp5HJULhtuVCe0vPRmIJgLrwjvkWQy', NULL, 9, 1, 2, NULL, NULL, '2023-11-30'),
('2303009', 'SAS', 'SAS', '1239', '12', '1@1.com', '2001-11-08', 'SAS', 'AS', 'SAS', NULL, '778948', '$2a$10$qrX0bwH9ukrLYlUj7.RgYemUSFEgc33PgTBQuzlIVu2dLDBoA5XIi', NULL, 13, 1, 2, NULL, NULL, '2023-11-30'),
('2303010', 'ALA', 'AL', 'ALLAHU', '22', 'alahuakbar@gmail.com', '2001-11-08', 'ALA', 'ALA', 'ALA', NULL, '745415', '$2a$10$8Ho8vCxPamf4GxbQuml0J.EsUsBtE6M9rxH0P0mLuRKZ0y.qFes36', NULL, 13, 1, 2, NULL, NULL, '2023-12-02'),
('2303011', 'TITO', 'TITO', '1231231', '12', 'AS@com.com', '2001-11-08', 'TITO', 'TITO', 'TITO', NULL, 'TITO', '$2a$10$pQLGVgh/Mkrh2mOeXJj49OB6irYnr1JsEruXqOKQGDh/ZwbjpFtwi', NULL, 7, 1, 1, NULL, NULL, '2023-12-02'),
('2303012', 'PEPEPON', 'PEPEPON', 'ELPEPE', '15', 'pepe@pe.com', '2001-11-08', 'PEPEPON', 'PEPEPON', 'PEPEPON', NULL, '7770', '$2a$10$OKgs6yuPTEy4uTQRTOf.WumOMCQzpFVtz4A5iiyAuBkzw.CoRjnTq', NULL, 2, 1, 2, NULL, NULL, '2023-12-05'),
('2303013', 'IOASDO', 'IOASDO', 'IOASDO', '12', 'ooo@io.com', '2001-11-08', 'IOASDO', 'IOASDO', 'IOASDO', NULL, '54545', '$2a$10$tkWkmwNy.64IlgZVAhk19enXRSKeK5lBEim49mv.aMnBwuMMUPmLy', NULL, 16, 1, 1, NULL, '3', '2023-12-05'),
('2303014', 'as', 'as', 'PEPETE', '12', 'PEPETE@gmail.com', '2001-11-08', 'as', 'as', 'as', NULL, '546415', '$2a$10$pBnjhScnVGFpI/mfm5310.Rsdj.c1utdogrUOO2JEILlq.087SxN.', NULL, 3, 2, 1, NULL, '3', '2023-12-06'),
('2303015', 'JEJE', 'JEJE', 'JEJE', '19', 'PEPETE2@gmail.com', '2001-11-05', 'JEJE', 'JEJE', 'JEJE', NULL, '56454645', '$2a$10$z6wvcNko1NOXVr9Wj3Q2AuOX3GJXz7zfM/XsOexOMqRvhLskWFEMC', NULL, 17, 1, 2, NULL, '3', '2023-12-07'),
('2303016', 'c', 'c', 'cfdgfxinnn', '123', 'kmaoudyf@utmir.edu.mx', '2200-03-12', 'asdfghj', 'sdfghjkl', 'c', NULL, '12345678', '$2a$10$tlSROk37eO1ETaWQTq6pUuz/Qu7tNsYBxNSe04LPpaQpd2wQWnXMi', NULL, 2, 2, 2, NULL, '3', '2023-12-07'),
('2303017', 'ALVARADO', 'FERNÁNDEZ', 'AVEHA0112', '25', 'alanvelaz24@gmail.com', '1998-05-09', 'ASAS', 'MICHO', 'TUSA', NULL, '7877818', '$2a$10$0QL90g6E9itMGvXCySStfuf2ezSV/TixsVkZCcBbnpDOlgOgtbpLK', NULL, 33, 2, 2, NULL, '4', '2023-12-09'),
('2303018', 'NIETO', 'PEÑA', 'ESPONJAAS', '18', 'enriquepena@gmail.com', '2001-11-08', 'ASD', 'ELP', 'ENRIQUE', NULL, '77130007878', '$2a$10$lU/GaJL5uWNNrowaGZZ49e6SeTG8w3LkWyaZmIlPS5kiiDJUgpd9O', NULL, 17, 1, 1, NULL, '3', '2023-12-12'),
('2303019', 'ALAN', 'ALAN', 'CURP321', '46', 'correo@fake.com', '1984-11-17', 'LOCALIDAD', 'MUNICIPIO', 'ALAN', NULL, '775567878', '$2a$10$Qqr7M3jsoJ60iMZ4utqSGub5R8RDwMHxVCAtcC7sZBS2/xvNgJWEG', NULL, 4, 1, 1, NULL, '3', '2023-12-12'),
('2303020', 'EPE', 'EPE', 'CUROPO', '23', 'isjaja@gmail.com', '2001-11-08', 'EPE', 'EPE', 'EPE', NULL, '4645648', '$2a$10$8yU72udN4oDPKp.u.YPiWOmwk8vjQn3HAv0b37jibsCcw.WEroYE2', NULL, 10, 1, 1, NULL, '5', '2023-12-18'),
('2303021', 'Hdez', 'Ape', '12345678900as', '23', 'testeodematricula@test.com', '1998-11-20', 'MUNUI', 'LOCVA', 'Noe', NULL, '78794815', '$2a$10$bDYtMvwSXVxLJHwI55iTBuUKU5RrTp6BBDWpdMFDPFJ7FF8oA7OQm', NULL, 3, 1, 1, NULL, '3', '2023-12-21'),
('2303022', 'MAYUS', 'MAYUS', 'OPPOO', '24', 'ooop@gmail.com', '2001-02-12', 'AS', 'MAYUS', 'MAYUS', NULL, '771523315', '$2a$10$kf..PlN.eZUqFflKeR3dRekfx5Z1d5wlHOgA5Jzrj5OVw1nLtjCmm', NULL, 18, 1, 1, NULL, '3', '2023-12-21'),
('2303023', 'CAMPOS', 'MARTINEZ', 'KSAJDSAOSAD', '26', 'uncorreo@algofake.com', '1997-03-05', 'DC', 'WASHINGTON', 'ISRA', 'NSSDEPRUEBA', '7718596336', '$2a$10$BxYsSRvBMuNbbswJrZLieuga.imnZaYg5HzfMGWke2RieA6.saInW', 'RFCDEPRUEBA', 33, 1, 1, NULL, '3', '2023-12-23'),
('2303024', 'ASD', 'ASD', 'OWROEWO', '23', 'noelinarte@utmir.edu.mx', '2000-12-23', 'ASDASD', 'ASDAS', 'ASD', NULL, '7847848', '$2a$10$J2jGCg5g8Fk/XkEh6mx9SO1ev72WKiw.D3qkl0MRCRVWRswfBnbDm', NULL, 18, 2, 1, NULL, '3', '2023-12-23'),
('2303025', 'DURA', 'DURA', 'TUSADEMELON', '25', 'uncorreo@sjot.com', '1998-05-23', 'SAN AGUSTIN', 'ESCA', 'DURA', NULL, '784155664', '$2a$10$PnJ5HgeE2SPi.CJCUH.GSeU/cNP2APbaeggbjOjCvDlg.aLJpFYdO', NULL, 9, 1, 2, NULL, '3', '2023-12-23'),
('2303026', 'RODRIGUEZ', 'HERNANDEZ', 'CORREFAKEPARADEMO', '26', 'correfake@gmail.coma', '1997-03-11', 'PASEOS DE CHAVARRIA', 'ACAXOCHITLAN', 'VANESSA', NULL, '7712563696', '$2a$10$3t2sJynVjYyzHnargurr8u.50ORFi25HiOI/prW7buW4sYtpgHUwm', NULL, 3, 2, 1, NULL, '4', '2023-12-27'),
('2303027', 'SERRANO', 'URIEL', 'ASPMASDM', '20', 'examne@admision.com', '2003-11-08', 'SAN A', 'ECTAPE', 'ANDRES', NULL, '778929', '$2a$10$UH8LuzHqFOkhDCh5ug1b/OaJt.qrCAkFiIKkvESIYXhAgoDcPlf9W', NULL, 9, 1, 2, NULL, '4', '2023-12-27'),
('2403001', NULL, NULL, '1asnmueueue', NULL, 'asdasdas@com.amasmmasmas', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$kykt.U1La3Do4c7y13NAnOXtUfNus3Vf7CzeuRw05yaoyqV9PnhRK', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403002', 'PEPADOR', 'PEPADOR', 'ASDJDASJNNASDOASD12|', '20', 'emasdmas@emmasd.com', '2003-02-05', 'PEPADOR', 'PEPADOR', 'PEPADOR', NULL, 'PEPADOR', '$2a$10$H7pEoIQJCzsKE3mLUd2M.u.51v82qPIgLVKtuFN2KeE6rDm5qXvgG', NULL, 21, 1, 1, NULL, '3', '2024-01-04'),
('2403003', NULL, NULL, 'mlasdkdkmas', NULL, 'asdasd@camasc.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$MPbEYvQ9zE4sDSVOeV4Fy.DNVsv0e8HlKbw5au1jBFMlWKNxvaBoC', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-04'),
('2403004', 'ELELE', 'ELELE', 'ASADSASD1221', '17', 'asdaasd@camasc.com', '2006-06-06', 'ELELE', 'ELELE', 'ELELE', NULL, '5155', '$2a$10$PSYgWeg42x9nONEcosnPgOkNpzaF03WOlVtZTGfzP/zZgI.RoBldu', NULL, 3, 2, 1, NULL, '4', '2024-01-07'),
('2403005', NULL, NULL, 'popmmmp', NULL, 'llkll@llasd.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$z2f4jdSdDm0uzUhYPIKYU.A2wNS1EznEdyfkaJdhFKTMyaFtPCgzS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-05'),
('2403006', 'ASCSASCZZ', 'ASCSASCZZ', 'PPLPPPPP', '22', '1866010@comaaaa.com', '2001-11-08', 'ASCSASCZZ', 'ASCSASCZZ', 'ASCSASCZZ', NULL, 'a4as6', '$2a$10$WSee1W6sGuHIanCmtmN6a.7nASt95T4mXnnhlxXPMjLNHLEqKhUUG', NULL, 8, 2, 1, NULL, '3', '2024-01-05'),
('2403007', 'IJIJIA', 'IJIJIA', 'IJIJIA', '22', 'ijiji@ijiji.com', '2001-05-05', 'IJIJIA', 'AAS', 'IJIJIA', NULL, '7848145156', '$2a$10$D6FLHld0iccDmd6VmqrxTeCMZYdCLl.Ch.UZgG96OCpvyC0NyMiza', NULL, 15, 1, 1, NULL, '3', '2024-01-04'),
('2403008', 'AAASDAS', 'AAASDAS', '12345SSD', '23', 'pepe@pp.com', '2000-09-05', 'AAASDAS', 'AAASDAS', 'AAASDAS', NULL, 'AAASDAS', '$2a$10$pfjjF3jZdnNK6cDlSgqlTe3SeaN1dngTIWtOD55K3WrBq.3.Ry5f6', NULL, 8, 1, 1, NULL, '3', '2024-01-04'),
('2403009', 'OSSS', 'OSSS', 'CORREFAKEDEOSS', '15', 'correfakedeossss@gmail.coma', '2008-05-08', 'ASDDAS', 'SADASASD', 'OSSS', NULL, '1521556', '$2a$10$4IOrdddw.wwqW49YONfOaeSn/sE89pxl5YXZdv3lP5uLuN7ZQD8k.', NULL, 14, 1, 1, NULL, '4', '2024-01-04'),
('2403010', 'SUERTE', 'SUERTE', '12131JMASDMAS', '20', 'unnuevotest@suwerte.com', '2003-02-05', 'SUERTE', 'SUERTE', 'SUERTE', NULL, '123123', '$2a$10$ww96YI9eeYGTt1T0IbIeHOTOPB6QvT1NZ8mg85pCNfFIzuiFjgMSK', NULL, 17, 1, 2, NULL, '5', '2024-01-04'),
('2403011', 'ELELELEL', 'ELELELEL', '123456ASCAS', '5', 'asdas@com.commmm', '2018-05-05', 'ELELELEL', 'ELELELEL', 'ELELELEL', NULL, '455641', '$2a$10$0DykU3PPzhiHERKelEjtDu2j03WXJroRkMjElK8QxbJ4t2xpkE7FK', NULL, 8, 1, 1, NULL, '4', '2024-01-04'),
('2403012', 'NEW', 'NEW', 'NEWEWUWEU', '19', 'asasnewww@new.com', '2004-05-08', 'NEW', 'NEW', 'NEW', NULL, '12312', '$2a$10$Wd9yihvUW1pZVVcutjOsRuxRiu4NAPB4JjXNxnJPy6BSBCTF9Vh1K', NULL, 8, 1, 1, NULL, '4', '2024-01-04'),
('2403013', 'AS', 'AS', 'REGIST', '21', 'register.com@com.com', '2003-01-05', 'AS', 'AS', 'AS', NULL, '7778265', '$2a$10$5vtI0FKJsbK5DOeugLnwnOpbybz4igl6RkwbP/asjXtOHTTDb4HsS', NULL, 14, 1, 1, NULL, '3', '2024-01-05'),
('2403014', 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', '17', 'otramas@iot.com', '2006-02-26', 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', NULL, '778016', '$2a$10$VZryrfz.0Rq7JBC/z7uZyOIzYm38g8bX0fxlDMVrcmAE.pK4nG/Qe', NULL, 9, 1, 1, NULL, '3', '2024-01-05'),
('2403015', 'GASTROO', 'GASTROO', 'GASTROO', '22', 'gastr@fgast.com', '2001-12-08', 'GASTROO', '1AS', 'GASTROO', NULL, 'GASTROO', '$2a$10$KMg3pJbSzP/qtai.cJQAb.JUbflt.EsKDptzPCG.0zFalm3k8c2K6', NULL, 9, 1, 2, NULL, '3', '2024-01-05'),
('2403016', 'AGASFAO', 'AGASFAO', '1JKASCGASTROO', '17', 'gasto@g.com', '2006-11-08', 'AGASFAO', 'AGASFAO', 'AGASFAO', NULL, '56416+', '$2a$10$FWlSvZQv7rvqo7CI.1RtIu.mXg61gMrIJBThzQPh9FnpzrXNzDBMm', NULL, 9, 1, 1, NULL, '3', '2024-01-05'),
('2403017', 'ALAM', 'ALAM', 'ALASNVELAS2RASD', '15', 'alan.velazquez233@utmir.edu.mx', '2008-02-05', 'ALAM', 'ALAM', 'ALAM', NULL, '77781', '$2a$10$55D39udLsa6D.33L2vVHRu6KlQvEwimHhA6Lvd3IdHT9mPTTFDRNK', NULL, 11, 1, 1, NULL, '4', '2024-01-06'),
('2403018', 'OTRO', 'OTRO', '123ASFOTRO', '20', 'Otrooooooooooo@com.com', '2003-06-05', 'OTRO', 'OTRO', 'OTRO', NULL, '848949+49+', '$2a$10$E64vu/9C640wz/9E4acYk.cZAH2w//MYjMXufhBC1.Vx390P3IyS.', NULL, 9, 1, 1, NULL, '5', '2024-01-06'),
('2403019', NULL, NULL, 'generaraaaaa', NULL, 'generar@nuevamatr.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$gsk7MBUjQK8ELF6.VOAs5uTtc31hqRtvP2eKrHtFr6VFnrwodqvFi', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403020', 'JEJE', 'JEJE', 'OTRAMATERICULA1', '17', 'torto@com.com', '2006-05-08', 'JEJE', 'JEJE', 'JEJE', NULL, 'JEJE', '$2a$10$j09jALoKGnwlP73uWNRU2ejN926TCpbtuun/xDrguEkBRnegAoNXq', NULL, 33, 2, 2, NULL, '5', '2024-01-09'),
('2403021', 'LOGOOO', 'LOGOOO', 'LOGOOO', '22', 'pruebadelogo@log.com', '2001-11-08', 'LOGOOO', 'LOGOOO', 'LOGOOO', NULL, 'LOGOOO', '$2a$10$SIjSsO3w4XQBQWz3UNwuQOZ9bigF436llhIAcKRcNDFcwjBqXswOW', NULL, 15, 1, 2, NULL, '3', '2024-01-09'),
('2403022', 'HERNANDEZ', 'VELAZQUEZ', '123456789012345678', '22', 'alasl@cmasm.com', '2001-11-08', 'ASDAS', '78485', 'ALAN', NULL, '1234567890', '$2a$10$2l..54K1K2WCCpPI9.2MMuoTQ7dXh5U9mIpptxf/pi2cvGfhvexRW', NULL, 15, 1, 1, NULL, '3', '2024-01-12'),
('2403023', NULL, NULL, '15483357656', NULL, 'dvjbnr@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$uxPPLXd0TUs5w1YmDrK8JOnwO6oXUNbK1BiIJ1KYUmoHZ37QpzF5e', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403024', 'CRUZ', 'RUTA', 'RIPM050212MHGVCXA8', '523', '2303074@utmir.edu.mx', '1500-01-24', 'MEXICO', 'MEXICO', 'SANTIAGO AGUILAR ', NULL, '77121345679995', '$2a$10$05icIqKtBcdpr9Y84ONOb.hvNieDfRShXOiON3TWaFu0vjIdeVO5K', NULL, 30, 1, 1, NULL, '3', '2024-01-09'),
('2403025', 'PEREZ', 'POBREZA', 'MALI050428MHGRNRA0', '18', 'jaquelinemartinezluna28@gmail.com', '2005-03-08', 'HIDALGO ', 'PAPACUATLA', 'PETRA ', NULL, '2589741', '$2a$10$BZGv5uP9LH0w1oNtd7KUce29ET7YUPHFhMQ636aCvtCWgQrPBrzA6', NULL, 13, 2, 1, NULL, '5', '2024-01-09'),
('2403026', 'PEREZ', 'GALINDO', 'HJFKLSGBFÑUAFAÑVAHFW', '20', 'maquinadefuego@gmail.com', '2003-10-24', 'PACHUCA', 'PACHUCA', 'MONICA', NULL, '5548761378', '$2a$10$DhbijBxZCK2MM/aq1rnsZu3f4nozGriDcRJijaX0bhOT77kjWYcPi', NULL, 13, 2, 1, NULL, '5', '2024-01-09'),
('2403027', 'RUVALCABA ', 'PETRONILA', 'ASDFGHJKLQWERTYU', '24', 'armando908@gmail.com', '1999-02-09', 'APATZINGAN', 'ZITACUARO', 'IVANO', NULL, '77713559560', '$2a$10$m0rvYidqfetM9OrjhcEgsORGMOzN4TPr8bN2EsTavkFa5CTcSf2AC', NULL, 28, 1, 1, NULL, '3', '2024-01-09'),
('2403028', 'PEREZ', 'LOPEZ', 'TOMF050621HHGRRRA1', '69', 'tenorioerick33@gmail.com', '2022-11-27', 'PIRACANTOS', 'PACHUCA', 'MEMO', NULL, '230586978', '$2a$10$nXdvPWN8WBsmJSZFqOw2xO0R2hm3KTdyhC8dx9jW88S9YAs.fyd6.', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403029', 'PIU', 'PIU', 'HEBF030409HHGRTRA6', '21', 'luigusvmedina@gmail.com', '2003-01-01', 'CIUDAD DE MEXICO', 'COYOACAN', 'DAETH', NULL, '5555555555', '$2a$10$CRfk9cQ9RWOcRec4KT1dL.E854Nt9m/V8fudX9Pn8Vc/1kDL7XTnu', NULL, 9, 2, 1, NULL, '3', '2024-01-09'),
('2403030', NULL, NULL, 'AUHA050417HHGCRNA7', NULL, 'gabrielang2005@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$Xa5fl3Nia6xxkXCYqic8/u35BnRrYV5K1gwNDvWeGL2scCNGxFEQC', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403031', NULL, NULL, 'KFUHIFHIDSGHF0', NULL, 'termostato12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$OkI7WMea/LcJQEEv33RFyuCF.vn/kH9B0pMiLehlRaL/y5JS58Mh2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403032', 'DE PLESIS', 'ENCISO', 'TOGH001031HMCDFDK9', '19', 'test01@testing.com', '2004-01-26', 'LA CRUZ', 'TLAJOMULCO DE ZUÑIGA', 'BRUNO', NULL, '1234567891', '$2a$10$dfOyLkqpS61r1KDKi9eJm.C5BY/PFplEkVywogzr0jAE/NdvWBadi', NULL, 14, 1, 1, NULL, '3', '2024-01-09'),
('2403033', 'PEREZ', 'LOPEZ', 'GOPI050517HHGNLDA9', '18', 'lopezgarza@gmail.com', '2005-05-10', 'HIDALGO ', 'PACHUCA', 'IGUANO ', NULL, '7712356987', '$2a$10$/gB8c6tDIYBJ0ZMj0MiIl.jddkHQkky07OJGvEHmwu.6Z1Ob9Iyua', NULL, 19, 1, 1, NULL, '3', '2024-01-09'),
('2403034', 'HERNANDEZ', 'POZOS', 'SAAD880705HDFLLV03', '33', 'perromojadito@gmail.com', '1990-11-15', 'GUSTABO AMADERO', 'GUSTABO AMADERO', 'GEOVANNY ', NULL, '7724595823', '$2a$10$lVuoVm5B.ah1Ds.AIrU7yOMeEAmMnju7DolIJzz5CjX2gbAFtEcse', NULL, 15, 1, 1, NULL, '3', '2024-01-09'),
('2403035', 'HERNANDEZ', 'POSOS', 'ABCDEFGHIJKLMNÑ7575Y', '18', 'burrito@gmail.com', '2005-03-31', 'SAN JUDAS TADEO', 'TULANCINGO', 'GEOVANNY', NULL, '7717778534', '$2a$10$04d2yfBdPBViaVp5H.7diuNK6YybjIOz4q.sn52CZpamI5Iwqd5wW', NULL, 11, 2, 1, NULL, NULL, NULL),
('2403036', NULL, NULL, 'HODFKS523211', NULL, 'prueba@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$PWG3iMMhqtfgn0sWXhJkNu9L/C1Nt7hRzZJ9vbpwHuFDJbOw8IPm.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403037', 'NIETO', 'MANUEL', 'POQWHD2314DENU45JI', '5', 'hbmg1512345@gmail.com', '2018-02-09', 'PACHUCA', 'MINERAL DE LA REFORMA', 'ANDRES', NULL, '551640981', '$2a$10$ALER952fdy8p5.e7cfWYAu8VN/Yak18PEPSSYBwNwvGPMxOJeLoiG', NULL, 13, 1, 1, NULL, '2', '2024-01-09'),
('2403038', 'LLLLLL', 'JJJJJ', '123456', '-1', 'ss@g.com', '2024-02-09', 'TTTTTTTTT', 'RRRR', 'DDDD', NULL, '33333333333', '$2a$10$8tDNzZlybtxQwDigL.shiekD4Y/vypbEVNQoNB/MZsNw48m90y/zS', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403039', 'HERNANDEZ', 'HERNANDEZ', 'CVCA000675FFTHREA6', '18', 'cddg@gmail.com', '2005-08-08', 'MINERAL DE LA REFORMA', 'MINERAL DE LA REFORMA', 'ALBERTO', NULL, '7712257545', '$2a$10$urM2Z3geoxxv.02HJzsGQOQYNINj/aaCyoDyapX9G793Q2X3QFpGW', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403040', NULL, NULL, 'HELJ0416HHGRRNA7', NULL, 'leticialeonleon07@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$iGrvlSMSICVgdw5qhQLox.xjY5Q/980gGw/WCFRNygrQjFFvWp3ya', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403041', 'MEJIA', 'RODRIGUEZ ', 'ROMD020813MHGDJRA7', '19', 'touka.tokyoghoul.anime.pankeke@gmail.com', '2004-08-13', 'PACHUCA', 'PACHUCA', 'KATHERINE JANE', NULL, '7711758437', '$2a$10$FzADK8pe70/Wjy/XDgtr8.cjoqOytru0ECTvKQZbl0eFr8pDN1thO', NULL, 13, 2, 1, NULL, '3', '2024-01-09'),
('2403042', 'PEREZ', 'PEREZ', 'HDJFDHKK5030', '26', 'Prueba2@gmailo.com', '1997-10-09', 'PACHUCA DE SOTO', 'PACHUCA DE SOTO', 'JUANITO', NULL, '771111111111', '$2a$10$vte49wbqN8LDlgmbZfZ.I.9QG7yIbasdIHYEgJcCosJbFNGqESMlW', NULL, 13, 1, 1, NULL, '2', '2024-01-09'),
('2403043', NULL, NULL, '455225688755625', NULL, 'misa@c.om', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$IV3sUFtYIaP8BT3WWKC0Leriq/MJaYyWCpfJMwXRMpJGJ/n2Iq.Ey', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403044', 'GLOVER', 'AFTON', 'CEFF005678', '54', 'waspinator01@gmail.com', '1969-09-11', 'TLAXCALA', 'MINERL DE LA REFORMA', 'AXEL MICHAEL', NULL, '7711771987', '$2a$10$TklxU5CtsMFJvq/w/3Bt4ej6g5YI0b/xULd/OAJ97KIstAv9/t.Iu', NULL, 28, 1, 1, NULL, '3', '2024-01-09'),
('2403045', 'PEREZ ', 'RAMIREZ ', 'GARM040527MHGRMRA1', '23', 'char27@gmai.com', '2000-06-05', 'HIDALGO', 'PACHUCA ', 'DANIELA', NULL, '7711262999', '$2a$10$v2y/8wBHi6lgpaoLxW7xoO4XiIFeaZn.JzanbdeFGTVrLrQgJjGC2', NULL, 13, 2, 1, NULL, '3', '2024-01-09'),
('2403046', 'SMITH', 'GONZALES', 'GHOP31229RRHHA7', '19', 'baselink@gmail.com', '2004-10-18', 'PACHUCA DE SOTO', 'PACHUCA DE SOTO', 'MIGUEL JOSE', NULL, '7715938712', '$2a$10$u6vMHV3HqpaoR2DdpvvxSur5XOE92GtMLE7O6RsrdWQWFFbUhg2/u', NULL, 13, 1, 1, NULL, NULL, NULL),
('2403047', 'RIOS', 'MONTEZ', 'AEFJ010501HHGNLRA6', '19', '2303117@utmir.edu.mx', '2004-02-22', 'PACHUCA', 'PACHUCA', 'JOSUE', NULL, '7712589346', '$2a$10$srurxX1/OcEyhIgHNt8zhuoZOUYw5XBN68Z2gAlKdKe1CsZSodHAS', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403048', 'ANASTACIO', 'TEPISCA ', '785212211245', '23', 'bruno.dark67@gmail.com', '2027-11-18', 'BENITO JUAREZ', 'CDMX', 'GERAERDO ', NULL, '54541616', '$2a$10$1PmtirTRiaPcHDIev3qC5OdG5L2iUDxf/toiu9XSjbFyK6bwRSMs2', NULL, 15, 1, 1, NULL, '3', '2024-01-09'),
('2403049', 'SIENTES', 'RICO', 'PEXR050809HNERXCA5', '-1', 'LOLASPEREZ@GMAIL.COM', '2024-05-09', 'LAGO ZARIAS', 'AILEJO DE MIVARA', 'ALMA MARIA', NULL, '77342456732', '$2a$10$5HuoTiNfR2eu1Z.XhIiboOzg4BaXeQbyNEnuQwmqkcyjyUbNQ/ptW', NULL, 12, 2, 1, NULL, '3', '2024-01-09'),
('2403050', 'PERRR', 'FHUEDFHU', '20647', '23', 'dvjbnrQ@gmail.com', '2000-09-19', 'SINALOA', 'TLAXCASLAS', ' NSDUCJKSDV', NULL, '2284451275', '$2a$10$qglYCazxBVW7BT6b2rQPF.3iL/hOegT9GdIEVGg4U4VFMsxIRUtcK', NULL, 28, 1, 1, NULL, '3', '2024-01-09'),
('2403051', 'CUENTAS', 'GALINDO', '1234', '23', 'rodri@n.com', '2000-04-25', 'OOOOO', 'PPPP', 'MISA', NULL, '7715856231', '$2a$10$uSycu2aTFCWQ3JiFHykRV.UIWIQQuLilWEtQJSUIDM0/i48D/uray', NULL, 13, 2, 1, NULL, '3', '2024-01-09'),
('2403052', 'PALACIOS ', 'HERNANDEZ ', 'AUHA050417HHGCRNA8', '20', 'acunangel202880125.2@gmail.com', '2019-04-18', 'EL GIRASOL ', 'PÁCHUCA ', 'ARTURO ', NULL, '7712334567', '$2a$10$aUVtycQS1UUmH3u1xF8A8.duO.tLUxM9AM7L2Cvs7Nt4drt2KrJ9S', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403053', 'PICHARDO', 'RIVERA', 'FD4356', '18', 'mianinel37@gmail.com', '2005-02-12', 'REAL DE MINAS', 'PACHUCA', 'MIA', NULL, '3423552', '$2a$10$0u6KmlU8Bju.kBbf0VcJsuJcN14gzji9QKBdwgry2cY.N/Y7e0C4m', NULL, 13, 2, 1, NULL, '3', '2024-01-09'),
('2403054', 'SAMPERIO', 'ORTIZ', 'HOL051623HHGRRNA7', '24', 'Leon23@gmail.com', '1999-12-13', 'HIDALGO', 'PACHUCA', 'ADRIAN', NULL, '7712628090', '$2a$10$EP08kvYfQ70VsJCFGKkHjuMbV.OYCYnkKw5ATwDKbwNWhn9TvuLsy', NULL, 13, 2, 1, NULL, '3', '2024-01-09'),
('2403055', 'TERCERO', 'MATERNO', 'GHYEDIGYHUIOWSDCF', '17', 'ghfdugnhf@gmail.com', '2006-11-22', 'FGYUIOFDF', 'PACHUCA', 'MARCUS', NULL, '777146792764', '$2a$10$h3KbDDriCRaF5reuhEdH8.aFzCIehAZp1C4CXkHVQ/suFIJk/XxaC', NULL, 13, 1, 1, NULL, '3', '2024-01-09'),
('2403056', '123ANMASN', '123ANMASN', '123ANMASN', '22', 'as@comadepepe.com', '2001-11-08', '123ANMASN', '123ANMASN', '123ANMASN', NULL, '4548485', '$2a$10$cdg/MvjH3rGw6PIszAc3AuzpdZ.k23ZqW4iZ0.2BhvUdcujLHKFzC', NULL, 14, 1, 2, NULL, '2', '2024-01-10'),
('2403057', NULL, NULL, 'fdgsdhhrhsrsgfji945', NULL, 'a02103044@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$00O.wZ4kK1idhyxaeKgUEOwTx9NITa5IJnqwo2pNeb/PBBzqv7uwW', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403058', NULL, NULL, 'CAPF030906MHGNLRA7', NULL, 'a02103076@urmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$u06jtBwQPGfOEKoMfPnDau2OaEDNTgfhkvVwX5PlvNwovOLEeczrS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403059', NULL, NULL, 'michelin', NULL, 'arlethcruz2905@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$lsEocQbxsoz7JLDH6oDyg.tYDXyx50si6Dq2BW1fSFe8NTZmEEDbu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403060', NULL, NULL, 'AABD030501HHGLXNA5', NULL, 'a02103065@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$S0OW5G7hRmh1nN5h/zdPSeoqF8uwu97ehHkKcQOvLfpafBm9bqwNO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403061', NULL, NULL, 'uytgbn4567uhgbnmd', NULL, 'kdjklfhd@hj.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$rV7AmLVI0XbeDJcdyWSi6umU/qaeUhIujlgofuR0KFQ9HDh7/H80C', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403062', 'ROSAS', 'CLAUDIO', 'CARM010629HHGLSRA0', '22', 'a02103068@utmir.edu.mx', '2001-06-29', 'PACHUCA ', 'PACHUCA ', 'MARCO ANTONIO', NULL, '7711133007', '$2a$10$gr/GWJf3GszrNWIOxCCTSeENs.hruC8ur7l.z.cJ1uUH0lSMBD4ci', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403063', 'GUTIERREZ', 'MONTES', 'BAHM840408MHGTRR03', '43', 'frank@utmir.edu.mx', '1980-04-09', 'CALIFORNIA', 'CALIFORNIA', 'PEDRO ', NULL, '5589635874', '$2a$10$AVFw5V0IPjH4JdkXIn1bd.Uhfc9Aw2ns8YXffGXuNM.y6kDyDcDBm', NULL, 2, 1, 1, NULL, '3', '2024-01-10'),
('2403064', 'DOLORES', 'GUERRERO ', 'SWDHUKHNFGDFGSDXSD', '23', 'alejandra.azpe29@gmail.com', '2000-03-15', 'PACHUCA', 'PACHUCA', 'ALELI', NULL, '9971626788', '$2a$10$jD2F7YV6axGir/QK2DlDSOPW6QWY1lLWOascWR1irHJ.jyJi9KMU.', NULL, 15, 2, 1, NULL, NULL, NULL),
('2403065', 'LINARTE', 'LAZCANO', 'MMGH030426HHGVNRA7', '23', 'mary@utmir.edu.mx', '2000-09-14', 'PUEBLA', 'PUEBLA', 'ODETTE', NULL, '7721560287', '$2a$10$HVkguUEYCAManUTzf8eeH.91/L1TplKvW7A.j9UDDfrQC8W4NgX0a', NULL, 21, 2, 1, NULL, '3', '2024-01-10'),
('2403066', 'SALAS', 'LEINES', 'LELI101024241212', '20', 'mochi@utmir.edu.mx', '2003-12-17', 'PACHUCA DE SOTO,HIDALGO', 'PACHUCA DE SOTO', 'IVETTE', NULL, '7711506171', '$2a$10$LdP/6nuNZCGsMZuw8/3K9.31GusYsXMTYnjzIK8AB241fhnDfDHYq', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403067', 'LOZANO', 'PEREZ', 'PELE0100290', '21', 'suga@utmir.edu.mx', '2002-10-10', 'PACHUCA', 'PACHUCA', 'ESTRELLA ', NULL, '5524021910', '$2a$10$3Di24o/4fif92lpu2pd6hOUMC1RAWe3DlR17UYmw/MZaMU622UdRS', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403068', 'PALACIOS', 'CANO', 'CAPF090603MHGNLRA7', '20', 'a11223344@utmir.edu.mx', '2003-09-06', 'PACHUCA', 'PACHUCA', 'FERNANDA', NULL, '7713112564', '$2a$10$sWR9ePBMXodJ1ewmAOfJpOD8Tk2ftqCPK1zs10AL9gfBZnWhZoxkm', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403069', 'CABRERA', 'NUÑEZ', 'NUCS', '20', 'a02103056@utmir.edu.mx', '2003-03-22', 'PACHUCA', 'PACHUCA', 'SANTIAGO', NULL, '77111333007', '$2a$10$ihJ07MAgk9Xx9vPd5su8X.2xTK9oWf46moP84LReHNzorovhLejBO', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403070', 'HERNANDEZ', 'PEREZ', 'CVCA000675FFTHREA4', '19', 'pichula@gmail.com', '2004-01-16', 'PORTUGAL', 'LISBOA', 'CRISTIAN', NULL, '7714846985', '$2a$10$3tPkZMaSXhWYktViWar5uuVGrdYD8pXAua9fb4RF2Fgs4A6L7tA0O', NULL, 33, 1, 2, NULL, '3', '2024-01-10'),
('2403071', 'SERNA', 'HERNANDEZ', 'FDGSDHHRHSRSGFJI94T', '23', 'a02103045@utmir.edu.mx', '2000-09-09', 'FELIPE ANGELES', 'PACHUCA', 'RAMON', NULL, '7714853212', '$2a$10$VDXHFmqx7Rq7kjXlmJ7JNeNrxzG01K9qDk8Aq.oSfByqVjoEf9.zy', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403072', NULL, NULL, 'dark', NULL, '2303367@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$Rqza0EYsw38ml/tVeN2G5OanVx4Bv220/8obAy3jAdH5YfXYBS8.S', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403073', NULL, NULL, 'GARM040527MHGRMR00', NULL, 'char20@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$6k7c0nKD1zByKOaj3TZNMeg.prePArbzS85ptgrS5YOOW79QtKsqy', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403074', 'BADAJOZ', 'YAIR', 'HELJ0416HHGRONA2', '23', 'lericialeonleon07@gmail.com', '2000-12-07', 'TEXCOCO', 'TEXCOCO', 'MARIA', NULL, '7713715274', '$2a$10$HFqwQWQRMx779J9X.3MKDeWTzqPNwHHWe1JxvgQTTtXuUdOkn3OGS', NULL, 15, 2, 1, NULL, '3', '2024-01-10'),
('2403075', 'CRUZ', 'PEÑA', 'PECA030529MHGXRRA1', '20', '290503@gmail.com', '2003-05-29', 'TEPEAPULCO', 'SAHAGUN', 'ARLETH MICHEL', NULL, '7714321320', '$2a$10$ygCPTaTvF3SoL0y5GYzuyenVu8/je3AG9h4bVJxNdUmMs6PSJhVMC', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403076', 'BAÑOS', 'ALVARADO', 'AABD030504HHGLXNA5', '20', 'a02103064@utmir.edu.mx', '2003-05-01', 'PACHUCA', 'PACHUCA', 'JOSE DANIEL', NULL, '7751896375', '$2a$10$cq.aT.k8GekVbE7O4yiAMu3ZJZKoXqAOsGc0QFZPNvHG0Sh5UsYqO', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403077', 'TIBIO', 'PLASENCIO', 'KUYDSXVBNM', '24', 'hjah@hshs.com', '1999-08-06', 'CHAVARRIA', 'PACHUCA', 'GUILLERMINO', NULL, '8976548976', '$2a$10$clN79pU6bVlip2JbyzaUeu280XjvSOv/hII45xIYOMtzRYi4lrMgy', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403078', 'BASILIO ', 'IBARAA ', 'GARM040527MHRRRRRR', '20', 'chai20@gmai.com', '2003-02-01', 'HIGALGO ', 'PACHUCA ', ' YAIR ', NULL, '77117272717', '$2a$10$QNF.e11r8rACjTPUV3KhDutUIJCoxMLCRHI4vrsACBYyw8IlLqdT.', NULL, 15, 1, 1, NULL, '5', '2024-01-10'),
('2403079', 'PEREZ', 'HERNANDEZ', 'HEPA971020GHRRL05', '26', 'axis_619@hotmail.com', '1997-10-20', 'PACHUCA DE SOTO', 'PACHUCA DE SOTO', 'ALEXIS', NULL, '7711759868', '$2a$10$eWTEeDpriobXOeJaH3.lS.TMrSaMsGEODNl/.BTXPhcY5sVDXCumS', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403080', NULL, NULL, 'jkdkdhjbdjkdkddkdh', NULL, 'holaaaaa_1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$esAatnRt4R6RC6TEn.kTC.zq2xH2.cifYWySDz5p2mPMaoGiBazMu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403081', 'TORRES', 'HENANDEZ', 'RSHT081097HGTRA7', '23', 'pelos@utmir.edu.mx', '2000-06-16', 'CENTRO', 'PACHUCA', 'RIGOBERTO SALMO', NULL, '7714567891', '$2a$10$vKvz2ScVrCbBFPUIrcc5muvH9lHe28sylwpsIqpQEM9Vyfh6kBd3y', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403082', 'HIDALGO', 'DOLORES', 'AORJMKSINOEJDLOPJH', '23', 'alelya@gmail.com', '2000-03-27', 'PACHUCA', 'PACHUCA', 'JUANITA', NULL, '1135757976', '$2a$10$9sDSLVVCvu1hdJFTPgsTHOyhUO5N5CA8ugnPM3oQhsGh46nEOj3sW', NULL, 15, 1, 1, NULL, '3', '2024-01-10'),
('2403083', 'ANAYA', 'VILLEGAS', 'VIAZ030430HHGLNRA3', '20', 'a02103127@utmir.edu.mx', '2003-04-30', 'PACHUCA', 'PACHUCA', 'ZURIEL', NULL, '7713813543', '$2a$10$0X4JRxoAVAIlNj8QD7xM9OlJaYucZdOlZHHL01ErNl/m1pzzs5pyK', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403084', 'BUSTOS', 'GARCÍA ', 'GABK', '-1', 'a02103225@utmir.edu.mx', '2024-06-10', 'PACHUCA', 'PACHUCA DE SOTO', 'KARIM', NULL, '45644654', '$2a$10$GmqPXqSC3Q501h6f62b1R.opRW6THzNcsFbGCGQBvDftHejLMQldy', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403085', NULL, NULL, 'CARM010629HHGLSRA9', NULL, 'a0203068@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$vM5dCDh0vD03tJAicQWByuZcHvNOFN7nzmUN.oG8X1no6FBiHc42q', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403086', 'MESA', 'RODRIGUEZ', 'GFE556RO4IQ78D', '19', 'roar@gmail.com', '2004-01-28', 'PACHUCA', 'PACHUCA', 'RAUL', NULL, '7715895207', '$2a$10$/fYq7LKWXvMikMiKS.aVmu0G9t52snqnLB0hWAIb/iDaURwEP/dVe', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403087', NULL, NULL, 'hjmuyukm', NULL, 'a02103209@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$.TiAfkZh70ifu.8ImSN0/udqZvcrRys1ypeSQLiBq5K4OSSKyaQye', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403088', NULL, NULL, 'POQQWGGGW', NULL, 'geovannypozos452@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$WuhK7rnc0v94FhLzsAMcOOq8M28ZwQTqYHUHhYAXlOYLVWtecmgau', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403089', 'GLUBKJ', 'JLHÑ', '5498748973', '18', 'dhusf@gmai.com', '2005-03-12', 'PACHUCA', 'PACHUCA', 'HUIUHU', NULL, '6767067', '$2a$10$tbn7a8pJRfn4ZfnudkwX5OAU1pNv6AzbbVkA5ePbqKz9hhH1TypqC', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403090', 'TGBCGNGFJR', 'GTFGEH', 'DFNFGBMFNNTHNDT', '23', 'lala@utmir.edu.mx', '2000-08-25', 'HMGYMYJ', '3HGFHF', 'DNFYDGTRHBD', NULL, '326326563736', '$2a$10$gwzqbPckQ5tfTzqbKIZEmOgqKrwYkuigP3UO5Hto4pz89wZ7.fmoe', NULL, 6, 1, 2, NULL, '3', '2024-01-10'),
('2403091', 'PEREZ', 'PEREZ', 'HDJDISNS55552222222', '25', 'tests23@gmail.com', '1998-12-11', 'PACHUCA DE SOTO', 'PACHUCA DE SOTO', 'JUANITA', NULL, '77125563112', '$2a$10$3//GfTJdcUS6tnu29sGwE.kUrV85jBiuoyXO8CBoEW0hF1NNv4J.q', NULL, 13, 2, 1, NULL, '3', '2024-01-10'),
('2403092', 'HERNANDEZ', 'POSOS', 'MGHHGRMXE28', '24', 'jotingas66@gmail.com', '1999-06-10', 'SAN JUDAS TADEO', 'TULANCINGO', 'GEOVANNY', NULL, '7717778534', '$2a$10$8eLbT9U3RuhtFOeAD.ENM.XoUdOoJI4vVnB1wtI6vDUMAh5VddkmK', NULL, 7, 1, 2, NULL, '2', '2024-01-10'),
('2403093', 'ALEGRIA ', 'ALEGRIA ', 'QWERTUIOASDFGH12', '24', 'kaulaoa89@gmail.com', '1999-02-10', 'PELAS ', 'CHIRAS ', 'ALMA MARCELA ', NULL, '7713559569', '$2a$10$NFsB2c9Kvi7GWV5Hs1nrHOhdgcXV/4U71J.0PTbWOMYote6WlkdKe', NULL, 14, 1, 1, NULL, '3', '2024-01-10'),
('2403094', 'CRUZ', 'MARTINEZ', 'AUHA050417HHCGRNA7', '20', 'acunaangel202880125.2@gmail.com', '2016-05-11', 'OLIVOS ', 'MINERAL DE LA REFORMA ', 'ALEJANDRO ', NULL, '7718047744', '$2a$10$3aNDIir6ucyHwafemLv67uPlO/oZviK068DEgYfO5cpkbfMD4z8d.', NULL, 13, 1, 1, NULL, '2', '2024-01-10'),
('2403095', 'PEREZ', 'HERNANDEZ', 'GARM040525MHGRMRA2', '23', 'juanc@gmail.com', '2000-02-05', 'HIDAÑLGO', 'PACHUCA ', 'JUAN CARLOS ', NULL, '7712629585', '$2a$10$YOvW3/uo/bvC/phOBYh9l.L0O1D2yLVD3Sg.DaXalCoo9eCkXbdk6', NULL, 13, 1, 1, NULL, '2', '2024-01-10'),
('2403096', 'LEON', 'SUAREZ', 'MAGJ0416HHGRRNA7', '23', 'marguada@gmail.com', '2000-12-02', 'PACHUCA', 'MINERAL DE LA REFORMA', 'MARIA', NULL, '7712628095', '$2a$10$kZ5NaXM37VWB5E1mbTEdUu6266yPkWCtF8Aevog3VjXYcluryBhnS', NULL, 13, 2, 2, NULL, '3', '2024-01-10'),
('2403097', 'MKGH', 'KHG', 'UDNHNNG', '20', 'a021032@utmir.edu.mx', '2003-05-06', 'B', 'PO', 'YUJN', NULL, '4', '$2a$10$.iUxdA.lZb1tEOy94Jb8EesLIh2MuPqNWRUX2C7zHlACwby9Gv2Wy', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403098', 'HERNANDEZ', 'POSOS', 'SAAD880705HDFLLV04', '23', '02003849@utmir.edu.mx', '2000-12-15', 'PACHUCA', 'MINERAL DE LA REFORMA', 'GEOBANNI', NULL, '7715461819', '$2a$10$nezyY8GTP0LIPFp3BK9RWughcfk7kBAINbkEcxREeAv5jj/0XKmk6', NULL, 13, 1, 1, NULL, '3', '2024-01-10'),
('2403099', 'WER', 'QEDR', 'QWERT', '23', 'qw@g.com', '2000-01-12', 'XCVB', 'WT6', 'CES', NULL, '2222', '$2a$10$k9m96EFKqxidFdbjuCME9ONmsQBt36S9svvYDJ6F6Dj/stj/DsXRm', NULL, 1, 2, 1, NULL, '3', '2024-01-10'),
('2403100', 'PWPW', 'PEPE', 'POQWHD2314DENU45J', '7', 'geovannypozos2@gmail.com', '2021-06-10', 'MEXICO', 'NANANAN', 'PEPE', NULL, '5517640981', '$2a$10$EhnxmDp9HmhNTO6nJIqV4.nU5EEqGP/n0YSoXuYU8Dcu3TUfiCphu', NULL, 2, 2, 1, NULL, '2', '2024-01-10'),
('2403101', NULL, NULL, 'CNBI000615DDDFRJC3', NULL, 'tmbf@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$EjpdExU.ruEjQp963q.ltO5EO1PB4d8Ibe0NRs6ePoJ4loVPHzGQe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403102', NULL, NULL, 'LOLI050617HHGNLDA9', NULL, 'lolitahayala@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$fbu9xcRNEASCZdswebgljOWVCp6a1xsLgnFNsZDVWahUAunRyyKZu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403103', NULL, NULL, 'ÑRSHT081097HGTRA7', NULL, 'prueba2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$lnaRBx5dQIjSNM2YIVqCgOGhfO/moFVyy6MqCgsGLBNrG.LiUJHc6', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403104', 'HERNANDEZ', 'RODRIGUEZ', 'HITR001231RYTXESU7', '23', 'test02@testing.com', '2000-01-25', 'DEL SOL', 'ZAPOPAN', 'ZEUS', NULL, '1234567895', '$2a$10$IpvNr1YG/.MLDtDZ3PpJs.gJe/v.dhtqQizbSj8uxo6a5zwibWn4.', NULL, 14, 1, 1, NULL, '3', '2024-01-10'),
('2403105', NULL, NULL, 'HAGSJDFKGAÑFAWEF', NULL, 'ayhdaheha@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$/nJAf/1hXi8VrzY.43BmKOiK0.oxSCSyfRbz6Ps86a0vUpSibuwJa', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403106', 'LOPEZ', 'GALINDO', 'JHDAJFDAFASF', '20', 'EDWKJGSALHDFA@gmail.com', '2003-05-25', 'PACHUCA', 'PACHUCA', 'MONICA', NULL, '4574845578', '$2a$10$p8doudM1ymXR1TzwHjWVSuPgkAfGi0eSHxWDxkUD6VYmvwnfJCejW', NULL, 13, 2, 1, NULL, '2', '2024-01-10'),
('2403107', NULL, NULL, 'TOGH001031HMCDFDK8', NULL, 'test045@testing.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$i.HsOAZz36oRGPcq1ZFdW.rUQC0HwUzkPbN5lToDznaciUZUUOfeG', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403108', 'VILLA LOBOS', 'PEREZ', 'ARRIBAMLO2012SA', '58', 'carnitasAsadasconrefresco@gmail.com', '1965-10-17', 'REDCLA', 'ENCHILADAS', 'IKUJY GUTIERREZ', NULL, '71772893', '$2a$10$Iq5zGtmsMAxXiQprbDUMNeZDP.Ev0BcXsaYhixHi9qHEGw.CP5JeG', NULL, 12, 1, 1, NULL, '3', '2024-01-10'),
('2403109', NULL, NULL, 'yujiuyfghbjk775c', NULL, 'ftgvyjhgdxfgb@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$peRWbGqF/Sa3X7NjBXIkU.drTgdHV27H64D.RZGZb2mhdNuXpWQhO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403110', NULL, NULL, 'LOLI050617HHIMNFA2', NULL, 'lolitaayala@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$yHPYp/GBlsHMt/zQZh9dbeyx6iWIkXZqR.KdsYU.1CKdAZes8yT.O', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403111', 'K', 'KK', 'RTYU', '1', 'jollvany@33.com', '2023-01-10', 'K', 'HK', 'J', NULL, '77', '$2a$10$Tva/yPDBRmLVeGo/xu1Wt.OC1a1tpW2ExM.2pFwy/NGRfzNF9UNcC', NULL, 17, 1, 1, NULL, '2', '2024-01-10'),
('2403112', 'PEREZ ', 'PEREZ ', 'JGHRUGHRUGHROG5454GR', '25', 'prueba2@gmial.com.mx', '1998-02-22', 'HIDALGO', 'HIDALGO', 'IGNACIO ', NULL, '5455654425728', '$2a$10$nuQ3qmQhoEdFfIjtmfIAcuh5awIlxMhBBTldN.hqBA/Y5ngsZK/6q', NULL, 13, 1, 1, NULL, '2', '2024-01-10'),
('2403113', 'LOPEZ', 'BALDERAMA', 'MRMY090967GGJBHYZ', '17', 'test044@testing.com', '2006-12-13', 'POIL', 'ATOTONILCO', 'BETH', NULL, '7874598/625', '$2a$10$hvS8iQO1YUo9UHcy9bHWIuNtc1hwGsyNWS6X7BfOnRA5wC9KLTsr.', NULL, 12, 2, 1, NULL, '2', '2024-01-10'),
('2403114', NULL, NULL, 'ytgufdrtygurdtygid', NULL, 'gcdxazdt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$Y.NEpoKLdAlT4N217zptdeQGTez/7TOhVsXKes6pyx/k4juUKMpnS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403115', NULL, NULL, 'CBCS000545JKJUTYS1', NULL, 'Panda8@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$HHaZSY.uEC/.XQc469gmTegFKMzItqxQdXliFFkYU6LV3Ua4JIs4W', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403116', 'LOPEZ', 'ZEDILLO', '446148964894', '31', 'ernestosedillo94@gmail.com', '1992-02-18', 'PANTITLAN', 'NEZAHUATCOYOTL', 'ERNESTO', NULL, '6129721971', '$2a$10$C3b19.A87o1wg2BWtnIxquywJAwgTFp0o8MFi6AqUEcAz7CuxOu8e', NULL, 15, 1, 1, NULL, '2', '2024-01-10'),
('2403117', 'FERNANDEZ', 'HERNANDEZ', 'ROMD040312MHGDJTX6', '19', 'gfiehfifoih@gmail.com', '2004-03-12', 'PACHUCA', 'PACHUCA', 'PATY CHAPOY ', NULL, '7711758437', '$2a$10$7d40YE/T6Y7xyZ0u6PnzbOf8P5rDGwwlPnA9eZyqvjs3bl2ie4/dm', NULL, 13, 2, 1, NULL, '2', '2024-01-10'),
('2403118', 'HERNANDEZ', 'LOPEZ', 'CZBS000454LLGLUSO4', '18', 'panda87@gmail.com', '2005-06-08', 'MINERAL D LA REFORMA', 'MINERAL DE LA REFORMA', 'JAVIER', NULL, '7712260806', '$2a$10$o6fqZfQ1g9wwxrvCmI2Ir.RMHJbx4Ft.S6qbaiwQU0/eQQ1QRG4zC', NULL, 13, 1, 1, NULL, '2', '2024-01-10'),
('2403119', 'FUJIGURO', 'JUJI', 'HEBF030409HHGRTRA8', '23', 'transfer34@sldcgl.com', '2000-08-26', 'JAPON', 'MINERAL DEL MONTE', 'ITADORY', NULL, '7716788769', '$2a$10$zne.VTyZJ/SEr8DTCdIOXOY.vrtQ/nRYmUXXuE2c94daYHxBre4bG', NULL, 14, 2, 1, NULL, '2', '2024-01-10'),
('2403120', NULL, NULL, 'HITR001231RYTXESU8', NULL, 'test02@teesting.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$X.L0NsgG0YiL8YRz8hVMFuNH2/4J2AfZQQ/sl6xwY97wElzrG5X3m', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403121', 'JONES', 'PELCASTRE', 'CEC000125CECESDF4', '20', 'test03@test.com', '2003-02-23', 'SAN NICOLAS', 'MONTERREY', 'YAIR', NULL, '4589741256', '$2a$10$EFxDUN8vUDrlcgiy93cP1ugDNSj8UzWhe2yx9Gy8u4AiH0YUMa.KG', NULL, 19, 1, 1, NULL, '2', '2024-01-10'),
('2403122', 'MARTINEZ', 'PONS', 'TEAE050223HDFNLRA8', '17', 'cuentadearchivos119@gmail.com', '2006-05-08', 'ASDAS', 'SAASSDA', 'LELE', NULL, '7713069011', '$2a$10$801pXn943FHU.lWKIPTwx.CK8NcFiJ65jMmhfJdXiN78IejNYSPZu', NULL, 15, 1, 1, NULL, NULL, NULL),
('2403123', 'CRUZ', 'MERCADOS DE LOS MONTEROS', 'MARIAGUADA', '22', 'maria.guadaluper@utm.com', '2001-11-08', 'MONTERE', 'ASASM', 'MARIA GUADALUPE ANGELES', NULL, '771663', '$2a$10$9ctkTrzpU9TtNqo.rL73/.cDT2n8WuYhGzSayhnJE3OPnee2cjGs2', NULL, 4, 2, 1, NULL, '2', '2024-01-11'),
('2403124', NULL, NULL, '1234567as012345678', NULL, 'ooopedigi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$639LlvQ4ppRCj2I2mhl.pOBWKMIRlsRMDZqmy8ySKDuY/3Z7cWXh6', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403125', NULL, NULL, 'VEHA01Z108HMCLRLA4', NULL, 'alan.velazquez@utmir.edu.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$McVl/EwusEOIPwdszOdodO2JvgUWwbejtpp2.9.C2yEKgBqNawLke', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403126', NULL, NULL, 'YOTECONOCIENPRIMAV', NULL, 'alan.despedida@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$qAIlz9AkpWi2YcVcSjreBui01eGn3gASWhUA1aKud434QCS/Dac2y', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403127', NULL, NULL, 'ooooaaaaaa', NULL, 'alanvelaz2as4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$7lSBVAaXtiF7M56rQN8hy.EEhd5Pidfw1Xjm35bs.oOPRx/AvUJRm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403128', 'MEME', 'ALA', 'UNCUROPAHIY', '22', 'curpisuto@gnmailci.com', '2001-11-08', 'ASASDAS', 'ASASDDA', 'UNKI', NULL, '77121532', '$2a$10$f5bGAFmEp4Sl.MPfzRuOxu74q5KuCou2qOmOVxAszsMnfLMCuJNDK', NULL, 3, 1, 1, NULL, '3', '2024-01-13'),
('2403129', 'NUEVO', 'NUEVO', 'NEWCURP', '22', 'NUEVOass@new.com', '2001-11-08', 'SA', 'ASDAS', 'NUEVO', NULL, '774155', '$2a$10$AHluTixRqs2tefhbfcq9N.l0r0favSAsZ4iKu84HKzgJJn5VMTEDC', NULL, 9, 1, 1, NULL, '4', '2024-01-13'),
('2403130', NULL, NULL, 'CURP12341231', NULL, 'alanvelaz112324@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$7N9s4Ej7RN.9SO/nMSqKdu9n62np7ntg/5JXcrnT9qsno74GT4Wey', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-15'),
('2403131', 'MATERNA', 'FEA', 'FEADEA', '23', 'feadaaa@con.com', '2000-03-15', 'J', 'JEJ', 'FEALDAD', NULL, '771772', '$2a$10$hXhYTFDLIFsJyTxARzV4He9vAOjXma.vfkEW8FQ2FmohO9BAhOTVC', NULL, 7, 1, 1, NULL, '5', '2024-01-15'),
('2403132', 'YOCUI', 'YOCUI', 'YOCUIDAOASMASMASDM', '17', '12SJKAJNAS@CMO.com', '2006-11-08', 'ASJIASOD', 'ASKDAAS', 'YOCUI', NULL, '5771856', '$2a$10$ibhGk7VhqHmj/1DvQYK.b.BzMDbUL/9QmI0hu44uUg9m/fbkatLVC', NULL, 10, 1, 1, NULL, '5', '2024-01-15'),
('2403133', NULL, NULL, 'CURPPARACORREODEPR', NULL, 'alanvelaz24@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$srGkaf02FWkzt5VT5HYsg.mm.mYUuFOr/khGpKroygNJ1eGkgSVNu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403134', NULL, NULL, 'ooooasdasdasas', NULL, 'asoasoumamama@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$3YrXYpRoGHX6IEQTsY4TM.UKvEfMtGWjgHOrmW.ObpR/I2qrg1KYe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403135', NULL, NULL, 'NOERLAKASMASQJKASD', NULL, 'noelinarte6@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$at1mkrcuZdeCezqev6uXsumZMfqHMaZIwnGi8SL88O/SZl/se3XRm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403136', NULL, NULL, 'NOELINARTYER666', NULL, 'noelinarte6@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$qu5NkqggunAeFjaeDLtPZe57up9.Qx3/rzP59pPd/jxYiN2AEch7G', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403137', NULL, NULL, 'pruebadenomanejode', NULL, 'pablovelazquez@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$MMAp2br/jnL.Ihz6zTGzNug0U94hFsjWnawpkd/xz3wXd4oTwK9H2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403138', 'RAMOS', 'FLORES', 'CURPDETESTEOCINCUN', '16', 'CURPDETESTEOCINCUN@gmail.com', '2007-05-08', 'ASUAS', 'ASJNASNJDASJN', 'ALANA', NULL, '8874818989', '$2a$10$WAQU0geooq8dLeSUzJNG7Ot3Y84uB4d67SOvsRhSkMG0Kdt1V1iJ.', NULL, 8, 2, 1, NULL, '2', '2024-01-19'),
('2403139', 'ZARCO', 'LOPEZ', 'REGISTRODEL2020242', '22', 'giseb50895@tsderp.com', '2001-05-05', 'CAKAS', 'LOC', 'HECTOR SAMUEL', NULL, '7744849615', '$2a$10$Hxi6qiWW78UIAsS2luuEDOxjTO4rzKdXn2Cg.BesWziKkKoBfor0y', NULL, 13, 1, 1, NULL, '3', '2024-01-20'),
('2403140', 'SOL', 'SYLAS', 'CURPDEL20204212134', '17', 'pispesadru@gufum.com', '2006-08-09', 'ASDDAS', '48645', 'AZIR', NULL, '7156156615', '$2a$10$LDXjSf8odw4s74cNaS9djupIeDExjV4pFfJkJ1T759nBQTRNjbv8K', NULL, 11, 1, 1, NULL, '5', '2024-01-20'),
('2403141', NULL, NULL, 'YELLASDICEECOREREC', NULL, 'correcamina@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$ri49ourGvSX299v7KOUioeVuxKI.soWYmFkx3GPggXeriXDWQHtCS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-20'),
('2403142', 'GONAZLES', 'JUAREZ', 'AASDDASMASJ1212331', '17', 'alanvelazas@yopmail.com', '2006-08-08', 'ASDASD', 'ASDASD', 'PEPE', NULL, '4116516515', '$2a$10$mCQIxYoyMO1Ai1dkJ5texupevc7S0jqxLKsbpPuySOPe8pvd/6hpK', NULL, 15, 1, 1, NULL, '3', '2024-01-20'),
('2403143', 'ASKDASJK', 'ASDASDJN', 'PENESOTEDEELEFANTE', '18', 'hekebi1925@ikuromi.com', '2005-11-08', 'ASFDASD', 'ASDFASD', 'ASKDASJK', NULL, '1545615615', '$2a$10$aB9sMbxA6C3mY9D4p6lZ0Osmb8Gk6UU7YhxRAbVy66QgLsWIn54q6', NULL, 2, 1, 1, NULL, '1', '2024-01-24'),
('66', NULL, NULL, NULL, NULL, 'noe.linarte@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$mtcXPXvvx/..Obi4xZVPDeCWrW.1QEW3GkHCVKi2tHkMc.nbUC5Aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('71', 'Anaya', 'Naranjo', NULL, NULL, 'docente@prueba.com', NULL, NULL, NULL, 'Alfonso', NULL, NULL, '$2a$10$YVz7Pe6z5YFcw.oFDT.P..p3Ulf9Wobk7Ff2fCDn3y9ZIMZIVYthq', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('91', NULL, NULL, NULL, NULL, 'fichas@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$U8hAsYeFGmdsJmjsmief5O8RS5uT3mtEZxx2ODfq5ELvHRU6S3ikK', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_log`
--

CREATE TABLE `utmir_log` (
  `id` bigint(20) NOT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `fecha_hora` datetime(6) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_log`
--

INSERT INTO `utmir_log` (`id`, `evento`, `fecha_hora`, `matricula`) VALUES
(1, 'Se registró en RaptorNet', '2024-01-09 11:04:21.000000', '2403021'),
(2, 'Se registró en RaptorNet', '2024-01-09 11:05:22.000000', '2403022'),
(3, 'Se registró en RaptorNet', '2024-01-09 11:08:43.000000', '15'),
(9, 'Completó su Perfil en RaptorNet', '2024-01-09 11:13:10.000000', '2403021'),
(10, 'Cargó referencias de pago en .txt a', '2024-01-09 11:24:10.000000', '2403020'),
(11, 'Cargó referencias de pago en .txt', '2024-01-09 11:24:10.000000', '2403021'),
(12, 'Cargó referencias de pago al 2403020', '2024-01-09 11:28:52.000000', '102'),
(13, 'Cargó referencias de pago al 2403021', '2024-01-09 11:28:52.000000', '102'),
(14, 'Cargó referencias de pago al 2403020', '2024-01-09 11:29:52.000000', '102'),
(15, 'Cargó referencias de pago al 2403021', '2024-01-09 11:29:52.000000', '102'),
(16, 'Verificó el pago de 2403021', '2024-01-09 11:33:45.000000', '102'),
(17, 'Se verificó el pago de 2403020 del exámen de admisión', '2024-01-09 11:37:57.000000', '102'),
(18, 'Se verificó el pago de 2403002 del exámen de admisión', '2024-01-09 11:38:13.000000', '102'),
(19, 'Actualizó la información de2303001', '2024-01-09 11:46:32.000000', '160'),
(20, 'Actualizó la información de 2303001', '2024-01-09 11:46:46.000000', '160'),
(21, 'Calificó el exámen de 2403021', '2024-01-09 11:48:52.000000', '160'),
(22, 'Calificó el exámen de 2303018', '2024-01-09 11:49:17.000000', '160'),
(23, 'Calificó el exámen de admisión de 2403012', '2024-01-09 11:56:18.000000', '160'),
(24, 'Cargó referencias de pago al 2303020', '2024-01-09 12:12:18.000000', '102'),
(25, 'Cargó referencias de pago al 2403006', '2024-01-09 12:12:18.000000', '102'),
(26, 'Cargó referencias de pago al 2403015', '2024-01-09 12:12:18.000000', '102'),
(27, 'Cargó referencias de pago al 2403015', '2024-01-09 12:15:40.000000', '102'),
(28, 'Se verificó el pago de 2403015 del exámen de admisión', '2024-01-09 12:16:50.000000', '102'),
(29, 'Se verificó el pago de 2403015 del exámen de admisión', '2024-01-09 12:16:50.000000', '102'),
(30, 'Cargó referencias de pago al 2403017', '2024-01-09 12:18:55.000000', '102'),
(31, 'Cargó referencias de pago al 2403018', '2024-01-09 12:18:55.000000', '102'),
(32, 'Se verificó el pago de 2403017 del exámen de admisión', '2024-01-09 12:20:00.000000', '102'),
(33, 'Calificó el exámen de admisión de 2403017', '2024-01-09 12:20:09.000000', '160'),
(34, 'Añadió a la lista de aceptados a 2403017', '2024-01-09 12:20:42.000000', '160'),
(35, 'Se verificó el pago de 2403006 del exámen de admisión', '2024-01-09 12:21:46.000000', '102'),
(36, 'Se verificó el pago de 2403006 del exámen de admisión', '2024-01-09 12:21:59.000000', '102'),
(37, 'Se verificó el pago de 2403006 del exámen de admisión', '2024-01-09 12:23:48.000000', '102'),
(38, 'Intento de verificación fallido para la matrícula 2403017 debido a referencia vacía', '2024-01-09 12:28:01.000000', '102'),
(39, 'Se verificó el pago de la matrícula 2303024 del exámen de admisión', '2024-01-09 12:28:18.000000', '102'),
(40, 'Intento de verificación fallido para la matrícula 2403017 debido a referencia vacía', '2024-01-09 12:32:27.000000', '102'),
(41, 'Intento de verificación fallido para la matrícula 2403006 debido a referencia vacía', '2024-01-09 12:33:26.000000', '102'),
(42, 'Se verificó el pago de 2403017 del exámen de admisión', '2024-01-09 12:34:21.000000', '102'),
(43, 'Se verificó el pago de 2403006 del exámen de admisión', '2024-01-09 12:34:26.000000', '102'),
(44, 'Se verificó el pago de 2403018 del exámen de admisión', '2024-01-09 12:34:43.000000', '102'),
(45, 'Se registró en RaptorNet', '2024-01-09 13:21:38.000000', '2403023'),
(46, 'Se registró en RaptorNet', '2024-01-09 13:21:44.000000', '2403024'),
(47, 'Se registró en RaptorNet', '2024-01-09 13:21:44.000000', '2403024'),
(48, 'Se registró en RaptorNet', '2024-01-09 13:21:46.000000', '2403025'),
(49, 'Se registró en RaptorNet', '2024-01-09 13:21:47.000000', '2403026'),
(50, 'Se registró en RaptorNet', '2024-01-09 13:21:48.000000', '2403027'),
(51, 'Se registró en RaptorNet', '2024-01-09 13:21:48.000000', '2403028'),
(52, 'Se registró en RaptorNet', '2024-01-09 13:21:50.000000', '2403029'),
(53, 'Se registró en RaptorNet', '2024-01-09 13:21:53.000000', '2403030'),
(54, 'Se registró en RaptorNet', '2024-01-09 13:21:57.000000', '2403031'),
(55, 'Se registró en RaptorNet', '2024-01-09 13:21:58.000000', '2403032'),
(56, 'Se registró en RaptorNet', '2024-01-09 13:21:59.000000', '2403033'),
(57, 'Se registró en RaptorNet', '2024-01-09 13:22:00.000000', '2403034'),
(58, 'Se registró en RaptorNet', '2024-01-09 13:22:10.000000', '2403035'),
(59, 'Se registró en RaptorNet', '2024-01-09 13:22:13.000000', '2403036'),
(60, 'Se registró en RaptorNet', '2024-01-09 13:22:14.000000', '2403037'),
(61, 'Se registró en RaptorNet', '2024-01-09 13:22:15.000000', '2403038'),
(62, 'Se registró en RaptorNet', '2024-01-09 13:22:15.000000', '2403039'),
(63, 'Se registró en RaptorNet', '2024-01-09 13:22:15.000000', '2403040'),
(64, 'Se registró en RaptorNet', '2024-01-09 13:22:38.000000', '2403041'),
(65, 'Se registró en RaptorNet', '2024-01-09 13:23:07.000000', '2403042'),
(66, 'Se registró en RaptorNet', '2024-01-09 13:23:11.000000', '2403043'),
(67, 'Se registró en RaptorNet', '2024-01-09 13:23:17.000000', '2403044'),
(68, 'Se registró en RaptorNet', '2024-01-09 13:23:19.000000', '2403045'),
(69, 'Se registró en RaptorNet', '2024-01-09 13:23:44.000000', '2403046'),
(70, 'Se registró en RaptorNet', '2024-01-09 13:23:45.000000', '2403047'),
(71, 'Se registró en RaptorNet', '2024-01-09 13:23:59.000000', '2403048'),
(72, 'Se registró en RaptorNet', '2024-01-09 13:24:23.000000', '2403049'),
(73, 'Se registró en RaptorNet', '2024-01-09 13:24:41.000000', '2403050'),
(74, 'Se registró en RaptorNet', '2024-01-09 13:24:48.000000', '2403051'),
(75, 'Se registró en RaptorNet', '2024-01-09 13:26:08.000000', '2403052'),
(76, 'Se registró en RaptorNet', '2024-01-09 13:27:55.000000', '2403053'),
(77, 'Se registró en RaptorNet', '2024-01-09 13:28:04.000000', '2403054'),
(78, 'Se registró en RaptorNet', '2024-01-09 13:30:23.000000', '2403055'),
(79, 'Completó su Perfil en RaptorNet', '2024-01-09 13:31:24.000000', '2403042'),
(80, 'Completó su Perfil en RaptorNet', '2024-01-09 13:31:25.000000', '2403037'),
(81, 'Completó su Perfil en RaptorNet', '2024-01-09 13:31:34.000000', '2403053'),
(82, 'Completó su Perfil en RaptorNet', '2024-01-09 13:31:44.000000', '2403038'),
(83, 'Completó su Perfil en RaptorNet', '2024-01-09 13:31:52.000000', '2403025'),
(84, 'Completó su Perfil en RaptorNet', '2024-01-09 13:32:27.000000', '2403051'),
(85, 'Completó su Perfil en RaptorNet', '2024-01-09 13:32:34.000000', '2403032'),
(86, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:08.000000', '2403026'),
(87, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:13.000000', '2403055'),
(88, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:24.000000', '2403024'),
(89, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:26.000000', '2403050'),
(90, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:47.000000', '2403027'),
(91, 'Completó su Perfil en RaptorNet', '2024-01-09 13:33:51.000000', '2403047'),
(92, 'Completó su Perfil en RaptorNet', '2024-01-09 13:34:08.000000', '2403049'),
(93, 'Completó su Perfil en RaptorNet', '2024-01-09 13:34:11.000000', '2403033'),
(94, 'Completó su Perfil en RaptorNet', '2024-01-09 13:34:26.000000', '2403052'),
(95, 'Completó su Perfil en RaptorNet', '2024-01-09 13:34:29.000000', '2403054'),
(96, 'Completó su Perfil en RaptorNet', '2024-01-09 13:34:48.000000', '2403039'),
(97, 'Completó su Perfil en RaptorNet', '2024-01-09 13:35:48.000000', '2403029'),
(98, 'Completó su Perfil en RaptorNet', '2024-01-09 13:36:37.000000', '2403041'),
(99, 'Completó su Perfil en RaptorNet', '2024-01-09 13:37:06.000000', '2403048'),
(100, 'Completó su Perfil en RaptorNet', '2024-01-09 13:37:07.000000', '2403034'),
(101, 'Completó su Perfil en RaptorNet', '2024-01-09 13:38:29.000000', '2403044'),
(102, 'Completó su Perfil en RaptorNet', '2024-01-09 13:38:32.000000', '2403044'),
(103, 'Se registró en RaptorNet', '2024-01-10 07:08:00.000000', '2403056'),
(104, 'Cargó referencias de pago al 2403047', '2024-01-10 07:10:48.000000', '102'),
(105, 'Cargó referencias de pago al 2403048', '2024-01-10 07:10:48.000000', '102'),
(106, 'Cargó referencias de pago al 2403049', '2024-01-10 07:10:48.000000', '102'),
(107, 'Cargó referencias de pago al 2403050', '2024-01-10 07:10:48.000000', '102'),
(108, 'Cargó referencias de pago al 2403051', '2024-01-10 07:10:48.000000', '102'),
(109, 'Cargó referencias de pago al 2403052', '2024-01-10 07:10:48.000000', '102'),
(110, 'Cargó referencias de pago al 2403053', '2024-01-10 07:10:48.000000', '102'),
(111, 'Cargó referencias de pago al 2403054', '2024-01-10 07:10:48.000000', '102'),
(112, 'Cargó referencias de pago al 2403055', '2024-01-10 07:10:48.000000', '102'),
(113, 'Completó su Perfil en RaptorNet', '2024-01-10 07:15:03.000000', '2403056'),
(114, 'Se verificó el pago de 2403047 del exámen de admisión', '2024-01-10 07:18:23.000000', '102'),
(115, 'Se verificó el pago de 2403048 del exámen de admisión', '2024-01-10 07:18:25.000000', '102'),
(116, 'Se verificó el pago de 2403049 del exámen de admisión', '2024-01-10 07:18:27.000000', '102'),
(117, 'Se verificó el pago de 2403050 del exámen de admisión', '2024-01-10 07:18:29.000000', '102'),
(118, 'Se verificó el pago de 2403051 del exámen de admisión', '2024-01-10 07:18:33.000000', '102'),
(119, 'Se verificó el pago de 2403052 del exámen de admisión', '2024-01-10 07:18:34.000000', '102'),
(120, 'Se verificó el pago de 2403053 del exámen de admisión', '2024-01-10 07:18:35.000000', '102'),
(121, 'Se verificó el pago de 2403054 del exámen de admisión', '2024-01-10 07:18:36.000000', '102'),
(122, 'Se verificó el pago de 2403055 del exámen de admisión', '2024-01-10 07:18:37.000000', '102'),
(123, 'Se registró en RaptorNet', '2024-01-10 08:13:15.000000', '2403057'),
(124, 'Se registró en RaptorNet', '2024-01-10 08:13:19.000000', '2403058'),
(125, 'Se registró en RaptorNet', '2024-01-10 08:13:22.000000', '2403059'),
(126, 'Se registró en RaptorNet', '2024-01-10 08:14:18.000000', '2403060'),
(127, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403061'),
(128, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403062'),
(129, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403063'),
(130, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403064'),
(131, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403065'),
(132, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403066'),
(133, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403067'),
(134, 'Se registró en RaptorNet', '2024-01-10 08:15:54.000000', '2403068'),
(135, 'Se registró en RaptorNet', '2024-01-10 08:15:55.000000', '2403069'),
(136, 'Se registró en RaptorNet', '2024-01-10 08:16:05.000000', '2403070'),
(137, 'Se registró en RaptorNet', '2024-01-10 08:16:08.000000', '2403071'),
(138, 'Se registró en RaptorNet', '2024-01-10 08:16:10.000000', '2403072'),
(139, 'Se registró en RaptorNet', '2024-01-10 08:16:30.000000', '2403073'),
(140, 'Se registró en RaptorNet', '2024-01-10 08:16:39.000000', '2403074'),
(141, 'Se registró en RaptorNet', '2024-01-10 08:16:49.000000', '2403075'),
(142, 'Se registró en RaptorNet', '2024-01-10 08:17:27.000000', '2403076'),
(143, 'Se registró en RaptorNet', '2024-01-10 08:18:24.000000', '2403077'),
(144, 'Se registró en RaptorNet', '2024-01-10 08:18:28.000000', '2403078'),
(145, 'Se registró en RaptorNet', '2024-01-10 08:19:08.000000', '2403079'),
(146, 'Se registró en RaptorNet', '2024-01-10 08:19:55.000000', '2403080'),
(147, 'Se registró en RaptorNet', '2024-01-10 08:23:13.000000', '2403081'),
(148, 'Se registró en RaptorNet', '2024-01-10 08:24:25.000000', '2403082'),
(149, 'Se registró en RaptorNet', '2024-01-10 08:24:49.000000', '2403083'),
(150, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:42.000000', '2403069'),
(151, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:42.000000', '2403062'),
(152, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:42.000000', '2403074'),
(153, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:43.000000', '2403063'),
(154, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:43.000000', '2403070'),
(155, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:43.000000', '2403076'),
(156, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:43.000000', '2403078'),
(157, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403079'),
(158, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403065'),
(159, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403075'),
(160, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403071'),
(161, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403077'),
(162, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:44.000000', '2403067'),
(163, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:45.000000', '2403066'),
(164, 'Completó su Perfil en RaptorNet', '2024-01-10 08:27:46.000000', '2403068'),
(165, 'Completó su Perfil en RaptorNet', '2024-01-10 08:29:23.000000', '2403083'),
(166, 'Completó su Perfil en RaptorNet', '2024-01-10 08:30:47.000000', '2403082'),
(167, 'Completó su Perfil en RaptorNet', '2024-01-10 08:32:32.000000', '2403081'),
(168, 'Cargó referencias de pago al 2403056', '2024-01-10 08:32:47.000000', '102'),
(169, 'Cargó referencias de pago al 2403062', '2024-01-10 08:32:47.000000', '102'),
(170, 'Cargó referencias de pago al 2403063', '2024-01-10 08:32:47.000000', '102'),
(171, 'Cargó referencias de pago al 2403065', '2024-01-10 08:32:47.000000', '102'),
(172, 'Cargó referencias de pago al 2403066', '2024-01-10 08:32:47.000000', '102'),
(173, 'Cargó referencias de pago al 2403067', '2024-01-10 08:32:47.000000', '102'),
(174, 'Cargó referencias de pago al 2403068', '2024-01-10 08:32:47.000000', '102'),
(175, 'Cargó referencias de pago al 2403069', '2024-01-10 08:32:47.000000', '102'),
(176, 'Cargó referencias de pago al 2403070', '2024-01-10 08:32:47.000000', '102'),
(177, 'Cargó referencias de pago al 2403071', '2024-01-10 08:32:47.000000', '102'),
(178, 'Cargó referencias de pago al 2403074', '2024-01-10 08:32:47.000000', '102'),
(179, 'Cargó referencias de pago al 2403075', '2024-01-10 08:32:47.000000', '102'),
(180, 'Cargó referencias de pago al 2403076', '2024-01-10 08:32:47.000000', '102'),
(181, 'Cargó referencias de pago al 2403077', '2024-01-10 08:32:47.000000', '102'),
(182, 'Cargó referencias de pago al 2403078', '2024-01-10 08:32:47.000000', '102'),
(183, 'Cargó referencias de pago al 2403079', '2024-01-10 08:32:47.000000', '102'),
(184, 'Cargó referencias de pago al 2403083', '2024-01-10 08:32:47.000000', '102'),
(185, 'Se registró en RaptorNet', '2024-01-10 08:35:02.000000', '2403084'),
(186, 'Se verificó el pago de 2403062 del exámen de admisión', '2024-01-10 08:36:03.000000', '102'),
(187, 'Se verificó el pago de 2403063 del exámen de admisión', '2024-01-10 08:36:08.000000', '102'),
(188, 'Se verificó el pago de 2403065 del exámen de admisión', '2024-01-10 08:36:09.000000', '102'),
(189, 'Se verificó el pago de 2403066 del exámen de admisión', '2024-01-10 08:36:10.000000', '102'),
(190, 'Se verificó el pago de 2403067 del exámen de admisión', '2024-01-10 08:36:11.000000', '102'),
(191, 'Se verificó el pago de 2403071 del exámen de admisión', '2024-01-10 08:36:13.000000', '102'),
(192, 'Se verificó el pago de 2403074 del exámen de admisión', '2024-01-10 08:36:15.000000', '102'),
(193, 'Se verificó el pago de 2403075 del exámen de admisión', '2024-01-10 08:36:17.000000', '102'),
(194, 'Se verificó el pago de 2403075 del exámen de admisión', '2024-01-10 08:36:17.000000', '102'),
(195, 'Se verificó el pago de 2403076 del exámen de admisión', '2024-01-10 08:36:18.000000', '102'),
(196, 'Se verificó el pago de 2403068 del exámen de admisión', '2024-01-10 08:37:15.000000', '102'),
(197, 'Se verificó el pago de 2403069 del exámen de admisión', '2024-01-10 08:37:18.000000', '102'),
(198, 'Se verificó el pago de 2403070 del exámen de admisión', '2024-01-10 08:37:28.000000', '102'),
(199, 'Se verificó el pago de 2403077 del exámen de admisión', '2024-01-10 08:37:31.000000', '102'),
(200, 'Se verificó el pago de 2403083 del exámen de admisión', '2024-01-10 08:37:56.000000', '102'),
(201, 'Se verificó el pago de 2403078 del exámen de admisión', '2024-01-10 08:38:04.000000', '102'),
(202, 'Se verificó el pago de 2403079 del exámen de admisión', '2024-01-10 08:38:11.000000', '102'),
(203, 'Cargó referencias de pago al 2403081', '2024-01-10 08:40:38.000000', '102'),
(204, 'Completó su Perfil en RaptorNet', '2024-01-10 08:40:47.000000', '2403084'),
(205, 'Se verificó el pago de 2403081 del exámen de admisión', '2024-01-10 08:41:06.000000', '102'),
(206, 'Calificó el exámen de admisión de 2403049', '2024-01-10 08:42:37.000000', '160'),
(207, 'Calificó el exámen de admisión de 2403071', '2024-01-10 08:43:18.000000', '160'),
(208, 'Calificó el exámen de admisión de 2403062', '2024-01-10 08:43:51.000000', '160'),
(209, 'Calificó el exámen de admisión de 2403074', '2024-01-10 09:15:17.000000', '160'),
(210, 'Añadió a la lista de aceptados a 2403018', '2024-01-10 09:18:17.000000', '160'),
(211, 'Añadió a la lista de aceptados a 2403017', '2024-01-10 09:18:28.000000', '160'),
(212, 'Calificó el exámen de admisión de 2403020', '2024-01-10 09:22:09.000000', '160'),
(213, 'Calificó el exámen de admisión de 2403047', '2024-01-10 09:22:17.000000', '160'),
(214, 'Regresó a la lista de aspirantes a 2303002 por falta de pago', '2024-01-10 09:44:50.000000', '160'),
(215, 'Regresó a la lista de aspirantes a 2303003 por falta de pago', '2024-01-10 09:46:32.000000', '160'),
(216, 'Se registró en RaptorNet', '2024-01-10 12:10:32.000000', '2403085'),
(217, 'Se registró en RaptorNet', '2024-01-10 12:11:38.000000', '2403086'),
(218, 'Se registró en RaptorNet', '2024-01-10 12:11:43.000000', '2403087'),
(219, 'Se registró en RaptorNet', '2024-01-10 12:11:54.000000', '2403088'),
(220, 'Se registró en RaptorNet', '2024-01-10 12:11:55.000000', '2403089'),
(221, 'Se registró en RaptorNet', '2024-01-10 12:11:57.000000', '2403090'),
(222, 'Se registró en RaptorNet', '2024-01-10 12:12:03.000000', '2403091'),
(223, 'Se registró en RaptorNet', '2024-01-10 12:12:16.000000', '2403092'),
(224, 'Se registró en RaptorNet', '2024-01-10 12:12:25.000000', '2403093'),
(225, 'Se registró en RaptorNet', '2024-01-10 12:12:25.000000', '2403094'),
(226, 'Se registró en RaptorNet', '2024-01-10 12:12:25.000000', '2403095'),
(227, 'Se registró en RaptorNet', '2024-01-10 12:12:26.000000', '2403096'),
(228, 'Se registró en RaptorNet', '2024-01-10 12:12:28.000000', '2403097'),
(229, 'Se registró en RaptorNet', '2024-01-10 12:12:31.000000', '2403098'),
(230, 'Se registró en RaptorNet', '2024-01-10 12:12:53.000000', '2403099'),
(231, 'Se registró en RaptorNet', '2024-01-10 12:12:57.000000', '2403100'),
(232, 'Se registró en RaptorNet', '2024-01-10 12:13:04.000000', '2403101'),
(233, 'Se registró en RaptorNet', '2024-01-10 12:13:15.000000', '2403102'),
(234, 'Se registró en RaptorNet', '2024-01-10 12:13:29.000000', '2403103'),
(235, 'Se registró en RaptorNet', '2024-01-10 12:13:50.000000', '2403104'),
(236, 'Se registró en RaptorNet', '2024-01-10 12:13:57.000000', '2403105'),
(237, 'Completó su Perfil en RaptorNet', '2024-01-10 12:14:19.000000', '2403089'),
(238, 'Se registró en RaptorNet', '2024-01-10 12:14:24.000000', '2403106'),
(239, 'Completó su Perfil en RaptorNet', '2024-01-10 12:14:35.000000', '2403090'),
(240, 'Completó su Perfil en RaptorNet', '2024-01-10 12:14:51.000000', '2403097'),
(241, 'Completó su Perfil en RaptorNet', '2024-01-10 12:14:58.000000', '2403099'),
(242, 'Completó su Perfil en RaptorNet', '2024-01-10 12:15:07.000000', '2403095'),
(243, 'Completó su Perfil en RaptorNet', '2024-01-10 12:15:15.000000', '2403100'),
(244, 'Se registró en RaptorNet', '2024-01-10 12:15:25.000000', '2403107'),
(245, 'Se registró en RaptorNet', '2024-01-10 12:15:32.000000', '2403108'),
(246, 'Se registró en RaptorNet', '2024-01-10 12:15:39.000000', '2403109'),
(247, 'Se registró en RaptorNet', '2024-01-10 12:15:42.000000', '2403110'),
(248, 'Se registró en RaptorNet', '2024-01-10 12:15:54.000000', '2403111'),
(249, 'Completó su Perfil en RaptorNet', '2024-01-10 12:16:02.000000', '2403086'),
(250, 'Completó su Perfil en RaptorNet', '2024-01-10 12:16:03.000000', '2403096'),
(251, 'Se registró en RaptorNet', '2024-01-10 12:16:25.000000', '2403112'),
(252, 'Completó su Perfil en RaptorNet', '2024-01-10 12:16:31.000000', '2403098'),
(253, 'Completó su Perfil en RaptorNet', '2024-01-10 12:16:32.000000', '2403092'),
(254, 'Se registró en RaptorNet', '2024-01-10 12:16:35.000000', '2403113'),
(255, 'Se registró en RaptorNet', '2024-01-10 12:17:01.000000', '2403114'),
(256, 'Completó su Perfil en RaptorNet', '2024-01-10 12:17:16.000000', '2403111'),
(257, 'Completó su Perfil en RaptorNet', '2024-01-10 12:17:36.000000', '2403091'),
(258, 'Se registró en RaptorNet', '2024-01-10 12:18:20.000000', '2403115'),
(259, 'Completó su Perfil en RaptorNet', '2024-01-10 12:18:28.000000', '2403104'),
(260, 'Se registró en RaptorNet', '2024-01-10 12:18:39.000000', '2403116'),
(261, 'Completó su Perfil en RaptorNet', '2024-01-10 12:18:40.000000', '2403094'),
(262, 'Se registró en RaptorNet', '2024-01-10 12:19:01.000000', '2403117'),
(263, 'Completó su Perfil en RaptorNet', '2024-01-10 12:19:35.000000', '2403108'),
(264, 'Completó su Perfil en RaptorNet', '2024-01-10 12:19:44.000000', '2403106'),
(265, 'Completó su Perfil en RaptorNet', '2024-01-10 12:20:02.000000', '2403093'),
(266, 'Se registró en RaptorNet', '2024-01-10 12:20:59.000000', '2403118'),
(267, 'Se registró en RaptorNet', '2024-01-10 12:22:20.000000', '2403119'),
(268, 'Cargó referencias de pago al 2403082', '2024-01-10 12:22:34.000000', '102'),
(269, 'Cargó referencias de pago al 2403084', '2024-01-10 12:22:34.000000', '102'),
(270, 'Cargó referencias de pago al 2403086', '2024-01-10 12:22:34.000000', '102'),
(271, 'Cargó referencias de pago al 2403089', '2024-01-10 12:22:34.000000', '102'),
(272, 'Cargó referencias de pago al 2403090', '2024-01-10 12:22:34.000000', '102'),
(273, 'Cargó referencias de pago al 2403091', '2024-01-10 12:22:34.000000', '102'),
(274, 'Cargó referencias de pago al 2403092', '2024-01-10 12:22:34.000000', '102'),
(275, 'Cargó referencias de pago al 2403093', '2024-01-10 12:22:34.000000', '102'),
(276, 'Cargó referencias de pago al 2403094', '2024-01-10 12:22:34.000000', '102'),
(277, 'Cargó referencias de pago al 2403095', '2024-01-10 12:22:34.000000', '102'),
(278, 'Cargó referencias de pago al 2403096', '2024-01-10 12:22:34.000000', '102'),
(279, 'Cargó referencias de pago al 2403097', '2024-01-10 12:22:34.000000', '102'),
(280, 'Cargó referencias de pago al 2403098', '2024-01-10 12:22:34.000000', '102'),
(281, 'Cargó referencias de pago al 2403099', '2024-01-10 12:22:34.000000', '102'),
(282, 'Cargó referencias de pago al 2403100', '2024-01-10 12:22:34.000000', '102'),
(283, 'Cargó referencias de pago al 2403104', '2024-01-10 12:22:34.000000', '102'),
(284, 'Cargó referencias de pago al 2403106', '2024-01-10 12:22:34.000000', '102'),
(285, 'Cargó referencias de pago al 2403108', '2024-01-10 12:22:34.000000', '102'),
(286, 'Cargó referencias de pago al 2403111', '2024-01-10 12:22:34.000000', '102'),
(287, 'Completó su Perfil en RaptorNet', '2024-01-10 12:23:42.000000', '2403113'),
(288, 'Completó su Perfil en RaptorNet', '2024-01-10 12:23:43.000000', '2403112'),
(289, 'Se registró en RaptorNet', '2024-01-10 12:24:15.000000', '2403120'),
(290, 'Completó su Perfil en RaptorNet', '2024-01-10 12:24:41.000000', '2403116'),
(291, 'Completó su Perfil en RaptorNet', '2024-01-10 12:25:27.000000', '2403118'),
(292, 'Cargó referencias de pago al 2403112', '2024-01-10 12:26:56.000000', '102'),
(293, 'Cargó referencias de pago al 2403113', '2024-01-10 12:26:56.000000', '102'),
(294, 'Cargó referencias de pago al 2403116', '2024-01-10 12:26:56.000000', '102'),
(295, 'Cargó referencias de pago al 2403118', '2024-01-10 12:26:56.000000', '102'),
(296, 'Se verificó el pago de 2403082 del exámen de admisión', '2024-01-10 12:27:28.000000', '102'),
(297, 'Se verificó el pago de 2403082 del exámen de admisión', '2024-01-10 12:27:30.000000', '102'),
(298, 'Se verificó el pago de 2403084 del exámen de admisión', '2024-01-10 12:27:30.000000', '102'),
(299, 'Se verificó el pago de 2403084 del exámen de admisión', '2024-01-10 12:27:31.000000', '102'),
(300, 'Se verificó el pago de 2403086 del exámen de admisión', '2024-01-10 12:27:32.000000', '102'),
(301, 'Se verificó el pago de 2403086 del exámen de admisión', '2024-01-10 12:27:33.000000', '102'),
(302, 'Se verificó el pago de 2403089 del exámen de admisión', '2024-01-10 12:27:34.000000', '102'),
(303, 'Se verificó el pago de 2403090 del exámen de admisión', '2024-01-10 12:27:35.000000', '102'),
(304, 'Se verificó el pago de 2403090 del exámen de admisión', '2024-01-10 12:27:36.000000', '102'),
(305, 'Se verificó el pago de 2403091 del exámen de admisión', '2024-01-10 12:27:37.000000', '102'),
(306, 'Se verificó el pago de 2403096 del exámen de admisión', '2024-01-10 12:27:39.000000', '102'),
(307, 'Se verificó el pago de 2403097 del exámen de admisión', '2024-01-10 12:27:40.000000', '102'),
(308, 'Se verificó el pago de 2403098 del exámen de admisión', '2024-01-10 12:27:42.000000', '102'),
(309, 'Se verificó el pago de 2403099 del exámen de admisión', '2024-01-10 12:27:43.000000', '102'),
(310, 'Se verificó el pago de 2403100 del exámen de admisión', '2024-01-10 12:27:44.000000', '102'),
(311, 'Se verificó el pago de 2403100 del exámen de admisión', '2024-01-10 12:27:45.000000', '102'),
(312, 'Se verificó el pago de 2403104 del exámen de admisión', '2024-01-10 12:27:46.000000', '102'),
(313, 'Completó su Perfil en RaptorNet', '2024-01-10 12:27:56.000000', '2403117'),
(314, 'Completó su Perfil en RaptorNet', '2024-01-10 12:28:26.000000', '2403119'),
(315, 'Se registró en RaptorNet', '2024-01-10 12:29:03.000000', '2403121'),
(316, 'Cargó referencias de pago al 2403044', '2024-01-10 12:29:39.000000', '102'),
(317, 'Se registró en RaptorNet', '2024-01-10 12:29:51.000000', '2403122'),
(318, 'Se verificó el pago de 2403108 del exámen de admisión', '2024-01-10 12:30:31.000000', '102'),
(319, 'Completó su Perfil en RaptorNet', '2024-01-10 12:30:59.000000', '2403121'),
(320, 'Calificó el exámen de admisión de 2403070', '2024-01-10 12:31:22.000000', '160'),
(321, 'Calificó el exámen de admisión de 2403076', '2024-01-10 12:31:28.000000', '160'),
(322, 'Calificó el exámen de admisión de 2403077', '2024-01-10 12:31:32.000000', '160'),
(323, 'Calificó el exámen de admisión de 2403082', '2024-01-10 12:31:39.000000', '160'),
(324, 'Se registró en RaptorNet', '2024-01-11 08:11:53.000000', '2403123'),
(325, 'Completó su Perfil en RaptorNet', '2024-01-11 08:12:48.000000', '2403123'),
(326, 'Cargó referencias de pago al 2403123', '2024-01-11 08:15:42.000000', '102'),
(327, 'Calificó el exámen de admisión de 2403100', '2024-01-11 13:16:25.000000', '104'),
(328, 'Añadió a la lista de aceptados a 2403100', '2024-01-11 13:16:36.000000', '104'),
(329, 'Regresó a la lista de aspirantes a 2403100 por falta de pago', '2024-01-11 13:16:53.000000', '104'),
(330, 'Añadió a la lista de aceptados a 2303002', '2024-01-11 13:17:24.000000', '104'),
(331, 'Añadió a la lista de aceptados a 2403100', '2024-01-11 13:18:02.000000', '104'),
(332, 'Completó su Perfil en RaptorNet', '2024-01-12 11:45:58.000000', '2403022'),
(333, 'Completó su Perfil en RaptorNet', '2024-01-12 11:49:33.000000', '2403022'),
(334, 'Completó su Perfil en RaptorNet', '2024-01-12 12:48:19.000000', '2403022'),
(335, 'Se registró en RaptorNet', '2024-01-13 08:28:50.000000', '2403124'),
(336, 'Se registró en RaptorNet', '2024-01-13 08:36:15.000000', '2403125'),
(337, 'Se registró en RaptorNet', '2024-01-13 08:47:28.000000', '2403126'),
(338, 'Se registró en RaptorNet', '2024-01-13 08:48:16.000000', '2403127'),
(339, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-13 09:06:09.000000', '102'),
(340, 'Se verificó el pago de 2303021 del exámen de admisión', '2024-01-13 09:06:13.000000', '102'),
(341, 'Se verificó el pago de 2303022 del exámen de admisión', '2024-01-13 09:06:15.000000', '102'),
(342, 'Se verificó el pago de 2303023 del exámen de admisión', '2024-01-13 09:06:24.000000', '102'),
(343, 'Se verificó el pago de 2303025 del exámen de admisión', '2024-01-13 09:06:27.000000', '102'),
(344, 'Calificó el exámen de admisión de 2303001', '2024-01-13 09:12:22.000000', '160'),
(345, 'Añadió a la lista de aceptados a 2303001', '2024-01-13 09:12:25.000000', '160'),
(346, 'Cargó referencias de pago al 2303001', '2024-01-13 09:15:07.000000', '102'),
(347, 'Cargó referencias de pago al 2303002', '2024-01-13 09:15:07.000000', '102'),
(348, 'Cargó referencias de pago al 2403018', '2024-01-13 09:15:07.000000', '102'),
(349, 'Cargó referencias de pago al 2403100', '2024-01-13 09:15:07.000000', '102'),
(350, 'Cargó referencias de pago al 2403100', '2024-01-13 09:15:07.000000', '102'),
(351, 'Calificó el exámen de admisión de 2403078', '2024-01-13 10:06:43.000000', '160'),
(352, 'Añadió a la lista de aceptados a 2403078', '2024-01-13 10:07:12.000000', '160'),
(353, 'Cargó referencias de pago al 2403022', '2024-01-13 10:34:06.000000', '102'),
(354, 'Cargó referencias de pago al 2403024', '2024-01-13 10:37:04.000000', '102'),
(355, 'Cargó referencias de pago al 2403078', '2024-01-13 10:42:28.000000', '102'),
(356, 'Se registró en RaptorNet', '2024-01-13 10:52:05.000000', '2403128'),
(357, 'Completó su Perfil en RaptorNet', '2024-01-13 10:53:19.000000', '2403128'),
(358, 'Cargó referencias de pago al 2403128', '2024-01-13 10:56:50.000000', '102'),
(359, 'Se verificó el pago de 2403128 del exámen de admisión', '2024-01-13 10:58:24.000000', '102'),
(360, 'Actualizó la cuota 2a 1472.00', '2024-01-13 11:30:00.000000', '102'),
(361, 'Actualizó la cuota 2 a 1473.00', '2024-01-13 11:30:44.000000', '102'),
(362, 'Actualizó la cuota 2 a 1473.00', '2024-01-13 11:50:44.000000', '102'),
(363, 'Actualizó la cuota 2 a 1473.00', '2024-01-13 11:51:00.000000', '102'),
(364, 'Actualizó la cuota 1 a 1472.00', '2024-01-13 11:57:46.000000', '102'),
(365, 'Actualizó la cuota 1 a 1473.00', '2024-01-13 11:57:59.000000', '102'),
(366, 'Actualizó la cuota 1 a 1473.00a', '2024-01-13 11:58:17.000000', '102'),
(367, 'Actualizó la cuota 1 a 1473.00', '2024-01-13 11:58:25.000000', '102'),
(368, 'Actualizó la cuota 5 a 295.0', '2024-01-13 12:01:19.000000', '102'),
(369, 'Actualizó la cuota 5 a 295.00', '2024-01-13 12:01:29.000000', '102'),
(370, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:03:50.000000', '102'),
(371, 'Actualizó la cuota 4 a 122.01', '2024-01-13 12:06:46.000000', '102'),
(372, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:06:50.000000', '102'),
(373, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:07:59.000000', '102'),
(374, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:08:23.000000', '102'),
(375, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:08:49.000000', '102'),
(376, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:09:57.000000', '102'),
(377, 'Actualizó la cuota 1 a 1475', '2024-01-13 12:10:43.000000', '102'),
(378, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:10:47.000000', '102'),
(379, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:12:31.000000', '102'),
(380, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:12:36.000000', '102'),
(381, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:12:52.000000', '102'),
(382, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:13:33.000000', '102'),
(383, 'Actualizó la cuota 1 a 1475.01', '2024-01-13 12:14:22.000000', '102'),
(384, 'Actualizó la cuota 5 a 295.00', '2024-01-13 12:14:26.000000', '102'),
(385, 'Actualizó la cuota 5 a 295.00', '2024-01-13 12:14:30.000000', '102'),
(386, 'Actualizó la cuota 13 a 982.01', '2024-01-13 12:14:34.000000', '102'),
(387, 'Actualizó la cuota 1 a 1475.00', '2024-01-13 12:14:38.000000', '102'),
(388, 'Actualizó la cuota 4 a 122.00', '2024-01-13 12:14:48.000000', '102'),
(389, 'Actualizó la cuota 6 a 258.01', '2024-01-13 12:16:07.000000', '102'),
(390, 'Actualizó la cuota 6 a 258.00', '2024-01-13 12:16:14.000000', '102'),
(391, 'Actualizó la cuota 40 a 2348.00', '2024-01-13 12:17:05.000000', '102'),
(392, 'Se registró en RaptorNet', '2024-01-13 12:49:12.000000', '2403129'),
(393, 'Completó su Perfil en RaptorNet', '2024-01-13 12:50:31.000000', '2403129'),
(394, 'Cargó referencias de pago al 2403129', '2024-01-13 12:52:12.000000', '102'),
(395, 'Se verificó el pago de 2403129 del exámen de admisión', '2024-01-13 12:52:36.000000', '102'),
(396, 'Calificó el exámen de admisión de 2403129', '2024-01-13 12:53:07.000000', '160'),
(397, 'Añadió a la lista de aceptados a 2403129', '2024-01-13 12:53:18.000000', '160'),
(398, 'Actualizó la cuota 4 a 122.01', '2024-01-15 07:03:52.000000', '102'),
(399, 'Actualizó la cuota 13 a 982.00', '2024-01-15 07:04:10.000000', '102'),
(400, 'Actualizó la cuota 4 a 122.00', '2024-01-15 07:05:00.000000', '102'),
(401, 'Se registró en RaptorNet', '2024-01-15 08:20:19.000000', '2403130'),
(402, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:10:12.000000', '102'),
(403, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:10:12.000000', '102'),
(404, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:10:34.000000', '102'),
(405, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:10:34.000000', '102'),
(406, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:17:23.000000', '102'),
(407, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:17:23.000000', '102'),
(408, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:17:48.000000', '102'),
(409, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:17:48.000000', '102'),
(410, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:18:50.000000', '102'),
(411, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:18:50.000000', '102'),
(412, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:24:28.000000', '102'),
(413, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:24:28.000000', '102'),
(414, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:35:19.000000', '102'),
(415, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:35:19.000000', '102'),
(416, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:39:49.000000', '102'),
(417, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:39:49.000000', '102'),
(418, 'Se verificó el pago de 2303001 del exámen de admisión', '2024-01-15 12:44:26.000000', '102'),
(419, 'Cargó referencias de pago al 2403025', '2024-01-15 12:46:31.000000', '102'),
(420, 'Cargó referencias de pago al 2403026', '2024-01-15 12:46:31.000000', '102'),
(421, 'Se verificó el pago de 2403025 del exámen de admisión', '2024-01-15 12:46:49.000000', '102'),
(422, 'Se verificó el pago de 2403026 del exámen de admisión', '2024-01-15 12:46:52.000000', '102'),
(423, 'Calificó el exámen de admisión de 2403026', '2024-01-15 12:47:16.000000', '160'),
(424, 'Calificó el exámen de admisión de 2403025', '2024-01-15 12:47:26.000000', '160'),
(425, 'Añadió a la lista de aceptados a 2403025', '2024-01-15 12:47:53.000000', '160'),
(426, 'Añadió a la lista de aceptados a 2403026', '2024-01-15 12:47:55.000000', '160'),
(427, 'Cargó referencias de pago al 2403025', '2024-01-15 12:48:39.000000', '102'),
(428, 'Cargó referencias de pago al 2403026', '2024-01-15 12:48:39.000000', '102'),
(429, 'Se registró en RaptorNet', '2024-01-15 13:00:36.000000', '2403131'),
(430, 'Completó su Perfil en RaptorNet', '2024-01-15 13:02:43.000000', '2403131'),
(431, 'Cargó referencias de pago al 2403131', '2024-01-15 13:06:42.000000', '102'),
(432, 'Se verificó el pago de 2403131 del exámen de admisión', '2024-01-15 13:08:43.000000', '102'),
(433, 'Calificó el exámen de admisión de 2403131', '2024-01-15 13:09:26.000000', '160'),
(434, 'Añadió a la lista de aceptados a 2403131', '2024-01-15 13:09:37.000000', '160'),
(435, 'Cargó referencias de pago al 2403131', '2024-01-15 13:11:31.000000', '102'),
(436, 'Calificó el exámen de admisión de 2403063', '2024-01-15 13:19:10.000000', '160'),
(437, 'Calificó el exámen de admisión de 2403069', '2024-01-15 13:19:46.000000', '160'),
(438, 'Se registró en RaptorNet', '2024-01-15 13:49:08.000000', '2403132'),
(439, 'Completó su Perfil en RaptorNet', '2024-01-15 13:50:13.000000', '2403132'),
(440, 'Cargó referencias de pago al 2403132', '2024-01-15 13:51:56.000000', '102'),
(441, 'Se verificó el pago de 2403132 del exámen de admisión', '2024-01-15 13:53:38.000000', '102'),
(442, 'Calificó el exámen de admisión de 2403132', '2024-01-15 13:55:02.000000', '160'),
(443, 'Añadió a la lista de aceptados a 2403132', '2024-01-15 13:55:26.000000', '160'),
(444, 'Cargó referencias de pago al 2303020', '2024-01-15 13:57:00.000000', '102'),
(445, 'Cargó referencias de pago al 2403132', '2024-01-15 13:57:00.000000', '102'),
(446, 'Regresó a la lista de aspirantes a 2303020 por falta de pago', '2024-01-15 13:58:45.000000', '160'),
(447, 'Se registró en RaptorNet', '2024-01-16 07:26:59.000000', '2403133'),
(448, 'Se registró en RaptorNet', '2024-01-16 07:29:00.000000', '2403134'),
(449, 'Se registró en RaptorNet', '2024-01-16 08:16:32.000000', '2403135'),
(450, 'Se registró en RaptorNet', '2024-01-16 08:17:26.000000', '2403136'),
(451, 'Se registró en RaptorNet', '2024-01-16 08:18:44.000000', '2403137'),
(452, 'Cargó referencias de pago al 2403027', '2024-01-16 08:20:45.000000', '102'),
(453, 'Cargó referencias de pago al 2403029', '2024-01-16 08:20:45.000000', '102'),
(454, 'Cargó referencias de pago al 2403032', '2024-01-16 08:20:45.000000', '102'),
(455, 'Cargó referencias de pago al 2403033', '2024-01-16 08:20:45.000000', '102'),
(456, 'Cargó referencias de pago al 2403034', '2024-01-16 08:20:45.000000', '102'),
(457, 'Cargó referencias de pago al 2403037', '2024-01-16 08:20:45.000000', '102'),
(458, 'Verificó el pago de 2303013 y actualizó su etapa a 3', '2024-01-17 07:32:10.000000', '160'),
(459, 'Calificó el exámen de admisión de 2303013', '2024-01-17 07:33:42.000000', '160'),
(460, 'Verificó el pago de 2403045 y actualizó su etapa a 3', '2024-01-17 07:34:10.000000', '160'),
(461, 'Verificó el pago de 2303014 y actualizó su etapa a 3', '2024-01-17 07:48:57.000000', '160'),
(462, 'Verificó el pago de 2303015 y actualizó su etapa a 3', '2024-01-17 10:06:24.000000', '160'),
(463, 'Añadió a la lista de aceptados a 2403048', '2024-01-18 10:15:05.000000', '160'),
(464, 'Cargó referencias de pago al 2403038', '2024-01-18 10:18:05.000000', '102'),
(465, 'Cargó referencias de pago al 2403039', '2024-01-18 10:18:05.000000', '102'),
(466, 'Cargó referencias de pago al 2403041', '2024-01-18 10:18:05.000000', '102'),
(467, 'Cargó referencias de pago al 2403042', '2024-01-18 10:18:05.000000', '102'),
(468, 'Cargó referencias de pago al 2403117', '2024-01-18 10:18:05.000000', '102'),
(469, 'Cargó referencias de pago al 2403119', '2024-01-18 10:18:05.000000', '102'),
(470, 'Cargó referencias de pago al 2403121', '2024-01-18 10:18:05.000000', '102'),
(471, 'Se verificó el pago de 2403039 del exámen de admisión', '2024-01-18 10:19:38.000000', '102'),
(472, 'Cargó referencias de pago al 2303016', '2024-01-18 10:48:22.000000', '102'),
(473, 'Cargó referencias de pago al 2403016', '2024-01-18 10:48:22.000000', '102'),
(474, 'Cargó referencias de pago al 2303016', '2024-01-18 10:48:22.000000', '102'),
(475, 'Cargó referencias de pago al 2403016', '2024-01-18 10:48:22.000000', '102'),
(476, 'Cargó referencias de pago al 2403016', '2024-01-18 11:23:22.000000', '102'),
(477, 'Cargó referencias de pago al 2403016', '2024-01-18 11:25:28.000000', '102'),
(478, 'Cargó referencias de pago al 2303016', '2024-01-18 11:26:35.000000', '102'),
(479, 'Cargó referencias de pago al 2403016', '2024-01-18 11:26:35.000000', '102'),
(480, 'Cargó referencias de pago al 2303016', '2024-01-18 11:35:03.000000', '102'),
(481, 'Cargó referencias de pago al 2403016', '2024-01-18 11:35:03.000000', '102'),
(482, 'Cargó referencias de pago al 2303016', '2024-01-18 11:40:36.000000', '102'),
(483, 'Cargó referencias de pago al 2403016', '2024-01-18 11:40:36.000000', '102'),
(484, 'Cargó referencias de pago al 2303016', '2024-01-18 11:45:49.000000', '102'),
(485, 'Cargó referencias de pago al 2403016', '2024-01-18 11:45:49.000000', '102'),
(486, 'Cargó referencias de pago al 2403017', '2024-01-18 11:52:08.000000', '102'),
(487, 'Cargó referencias de pago al 2403006', '2024-01-18 11:52:08.000000', '102'),
(488, 'Cargó referencias de pago al 2303017', '2024-01-18 11:52:08.000000', '102'),
(489, 'Cargó referencias de pago al 2403048', '2024-01-18 11:52:08.000000', '102'),
(490, 'Cargó referencias de pago al 2403017', '2024-01-18 11:55:45.000000', '102'),
(491, 'Cargó referencias de pago al 2303017', '2024-01-18 11:55:45.000000', '102'),
(492, 'Cargó referencias de pago al 2303016', '2024-01-18 12:00:51.000000', '102'),
(493, 'Cargó referencias de pago al 2403016', '2024-01-18 12:00:51.000000', '102'),
(494, 'Se verificó el pago de 2403016 del exámen de admisión', '2024-01-18 13:13:39.000000', '102'),
(495, 'Se verificó el pago de 2403016 del exámen de admisión', '2024-01-18 13:15:36.000000', '102'),
(496, 'Se verificó el pago de 2403022 del exámen de admisión', '2024-01-18 13:15:36.000000', '102'),
(497, 'Se verificó el pago de 2403016 del exámen de admisión', '2024-01-18 13:17:59.000000', '102'),
(498, 'Se verificó el pago de 2403022 del exámen de admisión', '2024-01-18 13:17:59.000000', '102'),
(499, 'Se verificó el pago de 2403024 del exámen de admisión', '2024-01-18 13:17:59.000000', '102'),
(500, 'Se verificó el pago de 2403027 del exámen de admisión', '2024-01-18 13:17:59.000000', '102'),
(501, 'Se verificó el pago de 2403033 del exámen de admisión', '2024-01-18 13:35:49.000000', '102'),
(502, 'Se verificó el pago de 2403034 del exámen de admisión', '2024-01-18 13:35:49.000000', '102'),
(503, 'Se verificó el pago de 2403033 del exámen de admisión', '2024-01-18 13:43:27.000000', '102'),
(504, 'Se verificó el pago de 2403034 del exámen de admisión', '2024-01-18 13:43:27.000000', '102'),
(505, 'Se verificó el pago de 2403033 del exámen de admisión', '2024-01-18 13:45:35.000000', '102'),
(506, 'Se verificó el pago de 2403034 del exámen de admisión', '2024-01-18 13:45:35.000000', '102'),
(507, 'Se verificó el pago de 2403033 del exámen de admisión', '2024-01-18 13:47:34.000000', '102'),
(508, 'Se verificó el pago de 2403029 del exámen de admisión', '2024-01-18 13:47:34.000000', '102'),
(509, 'Se verificó el pago de 2403034 del exámen de admisión', '2024-01-18 13:47:34.000000', '102'),
(510, 'Se verificó el pago de 2403032 del exámen de admisión', '2024-01-18 13:47:34.000000', '102'),
(511, 'Añadió a la lista de aceptados a 2403010', '2024-01-18 13:50:44.000000', '160'),
(512, 'Añadió a la lista de aceptados a 2403012', '2024-01-18 13:50:46.000000', '160'),
(513, 'Añadió a la lista de aceptados a 2403020', '2024-01-18 13:50:46.000000', '160'),
(514, 'Cargó referencias de pago al 2403010', '2024-01-18 13:52:09.000000', '102'),
(515, 'Cargó referencias de pago al 2403012', '2024-01-18 13:52:09.000000', '102'),
(516, 'Cargó referencias de pago al 2403020', '2024-01-18 13:52:09.000000', '102'),
(517, 'Verificó el pago de 2403028 y actualizó su etapa a 3', '2024-01-18 13:52:31.000000', '160'),
(518, 'Se verificó el pago de 2403038 del exámen de admisión', '2024-01-19 07:12:04.000000', '102'),
(519, 'Se registró en RaptorNet', '2024-01-19 07:26:54.000000', '2403138'),
(520, 'Completó su Perfil en RaptorNet', '2024-01-19 07:28:00.000000', '2403138'),
(521, 'Se verificó el pago de 2403033 del exámen de admisión', '2024-01-19 07:54:28.000000', '102'),
(522, 'Se verificó el pago de 2403093 del exámen de admisión', '2024-01-19 07:54:28.000000', '102'),
(523, 'Se verificó el pago de 2403029 del exámen de admisión', '2024-01-19 07:54:28.000000', '102'),
(524, 'Se verificó el pago de 2403034 del exámen de admisión', '2024-01-19 07:54:28.000000', '102'),
(525, 'Se verificó el pago de 2403032 del exámen de admisión', '2024-01-19 07:54:28.000000', '102'),
(526, 'Actualizó la cuota 6 a 258.01', '2024-01-19 13:17:49.000000', '102'),
(527, 'Actualizó la cuota 6 a 258.00', '2024-01-19 13:17:59.000000', '102'),
(528, 'Se registró en RaptorNet', '2024-01-20 09:15:06.000000', '2403139'),
(529, 'Completó su Perfil en RaptorNet', '2024-01-20 09:17:06.000000', '2403139'),
(530, 'Verificó el pago de 2403139 y actualizó su etapa a 3', '2024-01-20 09:18:33.000000', '160'),
(531, 'Calificó el exámen de admisión de 2403139', '2024-01-20 09:20:33.000000', '160'),
(532, 'Verificó el pago de 2403139 y actualizó su etapa a 3', '2024-01-20 09:28:59.000000', '160'),
(533, 'Calificó el exámen de admisión de 2403139', '2024-01-20 09:31:04.000000', '160'),
(534, 'Añadió a la lista de aceptados a 2403139', '2024-01-20 09:31:42.000000', '160'),
(535, 'Cargó referencias de pago al 2403139', '2024-01-20 09:48:23.000000', '102'),
(536, 'Cargó referencias de pago al 2403139', '2024-01-20 09:50:58.000000', '102'),
(537, 'Cargó referencias de pago al 2403139', '2024-01-20 09:54:11.000000', '102'),
(538, 'Cargó referencias de pago al 2403139', '2024-01-20 09:59:57.000000', '102'),
(539, 'Cargó referencias de pago al 2403139', '2024-01-20 10:04:17.000000', '102'),
(540, 'Cargó referencias de pago al 2403138', '2024-01-20 10:06:05.000000', '102'),
(541, 'Cargó referencias de pago al 2403139', '2024-01-20 10:10:33.000000', '102'),
(542, 'Cargó referencias de pago al 2303016', '2024-01-20 10:13:41.000000', '102'),
(543, 'Cargó referencias de pago al 2403016', '2024-01-20 10:13:41.000000', '102'),
(544, 'Cargó referencias de pago al 2303016', '2024-01-20 10:15:25.000000', '102'),
(545, 'Cargó referencias de pago al 2303016', '2024-01-20 10:16:57.000000', '102'),
(546, 'Cargó referencias de pago al 2403016', '2024-01-20 10:17:10.000000', '102'),
(547, 'Cargó referencias de pago al 2303016', '2024-01-20 10:18:02.000000', '102'),
(548, 'Cargó referencias de pago al 2403016', '2024-01-20 10:18:02.000000', '102'),
(549, 'Cargó referencias de pago al 2303016', '2024-01-20 10:20:41.000000', '102'),
(550, 'Cargó referencias de pago al 2403016', '2024-01-20 10:20:41.000000', '102'),
(551, 'Cargó referencias de pago al 2303016', '2024-01-20 10:23:59.000000', '102'),
(552, 'Cargó referencias de pago al 2403016', '2024-01-20 10:23:59.000000', '102'),
(553, 'Cargó referencias de pago al 2403139', '2024-01-20 10:26:31.000000', '102'),
(554, 'Se registró en RaptorNet', '2024-01-20 10:33:43.000000', '2403140'),
(555, 'Completó su Perfil en RaptorNet', '2024-01-20 10:34:37.000000', '2403140'),
(556, 'Cargó referencias de pago al 2403140', '2024-01-20 10:35:08.000000', '102'),
(557, 'Se verificó el pago de 2403140 del exámen de admisión', '2024-01-20 10:35:55.000000', '102'),
(558, 'Calificó el exámen de admisión de 2403140', '2024-01-20 10:36:34.000000', '160'),
(559, 'Añadió a la lista de aceptados a 2403140', '2024-01-20 10:37:04.000000', '160'),
(560, 'Cargó referencias de pago al 2403140', '2024-01-20 10:38:47.000000', '102'),
(561, 'Se verificó el pago de inscripción de 2303017', '2024-01-20 11:35:50.000000', '102'),
(562, 'Se verificó el pago de inscripción de 2403010', '2024-01-20 11:39:11.000000', '102'),
(563, 'Se verificó el pago de inscripción de 2403010', '2024-01-20 11:39:11.000000', '102'),
(564, 'Se registró en RaptorNet', '2024-01-20 12:04:43.000000', '71'),
(565, 'Se registró en RaptorNet', '2024-01-20 12:05:12.000000', '2403141'),
(566, 'Se registró en RaptorNet', '2024-01-20 12:14:17.000000', '110'),
(567, 'Se verificó el pago de 2303016 del exámen de admisión', '2024-01-20 12:15:47.000000', '102'),
(568, 'Se verificó el pago de 2403016 del exámen de admisión', '2024-01-20 12:15:53.000000', '102'),
(569, 'Se verificó el pago de 2403139 del exámen de admisión', '2024-01-20 12:22:16.000000', '102'),
(570, 'Se verificó el pago de inscripción de 2403139', '2024-01-20 12:22:30.000000', '102'),
(571, 'Se verificó el pago de 2403048 del exámen de admisión', '2024-01-20 12:23:02.000000', '102'),
(572, 'Se verificó el pago de 2403020 del exámen de admisión', '2024-01-20 12:24:49.000000', '102'),
(573, 'Se verificó el pago de inscripción de 2403020', '2024-01-20 12:31:56.000000', '102'),
(574, 'Se registró en RaptorNet', '2024-01-20 12:35:05.000000', '2403142'),
(575, 'Completó su Perfil en RaptorNet', '2024-01-20 12:37:07.000000', '2403142'),
(576, 'Verificó el pago de 2403142 y actualizó su etapa a 3', '2024-01-20 12:38:11.000000', '160'),
(577, 'Calificó el exámen de admisión de 2403142', '2024-01-20 12:38:38.000000', '160'),
(578, 'Añadió a la lista de aceptados a 2403142', '2024-01-20 12:38:58.000000', '160'),
(579, 'Cargó referencias de pago al 2403142', '2024-01-20 12:39:59.000000', '102'),
(580, 'Se verificó el pago de inscripción de 2403142', '2024-01-20 12:41:30.000000', '102'),
(581, 'Se verificó el pago de 2403142 del exámen de admisión', '2024-01-20 12:46:47.000000', '102'),
(582, 'Actualizó la cuota 1 a 1475.01', '2024-01-23 11:22:30.000000', '102'),
(583, 'Actualizó la cuota 1 a 1475.00', '2024-01-23 11:22:33.000000', '102'),
(584, 'Se verificó el pago de 2403041 del exámen de admisión', '2024-01-23 11:22:39.000000', '102'),
(585, 'Se verificó el pago de 2403044 del exámen de admisión', '2024-01-23 11:22:49.000000', '102'),
(586, 'Calificó el exámen de admisión de 2303014', '2024-01-23 12:09:33.000000', '160'),
(587, 'Calificó el exámen de admisión de 2303015', '2024-01-23 12:09:39.000000', '160'),
(588, 'Se registró en RaptorNet', '2024-01-24 08:57:52.000000', '2403143'),
(589, 'Completó su Perfil en RaptorNet', '2024-01-24 08:59:04.000000', '2403143');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_nacionalidad`
--

CREATE TABLE `utmir_nacionalidad` (
  `id_nacionalidad` bigint(20) NOT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_nacionalidad`
--

INSERT INTO `utmir_nacionalidad` (`id_nacionalidad`, `nacionalidad`) VALUES
(1, 'Mexicana'),
(2, 'Extranjera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_objetivos_asignatura`
--

CREATE TABLE `utmir_objetivos_asignatura` (
  `id_objetivo_asignatura` bigint(20) NOT NULL,
  `fecha_entrega_planeacion` date DEFAULT NULL,
  `objetivo` varchar(255) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_objetivos_asignatura`
--

INSERT INTO `utmir_objetivos_asignatura` (`id_objetivo_asignatura`, `fecha_entrega_planeacion`, `objetivo`, `id_asignacion_asignatura`) VALUES
(31, NULL, 'Objetivo PWA grupo 1 ', 70),
(32, NULL, 'objetivo pwa grupo 2', 72),
(33, NULL, '2 2', 71),
(34, NULL, 'objetivo activa/inactiva', 74),
(35, NULL, 'Objetivo turismo', 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_pagos`
--

CREATE TABLE `utmir_pagos` (
  `id_pago` bigint(20) NOT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `id_cuota` bigint(20) DEFAULT NULL,
  `concatenado` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `verificar_pago` varchar(255) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `referencia_asignada` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_pagos`
--

INSERT INTO `utmir_pagos` (`id_pago`, `matricula`, `id_cuota`, `concatenado`, `referencia`, `verificar_pago`, `fecha_generacion`, `fecha_limite`, `referencia_asignada`) VALUES
(14, '2303002', 5, '300209053', '30020905336874270', 'si', NULL, NULL, NULL),
(15, '2303003', 40, '300304403', '30030405336954250', 'si', NULL, NULL, NULL),
(17, '2303016', 5, '301604053', '30160405337104286', 'si', NULL, NULL, NULL),
(19, '2303017', 5, '301712053', '30171205336974221', 'si', '2024-01-11', '2024-01-19', NULL),
(20, '2303018', 5, '301812053', '30181205337004258', 'si', NULL, NULL, NULL),
(21, '2303019', 5, '301903053', '30190305337004283', 'si', NULL, NULL, NULL),
(22, '2303005', 5, '300505053', '30050505337044231', 'si', NULL, NULL, NULL),
(24, '2303020', 40, '302001403', '30200140337377246', 'si', '2024-01-13', '2024-01-18', NULL),
(25, '2303021', 5, '302104053', '30210405337094275', 'si', NULL, NULL, NULL),
(26, '2303022', 5, '302212053', '30221205337094253', 'si', NULL, NULL, NULL),
(27, '2303024', 5, '302409053', '30240905337114215', 'si', NULL, NULL, NULL),
(28, '2303022', 24, '302204053', NULL, NULL, NULL, NULL, NULL),
(30, '2303025', 5, '302505053', '30250505337114233', 'si', NULL, NULL, NULL),
(31, '2303023', 5, '302312053', '30231205337114246', 'si', NULL, NULL, NULL),
(32, '2303026', 5, '302604053', '30260405337154291', 'si', NULL, NULL, NULL),
(33, '2303027', 5, '302704053', '30270405337154207', 'si', NULL, NULL, NULL),
(34, '2403001', 5, '300104053', '30010405337214240', 'si', NULL, NULL, NULL),
(35, '2303001', 5, '300112053', '30011205337234239', 'si', NULL, NULL, NULL),
(36, '2403002', 5, '300203053', '30020305337234264', 'si', NULL, NULL, NULL),
(37, '2403004', 5, '300405053', '30040505337264290', 'si', NULL, NULL, NULL),
(38, '2403007', 5, '300705053', '30070505337234278', 'si', NULL, NULL, NULL),
(39, '2403008', 5, '300803053', '30080305337234245', 'si', NULL, NULL, NULL),
(40, '2403009', 5, '300903403', '30090305337234258', 'si', NULL, NULL, NULL),
(41, '2403010', 5, '301003053', '30100305337234255', 'si', NULL, NULL, NULL),
(42, '2403011', 5, '301103053', '30110305337234268', 'si', NULL, NULL, NULL),
(43, '2403012', 5, '301205053', '30120505337234230', 'si', NULL, NULL, NULL),
(44, '2403006', 5, '300601053', '30060105337244287', 'si', NULL, NULL, NULL),
(45, '2403013', 5, '301303053', '30130305337244214', 'si', NULL, NULL, NULL),
(46, '2403014', 5, '301404053', '30140405337244250', 'si', NULL, NULL, NULL),
(47, '2403015', 5, '301505053', '30150505337244286', 'si', NULL, NULL, NULL),
(48, '2403016', 5, '301604053', '30160405337394283', 'si', NULL, NULL, NULL),
(49, '2403017', 5, '301704053', '30170405337254209', 'si', '2024-01-17', '2024-01-21', NULL),
(50, '2403018', 5, '301801053', '30180105337254250', 'si', NULL, NULL, NULL),
(51, '2403020', 5, '302003053', '30200305337284260', 'si', NULL, NULL, NULL),
(52, '2403006', 40, '300601403', '30060140337447258', NULL, NULL, NULL, NULL),
(53, '2403015', 40, '301505403', '30150540337245290', 'si', NULL, NULL, NULL),
(54, '2403021', 5, '302103053', '30210305337284273', 'si', NULL, NULL, NULL),
(55, '2403017', 40, '301704403', '30170440337387212', NULL, '2024-01-03', '2024-01-22', NULL),
(56, '2403038', 5, '303803053', '30380305337434237', 'si', NULL, NULL, NULL),
(57, '2403042', 5, '304212053', '30421205337434261', NULL, NULL, NULL, NULL),
(58, '2403037', 5, '303712053', '30371205337434212', NULL, NULL, NULL, NULL),
(59, '2403025', 5, '302504053', '30250405337434204', 'si', NULL, NULL, NULL),
(60, '2403053', 5, '305312053', '30531205337284241', 'si', NULL, NULL, NULL),
(61, '2403033', 5, '303301053', '30330105337434223', 'si', NULL, NULL, NULL),
(62, '2403032', 5, '303212053', '30321205337434244', 'si', NULL, NULL, NULL),
(63, '2403026', 5, '302603053', '30260305337434291', 'si', NULL, NULL, NULL),
(64, '2403027', 5, '302712053', '30271205337434292', 'si', NULL, NULL, NULL),
(65, '2403051', 5, '305101053', '30510105337284278', 'si', NULL, NULL, NULL),
(66, '2403049', 5, '304912053', '30491205337284205', 'si', NULL, NULL, NULL),
(67, '2403054', 5, '305404053', '30540405337284289', 'si', NULL, NULL, NULL),
(68, '2403050', 5, '305012053', '30501205337284202', 'si', NULL, NULL, NULL),
(69, '2403039', 5, '303909053', '30390905337434291', 'si', NULL, NULL, NULL),
(70, '2403024', 5, '302412053', '30241205337434253', 'si', NULL, NULL, NULL),
(71, '2403045', 5, '3045053', NULL, NULL, NULL, NULL, NULL),
(73, '2403047', 5, '304703053', '30470305337284288', 'si', NULL, NULL, NULL),
(74, '2403052', 5, '305201053', '30520105337284291', 'si', NULL, NULL, NULL),
(75, '2403055', 5, '305512053', '30551205337284267', 'si', NULL, NULL, NULL),
(76, '2403034', 5, '303412053', '30341205337434270', 'si', NULL, NULL, NULL),
(77, '2403029', 5, '302912053', '30291205337434221', 'si', NULL, NULL, NULL),
(78, '2403041', 5, '304112053', '30411205337434248', 'si', NULL, NULL, NULL),
(79, '2403048', 5, '304812053', '30481205337284289', 'si', NULL, NULL, NULL),
(80, '2403035', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2403046', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '2403044', 5, '304403053', '30440305337284249', 'si', NULL, NULL, NULL),
(83, '2403056', 5, '305603053', '30560305337294212', NULL, NULL, NULL, NULL),
(84, '2403071', 5, '307104053', '30710405337294204', 'si', NULL, NULL, NULL),
(85, '2403075', 5, '307505053', '30750505337294279', 'si', NULL, NULL, NULL),
(86, '2403064', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2403069', 5, '306904053', '30690405337294291', 'si', NULL, NULL, NULL),
(88, '2403078', 5, '307804053', '30780405337294295', 'si', NULL, NULL, NULL),
(89, '2403068', 5, '306805053', '30680505337294204', 'si', NULL, NULL, NULL),
(90, '2403076', 5, '307601053', '30760105337294297', 'si', NULL, NULL, NULL),
(91, '2403079', 5, '307912053', '30791205337294273', 'si', NULL, NULL, NULL),
(92, '2403074', 5, '307403053', '30740305337294220', 'si', NULL, NULL, NULL),
(93, '2403065', 5, '306501053', '30650105337294267', 'si', NULL, NULL, NULL),
(94, '2403077', 5, '307704053', '30770405337294282', 'si', NULL, NULL, NULL),
(95, '2403062', 5, '306205053', '30620505337294223', 'si', NULL, NULL, NULL),
(96, '2403070', 5, '307001053', '30700105337294219', 'si', NULL, NULL, NULL),
(97, '2403063', 5, '306304053', '30630405337294213', 'si', NULL, NULL, NULL),
(98, '2403066', 5, '306605053', '30660505337294275', 'si', NULL, NULL, NULL),
(99, '2403067', 5, '306703053', '30670305337294242', 'si', NULL, NULL, NULL),
(100, '2403082', 5, '308204053', '30820405337294234', 'si', NULL, NULL, NULL),
(101, '2403083', 5, '308301053', '30830105337294275', 'si', NULL, NULL, NULL),
(102, '2403081', 5, '308104053', '30810405337294221', 'si', NULL, NULL, NULL),
(103, '2403084', 5, '308412053', '30841205337294225', 'si', NULL, NULL, NULL),
(104, '2403018', 40, '301801403', '30180140337255254', 'si', NULL, NULL, NULL),
(105, '2303017', 40, '301704403', '30170440337417209', 'si', '2024-01-11', '2024-01-20', NULL),
(106, '2403089', 5, '308912053', '30891205337294290', 'si', NULL, NULL, NULL),
(107, '2403090', 5, '309012053', '30901205337294287', 'si', NULL, NULL, NULL),
(108, '2403086', 5, '308603053', '30860305337294263', 'si', NULL, NULL, NULL),
(109, '2403095', 5, '309504053', '30950405337294290', NULL, NULL, NULL, NULL),
(110, '2403100', 5, '310009053', '31000905337294206', 'si', NULL, NULL, NULL),
(111, '2403092', 5, '309201053', '30920105337294279', NULL, NULL, NULL, NULL),
(112, '2403097', 5, '309705053', '30970505337294242', 'si', NULL, NULL, NULL),
(113, '2403099', 5, '309901053', '30990105337294273', 'si', NULL, NULL, NULL),
(114, '2403096', 5, '309605053', '30960505337294229', 'si', NULL, NULL, NULL),
(115, '2403098', 5, '309804053', '30980405337294232', 'si', NULL, NULL, NULL),
(116, '2403093', 5, '309301053', '30930105337294292', 'si', NULL, NULL, NULL),
(117, '2403094', 5, '309404053', '30940405337294277', NULL, NULL, NULL, NULL),
(118, '2403091', 5, '309101053', '30910105337294266', 'si', NULL, NULL, NULL),
(119, '2403111', 5, '311103053', '31110305337294292', NULL, NULL, NULL, NULL),
(120, '2403104', 5, '310403053', '31040305337294217', 'si', NULL, NULL, NULL),
(121, '2403106', 5, '310605053', '31060505337294289', NULL, NULL, NULL, NULL),
(122, '2403108', 5, '310812053', '31081205337294257', 'si', NULL, NULL, NULL),
(123, '2403112', 5, '311212053', '31121205337294293', NULL, NULL, NULL, NULL),
(124, '2403113', 5, '311303053', '31130305337294221', NULL, NULL, NULL, NULL),
(125, '2403118', 5, '311804053', '31180405337294212', NULL, NULL, NULL, NULL),
(126, '2403116', 5, '311604053', '31160405337294283', NULL, NULL, NULL, NULL),
(127, '2403117', 5, '311712053', '31171205337444214', NULL, NULL, NULL, NULL),
(128, '2403119', 5, '311904053', '31190405337444275', NULL, NULL, NULL, NULL),
(129, '2403121', 5, '312101053', '31210105337444216', NULL, NULL, NULL, NULL),
(130, '2403123', 5, '312303053', '31230305337304201', NULL, NULL, NULL, NULL),
(132, '2403100', 40, '310009403', '31000940337295210', 'si', NULL, NULL, NULL),
(133, '2303002', 40, '300209403', '30020940336875274', 'si', NULL, NULL, NULL),
(135, '2403022', 5, '302203053', '30220305337314283', 'si', NULL, NULL, NULL),
(136, '2303001', 40, '300112403', '30011240337235243', 'si', NULL, NULL, NULL),
(137, '2403078', 40, '307804403', '30780440337375284', 'si', '2024-01-13', '2024-01-18', NULL),
(138, '2403128', 5, '312809053', '31280905337474251', 'si', NULL, NULL, NULL),
(139, '2403129', 5, '312903053', '31290305337474223', 'si', NULL, NULL, NULL),
(140, '2403129', 40, '312903403', NULL, 'si', '2024-01-13', '2024-01-18', NULL),
(141, '2403025', 40, '302504403', '30250440337397220', 'si', '2024-01-15', '2024-01-20', NULL),
(142, '2403026', 40, '302603403', '30260340337397210', 'si', '2024-01-15', '2024-01-20', NULL),
(143, '2403131', 5, '313109053', '31310905337494211', 'si', NULL, NULL, NULL),
(144, '2403131', 40, '313109403', '31310940337397222', 'si', '2024-01-15', '2024-01-20', NULL),
(145, '2403132', 5, '313209053', '31320905337494224', 'si', NULL, NULL, NULL),
(146, '2403132', 40, '313209403', '31320940337397235', 'si', '2024-01-15', '2024-01-20', NULL),
(147, '2403048', 40, '304812403', '30481240337467226', 'si', '2024-01-18', '2024-01-23', NULL),
(148, '2403010', 40, '301003403', '30100340337427209', 'si', '2024-01-18', '2024-01-23', NULL),
(149, '2403012', 40, '301205403', '30120540337427281', NULL, '2024-01-18', '2024-01-23', NULL),
(150, '2403020', 40, '302003403', '30200340337427226', 'si', '2024-01-18', '2024-01-23', NULL),
(151, '2403138', 5, '313809053', '31380905337534219', NULL, NULL, NULL, NULL),
(152, '2403139', 5, '313901053', NULL, 'si', NULL, NULL, NULL),
(153, '2403139', 40, '313901403', '31390140337447270', 'si', '2024-01-20', '2024-01-25', NULL),
(154, '2403140', 5, '314003053', '31400305337544205', 'si', NULL, NULL, NULL),
(155, '2403140', 40, '314003403', '31400340337447216', 'si', '2024-01-20', '2024-01-25', NULL),
(156, '2403142', 5, '314201053', NULL, 'si', NULL, NULL, NULL),
(157, '2403142', 40, '314201403', '31420140337447293', 'si', '2024-01-20', '2024-01-25', NULL),
(158, '2403143', 5, '314301053', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_periodos`
--

CREATE TABLE `utmir_periodos` (
  `id` bigint(20) NOT NULL,
  `anio_fin` int(11) DEFAULT NULL,
  `anio_inicio` int(11) DEFAULT NULL,
  `numero_periodo` int(11) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_planeaciones`
--

CREATE TABLE `utmir_planeaciones` (
  `id_planeacion` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `no_semana` varchar(255) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_planeaciones`
--

INSERT INTO `utmir_planeaciones` (`id_planeacion`, `descripcion`, `fecha_fin`, `fecha_inicio`, `no_semana`, `id_asignacion_asignatura`) VALUES
(43, 'Primera semana ed d1', '2024-01-12', '2024-01-08', '1', 70),
(44, 'Segunda semana ed d1', '2024-01-19', '2024-01-15', '2', 70),
(45, '1231', '2024-02-23', '2024-02-14', '1', 72),
(46, '', '2024-02-15', '2024-02-05', '2', 72),
(47, '12222', '2024-02-22', '2024-02-08', '1', 74),
(48, 'as', '2024-02-16', '2024-02-16', '1', 75),
(49, '2332', '2024-02-23', '2024-02-17', '2', 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_proyecto_asignatura`
--

CREATE TABLE `utmir_proyecto_asignatura` (
  `id_proyecto_asignatura` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `objetivo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_asignacion_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_proyecto_asignatura`
--

INSERT INTO `utmir_proyecto_asignatura` (`id_proyecto_asignatura`, `fecha`, `objetivo`, `titulo`, `id_asignacion_asignatura`) VALUES
(8, '2024-04-15', 'El alumno realizará procesos de videojueog', 'Videojuego', 70),
(9, '2022-02-02', '2', '2', 72),
(10, '2001-02-21', '2.1', '21', 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_roles`
--

CREATE TABLE `utmir_roles` (
  `id` int(11) NOT NULL,
  `name` enum('ROLE_ADMIN','ROLE_ALUMNO','ROLE_ASPIRANTE','ROLE_BAJA_ABANDONO','ROLE_BAJA_DEFINITIVA','ROLE_BAJA_TEMPORAL','ROLE_DIRECCION_ACADEMICA','ROLE_DOCENTES','ROLE_EGRESADO_ING_LIC','ROLE_EGRESADO_TSU','ROLE_FINANZAS','ROLE_INACTIVO_FALTA_PAGO','ROLE_NO_CONTINUIDAD','ROLE_SERVICIOSESCOLARES','ROLE_VINCULACION') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_roles`
--

INSERT INTO `utmir_roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_ASPIRANTE'),
(3, 'ROLE_FINANZAS'),
(4, 'ROLE_VINCULACION'),
(5, 'ROLE_SERVICIOSESCOLARES'),
(6, 'ROLE_ALUMNO'),
(7, 'ROLE_DIRECCION_ACADEMICA'),
(8, 'ROLE_DOCENTES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_status`
--

CREATE TABLE `utmir_status` (
  `id_status` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_status`
--

INSERT INTO `utmir_status` (`id_status`, `status`) VALUES
(0, 'Inactivo'),
(1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_tipo_sangre`
--

CREATE TABLE `utmir_tipo_sangre` (
  `id_tipo_sangre` bigint(20) NOT NULL,
  `tipo_sangre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_tipo_sangre`
--

INSERT INTO `utmir_tipo_sangre` (`id_tipo_sangre`, `tipo_sangre`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_unidades_asignatura`
--

CREATE TABLE `utmir_unidades_asignatura` (
  `id_unidades_asignatura` bigint(20) NOT NULL,
  `nombre_unidad` varchar(255) DEFAULT NULL,
  `porcentaje` double NOT NULL,
  `total_horas_unidad` varchar(255) DEFAULT NULL,
  `id_asignaturas` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_unidades_asignatura`
--

INSERT INTO `utmir_unidades_asignatura` (`id_unidades_asignatura`, `nombre_unidad`, `porcentaje`, `total_horas_unidad`, `id_asignaturas`) VALUES
(1, 'I. Sistemas de Numeración', 18.19, '12', 87),
(2, 'II.	Álgebra', 27.27, '18', 87),
(3, 'III.	Ecuaciones e Inecuaciones', 27.27, '18', 87),
(4, 'IV. Álgebra Lineal', 27.27, '18', 87),
(5, 'I.	Principios básicos de Química', 26.67, '20', 88),
(6, 'II.	Nomenclatura de compuestos químicos y Estequiometría', 26.67, '20', 88),
(7, 'III.	Soluciones y Cinética química', 26.66, '20', 88),
(8, 'VI.	Electroquímica y Termoquímica', 20, '15', 88),
(9, 'I.             La Célula', 20, '12', 89),
(10, 'II.            Anatomía vegetal', 43.33, '26', 89),
(11, 'III.          Grupos zoológicos de interés agrícola', 21.67, '13', 89),
(12, 'IV.         Introducción a la ecología', 15, '9', 89),
(13, '     I.        Introducción a la Fisiología Vegetal', 8.33, '5', 90),
(14, '    II.        Crecimiento y desarrollo de las plantas', 63.33, '38', 90),
(15, '  III.        Reguladores de crecimiento', 28.34, '17', 90),
(16, 'I.	Presentación', 50, '30', 92),
(17, 'II.	Actividades', 50, '30', 92),
(18, 'I. Bases gramaticales para la construcción de ideas', 26.67, '20', 93),
(19, 'II. Organización y estructuración de ideas', 46.67, '35', 93),
(20, 'III. Introducción a la redacción', 26.66, '20', 93),
(21, 'I.	Desarrollo sustentable', 50, '15', 94),
(22, 'II.	Plan de vida y carrera', 50, '15', 94),
(23, 'I.	Estructura y función de microorganismos', 25, '15', 91),
(24, 'II.	Medios de cultivo y crecimiento microbiano', 50, '30', 91),
(25, 'III.	Producción masiva de microorganismos', 25, '15', 91),
(26, 'I.	Geometría y Trigonometría', 26.67, '16', 95),
(27, 'II.	Geometría Analítica', 26.67, '16', 95),
(28, 'III.	Funciones', 26.66, '16', 95),
(29, 'VI.	Álgebra Vectorial', 20, '12', 95),
(30, 'I. Introducción a la química orgánica', 16.67, '15', 96),
(31, 'II.  Hidrocarburos alifáticos y cíclicos', 22.22, '20', 96),
(32, 'III.  Hidrocarburos aromáticos y sus derivados', 22.22, '20', 96),
(33, 'IV. Compuestos orgánicos oxigenados', 22.22, '20', 96),
(34, 'V. Compuestos orgánicos nitrogenados', 16.67, '15', 96),
(35, 'I.             El presente continuo', 16.67, '10', 102),
(36, 'II.            La cantidad', 16.67, '10', 102),
(37, 'III.          El pasado', 66.66, '40', 102),
(38, 'I.             Mecánica de grupos', 33.33, '15', 103),
(39, 'II.            Dinámica de grupos', 66.67, '30', 103),
(40, 'I.           Sistemas, taxonomía y nomenclatura de plantas', 10, '6', 100),
(41, 'II.            Talofitas', 10, '6', 100),
(42, 'III.          Plantas inferiores', 10, '6', 100),
(43, 'IV.          Spermatophyta: Subdivisión Coniferophytina, (Gimnospermas).', 10, '6', 100),
(44, 'V.           Spermatophyta: Subdivisión Magnoliophytina, (Angiospermas).', 33.33, '20', 100),
(45, 'VI.          Spermatophyta: Subdivisión Magnoliophytina, (Angiospermas). ', 26.67, '16', 100),
(46, 'I. Interacción y cuantificación de poblaciones microbianas', 55.56, '25', 99),
(47, 'II. Hábitat microbiano y ciclos biogeoquímicos', 44.44, '20', 99),
(48, 'I.             Introducción a la edafología', 10, '6', 98),
(49, 'II.            Propiedades físicas', 26.67, '16', 98),
(50, 'III.          Propiedades hidrofísicas', 23.33, '14', 98),
(51, 'IV.         Propiedades químicas', 40, '24', 98),
(52, '1.    Bases cromosómicas y bioquímicas de la herencia ', 20, '12', 97),
(53, '2.    Genética mendeliana y no mendeliana', 33.33, '20', 97),
(54, '3.    Mejoramiento genético de plantas', 46.67, '28', 97),
(55, 'I.      Informática.', 11.12, '5', 101),
(56, 'II.     Ofimática.', 44.44, '20', 101),
(57, 'III.   Bases de Datos', 44.44, '20', 101),
(58, 'I.             Límites y continuidad', 20, '12', 104),
(59, 'II.            La derivada', 53.33, '32', 104),
(60, 'III.          Optimización', 26.67, '16', 104),
(61, 'I.             Muestreo y pretratamiento de muestras', 16.67, '15', 105),
(62, 'II.            Métodos analíticos clásicos', 44.44, '40', 105),
(63, 'III.          Métodos de análisis instrumental', 38.89, '35', 105),
(64, 'I.             Introducción a la Física', 20, '12', 106),
(65, 'II.            Estática', 33.33, '20', 106),
(66, 'III.          Dinámica y Cinemática', 46.67, '28', 106),
(67, 'I.             Pasado simple vs pasado continuo', 33.33, '20', 111),
(68, 'II.            Invitaciones', 33.33, '20', 111),
(69, 'III.          Planes y proyectos', 33.34, '20', 111),
(70, 'I.             Liderazgo y toma de decisiones', 33.33, '10', 112),
(71, 'II.            Negociación y toma de decisiones', 66.67, '20', 112),
(72, 'I.             Carbohidratos', 20, '12', 109),
(73, 'II.            Lípidos', 20, '12', 109),
(74, 'III.          Proteínas', 41.67, '25', 109),
(75, 'IV.         Ácidos nucleicos.', 18.33, '11', 109),
(76, 'I.             Importancia de la biotecnología y requerimientos para el cultivo in vitro', 33.33, '20', 107),
(77, 'II.            Vías morfogénicas de propagación in vitro', 50, '30', 107),
(78, 'III.          Técnicas de cultivo para mejoramiento de material vegetal', 16.67, '10', 107),
(79, 'I.      Plagas', 66.67, '40', 108),
(80, 'II.     Malezas', 33.33, '20', 108),
(81, 'I.   Propagación por acodos y estacas', 28.89, '13', 110),
(82, 'II.  Reproducción y propagación por injertos', 28.89, '13', 110),
(83, 'III. Reproducción y propagación por semillas', 22.22, '10', 110),
(84, 'IV. Propagación mediante estructuras especiales', 20, '9', 110),
(85, 'I.             Integral indefinida ', 33.33, '20', 113),
(86, 'II.            Integral definida', 33.33, '20', 113),
(87, 'III.          Series y sucesiones', 33.34, '20', 113),
(88, 'I.             Estadística Descriptiva', 33.33, '25', 114),
(89, 'II.            Probabilidad', 33.33, '25', 114),
(90, 'III.          Estadística Inferencial', 33.34, '25', 114),
(91, 'I.             Planteamiento del proyecto agrobiotecnológico', 20, '6', 115),
(92, 'II.            Desarrollo del proyecto agrobiotecnológico', 80, '24', 115),
(93, 'I.             Comparativos, superlativos', 33.33, '20', 121),
(94, 'II.            Presente Perfecto', 66.67, '40', 121),
(95, 'I. Proceso del pensamiento creativo', 33.33, '15', 122),
(96, 'II. Desarrollo de ideas', 44.45, '20', 122),
(97, 'III. Administración por valores', 22.22, '10', 122),
(98, '     I.        Introducción a los abonos orgánicos', 11.11, '5', 119),
(99, '    II.        Abonos orgánicos sólidos', 44.45, '20', 119),
(100, '  III.        Abonos orgánicos líquidos', 44.44, '20', 119),
(101, 'I. Requerimientos para la aclimatización', 50, '30', 118),
(102, 'II.  Manejo nutricional durante la aclimatización.', 50, '30', 118),
(103, 'I.             Introducción a la agrometeorología.', 28.89, '13', 120),
(104, 'II.            Elementos del clima', 48.89, '22', 120),
(105, 'III.          Manejo de la información climática.', 22.22, '10', 120),
(106, 'I.      Introducción a la fitopatología', 25, '15', 117),
(107, 'II.     Tratamiento y control de enfermedades', 75, '45', 117),
(108, 'I.             Proceso administrativo', 20, '9', 116),
(109, 'II.            Contabilidad de costos', 35.56, '16', 116),
(110, 'III.          Análisis costo-volumen-utilidad', 44.44, '20', 116),
(111, 'I.             Principios de Electricidad y Magnetismo ', 13.33, '6', 123),
(112, 'II.            Electrostática', 33.33, '15', 123),
(113, 'III.          Electrocinética', 33.34, '15', 123),
(114, 'IV.         Fuentes de campo magnético', 20, '9', 123),
(115, 'I.             Planteamiento del proyecto agrobiotecnológico', 20, '6', 129),
(116, 'II.            Desarrollo del proyecto agrobiotecnológico', 80, '24', 129),
(117, 'I.             Condicionales', 33.33, '20', 131),
(118, 'II.            Entorno laboral', 33.33, '20', 131),
(119, 'III.          Interpretación de textos técnicos específicos', 33.34, '20', 131),
(120, 'I.     Comunicación verbal y no verbal', 24, '18', 132),
(121, 'II.    Tipos de comunicación', 38.67, '29', 132),
(122, 'III. Redacción de documentos ejecutivos y técnicos', 37.33, '28', 132),
(123, 'I.             Sistemas Agrícolas', 17.78, '8', 130),
(124, 'II.            Manejo sostenible de cultivos agrícolas', 48.89, '22', 130),
(125, 'III.          Prácticas de conservación y mejoramiento del suelo', 33.33, '15', 130),
(126, 'I.             Introducción a los biofertilizantes', 16.67, '10', 127),
(127, 'II.            Bacterias fijadoras de nitrógeno', 41.67, '25', 127),
(128, 'III.          Micorrizas', 41.66, '25', 127),
(129, 'I. Fundamentos de biorremediación', 16.67, '10', 125),
(130, 'II. Biorremediación', 46.67, '28', 125),
(131, 'III. Fitorremediación', 36.66, '22', 125),
(132, 'I.     Tipos de agentes de control biológico', 16.67, '10', 128),
(133, 'II.            Técnicas de reproducción de organismos', 55, '33', 128),
(134, 'III.          Técnicas de aplicación de bioproductos', 28.33, '17', 128),
(135, 'I.      Introducción a los diseños experimentales', 11.11, '5', 124),
(136, 'II.     Diseño completamente al azar (DCA)', 44.44, '20', 124),
(137, 'III.   Diseño de bloques completos al azar (DBCA)', 44.45, '20', 124),
(138, 'I.             Metabolismo', 20, '12', 126),
(139, 'II.            Extracción y purificación de metabolitos', 80, '48', 126),
(140, '-       I. Operaciones Aritméticas', 13.33, '8', 173),
(141, '-       II. Operaciones Algebraicas', 33.33, '20', 173),
(142, '-       III. Operaciones Matriciales', 53.34, '32', 173),
(143, 'I.       Herramientas en línea', 13.33, '10', 174),
(144, 'II.     Ofimática', 33.33, '25', 174),
(145, 'III.    Hoja de cálculo', 53.34, '40', 174),
(146, 'I. Introducción a la Administración     ', 20, '9', 175),
(147, 'II. Proceso Administrativo     ', 80, '36', 175),
(148, 'I. Fundamentos de Mercadotecnia', 8, '6', 176),
(149, 'II. Proceso de investigación de mercados', 20, '15', 176),
(150, 'III. Mezcla de Mercadotecnia', 58.67, '44', 176),
(151, 'IV. Introducción al Comercio Internacional', 13.33, '10', 176),
(152, 'I.             Introducción a la contabilidad', 6.67, '7', 177),
(153, 'II.            Estructura financiera', 20, '21', 177),
(154, 'III.          Proceso contable', 33.33, '35', 177),
(155, 'IV.         Ciclo Contable', 40, '42', 177),
(156, 'I.             Presentación', 50, '30', 178),
(157, 'II.            Actividades', 50, '30', 178),
(158, 'I. Bases gramaticales para la construcción de ideas', 26.67, '20', 179),
(159, 'II. Organización y estructuración de ideas', 46.67, '35', 179),
(160, 'III. Introducción a la redacción', 26.66, '20', 179),
(161, 'I.             Desarrollo sustentable', 50, '15', 180),
(162, 'II.            Plan de vida y carrera', 50, '15', 180),
(163, 'I. Tanto por ciento', 13.33, '6', 181),
(164, 'II. Interés simple e interés compuesto', 31.12, '14', 181),
(165, 'III. Anualidades', 33.33, '15', 181),
(166, 'IV. Tablas de amortización', 22.22, '10', 181),
(167, 'I. Introducción a la estadística  ', 10, '6', 182),
(168, 'II. Estadística descriptiva', 35, '21', 182),
(169, 'III. Estadística inferencial     ', 35, '21', 182),
(170, 'IV. Operación de software estadístico', 20, '12', 182),
(171, 'I.       Introducción al Desarrollo Organizacional', 13.33, '6', 183),
(172, 'II.     Cultura Organizacional', 46.67, '21', 183),
(173, 'III.    Diagnóstico Organizacional', 40, '18', 183),
(174, 'I.             Fundamentos de Investigación', 10, '6', 184),
(175, 'II.            Investigación cuantitativa', 36.67, '22', 184),
(176, 'III.          Procesamiento de información', 41.67, '25', 184),
(177, 'IV.         Investigación cualitativa y mixta', 11.66, '7', 184),
(178, '1.    I. Registro de operaciones utilizando software contable', 18.67, '14', 185),
(179, '2.    II. Capital de trabajo e inversiones permanentes', 61.33, '46', 185),
(180, '3.    III. El costo de producción', 20, '15', 185),
(181, 'I.             Introducción a la economía', 13.33, '8', 186),
(182, 'II.            Microeconomía', 50, '30', 186),
(183, 'III.          Macroeconomía', 36.67, '22', 186),
(184, 'I. Desarrollo de procesos', 40, '30', 187),
(185, 'II. Gestión de la calidad', 10.67, '8', 187),
(186, 'III. Certificación y mejora continua', 22.67, '17', 187),
(187, 'IV. Herramientas de calidad', 26.66, '20', 187),
(188, 'I.             El presente continuo', 16.67, '10', 188),
(189, 'II.            La cantidad', 16.67, '10', 188),
(190, 'III.          El pasado', 66.66, '40', 188),
(191, 'I.             Mecánica de grupos', 33.33, '15', 189),
(192, 'II.            Dinámica de grupos', 66.67, '30', 189),
(193, 'I.             Introducción a las finanzas', 13.33, '10', 192),
(194, 'II.            Métodos de análisis financiero horizontal', 33.33, '25', 192),
(195, 'III.          Métodos de análisis financiero vertical', 53.34, '40', 192),
(196, 'I.             Escenarios de la Sustentabilidad en las organizaciones y su entorno.', 50, '30', 194),
(197, 'II.            Estrategias de Sustentabilidad', 50, '30', 194),
(198, 'I.             Liderazgo y toma de decisiones', 33.33, '10', 198),
(199, 'II.            Negociación y toma de decisiones', 66.67, '20', 198),
(200, 'I.             Pasado simple vs pasado continuo', 33.33, '20', 197),
(201, 'II.            Invitaciones', 33.33, '20', 197),
(202, 'III.          Planes y proyectos', 33.34, '20', 197),
(203, 'I. Diagnóstico Organizacional  ', 33.33, '10', 196),
(204, 'II. Gestión de la organización ', 66.67, '20', 196),
(205, 'I.             Conceptos generales y divisiones del derecho', 10, '6', 195),
(206, 'II.            Fundamentos de derecho civil', 15, '9', 195),
(207, 'III.          Fundamentos de derecho mercantil', 41.67, '25', 195),
(208, 'IV.         Fundamentos de derecho laboral', 33.33, '20', 195),
(209, 'I.             Fundamentos de Planeación Estratégica', 13.33, '8', 190),
(210, 'II.            Diagnóstico situacional', 50, '30', 190),
(211, 'III.          Formulación de Objetivos y Estrategias', 36.67, '22', 190),
(212, 'I.         Costos y presupuestos', 33.33, '30', 193),
(213, 'II.        Presupuesto de ingresos, egresos y financiero', 35.55, '32', 193),
(214, 'III.      Presupuestos por programas y actividades', 15.56, '14', 193),
(215, 'IV.      Fuentes de financiamiento', 15.56, '14', 193),
(216, 'I.             Iniciativa emprendedora', 16.67, '10', 191),
(217, 'II.            Creatividad e innovación', 33.33, '20', 191),
(218, 'III.          Emprendimiento', 50, '30', 191),
(219, 'I. Fundamentos de la psicología organizacional', 16.67, '10', 199),
(220, 'II. Comportamiento individual', 25, '15', 199),
(221, 'III. Comportamiento grupal  ', 33.33, '20', 199),
(222, 'IV. Estrés laboral', 25, '15', 199),
(223, 'I. Manual de descripción de puestos', 46.67, '42', 202),
(224, 'II. Valuación de Puestos', 53.33, '48', 202),
(225, 'I. Proceso del pensamiento creativo', 33.33, '15', 205),
(226, 'II. Desarrollo de ideas', 44.44, '20', 205),
(227, 'III. Administración por valores', 22.23, '10', 205),
(228, 'I.             Comparativos, superlativos', 33.33, '20', 204),
(229, 'II.            Presente Perfecto', 66.67, '40', 204),
(230, 'I.             Planeación de capital humano', 28.57, '30', 201),
(231, 'II.            Reclutamiento', 19.05, '20', 201),
(232, 'III.          Selección', 38.1, '40', 201),
(233, 'IV.         Formalización de la relación laboral', 14.28, '15', 201),
(234, 'I.             Relaciones Individuales de Trabajo', 46.67, '35', 203),
(235, 'II.            Autoridades laborales', 13.33, '10', 203),
(236, 'III.          Relaciones Colectivas de trabajo', 40, '30', 203),
(237, 'I.             Fundamentos de nómina', 13.33, '14', 200),
(238, 'II.            Nómina ordinaria', 47.62, '50', 200),
(239, 'III.          Nóminas extraordinarias y especiales', 39.05, '41', 200),
(240, 'I. Comunicación organizacional', 33.33, '30', 206),
(241, 'II. Clima Laboral', 33.33, '30', 206),
(242, 'III Cultura organizacional', 33.34, '30', 206),
(243, 'I.             Inducción a la organización', 27.78, '25', 208),
(244, 'II.            Diagnóstico de necesidades de capacitación', 27.78, '25', 208),
(245, 'III.          Plan de capacitación y evaluación', 27.78, '25', 208),
(246, 'IV.         Plan de carrera', 16.66, '15', 208),
(247, 'I.             Generalidades de la evaluación de desempeño del personal', 20, '12', 209),
(248, 'II.            Métodos y Manual de evaluación   ', 80, '48', 209),
(249, 'I. El proceso de la comunicación', 33.33, '25', 213),
(250, 'II. La comunicación efectiva en las organizaciones', 66.67, '50', 213),
(251, 'I. Seguridad laboral', 20, '12', 210),
(252, 'II. Higiene Laboral', 33.33, '20', 210),
(253, 'III. Gestión de seguridad e Higiene.', 46.67, '28', 210),
(254, 'I.             Condicionales', 33.33, '20', 212),
(255, 'II.            Entorno laboral', 33.33, '20', 212),
(256, 'III.          Interpretación de textos técnicos específicos', 33.34, '20', 212),
(257, 'I. Administración de capital humano', 50, '15', 211),
(258, 'II. Desarrollo de capital humano', 50, '15', 211),
(259, 'I. Impuesto sobre la Renta Anual y Honorarios asimilados  ', 44.44, '20', 207),
(260, 'II. Disposiciones de Seguridad Social', 55.56, '25', 207),
(261, 'I.             Sistemas de Numeración', 20, '18', 215),
(262, 'II.            Álgebra', 26.67, '24', 215),
(263, 'III.          Ecuaciones e Inecuaciones', 26.67, '24', 215),
(264, 'IV.         Álgebra Lineal', 26.66, '24', 215),
(265, 'I. Fundamentos del dibujo y entorno de trabajo', 42.22, '38', 217),
(266, 'II. Dibujo arquitectónico', 33.33, '30', 217),
(267, 'III. Dibujo estructural', 24.45, '22', 217),
(268, 'I. Bases gramaticales para la construcción de ideas', 26.67, '20', 221),
(269, 'II. Organización y estructuración de ideas', 46.67, '35', 221),
(270, 'III. Introducción a la redacción', 26.66, '20', 221),
(271, 'I.  Desarrollo sustentable', 50, '15', 222),
(272, 'II. Plan de Vida y Carrera', 50, '15', 222),
(273, 'I. Procesador de textos', 20, '9', 218),
(274, 'II. Editor de Presentaciones', 13.33, '6', 218),
(275, 'III. Hoja de cálculo', 66.67, '30', 218),
(276, 'I.             Presentación', 50, '30', 220),
(277, 'II.            Actividades', 50, '30', 220),
(278, '     I.        La industria de la construcción en México', 16.67, '10', 219),
(279, '    II.        Materiales básicos en la construcción', 16.67, '10', 219),
(280, '  III.        Principios básicos en la construcción', 33.33, '20', 219),
(281, '  IV.        Herramienta básica en la construcción   ', 23.33, '14', 219),
(282, '    V.        Equipo y maquinaria', 5, '3', 219),
(283, '  VI.        Seguridad', 5, '3', 219),
(284, 'I.             Principios básicos de Química', 26.67, '20', 216),
(285, 'II.            Nomenclatura de compuestos químicos y Estequiometría', 26.67, '20', 216),
(286, 'III.          Soluciones y Cinética química', 26.66, '20', 216),
(287, 'IV.          Electroquímica y Termoquímica', 20, '15', 216),
(288, 'I.     Proceso Administrativo', 48.89, '22', 225),
(289, '     II.- Empresas Constructoras', 31.11, '14', 225),
(290, '     III.- Registros y Permisos de Obra', 8.89, '4', 225),
(291, '     IV.- Seguridad e Higiene de Obra', 11.11, '5', 225),
(292, '      I.        Trabajos preliminares', 27.78, '25', 227),
(293, '    II.        Procesos constructivos', 72.22, '65', 227),
(294, 'I.             Estática de partícula', 22.22, '20', 224),
(295, 'II.            Estática del cuerpo rígido', 27.78, '25', 224),
(296, 'III.          Propiedades de las áreas', 16.67, '15', 224),
(297, 'IV.          Estructuras formadas por barras', 33.33, '30', 224),
(298, 'I.            Mecánica de grupos', 33.33, '15', 231),
(299, 'II.         Dinámica de grupos', 66.67, '30', 231),
(300, 'I.             Geometría y Trigonometría', 26.67, '16', 223),
(301, 'II.            Geometría Analítica', 26.67, '16', 223),
(302, 'III.          Funciones', 26.66, '16', 223),
(303, 'IV.         Álgebra Vectorial', 20, '12', 223),
(304, 'I.             El presente continuo', 16.67, '10', 230),
(305, 'II.            La cantidad', 16.66, '10', 230),
(306, 'III.          El pasado', 66.67, '40', 230),
(307, '     I.        Fundamentos de instalaciones eléctricas.', 33.33, '15', 228),
(308, '    II.        Cálculo de elementos de instalaciones eléctricas', 44.44, '20', 228),
(309, 'III. Memoria de cálculo de una instalación eléctrica', 22.23, '10', 228),
(310, 'I. Instalaciones de gas LP', 24.44, '11', 229),
(311, 'II.  Instalaciones de aire acondicionado', 31.12, '14', 229),
(312, 'III. Instalaciones de voz y datos/sistema contra incendios', 44.44, '20', 229),
(313, 'I.              Introducción a la Topografía', 25, '15', 226),
(314, 'II.             Planimetría', 33.33, '20', 226),
(315, 'III.           Altimetría', 41.67, '25', 226),
(316, 'I.             Introducción al análisis de costos de obra', 22.22, '20', 234),
(317, 'II.            Costo directo', 77.78, '70', 234),
(318, 'I.             Límites y continuidad', 20, '12', 232),
(319, 'II.            La derivada', 53.33, '32', 232),
(320, 'III.          Optimización', 26.67, '16', 232),
(321, 'I.             Estructura de los materiales', 26.66, '12', 233),
(322, 'II.            Propiedades de los materiales  ', 46.67, '21', 233),
(323, 'III.          Materiales semiconductores', 26.67, '12', 233),
(324, 'I.             Liderazgo y toma de decisiones', 33.33, '10', 240),
(325, 'II.            Negociación y toma de decisiones', 66.67, '20', 240),
(326, 'I.             Pasado simple vs pasado continuo', 33.34, '20', 239),
(327, 'II.            Invitaciones', 33.33, '20', 239),
(328, 'III.          Planes y proyectos', 33.33, '20', 239),
(329, 'I.             Instalaciones Hidráulicas', 48.89, '22', 237),
(330, 'II.            Instalaciones Sanitarias', 51.11, '23', 237),
(331, 'I.             Planos arquitectónicos y estructurales', 33.33, '10', 238),
(332, 'II.            Proyecto de instalaciones', 33.33, '10', 238),
(333, 'III.  Volumetría de obra y licencias de construcción', 33.34, '10', 238),
(334, 'I.  Introducción a la mecánica de materiales', 22.22, '20', 236),
(335, 'II.  Carga axial y flexión', 27.78, '25', 236),
(336, 'III. Cortante y torsión', 33.33, '30', 236),
(337, 'IV. Deformaciones', 16.67, '15', 236),
(338, 'I.             Estación total  y GPS', 50, '30', 235),
(339, 'II.            Software Especializado en Topografía', 50, '30', 235),
(340, 'I.- Costos indirectos de obra', 33.33, '30', 242),
(341, 'II.- Precio unitario y presupuesto de obra', 50, '45', 242),
(342, 'III.- Escalatorias', 16.67, '15', 242),
(343, 'I.             Integral indefinida ', 33.34, '20', 241),
(344, 'II.            Integral definida', 33.33, '20', 241),
(345, 'III.          Series y sucesiones', 33.33, '20', 241),
(346, 'I.             Proceso de pensamiento creativo', 33.33, '15', 247),
(347, 'II.            Desarrollo de ideas', 44.44, '20', 247),
(348, 'III.          Administración por valores', 22.23, '10', 247),
(349, 'I.             Hidrostática', 16.67, '15', 244),
(350, 'II.            Hidrodinámica', 16.67, '15', 244),
(351, 'III.           Flujo y conductos a presión', 27.78, '25', 244),
(352, 'IV.          Sistemas de bombeo', 22.22, '20', 244),
(353, 'V.           Hidráulica de canales', 16.66, '15', 244),
(354, 'I.             Comparativos, superlativos', 33.33, '20', 246),
(355, 'II.            Presente Perfecto', 66.67, '40', 246),
(356, 'I.      Características y aplicaciones de la maquinaria pesada en la construcción', 50, '30', 245),
(357, 'II.     Rendimiento y costo de maquinaria pesada en la construcción', 50, '30', 245),
(358, 'I.             Generalidades de los suelos', 14.29, '15', 243),
(359, 'II.            Relaciones volumétricas y gravimétricas en suelos', 33.33, '35', 243),
(360, 'III.           Clasificación e identificación de los suelos', 33.33, '35', 243),
(361, 'IV.          Compresibilidad y Consolidación', 19.05, '20', 243),
(362, 'I.             Estadística Descriptiva', 33.33, '25', 248),
(363, 'II.            Probabilidad', 33.33, '25', 248),
(364, 'III.          Estadística Inferencial', 33.34, '25', 248),
(365, 'I. Procedimientos de construcción en terracerías.', 33.33, '15', 249),
(366, 'II. Procedimientos de construcción en pavimentos flexibles.', 33.33, '15', 249),
(367, 'III. Procedimientos de construcción en pavimentos rígidos.', 33.34, '15', 249),
(368, '      I.        Control de obra', 36.67, '22', 252),
(369, '     II.        Seguridad en los procesos constructivos', 13.33, '8', 252),
(370, '   III.        Instalaciones provisionales ', 10, '6', 252),
(371, '   IV.        Supervisión de obra', 40, '24', 252),
(372, 'I. El proceso de la comunicación', 33.33, '25', 255),
(373, 'II. La comunicación efectiva en las organizaciones', 66.67, '50', 255),
(374, 'I.             Condicionales', 33.34, '20', 254),
(375, 'II.            Entorno laboral', 33.33, '20', 254),
(376, 'III.          Interpretación de textos técnicos específicos', 33.33, '20', 254),
(377, 'I.             Presupuesto', 33.33, '10', 253),
(378, 'II.            Plan de seguridad', 16.67, '5', 253),
(379, 'III.          Pruebas de materiales ', 50, '15', 253),
(380, 'I.             Resistencia al esfuerzo cortante', 33.33, '35', 250),
(381, 'II.            Mejoramiento de suelos', 22.86, '24', 250),
(382, 'III.           Empuje de tierra', 24.76, '26', 250),
(383, 'IV.          Estabilidad de taludes', 19.05, '20', 250),
(384, 'I. Cemento', 16.67, '15', 251),
(385, 'II. Morteros', 22.22, '20', 251),
(386, 'III. Concreto Fresco', 33.33, '30', 251),
(387, 'IV. Concreto Endurecido', 27.78, '25', 251),
(388, 'I.             Sistemas de Numeración', 20, '18', 48),
(389, 'II.            Álgebra', 26.67, '24', 48),
(390, 'III.          Ecuaciones e Inecuaciones', 26.67, '24', 48),
(391, 'IV.         Álgebra Lineal', 26.66, '24', 48),
(392, 'I. Sistemas Numéricos', 24.44, '11', 49),
(393, 'II. Algebra Booleana', 42.23, '19', 49),
(394, 'III. Habilidades del Pensamiento Lógico', 33.33, '15', 49),
(395, 'I.             Ofimática', 33.34, '25', 50),
(396, 'II.            Hardware', 33.33, '25', 50),
(397, 'III.          Software', 33.33, '25', 50),
(398, '     I.        Introducción a las Redes de Datos', 6.66, '5', 51),
(399, '    II.        Protocolos y Comunicación en la Red', 6.67, '5', 51),
(400, '  III.        Acceso a la Red', 26.67, '20', 51),
(401, '  IV.        Capa de Red', 20, '15', 51),
(402, '   V.        Protocolo de Internet', 20, '15', 51),
(403, '  VI.        Capa de transporte y capa de aplicación', 20, '15', 51),
(404, 'I. Conceptos básicos', 6.67, '5', 52),
(405, 'II. Expresiones', 20, '15', 52),
(406, 'III. Algoritmos, diagramas de flujo y pseudocódigos', 73.33, '55', 52),
(407, 'I. Bases gramaticales para la construcción de ideas', 26.66, '20', 54),
(408, 'II. Organización y estructuración de ideas', 46.67, '35', 54),
(409, 'III. Introducción a la redacción', 26.67, '20', 54),
(410, 'I.             Presentación', 50, '30', 53),
(411, 'II.            Actividades', 50, '30', 53),
(412, 'I.             Desarrollo sustentable', 50, '15', 55),
(413, 'II.            Plan de vida y carrera', 50, '15', 55),
(414, 'I.             Geometría y Trigonometría', 26.66, '16', 56),
(415, 'II.            Geometría Analítica', 26.67, '16', 56),
(416, 'III.          Funciones', 26.67, '16', 56),
(417, 'IV.         Álgebra Vectorial', 20, '12', 56),
(418, 'I. Ingeniería de requerimientos', 12, '9', 57),
(419, 'II. Modelado de software', 38.67, '29', 57),
(420, 'III. Procesos de negocios', 16, '12', 57),
(421, 'IV. Metodologías de desarrollo de software', 33.33, '25', 57),
(422, '     I.        Introducción al enrutamiento', 13.33, '12', 58),
(423, '    II.        Ruteo Estático', 20, '18', 58),
(424, '  III.        Ruteo Dinámico', 13.33, '12', 58),
(425, '  IV.        Redes Conmutadas', 20, '18', 58),
(426, '   V.        Listas de control de acceso', 20, '18', 58),
(427, '  VI.        Servicios de direccionamiento IP', 13.34, '12', 58),
(428, 'I.    Paradigma Orientado a Objetos (POO).', 6.66, '6', 59),
(429, 'II.   Fundamentos de Programación Orientada a Objetos.', 26.67, '24', 59),
(430, 'III.  Programación Orientada a Objetos.', 66.67, '60', 59),
(431, '            I. Fundamentos de diseño gráfico', 13.34, '6', 60),
(432, '            II. Proceso de diseño creativo', 33.33, '15', 60),
(433, '          III. Creatividad digital', 53.33, '24', 60),
(434, 'I. Modelo Entidad - Relación y Relacional', 26.66, '16', 61),
(435, 'II. Normalización de Bases de Datos', 26.67, '16', 61),
(436, 'III. Lenguaje SQL', 46.67, '28', 61),
(437, 'I.             El presente continuo', 16.66, '10', 62),
(438, 'II.            La cantidad', 16.67, '10', 62),
(439, 'III.          El pasado', 66.67, '40', 62),
(440, 'I. Mecánica de grupos', 33.33, '15', 63),
(441, 'II. Dinámica de grupos', 66.67, '30', 63),
(442, 'I.             Límites y continuidad', 20, '12', 64),
(443, 'II.            La derivada', 53.33, '32', 64),
(444, 'III.          Optimización', 26.67, '16', 64),
(445, '     I.        Introducción a Sistemas Operativos', 6.66, '5', 67),
(446, '    II.        Instalación de sistemas operativos basados en UNIX', 13.33, '10', 67),
(447, '  III.        Comandos básicos de sistemas operativos basados en UNIX', 26.67, '20', 67),
(448, '  IV.        Administración básica del sistema operativo', 26.67, '20', 67),
(449, '   V.        Instalación de servicios para aplicaciones web', 26.67, '20', 67),
(450, 'I.             Fundamentos de la Mercadotecnia.', 20, '15', 65),
(451, 'II.            Marketing Digital.', 80, '60', 65),
(452, 'I. Imágenes digitales', 20, '21', 66),
(453, 'II. Animación bidimensional', 80, '84', 66),
(454, 'I. Ambientes de desarrollo Web', 13.33, '12', 68),
(455, 'II. Desarrollo de Front end', 28.9, '26', 68),
(456, 'III. Desarrollo de Back end', 44.44, '40', 68),
(457, 'IV. Publicación de aplicaciones', 13.33, '12', 68),
(458, 'I.             Planeación del proyecto de T.I', 16.67, '5', 69),
(459, 'II.            Desarrollo del Proyecto de T.I.', 83.33, '25', 69),
(460, 'I.             Pasado simple vs pasado continuo', 33.34, '20', 70),
(461, 'II.            Invitaciones', 33.33, '20', 70),
(462, 'III.          Planes y proyectos', 33.33, '20', 70),
(463, 'I.             Liderazgo y toma de decisiones', 33.33, '10', 71),
(464, 'II.            Negociación y toma de decisiones', 66.67, '20', 71),
(465, 'I.             Estadística Descriptiva', 33.34, '25', 72),
(466, 'II.            Probabilidad', 33.33, '25', 72),
(467, 'III.          Estadística Inferencial', 33.33, '25', 72),
(468, 'I. Planeación para el desarrollo del proyecto', 66.67, '50', 73),
(469, 'II. Seguimiento, control y cierre del proyecto', 33.33, '25', 73),
(470, 'I.             Fundamentos de la animación.', 20, '18', 74),
(471, 'II.            Técnicas de animación digital bidimensional.', 33.33, '30', 74),
(472, 'III.          Principios del modelado tridimensional.', 46.67, '42', 74),
(473, 'I. Fundamentos de Realidad Aumentada ', 20, '18', 75),
(474, 'II. Desarrollo de aplicaciones de Realidad Aumentada ', 80, '72', 75),
(475, 'I.             Proceso de desarrollo Frontend.', 33.33, '30', 76),
(476, 'II.            Desarrollo Backend web.', 66.67, '60', 76),
(477, 'I.             Comparativos, superlativos', 33.33, '20', 77),
(478, 'II.            Presente Perfecto', 66.67, '40', 77),
(479, 'I. Proceso del pensamiento creativo', 33.33, '15', 78),
(480, 'II. Desarrollo de ideas', 44.44, '20', 78),
(481, 'III. Administración por valores', 22.23, '10', 78),
(482, 'I.             Audio', 46.67, '35', 79),
(483, 'II.            Video', 53.33, '40', 79),
(484, 'I.             Modelado de escenarios virtuales', 27.78, '25', 80),
(485, 'II.            Animación  de personajes tridimensionales', 72.22, '65', 80),
(486, 'I. Fundamentos de la realidad Virtual (RV)', 13.34, '12', 81),
(487, 'II. Interfaz para realidad virtual', 33.33, '30', 81),
(488, 'III. Desarrollo de aplicaciones de Realidad Aumentada', 53.33, '48', 81),
(489, 'I.             Introducción a los negocios digitales', 14.28, '15', 82),
(490, 'II.            Programación de negocios digitales', 71.43, '75', 82),
(491, 'III.          Seguridad de los negocios digitales', 14.29, '15', 82),
(492, '     I.        La percepción del cliente para el diseño de soluciones.', 33.33, '10', 83),
(493, '    II.        Metodología para el desarrollo de soluciones.', 66.67, '20', 83),
(494, 'I. El proceso de la comunicación', 33.33, '25', 85),
(495, 'II. La comunicación efectiva en las organizaciones', 66.67, '50', 85),
(496, 'I.             Condicionales', 33.34, '20', 84),
(497, 'II.            Entorno laboral', 33.33, '20', 84),
(498, 'III.          Interpretación de textos técnicos específicos', 33.33, '20', 84),
(499, 'I.             Fracciones y proporciones', 16.67, '10', 134),
(500, 'II.            Unidades de medida.', 33.33, '20', 134),
(501, 'III.          Introducción a la estadística descriptiva', 50, '30', 134),
(502, 'I.             Introducción a la informática.', 11.66, '7', 135),
(503, 'II.            Procesador de textos.', 25, '15', 135),
(504, 'III.          Hojas de cálculo.', 41.67, '25', 135),
(505, 'IV.         Editores de presentaciones.', 21.67, '13', 135),
(506, 'I. Manejo higiénico de los alimentos.', 55.56, '25', 136),
(507, 'II. Seguridad en el trabajo.', 44.44, '20', 136),
(508, 'I.             Antecedentes históricos de la gastronomía', 26.66, '20', 137),
(509, 'II.            Estructura de cocina', 26.67, '20', 137),
(510, 'III.          Identificación de materias primas', 46.67, '35', 137),
(511, 'I.             Técnicas de corte y métodos de cocción', 23.33, '28', 138),
(512, 'II.            Preparaciones Aromáticas y elaboración de      fondos.', 33.33, '40', 138),
(513, 'III.          Salsas y su aplicación en volatería y Huevos', 43.34, '52', 138),
(514, 'I.             Presentación', 50, '30', 139),
(515, 'II.            Actividades', 50, '30', 139),
(516, 'I. Bases gramaticales para la construcción de ideas', 26.66, '20', 140),
(517, 'II. Organización y estructuración de ideas', 46.67, '35', 140),
(518, 'III. Introducción a la redacción', 26.67, '20', 140),
(519, 'I. Desarrollo sustentable', 50, '15', 141),
(520, 'II. Plan de vida y carrera', 50, '15', 141),
(521, 'I. Estadística descriptiva', 33.33, '20', 142),
(522, 'II. Estadística inferencial', 66.67, '40', 142),
(523, '     I.        Características nutrimentales de los alimentos', 33.33, '20', 143),
(524, '    II.        Grupos de alimentos y sus características nutrimentales', 33.33, '20', 143),
(525, '  III.        Sistema mexicano de alimentos equivalentes', 33.34, '20', 143),
(526, 'I. Introducción al servicio de alimentos y bebidas', 25, '15', 144),
(527, 'II. Servicio al cliente', 75, '45', 144),
(528, 'I.             Guarniciones a base de almidón y ensaladas.', 23.33, '28', 145),
(529, 'II.            Sopas cremosas y de especialidad', 30, '36', 145),
(530, 'III.          Procesamiento de pescados y mariscos.', 46.67, '56', 145),
(531, 'I.             Introducción a la panadería ', 26.67, '32', 146),
(532, 'II.            Proceso de panificación', 25.83, '31', 146),
(533, 'III.          Técnicas aplicadas en panadería ', 47.5, '57', 146),
(534, 'I.             El presente continuo', 16.67, '10', 147),
(535, 'II.            La cantidad', 16.67, '10', 147),
(536, 'III.          El pasado', 66.66, '40', 147),
(537, 'I.             Mecánica de grupos', 33.33, '15', 148),
(538, 'II.            Dinámica de grupos', 66.67, '30', 148),
(539, 'I. Introducción a los costos en servicios gastronómicos.', 66.67, '40', 149),
(540, 'II. Presupuestos en  servicios gastronómicos.', 33.33, '20', 149),
(541, 'I.             Introducción a la coctelería', 13.33, '10', 150),
(542, 'II.            Coctelería y montaje de bebidas', 46.67, '35', 150),
(543, 'III.          Cafés, tés e infusiones', 40, '30', 150),
(544, 'I. Receta estándar y técnicas de montaje', 13.33, '16', 151),
(545, 'II. Productos cárnicos: ganadería y animales de caza', 50, '60', 151),
(546, 'III. Métodos de procesamientos y conservación de productos cárnicos. ', 36.67, '44', 151),
(547, 'I.             Proceso de compra', 26.67, '20', 152),
(548, 'II.            Planeación de compras', 33.33, '25', 152),
(549, 'III.          Control de almacén', 40, '30', 152),
(550, 'I.             Introducción a la pastelería.', 13.33, '14', 153),
(551, 'II.            Preparaciones y presentaciones de pastelería.', 86.67, '91', 153),
(552, 'I.             Pasado simple vs pasado continuo', 33.33, '20', 154),
(553, 'II.            Invitaciones', 33.33, '20', 154),
(554, 'III.          Planes y proyectos', 33.34, '20', 154),
(555, 'I.             Liderazgo y toma de decisiones', 33.33, '10', 155),
(556, 'II.            Negociación y toma de decisiones', 66.67, '20', 155),
(557, 'I. Introducción a la mercadotecnia.', 20, '12', 156),
(558, 'II. Mezcla de mercadotecnia (7 P´s).', 40, '24', 156),
(559, 'III. Servicio y evaluación de la satisfacción del cliente en la industria gastronómica.', 40, '24', 156),
(560, 'I. Introducción a la vitivinicultura', 50, '30', 157),
(561, 'II. Cata y maridaje ', 50, '30', 157),
(562, 'I. Planeación en establecimientos de alimentos y bebidas', 20, '15', 158),
(563, 'II. Organización en establecimientos de alimentos y bebidas', 26.67, '20', 158),
(564, 'III. Dirección en establecimientos de alimentos y bebidas', 20, '15', 158),
(565, 'IV. Control en establecimientos de alimentos y bebidas', 33.33, '25', 158),
(566, 'I. Introducción a la repostería.', 14.29, '15', 159),
(567, 'II. Técnicas de preparación de elementos de repostería.', 57.14, '60', 159),
(568, 'III. Fundamentos de chocolatería ', 28.57, '30', 159),
(569, 'I.             Planeación de evento gastronómico', 50, '15', 160),
(570, 'II.            Ejecución del evento', 50, '15', 160),
(571, 'I.             Comparativos, superlativos', 33.33, '20', 161),
(572, 'II.            Presente Perfecto', 66.67, '40', 161),
(573, 'I.             Introducción', 33.33, '30', 162),
(574, 'II.            Actividades', 33.33, '30', 162),
(575, 'III.          Situarse en el tiempo', 33.34, '30', 162),
(576, 'I. Proceso del pensamiento creativo', 33.33, '15', 163),
(577, 'II. Desarrollo de ideas', 44.44, '20', 163),
(578, 'III. Administración por valores', 22.23, '10', 163),
(579, 'I.             Fundamentos de Investigación', 33.33, '20', 164),
(580, 'II.            Investigación aplicada', 66.67, '40', 164),
(581, 'I. Fundamentos de calidad.', 33.33, '15', 165),
(582, 'II. Instrumentos para la evaluación de la calidad del servicio de alimentos y bebidas.', 66.67, '30', 165),
(583, '1.            I. Conformación de menús', 66.67, '80', 166),
(584, '2.            II. Conformación de la carta', 33.33, '40', 166),
(585, 'I. Planeación  de Eventos.', 60, '45', 167),
(586, 'II. Operación de  eventos.', 40, '30', 167),
(587, 'Planeación de un evento gastronómico.', 66.67, '20', 168),
(588, 'Ejecución del evento.', 33.33, '10', 168),
(589, 'I.             Condicionales', 33.33, '20', 169),
(590, 'II.            Entorno laboral', 33.33, '20', 169),
(591, 'III.          Interpretación de textos técnicos específicos', 33.34, '20', 169),
(592, 'I.             Ubicarse en el espacio.', 16.67, '10', 170),
(593, 'II.            La cantidad.', 33.33, '20', 170),
(594, 'III.          Invitar y proponer', 13.33, '8', 170),
(595, 'IV.         ¿Qué hiciste ayer?', 36.67, '22', 170),
(596, 'I. El proceso de la comunicación', 33.33, '25', 171),
(597, 'II. La comunicación efectiva en las organizaciones', 66.67, '50', 171),
(598, 'I.             Introducción a la administración', 16.67, '10', 11),
(599, 'II.            Fases del proceso administrativo', 83.33, '50', 11),
(600, 'I. Bases gramaticales para la construcción de ideas', 26.67, '20', 13),
(601, 'II. Organización y estructuración de ideas', 46.67, '35', 13),
(602, 'III. Introducción a la redacción', 26.66, '20', 13),
(603, 'I.             Desarrollo sustentable', 50, '15', 14),
(604, 'II.            Plan de vida y carrera', 50, '15', 14),
(605, 'I.               Expresando quehaceres, opiniones y preferencias.', 13.33, '18', 12),
(606, 'II.             Voz pasiva en presente y pasado.', 26.67, '36', 12),
(607, 'III.           Intercambiando información de manera formal  y expresando hábitos del pasado.', 26.67, '36', 12),
(608, 'IV.         Expresando experiencias y carta formal.', 33.33, '45', 12),
(609, 'I.             Introducción a la informática', 26.67, '16', 8),
(610, 'II.            Procesadores de información ', 73.33, '44', 8),
(611, 'I.             Introducción al estudio del Turismo', 33.33, '20', 9),
(612, 'II.            Componentes de la actividad Turística', 66.67, '40', 9),
(613, 'I. Operaciones fundamentales', 53.33, '40', 7),
(614, 'II. Bases de matemáticas financieras', 46.67, '35', 7),
(615, 'I.             Geografía física y humana', 22.22, '20', 10),
(616, 'II.            Patrimonio natural y cultural', 33.33, '30', 10),
(617, 'III.       Inventario de atractivos naturales y culturales', 27.78, '25', 10),
(618, 'IV.      Sitios turísticos del mundo', 16.67, '15', 10),
(619, 'I. Introducción a la estadística', 13.33, '10', 15),
(620, 'II Estadística descriptiva', 40, '30', 15),
(621, 'III. Pronósticos estadísticos en el turismo', 46.67, '35', 15),
(622, 'I.             Mecánica de grupos', 33.33, '15', 21),
(623, 'II.            Dinámica de grupos', 66.67, '30', 21),
(624, 'I.             Calidad en el servicio', 13.33, '10', 19),
(625, 'II.            Instrumentos y herramientas de calidad', 40, '30', 19),
(626, 'III.          Estandarización de procesos y mejora continua', 46.67, '35', 19),
(627, 'I.             El pasado', 33.32, '40', 20),
(628, 'II.            Pasado simple vs pasado continuo', 16.67, '20', 20),
(629, 'III.          Invitaciones', 16.67, '20', 20),
(630, 'IV.         Planes y proyectos', 16.67, '20', 20),
(631, 'V.           Comparativos y superlativos', 16.67, '20', 20),
(632, 'I.             Introducción a los Servicios de Hospedaje', 20, '15', 18),
(633, 'II.            Operación de los servicios de hospedaje', 46.67, '35', 18),
(634, 'III.           Establecimientos de Alimentos y Bebidas', 33.33, '25', 18),
(635, 'I.             Servicios turísticos', 66.67, '40', 17),
(636, 'II.            Parques temáticos', 33.33, '20', 17),
(637, 'I.             Fundamentos de Sustentabilidad', 58.33, '35', 16),
(638, 'II.            Sustentabilidad en el Turismo', 41.67, '25', 16),
(639, 'I. Generalidades del capital humano', 20, '12', 24),
(640, 'II. Descripción y análisis de puestos', 26.67, '16', 24),
(641, 'III. Gestión del capital humano', 53.33, '32', 24),
(642, 'I. Liderazgo y toma de decisiones', 33.33, '10', 29),
(643, 'II. Negociación y toma de decisiones', 66.67, '20', 29),
(644, 'I. Experiencias', 50, '45', 28),
(645, 'II. How long have you been …….?', 22.22, '20', 28),
(646, 'III. Condicionales', 27.78, '25', 28),
(647, 'I. Diagnóstico de los servicios turísticos', 33.33, '10', 27),
(648, 'II. Prestación de servicios turísticos', 66.67, '20', 27),
(649, 'I. Introducción a la Mercadotecnia en el Turismo', 20, '15', 26),
(650, 'II. Segmentación de Mercado', 33.33, '25', 26),
(651, 'III. Estrategias de mercadotecnia y las Tendencias', 46.67, '35', 26),
(652, 'I. Anteproyecto de la investigación', 41.33, '31', 22),
(653, 'II. Desarrollo de la Investigación', 58.67, '44', 22),
(654, 'I. Estados Financieros', 40, '36', 25),
(655, 'II. Costos y presupuestos', 26.67, '24', 25),
(656, 'III. Administración de Almacén', 33.33, '30', 25),
(657, 'I. La agencia de viajes y su entorno', 20, '15', 23),
(658, 'II. Diseño de paquetes turísticos', 46.67, '35', 23),
(659, 'III. Servicios de transportación', 33.33, '25', 23),
(660, 'I. Introducción al departamento de ama de llaves', 26.67, '20', 31),
(661, 'II. Operación del departamento de ama de llaves', 73.33, '55', 31),
(662, 'I. Calidad en los servicios de hospedaje', 44.44, '20', 33),
(663, 'II. Mejora continua', 55.56, '25', 33),
(664, 'I. Proceso del pensamiento creativo', 33.33, '15', 37),
(665, 'II. Desarrollo de ideas', 44.44, '20', 37),
(666, 'III. Administración por valores', 22.23, '10', 37),
(667, 'I. Tag questions', 50, '30', 35),
(668, 'II. Passive Voice', 50, '30', 35),
(669, 'I. Operatividad y procedimientos del departamento de recepción', 46.67, '42', 32),
(670, 'II. Teléfonos y Bell Boys', 17.78, '16', 32),
(671, 'III. Auditoría Nocturna', 35.55, '32', 32),
(672, 'I. Introducción al departamento de reservaciones', 20, '12', 30),
(673, 'II. Operación del departamento de reservaciones', 60, '36', 30),
(674, 'III. Revenue management', 20, '12', 30),
(675, 'I. Introducción al departamento de ventas', 20, '15', 34),
(676, 'II. Proceso de ventas en hotelería', 46.67, '35', 34),
(677, 'III. Técnicas, estrategias y pronósticos de venta', 33.33, '25', 34),
(678, 'I. Generalidades de la animación turística y sociocultural', 26.67, '12', 39),
(679, 'II. Operatividad del departamento de actividades', 73.33, '33', 39),
(680, 'I. Introducción a los Centros de Consumo ', 26.67, '16', 41),
(681, 'II. Operación de Centros de Consumo de  alimentos y bebidas', 73.33, '44', 41),
(682, 'I. El proceso de la comunicación', 33.33, '25', 46),
(683, 'II. La comunicación efectiva en las organizaciones', 66.67, '50', 46),
(684, 'I. Generalidades, técnicas de enseñanza y recursos didácticos de la capacitación', 33.33, '25', 42),
(685, 'II. Impartición y evaluación de cursos de capacitación', 66.67, '50', 42),
(686, 'I. Situaciones diplomáticas', 33.33, '20', 44),
(687, 'II. Entorno Laboral', 33.33, '20', 44),
(688, 'III. Interpretación de textos técnicos específicos', 33.34, '20', 44),
(689, 'I. Supervisión de los Establecimientos de hospedaje', 33.33, '10', 43),
(690, 'II. Desarrollo de Eventos en el Sector Hotelero', 66.67, '20', 43),
(691, 'I. Planeación de Eventos', 53.33, '40', 40),
(692, 'II. Operación de Eventos', 33.33, '25', 40),
(693, 'III. Cierre de Eventos', 13.34, '10', 40),
(694, 'I. Concierge', 66.67, '20', 38),
(695, 'II. Relaciones públicas', 33.33, '10', 38),
(696, 'I.             Funciones de varias variables', 20, '12', 305),
(697, 'II.            Derivadas parciales', 26.67, '16', 305),
(698, 'III.          Integral múltiple', 26.67, '16', 305),
(699, 'IV.         Funciones vectoriales', 26.66, '16', 305),
(700, 'I.             Principios de la Termodinámica', 20, '9', 306),
(701, 'II.            Propiedades y Estado Termodinámico', 40, '18', 306),
(702, 'III.          Leyes y Sistemas de la Termodinámica', 40, '18', 306),
(703, '     I.        Cinética y Equilibrio químico', 40, '18', 307),
(704, '    II.        Fenómenos superficiales', 33.33, '15', 307),
(705, '  III.        Sistemas dispersos coloidales', 26.67, '12', 307),
(706, 'I.             Estructura de la metodología de investigación', 44.44, '20', 308),
(707, 'II.            Metodología cuantitativa', 33.33, '15', 308),
(708, 'III.          Metodología cualitativa', 22.23, '10', 308),
(709, '     I.        Planeación estratégica', 33.33, '25', 309),
(710, '    II.        Administración de los recursos humanos', 20, '15', 309),
(711, '  III.        Administración de recursos materiales', 46.67, '35', 309),
(712, 'I.             Administración del tiempo', 40, '18', 311),
(713, 'II.            Liderazgo', 60, '27', 311),
(714, 'I.             Tag Questions', 50, '30', 310),
(715, 'II.            Passive Voices', 33.33, '20', 310),
(716, 'III.          How long have you been….?', 16.67, '10', 310),
(717, 'I.             Ecuaciones diferenciales', 40, '30', 312),
(718, 'II.            Transformadas de Laplace', 20, '15', 312),
(719, 'III.          Métodos numéricos', 40, '30', 312),
(720, '     I.        Diseños experimentales con arreglo factorial y en parcelas divididas', 66.67, '30', 313),
(721, '    II.        Diseño experimental en cuadro latino', 33.33, '15', 313),
(722, '     I.        Fundamentos de operaciones unitarias', 33.34, '25', 314),
(723, '    II.        Separación Físico-mecánicas', 33.33, '25', 314),
(724, '  III.        Separación Sólido-Fluido y líquido-líquido', 33.33, '25', 314),
(725, '     I.        Gestión de la calidad', 33.33, '30', 315),
(726, '    II.        Control Estadístico de Procesos', 66.67, '60', 315),
(727, 'I.             Situaciones diplomáticas', 50, '30', 316),
(728, 'II.            Discutiendo sobre el pasado', 50, '30', 316),
(729, 'I.             Planeación estratégica', 44.44, '20', 317),
(730, 'II.            Organización del trabajo', 22.22, '10', 317),
(731, 'III.          Análisis y evaluación', 33.34, '15', 317),
(732, '     I.        Introducción a la bioingeniería', 33.33, '20', 321),
(733, '    II.        Biorreactores', 66.67, '40', 321),
(734, '     I.        Transducción de señales y ciclo celular', 23.81, '25', 319),
(735, '    II.        La expresión génica en los organismos', 23.81, '25', 319),
(736, '  III.        Herramientas y Técnicas de Biología Molecular', 52.38, '55', 319),
(737, '     I.        Introducción a la conservación de bioproductos.', 10, '6', 320),
(738, '    II.        Técnicas de conservación', 73.33, '44', 320),
(739, '  III.        Banco de Germoplasma', 16.67, '10', 320),
(740, 'I.             Grupos y necesidades', 50, '15', 323),
(741, 'II.            Liderazgo y manejo de grupos', 50, '15', 323),
(742, 'I.             La descripción', 50, '30', 322),
(743, 'II.            Correspondencia', 50, '30', 322),
(744, '     I.        Separación Vapor-Líquido', 55.56, '25', 318),
(745, '    II.        Escalamiento de procesos', 44.44, '20', 318),
(746, '     I.        Introducción a la caracterización de bioproductos.', 11.11, '10', 326),
(747, '    II.        Técnicas de caracterización.', 66.67, '60', 326),
(748, '  III.        Formulación, uso y manejo de bioproductos.', 22.22, '20', 326),
(749, 'I. Introducción de ingeniería económica', 26.67, '20', 325),
(750, 'II.  Estados financieros', 46.67, '35', 325),
(751, 'III. Rentabilidad de la producción agrobiotecnológica', 26.66, '20', 325),
(752, '     I.        Introducción a la ingeniería genética.', 33.33, '30', 324),
(753, '    II.        Vectores de expresión y métodos de transferencia de material genético.', 27.78, '25', 324),
(754, '  III.        Técnicas de selección de clonas recombinantes.', 16.67, '15', 324),
(755, '  IV.        Marcadores moleculares.', 22.22, '20', 324),
(756, 'I.             El discurso', 50, '30', 328),
(757, 'II.            La argumentación', 50, '30', 328),
(758, 'I. Planeación del desarrollo de un bioproducto', 40, '12', 327),
(759, 'II. Desarrollo del proceso de producción de un bioproducto', 60, '18', 327),
(760, 'I.       Factores y estilos de negociación', 66.67, '20', 329),
(761, 'II.     Análisis de problemas y toma de decisión efectiva', 33.33, '10', 329),
(762, 'I.             Funciones de varias variables', 20, '12', 280),
(763, 'II.            Derivadas parciales', 26.67, '16', 280),
(764, 'III.          Integral múltiple', 26.67, '16', 280),
(765, 'IV.         Funciones vectoriales', 26.66, '16', 280),
(766, 'I. Preproducción', 40, '30', 281),
(767, 'II. Producción', 40, '30', 281),
(768, 'III Postproducción', 20, '15', 281),
(769, 'I. Introducción al desarrollo de aplicaciones de videojuegos', 20, '18', 282),
(770, 'II. Programación orientada a objetos para videojuegos', 60, '54', 282),
(771, 'III. Distribución de la aplicación de videojuegos.', 20, '18', 282),
(772, '     I.        Introducción a los efectos visuales (VFX).', 13.33, '6', 283),
(773, '    II.        Desarrollo de efectos visuales. ', 73.33, '33', 283);
INSERT INTO `utmir_unidades_asignatura` (`id_unidades_asignatura`, `nombre_unidad`, `porcentaje`, `total_horas_unidad`, `id_asignaturas`) VALUES
(774, '  III.        Procesamiento del proyecto.', 13.34, '6', 283),
(775, 'I.             Tag Questions', 50, '30', 284),
(776, 'II.            Passive Voices', 33.33, '20', 284),
(777, 'III.          How long have you been….?', 16.67, '10', 284),
(778, 'I.             Administración del tiempo', 40, '18', 285),
(779, 'II.            Liderazgo', 60, '27', 285),
(780, '     I.        Gestión de servidores de Bases de Datos.', 13.33, '12', 286),
(781, '    II.        Manipulación avanzada.', 40, '36', 286),
(782, '  III.        Manejo de transacciones.', 16.67, '15', 286),
(783, '  IV.        Bases de datos NoSQL.', 30, '27', 286),
(784, 'I. Fundamentos de Inteligencia Artificial y Aplicaciones.', 11.11, '10', 287),
(785, 'II. Librerías de Inteligencia Artificial para Entornos Virtuales.', 33.33, '30', 287),
(786, 'III. Implementación de Inteligencia Artificial en Entornos Virtuales.', 55.56, '50', 287),
(787, 'I. Fundamentos de escenario 2D', 33.33, '15', 288),
(788, 'II. Multijugador y redes', 66.67, '30', 288),
(789, 'I. Cultura Emprendedora', 20, '9', 289),
(790, 'II. Diseño del Plan o Modelo de Negocio  ', 80, '36', 289),
(791, 'I.             Situaciones diplomáticas', 50, '30', 290),
(792, 'II.            Discutiendo sobre el pasado', 50, '30', 290),
(793, 'I.             Planeación estratégica', 44.44, '20', 291),
(794, 'II.            Organización del trabajo', 22.22, '10', 291),
(795, 'III.          Análisis y evaluación', 33.34, '15', 291),
(796, 'I.             Ecuaciones diferenciales', 40, '30', 292),
(797, 'II.            Transformadas de Laplace', 20, '15', 292),
(798, 'III.          Métodos numéricos', 40, '30', 292),
(799, 'I.             Introducción al análisis de los grandes volúmenes de datos.', 13.33, '12', 293),
(800, 'II.            Tratamiento y exploración de los datos.', 53.33, '48', 293),
(801, 'III.          Analítica de datos.', 33.34, '30', 293),
(802, 'I.                   Fundamentos de la ciberseguridad', 46.67, '28', 294),
(803, 'II.                Estándares y marcos de referencia para la ciberseguridad.', 16.67, '10', 294),
(804, 'III.             Ciberseguridad en la nube.', 36.66, '22', 294),
(805, 'I. Principios a la gestión de proyectos', 26.67, '16', 295),
(806, 'II. Planeación y ejecución del proyecto con Scrum', 60, '36', 295),
(807, 'III. Lanzamiento', 13.33, '8', 295),
(808, 'I.             La descripción', 50, '30', 296),
(809, 'II.            Correspondencia', 50, '30', 296),
(810, 'I.             Grupos y necesidades', 50, '15', 297),
(811, 'II.            Liderazgo y manejo de grupos', 50, '15', 297),
(812, 'I. Introducción a la Inteligencia de negocios.', 33.33, '30', 298),
(813, 'II. Transformación y visualización de los datos', 66.67, '60', 298),
(814, 'I.  Introducción al desarrollo de Aplicaciones Web Progresivas.', 26.67, '28', 299),
(815, 'II. Desarrollo de aplicaciones web Progresivas.', 60, '63', 299),
(816, 'III. Distribución de la Aplicación Web Progresivas', 13.33, '14', 299),
(817, 'I.             Estructuración  del proyecto', 33.33, '10', 300),
(818, 'II.            Dirección del proyecto', 53.33, '16', 300),
(819, 'III.          Presentación del proyecto', 13.34, '4', 300),
(820, 'I.   Modelo de gestión y liderazgo.', 26.67, '16', 301),
(821, 'II.  Implementación del modelo de gestión Hibrido.', 73.33, '44', 301),
(822, 'I.             El discurso', 50, '30', 302),
(823, 'II.            La argumentación', 50, '30', 302),
(824, 'I.       Factores y estilos de negociación', 66.67, '20', 303),
(825, 'II.     Análisis de problemas y toma de decisión efectiva', 33.33, '10', 303),
(826, 'I.              Enfoque de procesos en los sistemas de producción.', 50, '30', 333),
(827, 'II.            Función productiva.', 50, '30', 333),
(828, 'I.             Administración del tiempo', 40, '18', 336),
(829, 'II.            Liderazgo', 60, '27', 336),
(830, 'I. Destilados tradicionales de México', 44.44, '20', 334),
(831, 'II. Cata y maridaje ', 55.56, '25', 334),
(832, 'I.          Zona gastronómica: norte', 50, '45', 331),
(833, 'II.         Zona gastronómica: centro y Pacífico', 50, '45', 331),
(834, 'I.     Verifying Information', 33.33, '20', 335),
(835, 'II.   Posibiliteis', 33.33, '20', 335),
(836, 'III. What have you been doing?', 33.34, '20', 335),
(837, 'I.             Fundamentos del Patrimonio de México.', 40, '30', 332),
(838, 'II.            Patrimonio Culinario de México.', 60, '45', 332),
(839, 'I.              Cocina francesa', 33.33, '40', 338),
(840, 'II.            Cocina italiana', 33.33, '40', 338),
(841, 'III.          Cocina española', 33.34, '40', 338),
(842, 'I.          Zona gastronómica: sur', 50, '45', 337),
(843, 'II.         Cocina Regional', 50, '45', 337),
(844, 'I.             Diseño de carta ', 50, '30', 339),
(845, 'II.            Rentabilidad y popularidad platillos', 50, '30', 339),
(846, 'I.             Situaciones diplomáticas', 50, '30', 340),
(847, 'II.            Discutiendo sobre el pasado', 50, '30', 340),
(848, 'I.             Planeación estratégica', 44.44, '20', 341),
(849, 'II.            Organización del trabajo', 22.22, '10', 341),
(850, 'III.          Análisis y evaluación', 33.34, '15', 341),
(851, 'I.             Cocina China', 33.33, '40', 343),
(852, 'II.            Cocina de Japón', 26.67, '32', 343),
(853, 'III.          Cocina Thai', 20, '24', 343),
(854, 'IV. Cocina Hindú', 20, '24', 343),
(855, 'I.             Conceptos gastronómicos', 55.56, '25', 344),
(856, 'II.            Instalaciones y equipamiento', 44.44, '20', 344),
(857, 'I.      Operaciones contables', 66.67, '40', 342),
(858, 'II.     Estado de costos de producción y de ventas', 33.33, '20', 342),
(859, 'I.             Grupos y necesidades', 50, '15', 347),
(860, 'II.            Liderazgo y manejo de grupos', 50, '15', 347),
(861, 'I.    Descriptions 1', 33.33, '20', 346),
(862, 'II.  Descriptions 2', 33.33, '20', 346),
(863, 'III. Descriptions 3', 33.34, '20', 346),
(864, 'I.      Introducción a la mixología.', 33.33, '20', 345),
(865, 'II.     Técnicas aplicadas a la mixología.', 66.67, '40', 345),
(866, 'I. Análisis de estados financieros', 66.67, '40', 348),
(867, 'II. Razones financieras básicas', 33.33, '20', 348),
(868, 'I.              Introducción a la cocina contemporánea', 6.67, '6', 349),
(869, 'II.            Tendencias gastronómicas', 53.33, '48', 349),
(870, 'III.       Cocina de autor', 40, '36', 349),
(871, 'I.             Elementos de modelo de negocios.', 50, '30', 351),
(872, 'II.            Plan de apertura', 50, '30', 351),
(873, 'I.             Certificaciones para establecimientos de alimentos y bebidas', 33.33, '15', 350),
(874, 'II.            Herramientas administrativas para la gestión de calidad', 66.67, '30', 350),
(875, 'I.             El discurso', 50, '30', 353),
(876, 'II.            La argumentación', 50, '30', 353),
(877, 'I.              Planeación del proyecto gastronómico', 66.67, '20', 352),
(878, 'II.            Desarrollo del proyecto gastronómico', 33.33, '10', 352),
(879, 'I.       Factores y estilos de negociación', 66.67, '20', 354),
(880, 'II.     Análisis de problemas y toma de decisión efectiva', 33.33, '10', 354),
(881, 'I. Planeación del Proyecto', 50, '30', 358),
(882, 'II. Desarrollo del Proyecto', 50, '30', 358),
(883, 'I.             Administración del tiempo', 40, '18', 361),
(884, 'II.            Liderazgo', 60, '27', 361),
(885, 'I.             Tag Questions', 50, '30', 360),
(886, 'II.            Passive Voices', 33.33, '20', 360),
(887, 'III.          How long have you been….?', 16.67, '10', 360),
(888, 'I. Investigación cualitativa', 40, '24', 359),
(889, 'II. Análisis e interpretación de datos cualitativos', 60, '36', 359),
(890, 'I. Introducción a la Pedagogía Empresarial', 27.78, '25', 357),
(891, 'II. El Aprendizaje en la Capacitación', 33.33, '30', 357),
(892, 'III. Técnicas de Enseñanza y Recursos Didácticos', 38.89, '35', 357),
(893, 'I. Generalidades de Sociología del Trabajo', 25, '15', 356),
(894, 'II. Brecha Etaria y Generacional', 41.67, '25', 356),
(895, 'III. Ética en la Gestión de Capital Humano', 33.33, '20', 356),
(896, 'I. Normativa aplicable a la capacitación', 25, '30', 362),
(897, 'II. Diseño de cursos de capacitación', 41.67, '50', 362),
(898, 'III. Ejecución y evaluación de la capacitación', 33.33, '40', 362),
(899, 'I. Gestión de Clima en la organización', 38.89, '35', 363),
(900, 'II. Gestión de cultura organizacional', 38.89, '35', 363),
(901, 'III. Marketing interno', 22.22, '20', 363),
(902, 'I.             Situaciones diplomáticas', 50, '30', 365),
(903, 'II.            Discutiendo sobre el pasado', 50, '30', 365),
(904, 'I. Inteligencia Emocional', 26.67, '16', 364),
(905, 'II. Modelos y técnicas de inteligencia emocional', 40, '24', 364),
(906, 'III. Inteligencia emocional en el trabajo', 33.33, '20', 364),
(907, 'I.             Planeación estratégica', 44.44, '20', 366),
(908, 'II.            Organización del trabajo', 22.22, '10', 366),
(909, 'III.          Análisis y evaluación', 33.34, '15', 366),
(910, 'I.             Grupos y necesidades', 50, '15', 371),
(911, 'II.            Liderazgo y manejo de grupos', 50, '15', 371),
(912, 'I. Cambio Organizacional', 38.1, '40', 369),
(913, 'II. Implementación del cambio organizacional', 38.1, '40', 369),
(914, 'III. Impacto del cambio organizacional', 23.8, '25', 369),
(915, 'I. Empowerment', 20, '18', 368),
(916, 'II. Coaching', 20, '18', 368),
(917, 'III. Involvement', 14.44, '13', 368),
(918, 'IV. Performance Management', 20, '18', 368),
(919, 'V. Mentoring', 25.56, '23', 368),
(920, 'I.             La descripción', 50, '30', 370),
(921, 'II.            Correspondencia', 50, '30', 370),
(922, 'I. Proceso de Sistema de Gestión de la Calidad', 20, '15', 367),
(923, 'II. Medición del Sistema de Gestión de la Calidad', 46.67, '35', 367),
(924, 'III. Herramientas de mejora continua', 33.33, '25', 367),
(925, 'I. Competencia y evaluación de auditores ', 20, '18', 372),
(926, 'II. Planificación de auditoría', 33.33, '30', 372),
(927, 'III. Desarrollo y cierre de la auditoría', 46.67, '42', 372),
(928, 'I. Outsourcing', 27.78, '25', 373),
(929, 'II. Servicios de Consultoría en Capital Humano', 44.44, '40', 373),
(930, 'III. Administración de Servicios de Consultoría', 27.78, '25', 373),
(931, 'I.             El discurso', 50, '30', 376),
(932, 'II.            La argumentación', 50, '30', 376),
(933, 'I. Gestión de la capacitación', 33.33, '10', 375),
(934, 'II. Gestión del cambio', 50, '15', 375),
(935, 'III. Consultoría en capital humano', 16.67, '5', 375),
(936, 'I.       Factores y estilos de negociación', 66.67, '20', 377),
(937, 'II.     Análisis de problemas y toma de decisión efectiva', 33.33, '10', 377),
(938, 'I. Responsabilidad social corporativa', 27.78, '25', 374),
(939, 'II. Inclusión laboral', 27.78, '25', 374),
(940, 'III. Equidad de género', 27.78, '25', 374),
(941, 'IV. Calidad de vida en el trabajo', 16.66, '15', 374),
(942, 'I.             Administración del tiempo', 40, '18', 262),
(943, 'II.            Liderazgo', 60, '27', 262),
(944, 'I. Información estadística del sector turístico', 33.33, '20', 258),
(945, 'II. Investigación y herramientas tecnológicas', 66.67, '40', 258),
(946, 'I. Herramientas de calidad', 26.67, '20', 259),
(947, 'II. Responsabilidad social en el sector turístico', 26.67, '20', 259),
(948, 'III. Gestión de calidad', 46.66, '35', 259),
(949, 'I. Diagnóstico del capital humano', 50, '30', 260),
(950, 'II. Desarrollo del capital humano', 50, '30', 260),
(951, 'I.             Tag Questions', 50, '30', 261),
(952, 'II.            Passive Voices', 33.33, '20', 261),
(953, 'III.          How long have you been….?', 16.67, '10', 261),
(954, 'I. Control aplicado al turismo', 66.67, '40', 265),
(955, 'II. Optimización de tiempos en la actividad turística', 33.33, '20', 265),
(956, 'I. Matemáticas financieras', 33.33, '30', 263),
(957, 'II. Presupuestos y sistema de costeo', 44.44, '40', 263),
(958, 'III. Análisis e interpretación de estados financieros proforma', 22.23, '20', 263),
(959, 'I. Vocación Turística', 26.67, '32', 264),
(960, 'II. Administración Pública del Turismo', 20, '24', 264),
(961, 'III. Gobernanza en el Turismo', 13.33, '16', 264),
(962, 'IV. Planeación Turística', 40, '48', 264),
(963, 'I.             Situaciones diplomáticas', 50, '30', 266),
(964, 'II.            Discutiendo sobre el pasado', 50, '30', 266),
(965, 'I.             Planeación estratégica', 44.44, '20', 267),
(966, 'II.            Organización del trabajo', 22.23, '10', 267),
(967, 'III.          Análisis y evaluación', 33.33, '15', 267),
(968, 'I. Introducción al emprendimiento', 26.67, '20', 268),
(969, 'II. Estudio de mercado', 73.33, '55', 268),
(970, 'I.             Grupos y necesidades', 50, '15', 272),
(971, 'II.            Liderazgo y manejo de grupos', 50, '15', 272),
(972, 'I.             La descripción', 50, '30', 271),
(973, 'II.            Correspondencia', 50, '30', 271),
(974, 'I. Turismo responsable', 16.67, '20', 269),
(975, 'II. Innovación en el Diseño de Experiencias Turísticas', 50, '60', 269),
(976, 'III. Implementación y evaluación de experiencias turísticas', 33.33, '40', 269),
(977, 'I.- Marketing digital aplicado al turismo ', 46.67, '35', 270),
(978, 'II.- Estrategias de mercadotecnia en el sector turístico', 53.33, '40', 270),
(979, 'I. Estudio técnico y organizacional', 33.33, '30', 273),
(980, 'II. Estudio y evaluación financiera', 50, '45', 273),
(981, 'III. Presentación del plan de negocios', 16.67, '15', 273),
(982, 'I. De ciudades a destinos inteligentes', 20, '18', 275),
(983, 'II. Tecnología aplicada al turismo', 33.33, '30', 275),
(984, 'III. Gestión de destinos turísticos inteligentes', 46.67, '42', 275),
(985, 'I.             El discurso', 50, '30', 277),
(986, 'II.            La argumentación', 50, '30', 277),
(987, 'I. Desarrollo sustentable', 16.67, '15', 274),
(988, 'II. Áreas naturales protegidas y unidades de manejo ambiental', 16.67, '15', 274),
(989, 'III. Evaluación de impacto ambiental', 44.44, '40', 274),
(990, 'IV. Certificaciones de sustentabilidad para el turismo', 22.22, '20', 274),
(991, 'I. Gestión de empresas turísticas', 20, '6', 276),
(992, ' II. Desarrollo de proyectos turísticos', 40, '12', 276),
(993, 'III. Gestión de destinos turísticos', 40, '12', 276),
(994, 'I.       Factores y estilos de negociación', 66.67, '20', 278),
(995, 'II.     Análisis de problemas y toma de decisión efectiva', 33.33, '10', 278);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estados_mexico`
--
ALTER TABLE `estados_mexico`
  ADD PRIMARY KEY (`id_estado_mexico`);

--
-- Indices de la tabla `matricula_roles`
--
ALTER TABLE `matricula_roles`
  ADD PRIMARY KEY (`matricula_id`,`role_id`),
  ADD KEY `FK1umcxad67llyj80yjfydihbn4` (`role_id`);

--
-- Indices de la tabla `utmir_antecedentes_academicos`
--
ALTER TABLE `utmir_antecedentes_academicos`
  ADD PRIMARY KEY (`id_antecedentes_academicos`),
  ADD UNIQUE KEY `UK_s3yw57f85ypkxmdg6gb9tmnrm` (`matricula`),
  ADD KEY `FKf1nxuxexk4s8cj09ib5uule1m` (`id_carrera_1`),
  ADD KEY `FKf718u9lt2f0vdm2cfxwd6ku37` (`id_carrera_2`);

--
-- Indices de la tabla `utmir_asignacion_asignatura`
--
ALTER TABLE `utmir_asignacion_asignatura`
  ADD PRIMARY KEY (`id_asignacion_asignatura`),
  ADD KEY `FKt6kfdoqu7j8ui4imbfu3ql94b` (`matricula`),
  ADD KEY `FKl2tarjtnov2o7qnmt15of45pe` (`id_asignatura`),
  ADD KEY `FKktn9ey1i0eohcf9yqkyhaqooi` (`id_grupo`);

--
-- Indices de la tabla `utmir_asignatura`
--
ALTER TABLE `utmir_asignatura`
  ADD PRIMARY KEY (`id_asignaturas`),
  ADD KEY `FKbx8vsn1264rotet1ujbdm9s91` (`id_carrera`),
  ADD KEY `FKbim2dq7afxd3qlb22aibrqxg2` (`id_cuatrimestre`);

--
-- Indices de la tabla `utmir_asistencias`
--
ALTER TABLE `utmir_asistencias`
  ADD PRIMARY KEY (`id_asistencias`),
  ADD KEY `FKgjg64fvrhi7yxx0ohdixfg76x` (`matricula`),
  ADD KEY `FKjwcaiq8aodonvxflilf6cmmww` (`id_asignaturas`),
  ADD KEY `FKl0fi4bimi1oga78wd46hnosok` (`id_unidades_asignatura`),
  ADD KEY `FKahcwhfwbtonad9c5hrbjjgtrp` (`id_grupo`),
  ADD KEY `FKdlg6v54o8f4gqvwjx9sbdeu32` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_calificaciones`
--
ALTER TABLE `utmir_calificaciones`
  ADD PRIMARY KEY (`id_calificaciones`),
  ADD KEY `FK78g1iasgycidyhm37wjf9oq1m` (`matricula_alumno`),
  ADD KEY `FKtg2aqw543sdf7jt6rcmta60i5` (`id_asignacion_asignatura`),
  ADD KEY `FK60x2mv0hq8in7kx392pp2dkp4` (`id_informacion_academica`);

--
-- Indices de la tabla `utmir_calificaciones_unidad`
--
ALTER TABLE `utmir_calificaciones_unidad`
  ADD PRIMARY KEY (`id_calificacion_unidad`),
  ADD KEY `FKlk6bb06hbn2b9m7jdxxmnnl3c` (`matricula_alumno`),
  ADD KEY `FKcqk6ay6mwbe0l6lfyfag0go55` (`id_asignacion_asignatura`),
  ADD KEY `FKtm5vk4j1kgwb4rsgx3ukwsv5m` (`id_unidades_asignatura`),
  ADD KEY `FKojefst66lgembo6opsifd3pcn` (`id_informacion_academica`);

--
-- Indices de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `utmir_clase_asignatura`
--
ALTER TABLE `utmir_clase_asignatura`
  ADD PRIMARY KEY (`id_horarios_clase`),
  ADD KEY `FKt6mgrne2uth1hcbayblsectu0` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  ADD PRIMARY KEY (`id_contacto_emergencia`),
  ADD UNIQUE KEY `UK_4k6fxd9a2dcgswq7hba6iutus` (`matricula`);

--
-- Indices de la tabla `utmir_cuatrimestres`
--
ALTER TABLE `utmir_cuatrimestres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utmir_cuotas`
--
ALTER TABLE `utmir_cuotas`
  ADD PRIMARY KEY (`id_cuota`);

--
-- Indices de la tabla `utmir_datos_generales`
--
ALTER TABLE `utmir_datos_generales`
  ADD PRIMARY KEY (`id_datos_generales`),
  ADD UNIQUE KEY `UK_9g4tnlk6qdsf8uyx8pecxqi1k` (`matricula`);

--
-- Indices de la tabla `utmir_estadistica_aspirantes`
--
ALTER TABLE `utmir_estadistica_aspirantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utmir_estadistica_aspirantes_carrera`
--
ALTER TABLE `utmir_estadistica_aspirantes_carrera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk5any990nv5rp4lf4y3it5418` (`id_carrera`);

--
-- Indices de la tabla `utmir_evaluacion_unidad`
--
ALTER TABLE `utmir_evaluacion_unidad`
  ADD PRIMARY KEY (`id_evaluacion_unidad`),
  ADD KEY `FKdj8gor6vhkjpueosof6peqh0b` (`id_asignacion_asignatura`),
  ADD KEY `FKk414dkmqtd1ln810of8lcf3xc` (`id_unidades_asignatura`);

--
-- Indices de la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  ADD PRIMARY KEY (`id_examen_admision`),
  ADD UNIQUE KEY `UK_i3mxd0cdpk03oysd6vj6yc4um` (`matricula`);

--
-- Indices de la tabla `utmir_fecha_unidades`
--
ALTER TABLE `utmir_fecha_unidades`
  ADD PRIMARY KEY (`id_fechas_unidades`),
  ADD KEY `FK5f1vgt1i7ur68asvpxymd0nbs` (`matricula`),
  ADD KEY `FK9rrrngc5nh4pqy1dcjy6e8hoj` (`id_unidades_asignatura`),
  ADD KEY `FKdmw58hsy2dmd0g0vxusyu4gp3` (`id_grupo`),
  ADD KEY `FKmyex4jgubq3stg9ec9xsgxers` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_genero`
--
ALTER TABLE `utmir_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `utmir_grupos`
--
ALTER TABLE `utmir_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utmir_informacion_academica`
--
ALTER TABLE `utmir_informacion_academica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmx3cmpg5tnp7moupsqfnwaugd` (`matricula`),
  ADD KEY `FKffpcithn6n7ik8mkfbnuwir1t` (`id_cuatrimestre`),
  ADD KEY `FKfkl81jb705ahryom6r25mtero` (`id_grupo`),
  ADD KEY `FKfc3gya7xlfhmfv2co6538grl6` (`id_periodo`),
  ADD KEY `FKtp02bhjojmxygqn4bm1onw707` (`programa_educativo`),
  ADD KEY `FKm1m3k4mtq9bukg9j1flcq669m` (`id_status`);

--
-- Indices de la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  ADD PRIMARY KEY (`id_info_medica`),
  ADD UNIQUE KEY `UK_fkp9yntns15j23jlwk1d7kyvi` (`matricula`),
  ADD KEY `FKaxwxureuusmue2imyn3l9nt2b` (`id_tipo_sangre`);

--
-- Indices de la tabla `utmir_info_personal`
--
ALTER TABLE `utmir_info_personal`
  ADD PRIMARY KEY (`matricula`),
  ADD UNIQUE KEY `UKntulfvtkygss8mm3jfkt9k5l5` (`email`),
  ADD UNIQUE KEY `UKg1ro6152y6aodpgk6r37yuyv` (`curp`),
  ADD KEY `FK8q3wmbracfitnomcbqdy4dr7c` (`id_estados_mexico`),
  ADD KEY `FK9wibxfegqkl27jedd6kb6rh6x` (`id_genero`),
  ADD KEY `FK3l2v599gf2wq4c71gs0243o43` (`id_nacionalidad`),
  ADD KEY `FK8ssdyq5ue1xlflgu0sk8aeqwy` (`id_status`);

--
-- Indices de la tabla `utmir_log`
--
ALTER TABLE `utmir_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgy9hea5qo4wt2ah5bjx2dxh48` (`matricula`);

--
-- Indices de la tabla `utmir_nacionalidad`
--
ALTER TABLE `utmir_nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`);

--
-- Indices de la tabla `utmir_objetivos_asignatura`
--
ALTER TABLE `utmir_objetivos_asignatura`
  ADD PRIMARY KEY (`id_objetivo_asignatura`),
  ADD KEY `FKtnwhdu81iqjja9duj57a22w2y` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `FK6bwo2ixb7eyfb99v2yhrj2g3m` (`matricula`),
  ADD KEY `FKj4bssi00tth348nn0ausf20gx` (`id_cuota`);

--
-- Indices de la tabla `utmir_periodos`
--
ALTER TABLE `utmir_periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utmir_planeaciones`
--
ALTER TABLE `utmir_planeaciones`
  ADD PRIMARY KEY (`id_planeacion`),
  ADD KEY `FKfp8cvhbvr9citdugaiah1bq5c` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_proyecto_asignatura`
--
ALTER TABLE `utmir_proyecto_asignatura`
  ADD PRIMARY KEY (`id_proyecto_asignatura`),
  ADD KEY `FKsafxj8wcxwpamgaddwla2kdov` (`id_asignacion_asignatura`);

--
-- Indices de la tabla `utmir_roles`
--
ALTER TABLE `utmir_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utmir_status`
--
ALTER TABLE `utmir_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `utmir_tipo_sangre`
--
ALTER TABLE `utmir_tipo_sangre`
  ADD PRIMARY KEY (`id_tipo_sangre`);

--
-- Indices de la tabla `utmir_unidades_asignatura`
--
ALTER TABLE `utmir_unidades_asignatura`
  ADD PRIMARY KEY (`id_unidades_asignatura`),
  ADD KEY `FKse3ogqcf3id8jlwb75a7pktp7` (`id_asignaturas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados_mexico`
--
ALTER TABLE `estados_mexico`
  MODIFY `id_estado_mexico` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `utmir_antecedentes_academicos`
--
ALTER TABLE `utmir_antecedentes_academicos`
  MODIFY `id_antecedentes_academicos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `utmir_asignacion_asignatura`
--
ALTER TABLE `utmir_asignacion_asignatura`
  MODIFY `id_asignacion_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `utmir_asignatura`
--
ALTER TABLE `utmir_asignatura`
  MODIFY `id_asignaturas` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT de la tabla `utmir_asistencias`
--
ALTER TABLE `utmir_asistencias`
  MODIFY `id_asistencias` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT de la tabla `utmir_calificaciones`
--
ALTER TABLE `utmir_calificaciones`
  MODIFY `id_calificaciones` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `utmir_calificaciones_unidad`
--
ALTER TABLE `utmir_calificaciones_unidad`
  MODIFY `id_calificacion_unidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  MODIFY `id_carrera` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `utmir_clase_asignatura`
--
ALTER TABLE `utmir_clase_asignatura`
  MODIFY `id_horarios_clase` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  MODIFY `id_contacto_emergencia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `utmir_cuatrimestres`
--
ALTER TABLE `utmir_cuatrimestres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `utmir_cuotas`
--
ALTER TABLE `utmir_cuotas`
  MODIFY `id_cuota` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `utmir_datos_generales`
--
ALTER TABLE `utmir_datos_generales`
  MODIFY `id_datos_generales` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `utmir_estadistica_aspirantes`
--
ALTER TABLE `utmir_estadistica_aspirantes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `utmir_estadistica_aspirantes_carrera`
--
ALTER TABLE `utmir_estadistica_aspirantes_carrera`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `utmir_evaluacion_unidad`
--
ALTER TABLE `utmir_evaluacion_unidad`
  MODIFY `id_evaluacion_unidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  MODIFY `id_examen_admision` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `utmir_fecha_unidades`
--
ALTER TABLE `utmir_fecha_unidades`
  MODIFY `id_fechas_unidades` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `utmir_genero`
--
ALTER TABLE `utmir_genero`
  MODIFY `id_genero` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_grupos`
--
ALTER TABLE `utmir_grupos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_academica`
--
ALTER TABLE `utmir_informacion_academica`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  MODIFY `id_info_medica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `utmir_log`
--
ALTER TABLE `utmir_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=590;

--
-- AUTO_INCREMENT de la tabla `utmir_nacionalidad`
--
ALTER TABLE `utmir_nacionalidad`
  MODIFY `id_nacionalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_objetivos_asignatura`
--
ALTER TABLE `utmir_objetivos_asignatura`
  MODIFY `id_objetivo_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `utmir_periodos`
--
ALTER TABLE `utmir_periodos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_planeaciones`
--
ALTER TABLE `utmir_planeaciones`
  MODIFY `id_planeacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `utmir_proyecto_asignatura`
--
ALTER TABLE `utmir_proyecto_asignatura`
  MODIFY `id_proyecto_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `utmir_roles`
--
ALTER TABLE `utmir_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `utmir_status`
--
ALTER TABLE `utmir_status`
  MODIFY `id_status` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `utmir_tipo_sangre`
--
ALTER TABLE `utmir_tipo_sangre`
  MODIFY `id_tipo_sangre` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `utmir_unidades_asignatura`
--
ALTER TABLE `utmir_unidades_asignatura`
  MODIFY `id_unidades_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula_roles`
--
ALTER TABLE `matricula_roles`
  ADD CONSTRAINT `FK1umcxad67llyj80yjfydihbn4` FOREIGN KEY (`role_id`) REFERENCES `utmir_roles` (`id`),
  ADD CONSTRAINT `FKmvvccnq2vgom06unfjy29rnl0` FOREIGN KEY (`matricula_id`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_antecedentes_academicos`
--
ALTER TABLE `utmir_antecedentes_academicos`
  ADD CONSTRAINT `FKf1nxuxexk4s8cj09ib5uule1m` FOREIGN KEY (`id_carrera_1`) REFERENCES `utmir_catalogo_carreras` (`id_carrera`),
  ADD CONSTRAINT `FKf718u9lt2f0vdm2cfxwd6ku37` FOREIGN KEY (`id_carrera_2`) REFERENCES `utmir_catalogo_carreras` (`id_carrera`),
  ADD CONSTRAINT `FKhjdhjrw87h8xscjtk59dbak3x` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_asignacion_asignatura`
--
ALTER TABLE `utmir_asignacion_asignatura`
  ADD CONSTRAINT `FKktn9ey1i0eohcf9yqkyhaqooi` FOREIGN KEY (`id_grupo`) REFERENCES `utmir_grupos` (`id`),
  ADD CONSTRAINT `FKl2tarjtnov2o7qnmt15of45pe` FOREIGN KEY (`id_asignatura`) REFERENCES `utmir_asignatura` (`id_asignaturas`),
  ADD CONSTRAINT `FKt6kfdoqu7j8ui4imbfu3ql94b` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_asignatura`
--
ALTER TABLE `utmir_asignatura`
  ADD CONSTRAINT `FKbim2dq7afxd3qlb22aibrqxg2` FOREIGN KEY (`id_cuatrimestre`) REFERENCES `utmir_cuatrimestres` (`id`),
  ADD CONSTRAINT `FKbx8vsn1264rotet1ujbdm9s91` FOREIGN KEY (`id_carrera`) REFERENCES `utmir_catalogo_carreras` (`id_carrera`);

--
-- Filtros para la tabla `utmir_asistencias`
--
ALTER TABLE `utmir_asistencias`
  ADD CONSTRAINT `FKahcwhfwbtonad9c5hrbjjgtrp` FOREIGN KEY (`id_grupo`) REFERENCES `utmir_grupos` (`id`),
  ADD CONSTRAINT `FKdlg6v54o8f4gqvwjx9sbdeu32` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`),
  ADD CONSTRAINT `FKgjg64fvrhi7yxx0ohdixfg76x` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKjwcaiq8aodonvxflilf6cmmww` FOREIGN KEY (`id_asignaturas`) REFERENCES `utmir_asignatura` (`id_asignaturas`),
  ADD CONSTRAINT `FKl0fi4bimi1oga78wd46hnosok` FOREIGN KEY (`id_unidades_asignatura`) REFERENCES `utmir_unidades_asignatura` (`id_unidades_asignatura`);

--
-- Filtros para la tabla `utmir_calificaciones`
--
ALTER TABLE `utmir_calificaciones`
  ADD CONSTRAINT `FK60x2mv0hq8in7kx392pp2dkp4` FOREIGN KEY (`id_informacion_academica`) REFERENCES `utmir_informacion_academica` (`id`),
  ADD CONSTRAINT `FK78g1iasgycidyhm37wjf9oq1m` FOREIGN KEY (`matricula_alumno`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKtg2aqw543sdf7jt6rcmta60i5` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_calificaciones_unidad`
--
ALTER TABLE `utmir_calificaciones_unidad`
  ADD CONSTRAINT `FKcqk6ay6mwbe0l6lfyfag0go55` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`),
  ADD CONSTRAINT `FKlk6bb06hbn2b9m7jdxxmnnl3c` FOREIGN KEY (`matricula_alumno`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKojefst66lgembo6opsifd3pcn` FOREIGN KEY (`id_informacion_academica`) REFERENCES `utmir_informacion_academica` (`id`),
  ADD CONSTRAINT `FKtm5vk4j1kgwb4rsgx3ukwsv5m` FOREIGN KEY (`id_unidades_asignatura`) REFERENCES `utmir_unidades_asignatura` (`id_unidades_asignatura`);

--
-- Filtros para la tabla `utmir_clase_asignatura`
--
ALTER TABLE `utmir_clase_asignatura`
  ADD CONSTRAINT `FKt6mgrne2uth1hcbayblsectu0` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  ADD CONSTRAINT `FK1dy62np33lwsld1295n3wumw` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_datos_generales`
--
ALTER TABLE `utmir_datos_generales`
  ADD CONSTRAINT `FKte3doal0e9b1vscpnxekuyw9l` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_estadistica_aspirantes_carrera`
--
ALTER TABLE `utmir_estadistica_aspirantes_carrera`
  ADD CONSTRAINT `FKk5any990nv5rp4lf4y3it5418` FOREIGN KEY (`id_carrera`) REFERENCES `utmir_catalogo_carreras` (`id_carrera`);

--
-- Filtros para la tabla `utmir_evaluacion_unidad`
--
ALTER TABLE `utmir_evaluacion_unidad`
  ADD CONSTRAINT `FKdj8gor6vhkjpueosof6peqh0b` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`),
  ADD CONSTRAINT `FKk414dkmqtd1ln810of8lcf3xc` FOREIGN KEY (`id_unidades_asignatura`) REFERENCES `utmir_unidades_asignatura` (`id_unidades_asignatura`);

--
-- Filtros para la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  ADD CONSTRAINT `FK2x3rf22hbsa23g6yaln30iry7` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_fecha_unidades`
--
ALTER TABLE `utmir_fecha_unidades`
  ADD CONSTRAINT `FK5f1vgt1i7ur68asvpxymd0nbs` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FK9rrrngc5nh4pqy1dcjy6e8hoj` FOREIGN KEY (`id_unidades_asignatura`) REFERENCES `utmir_unidades_asignatura` (`id_unidades_asignatura`),
  ADD CONSTRAINT `FKdmw58hsy2dmd0g0vxusyu4gp3` FOREIGN KEY (`id_grupo`) REFERENCES `utmir_grupos` (`id`),
  ADD CONSTRAINT `FKmyex4jgubq3stg9ec9xsgxers` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_informacion_academica`
--
ALTER TABLE `utmir_informacion_academica`
  ADD CONSTRAINT `FKfc3gya7xlfhmfv2co6538grl6` FOREIGN KEY (`id_periodo`) REFERENCES `utmir_periodos` (`id`),
  ADD CONSTRAINT `FKffpcithn6n7ik8mkfbnuwir1t` FOREIGN KEY (`id_cuatrimestre`) REFERENCES `utmir_cuatrimestres` (`id`),
  ADD CONSTRAINT `FKfkl81jb705ahryom6r25mtero` FOREIGN KEY (`id_grupo`) REFERENCES `utmir_grupos` (`id`),
  ADD CONSTRAINT `FKm1m3k4mtq9bukg9j1flcq669m` FOREIGN KEY (`id_status`) REFERENCES `utmir_status` (`id_status`),
  ADD CONSTRAINT `FKmx3cmpg5tnp7moupsqfnwaugd` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKtp02bhjojmxygqn4bm1onw707` FOREIGN KEY (`programa_educativo`) REFERENCES `utmir_catalogo_carreras` (`id_carrera`);

--
-- Filtros para la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  ADD CONSTRAINT `FKaxwxureuusmue2imyn3l9nt2b` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `utmir_tipo_sangre` (`id_tipo_sangre`),
  ADD CONSTRAINT `FKex28w9ymsqtrxfn0y5u2k356s` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_info_personal`
--
ALTER TABLE `utmir_info_personal`
  ADD CONSTRAINT `FK3l2v599gf2wq4c71gs0243o43` FOREIGN KEY (`id_nacionalidad`) REFERENCES `utmir_nacionalidad` (`id_nacionalidad`),
  ADD CONSTRAINT `FK8q3wmbracfitnomcbqdy4dr7c` FOREIGN KEY (`id_estados_mexico`) REFERENCES `estados_mexico` (`id_estado_mexico`),
  ADD CONSTRAINT `FK8ssdyq5ue1xlflgu0sk8aeqwy` FOREIGN KEY (`id_status`) REFERENCES `utmir_status` (`id_status`),
  ADD CONSTRAINT `FK9wibxfegqkl27jedd6kb6rh6x` FOREIGN KEY (`id_genero`) REFERENCES `utmir_genero` (`id_genero`);

--
-- Filtros para la tabla `utmir_log`
--
ALTER TABLE `utmir_log`
  ADD CONSTRAINT `FKgy9hea5qo4wt2ah5bjx2dxh48` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

--
-- Filtros para la tabla `utmir_objetivos_asignatura`
--
ALTER TABLE `utmir_objetivos_asignatura`
  ADD CONSTRAINT `FKtnwhdu81iqjja9duj57a22w2y` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  ADD CONSTRAINT `FK6bwo2ixb7eyfb99v2yhrj2g3m` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKj4bssi00tth348nn0ausf20gx` FOREIGN KEY (`id_cuota`) REFERENCES `utmir_cuotas` (`id_cuota`);

--
-- Filtros para la tabla `utmir_planeaciones`
--
ALTER TABLE `utmir_planeaciones`
  ADD CONSTRAINT `FKfp8cvhbvr9citdugaiah1bq5c` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_proyecto_asignatura`
--
ALTER TABLE `utmir_proyecto_asignatura`
  ADD CONSTRAINT `FKsafxj8wcxwpamgaddwla2kdov` FOREIGN KEY (`id_asignacion_asignatura`) REFERENCES `utmir_asignacion_asignatura` (`id_asignacion_asignatura`);

--
-- Filtros para la tabla `utmir_unidades_asignatura`
--
ALTER TABLE `utmir_unidades_asignatura`
  ADD CONSTRAINT `FKse3ogqcf3id8jlwb75a7pktp7` FOREIGN KEY (`id_asignaturas`) REFERENCES `utmir_asignatura` (`id_asignaturas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
