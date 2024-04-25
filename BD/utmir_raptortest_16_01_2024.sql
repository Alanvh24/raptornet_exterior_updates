-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-01-2024 a las 21:33:15
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
('15', 4),
('160', 4),
('164', 1),
('198', 3),
('2303001', 6),
('2303002', 2),
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
('2303017', 2),
('2303018', 2),
('2303019', 2),
('2303020', 2),
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
('2403010', 2),
('2403011', 2),
('2403012', 2),
('2403013', 2),
('2403014', 2),
('2403015', 2),
('2403016', 2),
('2403017', 2),
('2403018', 6),
('2403019', 2),
('2403020', 2),
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
('66', 1),
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
(2, 'PRUEBA', 'Prueba', 'Prueba', '2303002', 9, 3),
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
(123, 'YOCUI', '9.5', 'YOCUI', '2403132', 9, 4);

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
(123, '48YOCUI', 'YOCUI', 'YOCUI', '7478', '2403132');

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
(123, NULL, 'no', NULL, 'no', '2403132');

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
(4, 2024, 27, 101, 128);

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
(13, 20, 7, 13, 3, 2024),
(14, 18, 10, 8, 4, 2024),
(15, 8, 2, 6, 5, 2024),
(16, 14, 2, 12, 1, 2024),
(17, 2, 1, 1, 12, 2023),
(18, 2, 1, 1, 4, 2023),
(19, 20, 2, 18, 12, 2024),
(20, 5, 3, 2, 9, 2024);

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
(67, 53, '4.42', 120, '2403100'),
(68, NULL, NULL, NULL, '2403104'),
(69, NULL, NULL, NULL, '2403108'),
(70, 120, '10.00', 120, '2303001'),
(71, NULL, NULL, NULL, '2303021'),
(72, NULL, NULL, NULL, '2303022'),
(73, NULL, NULL, NULL, '2303023'),
(74, NULL, NULL, NULL, '2403128'),
(75, 105, '8.75', 120, '2403129'),
(76, 95, '7.92', 120, '2403025'),
(77, 105, '8.75', 120, '2403026'),
(78, 52, '4.33', 120, '2403131'),
(79, 89, '7.42', 120, '2403132');

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
(5, NULL, NULL, '2403078', NULL, NULL, NULL, 4, 1),
(6, NULL, NULL, '2303003', NULL, NULL, NULL, 4, 1),
(7, NULL, NULL, '2403018', NULL, NULL, NULL, 1, 1),
(11, NULL, NULL, '2303001', NULL, NULL, NULL, 12, 1),
(12, NULL, NULL, '2403025', NULL, NULL, NULL, 4, 1),
(13, NULL, NULL, '2403026', NULL, NULL, NULL, 3, 1),
(14, NULL, NULL, '2403131', NULL, NULL, NULL, 9, 1),
(15, NULL, NULL, '2403132', NULL, NULL, NULL, 9, 1);

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
(123, NULL, 'no', '2403132', 3);

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
('15', NULL, NULL, NULL, NULL, 'vinc@edu.mc', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$WNiJxqpV/4G2VXT3CEaESeslEr22yfZz1OI7UDij70i6D.gQ.YH3m', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('160', NULL, NULL, NULL, NULL, 'vane.vane@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$3SiL36Ez/eWtq.ANgeX2XuDiGuFSLz4Id2T/QXQeiFcmhgww//Ejm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('164', NULL, NULL, 'VEHA', NULL, 'alanvelazquez@test.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$V8gDOL743qHtPkwc/iJ3EuYLZBsS.39LSwf9LJk.ClTFPi0/GtLrW', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('198', NULL, NULL, NULL, NULL, 'finanzasdeprueba@tet.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$imr35PolGk6/tNF3PXiIeuj5u9tVnWVYVgWop42bPopIgww.Tx0Ya', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2303001', 'HERNÁNDEZ', 'VELÁZQUEZ', 'VEHA011108HMCLRLA4', '22', 'alan.velazquez@utmir.edu.mx', '2001-11-09', 'SAN AGUSTIN', 'ECATEPEC DE MORELOS', 'ALAN', 'nss', '7713069010', '$2a$10$dnF..11g0y5kKwqssCGh/Omc0tMEr/9F9osq/QFzk5yuama01JW2q', 'RFC', 15, 1, 1, 1, '3', '2024-01-04'),
('2303002', 'REGISTRO', 'DE', 'HAHAHAHA', '25', 'aa@aa.com', '2001-11-08', 'HIDO', 'ELP', 'PRUEBA', 'nss02', '7713000', '$2a$10$7dB/jacfUUb88S2nBnKDAuptGBYoXoyUf69tolhKXhwR1qlvRZ29y', 'rfcdematricula02', 13, 1, 1, NULL, '2', '2023-11-30'),
('2303003', 'E', 'E', 'VEHA0110', '01', 'registro@registro.com', '2001-11-08', 'ASD', 'ASD', 'as', NULL, '7741', '$2a$10$WpQr.Z9JDn6UUS6NUojXouSwbElv2Oq.2GGFmCSHnSToeIxWiVOgi', NULL, 18, 2, 1, NULL, '101', '2023-12-07'),
('2303005', 'BETH', 'LI', 'yoli', '16', 'yolibethama@gmail.com', '2001-02-08', 'LELE', 'LELE', 'YOL', NULL, '77115', '$2a$10$mktcAjaoI397/GpYd.RwAumhS6uTHXEDBetGYmgysgJhVPM2BBAaK', NULL, 14, 1, 1, NULL, '3', '2023-12-16'),
('2303006', 'as', 'asd', '12312312123', '12', 'fecha@gech.com', '2001-11-08', '12', '12', 'as', NULL, '2134', '$2a$10$jll.YnGZNW6Hrh5vSF4LL.pY7YP9P3pv4j40XzbAghyqTDeH.bxHC', NULL, 18, 1, 1, NULL, NULL, '2023-11-30'),
('2303007', 'TESTING', 'TESTING', 'loney', '12', 'asas@lone.com', '2023-11-30', '21', '12', 'TESTING', NULL, '12', '$2a$10$6IGObzG3f6DkxkeilYGLGOrCqKeKO3K9iyCIGTMtEVHR8iwo.PaA6', NULL, 17, 1, 1, NULL, NULL, '2023-11-30'),
('2303008', 'ELPEPE', 'ELPEPE', '1231321123123', '12', 'ala@ala.com', '2001-07-08', 'ELPEPE', 'ELPEPE', 'ELPEPE', NULL, '879749', '$2a$10$4bT8PXQuo8L1Kwvzr/kJ1.GTp5HJULhtuVCe0vPRmIJgLrwjvkWQy', NULL, 9, 1, 2, NULL, NULL, '2023-11-30'),
('2303009', 'SAS', 'SAS', '1239', '12', '1@1.com', '2001-11-08', 'SAS', 'AS', 'SAS', NULL, '778948', '$2a$10$qrX0bwH9ukrLYlUj7.RgYemUSFEgc33PgTBQuzlIVu2dLDBoA5XIi', NULL, 13, 1, 2, NULL, NULL, '2023-11-30'),
('2303010', 'ALA', 'AL', 'ALLAHU', '22', 'alahuakbar@gmail.com', '2001-11-08', 'ALA', 'ALA', 'ALA', NULL, '745415', '$2a$10$8Ho8vCxPamf4GxbQuml0J.EsUsBtE6M9rxH0P0mLuRKZ0y.qFes36', NULL, 13, 1, 2, NULL, NULL, '2023-12-02'),
('2303011', 'TITO', 'TITO', '1231231', '12', 'AS@com.com', '2001-11-08', 'TITO', 'TITO', 'TITO', NULL, 'TITO', '$2a$10$pQLGVgh/Mkrh2mOeXJj49OB6irYnr1JsEruXqOKQGDh/ZwbjpFtwi', NULL, 7, 1, 1, NULL, NULL, '2023-12-02'),
('2303012', 'PEPEPON', 'PEPEPON', 'ELPEPE', '15', 'pepe@pe.com', '2001-11-08', 'PEPEPON', 'PEPEPON', 'PEPEPON', NULL, '7770', '$2a$10$OKgs6yuPTEy4uTQRTOf.WumOMCQzpFVtz4A5iiyAuBkzw.CoRjnTq', NULL, 2, 1, 2, NULL, NULL, '2023-12-05'),
('2303013', 'IOASDO', 'IOASDO', 'IOASDO', '12', 'ooo@io.com', '2001-11-08', 'IOASDO', 'IOASDO', 'IOASDO', NULL, '54545', '$2a$10$tkWkmwNy.64IlgZVAhk19enXRSKeK5lBEim49mv.aMnBwuMMUPmLy', NULL, 16, 1, 1, NULL, '1', '2023-12-05'),
('2303014', 'as', 'as', 'PEPETE', '12', 'PEPETE@gmail.com', '2001-11-08', 'as', 'as', 'as', NULL, '546415', '$2a$10$pBnjhScnVGFpI/mfm5310.Rsdj.c1utdogrUOO2JEILlq.087SxN.', NULL, 3, 2, 1, NULL, '1', '2023-12-06'),
('2303015', 'JEJE', 'JEJE', 'JEJE', '19', 'PEPETE2@gmail.com', '2001-11-05', 'JEJE', 'JEJE', 'JEJE', NULL, '56454645', '$2a$10$z6wvcNko1NOXVr9Wj3Q2AuOX3GJXz7zfM/XsOexOMqRvhLskWFEMC', NULL, 17, 1, 2, NULL, '1', '2023-12-07'),
('2303016', 'c', 'c', 'cfdgfxinnn', '123', 'kmaoudyf@utmir.edu.mx', '2200-03-12', 'asdfghj', 'sdfghjkl', 'c', NULL, '12345678', '$2a$10$tlSROk37eO1ETaWQTq6pUuz/Qu7tNsYBxNSe04LPpaQpd2wQWnXMi', NULL, 2, 2, 2, NULL, '2', '2023-12-07'),
('2303017', 'ALVARADO', 'FERNÁNDEZ', 'AVEHA0112', '25', 'alanvelaz24@gmail.com', '1998-05-09', 'ASAS', 'MICHO', 'TUSA', NULL, '7877818', '$2a$10$0QL90g6E9itMGvXCySStfuf2ezSV/TixsVkZCcBbnpDOlgOgtbpLK', NULL, 33, 2, 2, NULL, '4', '2023-12-09'),
('2303018', 'NIETO', 'PEÑA', 'ESPONJAAS', '18', 'enriquepena@gmail.com', '2001-11-08', 'ASD', 'ELP', 'ENRIQUE', NULL, '77130007878', '$2a$10$lU/GaJL5uWNNrowaGZZ49e6SeTG8w3LkWyaZmIlPS5kiiDJUgpd9O', NULL, 17, 1, 1, NULL, '3', '2023-12-12'),
('2303019', 'ALAN', 'ALAN', 'CURP321', '46', 'correo@fake.com', '1984-11-17', 'LOCALIDAD', 'MUNICIPIO', 'ALAN', NULL, '775567878', '$2a$10$Qqr7M3jsoJ60iMZ4utqSGub5R8RDwMHxVCAtcC7sZBS2/xvNgJWEG', NULL, 4, 1, 1, NULL, '3', '2023-12-12'),
('2303020', 'EPE', 'EPE', 'CUROPO', '23', 'isjaja@gmail.com', '2001-11-08', 'EPE', 'EPE', 'EPE', NULL, '4645648', '$2a$10$8yU72udN4oDPKp.u.YPiWOmwk8vjQn3HAv0b37jibsCcw.WEroYE2', NULL, 10, 1, 1, NULL, '101', '2023-12-18'),
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
('2403010', 'SUERTE', 'SUERTE', '12131JMASDMAS', '20', 'unnuevotest@suwerte.com', '2003-02-05', 'SUERTE', 'SUERTE', 'SUERTE', NULL, '123123', '$2a$10$ww96YI9eeYGTt1T0IbIeHOTOPB6QvT1NZ8mg85pCNfFIzuiFjgMSK', NULL, 17, 1, 2, NULL, '3', '2024-01-04'),
('2403011', 'ELELELEL', 'ELELELEL', '123456ASCAS', '5', 'asdas@com.commmm', '2018-05-05', 'ELELELEL', 'ELELELEL', 'ELELELEL', NULL, '455641', '$2a$10$0DykU3PPzhiHERKelEjtDu2j03WXJroRkMjElK8QxbJ4t2xpkE7FK', NULL, 8, 1, 1, NULL, '4', '2024-01-04'),
('2403012', 'NEW', 'NEW', 'NEWEWUWEU', '19', 'asasnewww@new.com', '2004-05-08', 'NEW', 'NEW', 'NEW', NULL, '12312', '$2a$10$Wd9yihvUW1pZVVcutjOsRuxRiu4NAPB4JjXNxnJPy6BSBCTF9Vh1K', NULL, 8, 1, 1, NULL, '3', '2024-01-04'),
('2403013', 'AS', 'AS', 'REGIST', '21', 'register.com@com.com', '2003-01-05', 'AS', 'AS', 'AS', NULL, '7778265', '$2a$10$5vtI0FKJsbK5DOeugLnwnOpbybz4igl6RkwbP/asjXtOHTTDb4HsS', NULL, 14, 1, 1, NULL, '3', '2024-01-05'),
('2403014', 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', '17', 'otramas@iot.com', '2006-02-26', 'OTRAMAS', 'OTRAMAS', 'OTRAMAS', NULL, '778016', '$2a$10$VZryrfz.0Rq7JBC/z7uZyOIzYm38g8bX0fxlDMVrcmAE.pK4nG/Qe', NULL, 9, 1, 1, NULL, '3', '2024-01-05'),
('2403015', 'GASTROO', 'GASTROO', 'GASTROO', '22', 'gastr@fgast.com', '2001-12-08', 'GASTROO', '1AS', 'GASTROO', NULL, 'GASTROO', '$2a$10$KMg3pJbSzP/qtai.cJQAb.JUbflt.EsKDptzPCG.0zFalm3k8c2K6', NULL, 9, 1, 2, NULL, '3', '2024-01-05'),
('2403016', 'AGASFAO', 'AGASFAO', '1JKASCGASTROO', '17', 'gasto@g.com', '2006-11-08', 'AGASFAO', 'AGASFAO', 'AGASFAO', NULL, '56416+', '$2a$10$FWlSvZQv7rvqo7CI.1RtIu.mXg61gMrIJBThzQPh9FnpzrXNzDBMm', NULL, 9, 1, 1, NULL, '3', '2024-01-05'),
('2403017', 'ALAM', 'ALAM', 'ALASNVELAS2RASD', '15', 'alan.velazquez233@utmir.edu.mx', '2008-02-05', 'ALAM', 'ALAM', 'ALAM', NULL, '77781', '$2a$10$55D39udLsa6D.33L2vVHRu6KlQvEwimHhA6Lvd3IdHT9mPTTFDRNK', NULL, 11, 1, 1, NULL, '4', '2024-01-06'),
('2403018', 'OTRO', 'OTRO', '123ASFOTRO', '20', 'Otrooooooooooo@com.com', '2003-06-05', 'OTRO', 'OTRO', 'OTRO', NULL, '848949+49+', '$2a$10$E64vu/9C640wz/9E4acYk.cZAH2w//MYjMXufhBC1.Vx390P3IyS.', NULL, 9, 1, 1, NULL, '2', '2024-01-06'),
('2403019', NULL, NULL, 'generaraaaaa', NULL, 'generar@nuevamatr.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$gsk7MBUjQK8ELF6.VOAs5uTtc31hqRtvP2eKrHtFr6VFnrwodqvFi', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403020', 'JEJE', 'JEJE', 'OTRAMATERICULA1', '17', 'torto@com.com', '2006-05-08', 'JEJE', 'JEJE', 'JEJE', NULL, 'JEJE', '$2a$10$j09jALoKGnwlP73uWNRU2ejN926TCpbtuun/xDrguEkBRnegAoNXq', NULL, 33, 2, 2, NULL, '3', '2024-01-09'),
('2403021', 'LOGOOO', 'LOGOOO', 'LOGOOO', '22', 'pruebadelogo@log.com', '2001-11-08', 'LOGOOO', 'LOGOOO', 'LOGOOO', NULL, 'LOGOOO', '$2a$10$SIjSsO3w4XQBQWz3UNwuQOZ9bigF436llhIAcKRcNDFcwjBqXswOW', NULL, 15, 1, 2, NULL, '3', '2024-01-09'),
('2403022', 'HERNANDEZ', 'VELAZQUEZ', '123456789012345678', '22', 'alasl@cmasm.com', '2001-11-08', 'ASDAS', '78485', 'ALAN', NULL, '1234567890', '$2a$10$2l..54K1K2WCCpPI9.2MMuoTQ7dXh5U9mIpptxf/pi2cvGfhvexRW', NULL, 15, 1, 1, NULL, '2', '2024-01-12'),
('2403023', NULL, NULL, '15483357656', NULL, 'dvjbnr@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$uxPPLXd0TUs5w1YmDrK8JOnwO6oXUNbK1BiIJ1KYUmoHZ37QpzF5e', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403024', 'CRUZ', 'RUTA', 'RIPM050212MHGVCXA8', '523', '2303074@utmir.edu.mx', '1500-01-24', 'MEXICO', 'MEXICO', 'SANTIAGO AGUILAR ', NULL, '77121345679995', '$2a$10$05icIqKtBcdpr9Y84ONOb.hvNieDfRShXOiON3TWaFu0vjIdeVO5K', NULL, 30, 1, 1, NULL, '2', '2024-01-09'),
('2403025', 'PEREZ', 'POBREZA', 'MALI050428MHGRNRA0', '18', 'jaquelinemartinezluna28@gmail.com', '2005-03-08', 'HIDALGO ', 'PAPACUATLA', 'PETRA ', NULL, '2589741', '$2a$10$BZGv5uP9LH0w1oNtd7KUce29ET7YUPHFhMQ636aCvtCWgQrPBrzA6', NULL, 13, 2, 1, NULL, '2', '2024-01-09'),
('2403026', 'PEREZ', 'GALINDO', 'HJFKLSGBFÑUAFAÑVAHFW', '20', 'maquinadefuego@gmail.com', '2003-10-24', 'PACHUCA', 'PACHUCA', 'MONICA', NULL, '5548761378', '$2a$10$DhbijBxZCK2MM/aq1rnsZu3f4nozGriDcRJijaX0bhOT77kjWYcPi', NULL, 13, 2, 1, NULL, '2', '2024-01-09'),
('2403027', 'RUVALCABA ', 'PETRONILA', 'ASDFGHJKLQWERTYU', '24', 'armando908@gmail.com', '1999-02-09', 'APATZINGAN', 'ZITACUARO', 'IVANO', NULL, '77713559560', '$2a$10$m0rvYidqfetM9OrjhcEgsORGMOzN4TPr8bN2EsTavkFa5CTcSf2AC', NULL, 28, 1, 1, NULL, '2', '2024-01-09'),
('2403028', 'PEREZ', 'LOPEZ', 'TOMF050621HHGRRRA1', '69', 'tenorioerick33@gmail.com', '2022-11-27', 'PIRACANTOS', 'PACHUCA', 'MEMO', NULL, '230586978', '$2a$10$nXdvPWN8WBsmJSZFqOw2xO0R2hm3KTdyhC8dx9jW88S9YAs.fyd6.', NULL, 13, 1, 1, NULL, '1', '2024-01-09'),
('2403029', 'PIU', 'PIU', 'HEBF030409HHGRTRA6', '21', 'luigusvmedina@gmail.com', '2003-01-01', 'CIUDAD DE MEXICO', 'COYOACAN', 'DAETH', NULL, '5555555555', '$2a$10$CRfk9cQ9RWOcRec4KT1dL.E854Nt9m/V8fudX9Pn8Vc/1kDL7XTnu', NULL, 9, 2, 1, NULL, '2', '2024-01-09'),
('2403030', NULL, NULL, 'AUHA050417HHGCRNA7', NULL, 'gabrielang2005@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$Xa5fl3Nia6xxkXCYqic8/u35BnRrYV5K1gwNDvWeGL2scCNGxFEQC', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403031', NULL, NULL, 'KFUHIFHIDSGHF0', NULL, 'termostato12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$OkI7WMea/LcJQEEv33RFyuCF.vn/kH9B0pMiLehlRaL/y5JS58Mh2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403032', 'DE PLESIS', 'ENCISO', 'TOGH001031HMCDFDK9', '19', 'test01@testing.com', '2004-01-26', 'LA CRUZ', 'TLAJOMULCO DE ZUÑIGA', 'BRUNO', NULL, '1234567891', '$2a$10$dfOyLkqpS61r1KDKi9eJm.C5BY/PFplEkVywogzr0jAE/NdvWBadi', NULL, 14, 1, 1, NULL, '2', '2024-01-09'),
('2403033', 'PEREZ', 'LOPEZ', 'GOPI050517HHGNLDA9', '18', 'lopezgarza@gmail.com', '2005-05-10', 'HIDALGO ', 'PACHUCA', 'IGUANO ', NULL, '7712356987', '$2a$10$/gB8c6tDIYBJ0ZMj0MiIl.jddkHQkky07OJGvEHmwu.6Z1Ob9Iyua', NULL, 19, 1, 1, NULL, '2', '2024-01-09'),
('2403034', 'HERNANDEZ', 'POZOS', 'SAAD880705HDFLLV03', '33', 'perromojadito@gmail.com', '1990-11-15', 'GUSTABO AMADERO', 'GUSTABO AMADERO', 'GEOVANNY ', NULL, '7724595823', '$2a$10$lVuoVm5B.ah1Ds.AIrU7yOMeEAmMnju7DolIJzz5CjX2gbAFtEcse', NULL, 15, 1, 1, NULL, '2', '2024-01-09'),
('2403035', 'HERNANDEZ', 'POSOS', 'ABCDEFGHIJKLMNÑ7575Y', '18', 'burrito@gmail.com', '2005-03-31', 'SAN JUDAS TADEO', 'TULANCINGO', 'GEOVANNY', NULL, '7717778534', '$2a$10$04d2yfBdPBViaVp5H.7diuNK6YybjIOz4q.sn52CZpamI5Iwqd5wW', NULL, 11, 2, 1, NULL, NULL, NULL),
('2403036', NULL, NULL, 'HODFKS523211', NULL, 'prueba@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$PWG3iMMhqtfgn0sWXhJkNu9L/C1Nt7hRzZJ9vbpwHuFDJbOw8IPm.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403037', 'NIETO', 'MANUEL', 'POQWHD2314DENU45JI', '5', 'hbmg1512345@gmail.com', '2018-02-09', 'PACHUCA', 'MINERAL DE LA REFORMA', 'ANDRES', NULL, '551640981', '$2a$10$ALER952fdy8p5.e7cfWYAu8VN/Yak18PEPSSYBwNwvGPMxOJeLoiG', NULL, 13, 1, 1, NULL, '2', '2024-01-09'),
('2403038', 'LLLLLL', 'JJJJJ', '123456', '-1', 'ss@g.com', '2024-02-09', 'TTTTTTTTT', 'RRRR', 'DDDD', NULL, '33333333333', '$2a$10$8tDNzZlybtxQwDigL.shiekD4Y/vypbEVNQoNB/MZsNw48m90y/zS', NULL, 13, 1, 1, NULL, '1', '2024-01-09'),
('2403039', 'HERNANDEZ', 'HERNANDEZ', 'CVCA000675FFTHREA6', '18', 'cddg@gmail.com', '2005-08-08', 'MINERAL DE LA REFORMA', 'MINERAL DE LA REFORMA', 'ALBERTO', NULL, '7712257545', '$2a$10$urM2Z3geoxxv.02HJzsGQOQYNINj/aaCyoDyapX9G793Q2X3QFpGW', NULL, 13, 1, 1, NULL, '1', '2024-01-09'),
('2403040', NULL, NULL, 'HELJ0416HHGRRNA7', NULL, 'leticialeonleon07@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$iGrvlSMSICVgdw5qhQLox.xjY5Q/980gGw/WCFRNygrQjFFvWp3ya', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403041', 'MEJIA', 'RODRIGUEZ ', 'ROMD020813MHGDJRA7', '19', 'touka.tokyoghoul.anime.pankeke@gmail.com', '2004-08-13', 'PACHUCA', 'PACHUCA', 'KATHERINE JANE', NULL, '7711758437', '$2a$10$FzADK8pe70/Wjy/XDgtr8.cjoqOytru0ECTvKQZbl0eFr8pDN1thO', NULL, 13, 2, 1, NULL, '1', '2024-01-09'),
('2403042', 'PEREZ', 'PEREZ', 'HDJFDHKK5030', '26', 'Prueba2@gmailo.com', '1997-10-09', 'PACHUCA DE SOTO', 'PACHUCA DE SOTO', 'JUANITO', NULL, '771111111111', '$2a$10$vte49wbqN8LDlgmbZfZ.I.9QG7yIbasdIHYEgJcCosJbFNGqESMlW', NULL, 13, 1, 1, NULL, '1', '2024-01-09'),
('2403043', NULL, NULL, '455225688755625', NULL, 'misa@c.om', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$IV3sUFtYIaP8BT3WWKC0Leriq/MJaYyWCpfJMwXRMpJGJ/n2Iq.Ey', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-09'),
('2403044', 'GLOVER', 'AFTON', 'CEFF005678', '54', 'waspinator01@gmail.com', '1969-09-11', 'TLAXCALA', 'MINERL DE LA REFORMA', 'AXEL MICHAEL', NULL, '7711771987', '$2a$10$TklxU5CtsMFJvq/w/3Bt4ej6g5YI0b/xULd/OAJ97KIstAv9/t.Iu', NULL, 28, 1, 1, NULL, '2', '2024-01-09'),
('2403045', 'PEREZ ', 'RAMIREZ ', 'GARM040527MHGRMRA1', '23', 'char27@gmai.com', '2000-06-05', 'HIDALGO', 'PACHUCA ', 'DANIELA', NULL, '7711262999', '$2a$10$v2y/8wBHi6lgpaoLxW7xoO4XiIFeaZn.JzanbdeFGTVrLrQgJjGC2', NULL, 13, 2, 1, NULL, '1', '2024-01-09'),
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
('2403078', 'BASILIO ', 'IBARAA ', 'GARM040527MHRRRRRR', '20', 'chai20@gmai.com', '2003-02-01', 'HIGALGO ', 'PACHUCA ', ' YAIR ', NULL, '77117272717', '$2a$10$QNF.e11r8rACjTPUV3KhDutUIJCoxMLCRHI4vrsACBYyw8IlLqdT.', NULL, 15, 1, 1, NULL, '2', '2024-01-10'),
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
('2403093', 'ALEGRIA ', 'ALEGRIA ', 'QWERTUIOASDFGH12', '24', 'kaulaoa89@gmail.com', '1999-02-10', 'PELAS ', 'CHIRAS ', 'ALMA MARCELA ', NULL, '7713559569', '$2a$10$NFsB2c9Kvi7GWV5Hs1nrHOhdgcXV/4U71J.0PTbWOMYote6WlkdKe', NULL, 14, 1, 1, NULL, '2', '2024-01-10'),
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
('2403117', 'FERNANDEZ', 'HERNANDEZ', 'ROMD040312MHGDJTX6', '19', 'gfiehfifoih@gmail.com', '2004-03-12', 'PACHUCA', 'PACHUCA', 'PATY CHAPOY ', NULL, '7711758437', '$2a$10$7d40YE/T6Y7xyZ0u6PnzbOf8P5rDGwwlPnA9eZyqvjs3bl2ie4/dm', NULL, 13, 2, 1, NULL, '1', '2024-01-10'),
('2403118', 'HERNANDEZ', 'LOPEZ', 'CZBS000454LLGLUSO4', '18', 'panda87@gmail.com', '2005-06-08', 'MINERAL D LA REFORMA', 'MINERAL DE LA REFORMA', 'JAVIER', NULL, '7712260806', '$2a$10$o6fqZfQ1g9wwxrvCmI2Ir.RMHJbx4Ft.S6qbaiwQU0/eQQ1QRG4zC', NULL, 13, 1, 1, NULL, '2', '2024-01-10'),
('2403119', 'FUJIGURO', 'JUJI', 'HEBF030409HHGRTRA8', '23', 'transfer34@sldcgl.com', '2000-08-26', 'JAPON', 'MINERAL DEL MONTE', 'ITADORY', NULL, '7716788769', '$2a$10$zne.VTyZJ/SEr8DTCdIOXOY.vrtQ/nRYmUXXuE2c94daYHxBre4bG', NULL, 14, 2, 1, NULL, '1', '2024-01-10'),
('2403120', NULL, NULL, 'HITR001231RYTXESU8', NULL, 'test02@teesting.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$X.L0NsgG0YiL8YRz8hVMFuNH2/4J2AfZQQ/sl6xwY97wElzrG5X3m', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10'),
('2403121', 'JONES', 'PELCASTRE', 'CEC000125CECESDF4', '20', 'test03@test.com', '2003-02-23', 'SAN NICOLAS', 'MONTERREY', 'YAIR', NULL, '4589741256', '$2a$10$EFxDUN8vUDrlcgiy93cP1ugDNSj8UzWhe2yx9Gy8u4AiH0YUMa.KG', NULL, 19, 1, 1, NULL, '1', '2024-01-10'),
('2403122', 'MARTINEZ', 'PONS', 'TEAE050223HDFNLRA8', '17', 'cuentadearchivos119@gmail.com', '2006-05-08', 'ASDAS', 'SAASSDA', 'LELE', NULL, '7713069011', '$2a$10$801pXn943FHU.lWKIPTwx.CK8NcFiJ65jMmhfJdXiN78IejNYSPZu', NULL, 15, 1, 1, NULL, NULL, NULL),
('2403123', 'CRUZ', 'MERCADOS DE LOS MONTEROS', 'MARIAGUADA', '22', 'maria.guadaluper@utm.com', '2001-11-08', 'MONTERE', 'ASASM', 'MARIA GUADALUPE ANGELES', NULL, '771663', '$2a$10$9ctkTrzpU9TtNqo.rL73/.cDT2n8WuYhGzSayhnJE3OPnee2cjGs2', NULL, 4, 2, 1, NULL, '2', '2024-01-11'),
('2403124', NULL, NULL, '1234567as012345678', NULL, 'ooopedigi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$639LlvQ4ppRCj2I2mhl.pOBWKMIRlsRMDZqmy8ySKDuY/3Z7cWXh6', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403125', NULL, NULL, 'VEHA01Z108HMCLRLA4', NULL, 'alan.velazquez@utmir.edu.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$McVl/EwusEOIPwdszOdodO2JvgUWwbejtpp2.9.C2yEKgBqNawLke', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403126', NULL, NULL, 'YOTECONOCIENPRIMAV', NULL, 'alan.despedida@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$qAIlz9AkpWi2YcVcSjreBui01eGn3gASWhUA1aKud434QCS/Dac2y', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403127', NULL, NULL, 'ooooaaaaaa', NULL, 'alanvelaz2as4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$7lSBVAaXtiF7M56rQN8hy.EEhd5Pidfw1Xjm35bs.oOPRx/AvUJRm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-13'),
('2403128', 'MEME', 'ALA', 'UNCUROPAHIY', '22', 'curpisuto@gnmailci.com', '2001-11-08', 'ASASDAS', 'ASASDDA', 'UNKI', NULL, '77121532', '$2a$10$f5bGAFmEp4Sl.MPfzRuOxu74q5KuCou2qOmOVxAszsMnfLMCuJNDK', NULL, 3, 1, 1, NULL, '3', '2024-01-13'),
('2403129', 'NUEVO', 'NUEVO', 'NEWCURP', '22', 'NUEVOass@new.com', '2001-11-08', 'SA', 'ASDAS', 'NUEVO', NULL, '774155', '$2a$10$AHluTixRqs2tefhbfcq9N.l0r0favSAsZ4iKu84HKzgJJn5VMTEDC', NULL, 9, 1, 1, NULL, '4', '2024-01-13'),
('2403130', NULL, NULL, 'CURP12341231', NULL, 'alanvelaz112324@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$7N9s4Ej7RN.9SO/nMSqKdu9n62np7ntg/5JXcrnT9qsno74GT4Wey', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-15'),
('2403131', 'MATERNA', 'FEA', 'FEADEA', '23', 'feadaaa@con.com', '2000-03-15', 'J', 'JEJ', 'FEALDAD', NULL, '771772', '$2a$10$hXhYTFDLIFsJyTxARzV4He9vAOjXma.vfkEW8FQ2FmohO9BAhOTVC', NULL, 7, 1, 1, NULL, '2', '2024-01-15'),
('2403132', 'YOCUI', 'YOCUI', 'YOCUIDAOASMASMASDM', '17', '12SJKAJNAS@CMO.com', '2006-11-08', 'ASJIASOD', 'ASKDAAS', 'YOCUI', NULL, '5771856', '$2a$10$ibhGk7VhqHmj/1DvQYK.b.BzMDbUL/9QmI0hu44uUg9m/fbkatLVC', NULL, 10, 1, 1, NULL, '4', '2024-01-15'),
('2403133', NULL, NULL, 'CURPPARACORREODEPR', NULL, 'alanvelaz24@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$srGkaf02FWkzt5VT5HYsg.mm.mYUuFOr/khGpKroygNJ1eGkgSVNu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403134', NULL, NULL, 'ooooasdasdasas', NULL, 'asoasoumamama@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$3YrXYpRoGHX6IEQTsY4TM.UKvEfMtGWjgHOrmW.ObpR/I2qrg1KYe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403135', NULL, NULL, 'NOERLAKASMASQJKASD', NULL, 'noelinarte6@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$at1mkrcuZdeCezqev6uXsumZMfqHMaZIwnGi8SL88O/SZl/se3XRm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403136', NULL, NULL, 'NOELINARTYER666', NULL, 'noelinarte6@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$qu5NkqggunAeFjaeDLtPZe57up9.Qx3/rzP59pPd/jxYiN2AEch7G', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('2403137', NULL, NULL, 'pruebadenomanejode', NULL, 'pablovelazquez@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$MMAp2br/jnL.Ihz6zTGzNug0U94hFsjWnawpkd/xz3wXd4oTwK9H2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-16'),
('66', NULL, NULL, NULL, NULL, 'noe.linarte@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$mtcXPXvvx/..Obi4xZVPDeCWrW.1QEW3GkHCVKi2tHkMc.nbUC5Aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
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
(457, 'Cargó referencias de pago al 2403037', '2024-01-16 08:20:45.000000', '102');

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
  `fecha_limite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_pagos`
--

INSERT INTO `utmir_pagos` (`id_pago`, `matricula`, `id_cuota`, `concatenado`, `referencia`, `verificar_pago`, `fecha_generacion`, `fecha_limite`) VALUES
(14, '2303002', 5, '300209053', '30020905336874270', 'si', NULL, NULL),
(15, '2303003', 40, '300304403', '30030405336954250', 'si', NULL, NULL),
(17, '2303016', 5, '301604053', '30160405337244276', 'si', NULL, NULL),
(19, '2303017', 5, '301712053', '30171205336974221', 'si', NULL, NULL),
(20, '2303018', 5, '301812053', '30181205337004258', 'si', NULL, NULL),
(21, '2303019', 5, '301903053', '30190305337004283', 'si', NULL, NULL),
(22, '2303005', 5, '300505053', '30050505337044231', 'si', NULL, NULL),
(24, '2303020', 40, '302001403', '30200140337377246', NULL, '2024-01-13', '2024-01-18'),
(25, '2303021', 5, '302104053', '30210405337094275', 'si', NULL, NULL),
(26, '2303022', 5, '302212053', '30221205337094253', 'si', NULL, NULL),
(27, '2303024', 5, '302409053', '30240905337114215', 'si', NULL, NULL),
(28, '2303022', 24, '302204053', NULL, NULL, NULL, NULL),
(30, '2303025', 5, '302505053', '30250505337114233', 'si', NULL, NULL),
(31, '2303023', 5, '302312053', '30231205337114246', 'si', NULL, NULL),
(32, '2303026', 5, '302604053', '30260405337154291', 'si', NULL, NULL),
(33, '2303027', 5, '302704053', '30270405337154207', 'si', NULL, NULL),
(34, '2403001', 5, '300104053', '30010405337214240', 'si', NULL, NULL),
(35, '2303001', 5, '300112053', '30011205337234239', 'si', NULL, NULL),
(36, '2403002', 5, '300203053', '30020305337234264', 'si', NULL, NULL),
(37, '2403004', 5, '300405053', '30040505337264290', 'si', NULL, NULL),
(38, '2403007', 5, '300705053', '30070505337234278', 'si', NULL, NULL),
(39, '2403008', 5, '300803053', '30080305337234245', 'si', NULL, NULL),
(40, '2403009', 5, '300903403', '30090305337234258', 'si', NULL, NULL),
(41, '2403010', 5, '301003053', '30100305337234255', 'si', NULL, NULL),
(42, '2403011', 5, '301103053', '30110305337234268', 'si', NULL, NULL),
(43, '2403012', 5, '301205053', '30120505337234230', 'si', NULL, NULL),
(44, '2403006', 5, '300601053', '30060105337244287', 'si', NULL, NULL),
(45, '2403013', 5, '301303053', '30130305337244214', 'si', NULL, NULL),
(46, '2403014', 5, '301404053', '30140405337244250', 'si', NULL, NULL),
(47, '2403015', 5, '301505053', '30150505337244286', 'si', NULL, NULL),
(48, '2403016', 5, '301604053', '30160405337244276', 'si', NULL, NULL),
(49, '2403017', 5, '301704053', '30170405337254209', 'si', NULL, NULL),
(50, '2403018', 5, '301801053', '30180105337254250', 'si', NULL, NULL),
(51, '2403020', 5, '302003053', '30200305337284260', 'si', NULL, NULL),
(52, '2403006', 40, '300601403', NULL, NULL, NULL, NULL),
(53, '2403015', 40, '301505403', '30150540337245290', 'si', NULL, NULL),
(54, '2403021', 5, '302103053', '30210305337284273', 'si', NULL, NULL),
(55, '2403017', 40, '301704403', NULL, NULL, NULL, NULL),
(56, '2403038', 5, '303803053', NULL, NULL, NULL, NULL),
(57, '2403042', 5, '304212053', NULL, NULL, NULL, NULL),
(58, '2403037', 5, '303712053', '30371205337434212', NULL, NULL, NULL),
(59, '2403025', 5, '302504053', '30250405337434204', 'si', NULL, NULL),
(60, '2403053', 5, '305312053', '30531205337284241', 'si', NULL, NULL),
(61, '2403033', 5, '303301053', '30330105337434223', NULL, NULL, NULL),
(62, '2403032', 5, '303212053', '30321205337434244', NULL, NULL, NULL),
(63, '2403026', 5, '302603053', '30260305337434291', 'si', NULL, NULL),
(64, '2403027', 5, '302712053', '30271205337434292', NULL, NULL, NULL),
(65, '2403051', 5, '305101053', '30510105337284278', 'si', NULL, NULL),
(66, '2403049', 5, '304912053', '30491205337284205', 'si', NULL, NULL),
(67, '2403054', 5, '305404053', '30540405337284289', 'si', NULL, NULL),
(68, '2403050', 5, '305012053', '30501205337284202', 'si', NULL, NULL),
(69, '2403039', 5, '303909053', NULL, NULL, NULL, NULL),
(70, '2403024', 5, '302412053', '30241205337434253', NULL, NULL, NULL),
(71, '2403045', 5, '3045053', NULL, NULL, NULL, NULL),
(72, '2403028', 5, '3028053', NULL, NULL, NULL, NULL),
(73, '2403047', 5, '304703053', '30470305337284288', 'si', NULL, NULL),
(74, '2403052', 5, '305201053', '30520105337284291', 'si', NULL, NULL),
(75, '2403055', 5, '305512053', '30551205337284267', 'si', NULL, NULL),
(76, '2403034', 5, '303412053', '30341205337434270', NULL, NULL, NULL),
(77, '2403029', 5, '302912053', '30291205337434221', NULL, NULL, NULL),
(78, '2403041', 5, '304112053', NULL, NULL, NULL, NULL),
(79, '2403048', 5, '304812053', '30481205337284289', 'si', NULL, NULL),
(80, '2403035', NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2403046', NULL, NULL, NULL, NULL, NULL, NULL),
(82, '2403044', 5, '304403053', '30440305337284249', NULL, NULL, NULL),
(83, '2403056', 5, '305603053', '30560305337294212', NULL, NULL, NULL),
(84, '2403071', 5, '307104053', '30710405337294204', 'si', NULL, NULL),
(85, '2403075', 5, '307505053', '30750505337294279', 'si', NULL, NULL),
(86, '2403064', NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2403069', 5, '306904053', '30690405337294291', 'si', NULL, NULL),
(88, '2403078', 5, '307804053', '30780405337294295', 'si', NULL, NULL),
(89, '2403068', 5, '306805053', '30680505337294204', 'si', NULL, NULL),
(90, '2403076', 5, '307601053', '30760105337294297', 'si', NULL, NULL),
(91, '2403079', 5, '307912053', '30791205337294273', 'si', NULL, NULL),
(92, '2403074', 5, '307403053', '30740305337294220', 'si', NULL, NULL),
(93, '2403065', 5, '306501053', '30650105337294267', 'si', NULL, NULL),
(94, '2403077', 5, '307704053', '30770405337294282', 'si', NULL, NULL),
(95, '2403062', 5, '306205053', '30620505337294223', 'si', NULL, NULL),
(96, '2403070', 5, '307001053', '30700105337294219', 'si', NULL, NULL),
(97, '2403063', 5, '306304053', '30630405337294213', 'si', NULL, NULL),
(98, '2403066', 5, '306605053', '30660505337294275', 'si', NULL, NULL),
(99, '2403067', 5, '306703053', '30670305337294242', 'si', NULL, NULL),
(100, '2403082', 5, '308204053', '30820405337294234', 'si', NULL, NULL),
(101, '2403083', 5, '308301053', '30830105337294275', 'si', NULL, NULL),
(102, '2403081', 5, '308104053', '30810405337294221', 'si', NULL, NULL),
(103, '2403084', 5, '308412053', '30841205337294225', 'si', NULL, NULL),
(104, '2403018', 40, '301801403', '30180140337255254', 'si', NULL, NULL),
(105, '2403017', 40, '301704403', NULL, NULL, NULL, NULL),
(106, '2403089', 5, '308912053', '30891205337294290', 'si', NULL, NULL),
(107, '2403090', 5, '309012053', '30901205337294287', 'si', NULL, NULL),
(108, '2403086', 5, '308603053', '30860305337294263', 'si', NULL, NULL),
(109, '2403095', 5, '309504053', '30950405337294290', NULL, NULL, NULL),
(110, '2403100', 5, '310009053', '31000905337294206', 'si', NULL, NULL),
(111, '2403092', 5, '309201053', '30920105337294279', NULL, NULL, NULL),
(112, '2403097', 5, '309705053', '30970505337294242', 'si', NULL, NULL),
(113, '2403099', 5, '309901053', '30990105337294273', 'si', NULL, NULL),
(114, '2403096', 5, '309605053', '30960505337294229', 'si', NULL, NULL),
(115, '2403098', 5, '309804053', '30980405337294232', 'si', NULL, NULL),
(116, '2403093', 5, '309301053', '30930105337294292', NULL, NULL, NULL),
(117, '2403094', 5, '309404053', '30940405337294277', NULL, NULL, NULL),
(118, '2403091', 5, '309101053', '30910105337294266', 'si', NULL, NULL),
(119, '2403111', 5, '311103053', '31110305337294292', NULL, NULL, NULL),
(120, '2403104', 5, '310403053', '31040305337294217', 'si', NULL, NULL),
(121, '2403106', 5, '310605053', '31060505337294289', NULL, NULL, NULL),
(122, '2403108', 5, '310812053', '31081205337294257', 'si', NULL, NULL),
(123, '2403112', 5, '311212053', '31121205337294293', NULL, NULL, NULL),
(124, '2403113', 5, '311303053', '31130305337294221', NULL, NULL, NULL),
(125, '2403118', 5, '311804053', '31180405337294212', NULL, NULL, NULL),
(126, '2403116', 5, '311604053', '31160405337294283', NULL, NULL, NULL),
(127, '2403117', 5, '311712053', NULL, NULL, NULL, NULL),
(128, '2403119', 5, '311904053', NULL, NULL, NULL, NULL),
(129, '2403121', 5, '312101053', NULL, NULL, NULL, NULL),
(130, '2403123', 5, '312303053', '31230305337304201', NULL, NULL, NULL),
(132, '2403100', 40, '310009403', '31000940337295210', 'si', NULL, NULL),
(133, '2303002', 40, '300209403', '30020940336875274', NULL, NULL, NULL),
(135, '2403022', 5, '302203053', '30220305337314283', NULL, NULL, NULL),
(136, '2303001', 40, '300112403', '30011240337235243', 'si', NULL, NULL),
(137, '2403078', 40, '307804403', '30780440337375284', 'si', '2024-01-13', '2024-01-18'),
(138, '2403128', 5, '312809053', '31280905337474251', 'si', NULL, NULL),
(139, '2403129', 5, '312903053', '31290305337474223', 'si', NULL, NULL),
(140, '2403129', 40, '312903403', NULL, 'si', '2024-01-13', '2024-01-18'),
(141, '2403025', 40, '302504403', '30250440337397220', 'si', '2024-01-15', '2024-01-20'),
(142, '2403026', 40, '302603403', '30260340337397210', 'si', '2024-01-15', '2024-01-20'),
(143, '2403131', 5, '313109053', '31310905337494211', 'si', NULL, NULL),
(144, '2403131', 40, '313109403', '31310940337397222', 'si', '2024-01-15', '2024-01-20'),
(145, '2403132', 5, '313209053', '31320905337494224', 'si', NULL, NULL),
(146, '2403132', 40, '313209403', '31320940337397235', 'si', '2024-01-15', '2024-01-20');

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
-- Estructura de tabla para la tabla `utmir_roles`
--

CREATE TABLE `utmir_roles` (
  `id` int(11) NOT NULL,
  `name` enum('ROLE_ADMIN','ROLE_ALUMNO','ROLE_ASPIRANTE','ROLE_BAJA_ABANDONO','ROLE_BAJA_DEFINITIVA','ROLE_BAJA_TEMPORAL','ROLE_EGRESADO_ING_LIC','ROLE_EGRESADO_TSU','ROLE_FINANZAS','ROLE_INACTIVO_FALTA_PAGO','ROLE_NO_CONTINUIDAD','ROLE_SERVICIOSESCOLARES','ROLE_VINCULACION') DEFAULT NULL
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
(6, 'ROLE_ALUMNO');

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
-- Indices de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  ADD PRIMARY KEY (`id_carrera`);

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
-- Indices de la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  ADD PRIMARY KEY (`id_examen_admision`),
  ADD UNIQUE KEY `UK_i3mxd0cdpk03oysd6vj6yc4um` (`matricula`);

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
  MODIFY `id_antecedentes_academicos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  MODIFY `id_carrera` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  MODIFY `id_contacto_emergencia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

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
  MODIFY `id_datos_generales` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

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
-- AUTO_INCREMENT de la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  MODIFY `id_examen_admision` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `utmir_genero`
--
ALTER TABLE `utmir_genero`
  MODIFY `id_genero` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_grupos`
--
ALTER TABLE `utmir_grupos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_academica`
--
ALTER TABLE `utmir_informacion_academica`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  MODIFY `id_info_medica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `utmir_log`
--
ALTER TABLE `utmir_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;

--
-- AUTO_INCREMENT de la tabla `utmir_nacionalidad`
--
ALTER TABLE `utmir_nacionalidad`
  MODIFY `id_nacionalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `utmir_periodos`
--
ALTER TABLE `utmir_periodos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_roles`
--
ALTER TABLE `utmir_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Filtros para la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  ADD CONSTRAINT `FK2x3rf22hbsa23g6yaln30iry7` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`);

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
-- Filtros para la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  ADD CONSTRAINT `FK6bwo2ixb7eyfb99v2yhrj2g3m` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKj4bssi00tth348nn0ausf20gx` FOREIGN KEY (`id_cuota`) REFERENCES `utmir_cuotas` (`id_cuota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
