-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2023 a las 23:01:15
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
('164', 1),
('2303001', 2),
('2303002', 2),
('2303003', 2),
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
('2303025', 2);

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
(1, 'ALAN', 'ALAN', 'ALAN', '2303001', 3, 4),
(2, 'Prueba', 'Prueba', 'Prueba', '2303002', 9, 3),
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
(21, 'cecyteh', '9.3', '2021', '2303022', 12, 3),
(22, 'cecyteh', '9.5', '2016-2025', '2303024', 9, 5),
(23, 'DURA', 'DURA', 'DURA', '2303025', 5, 4),
(24, 'cecyteh', '6.5', '2015-2018', '2303023', 12, 9);

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
(12, 'T.S.U Tecnologías de la Información y Comunicación Area Entornos Virtuales y Negocios Digitales', '1', '12'),
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
(1, 'ALAN', 'ALAN', 'ALAN', 'ALAN', '2303001'),
(2, 'Prueba', 'Prueba', 'Prueba', 'Prueba', '2303002'),
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
(21, 'asdasd@cas.com', 'asdas', 'papa', 'asd', '2303022'),
(22, '', 'alan', 'madre', '7881561', '2303024'),
(23, 'DURA', 'DURA', 'DURA', 'DURA', '2303025'),
(24, 'correode@prueba.com', 'rocio chio zamora', 'madre', '778748949', '2303023');

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
(1, 'Inscripción', '01', '1473.00'),
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
(40, 'Paquete (5) inscripción ( inscripción, seguro, credencial, curso propedéutico', '40', '2346.00'),
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
(21, 'as', 'si', 'asda', 'si', '2303022'),
(22, NULL, 'no', NULL, 'no', '2303024'),
(23, NULL, 'no', NULL, 'no', '2303025'),
(24, NULL, 'si', 'e', 'no', '2303023');

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
(1, NULL, 'no', '2303001', 5),
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
(24, 'polvo', 'si', '2303023', 4);

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
('164', NULL, NULL, 'VEHA', NULL, 'alanvelazquez@test.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$V8gDOL743qHtPkwc/iJ3EuYLZBsS.39LSwf9LJk.ClTFPi0/GtLrW', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2303001', 'HERNÁNDEZ', 'VELÁZQUEZ', 'VEHA011108HMCLRLA4', '22', 'alan.velazquez@utmir.edu.mx', '2001-11-09', 'SAN AGUSTIN', 'ECATEPEC DE MORELOS', 'ALAN', 'nss', '7713069010', '$2a$10$dnF..11g0y5kKwqssCGh/Omc0tMEr/9F9osq/QFzk5yuama01JW2q', 'RFC', 15, 1, 1, 1, '2', '2023-11-30'),
('2303002', 'REGISTRO', 'DE', 'hahahah', '25', 'aa@aa.com', '2001-11-08', 'Hido', 'elp', 'Prueba', NULL, '7713000', '$2a$10$7dB/jacfUUb88S2nBnKDAuptGBYoXoyUf69tolhKXhwR1qlvRZ29y', NULL, 13, 1, 1, NULL, '3', '2023-11-30'),
('2303003', 'E', 'E', 'VEHA0110', '01', 'registro@registro.com', '2001-11-08', 'ASD', 'ASD', 'as', NULL, '7741', '$2a$10$WpQr.Z9JDn6UUS6NUojXouSwbElv2Oq.2GGFmCSHnSToeIxWiVOgi', NULL, 18, 2, 1, NULL, '3', '2023-12-07'),
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
('2303016', 'c', 'c', 'cfdgfxinnn', '123', 'kmaoudyf@utmir.edu.mx', '2200-03-12', 'asdfghj', 'sdfghjkl', 'c', NULL, '12345678', '$2a$10$tlSROk37eO1ETaWQTq6pUuz/Qu7tNsYBxNSe04LPpaQpd2wQWnXMi', NULL, 2, 2, 2, NULL, '3', '2023-12-07'),
('2303017', 'ALVARADO', 'FERNÁNDEZ', 'AVEHA0112', '25', 'alanvelaz24@gmail.com', '1998-05-09', 'ASAS', 'MICHO', 'TUSA', NULL, '7877818', '$2a$10$0QL90g6E9itMGvXCySStfuf2ezSV/TixsVkZCcBbnpDOlgOgtbpLK', NULL, 33, 2, 2, NULL, '3', '2023-12-09'),
('2303018', 'ENRIQUE', 'ENRIQUE', 'ESPONJAAS', '18', 'enriquepena@gmail.com', '2001-11-08', 'asd', 'elp', 'ENRIQUE', NULL, '77130007878', '$2a$10$lU/GaJL5uWNNrowaGZZ49e6SeTG8w3LkWyaZmIlPS5kiiDJUgpd9O', NULL, 17, 1, 1, NULL, '3', '2023-12-12'),
('2303019', 'ALAN', 'ALAN', 'CURP321', '46', 'correo@fake.com', '1984-11-17', 'LOCALIDAD', 'MUNICIPIO', 'ALAN', NULL, '775567878', '$2a$10$Qqr7M3jsoJ60iMZ4utqSGub5R8RDwMHxVCAtcC7sZBS2/xvNgJWEG', NULL, 4, 2, 1, NULL, '3', '2023-12-12'),
('2303020', 'EPE', 'EPE', 'CUROPO', '23', 'isjaja@gmail.com', '2001-11-08', 'EPE', 'EPE', 'EPE', NULL, '4645648', '$2a$10$8yU72udN4oDPKp.u.YPiWOmwk8vjQn3HAv0b37jibsCcw.WEroYE2', NULL, 10, 1, 1, NULL, '3', '2023-12-18'),
('2303021', 'Hdez', 'Ape', '12345678900as', '23', 'testeodematricula@test.com', '1998-11-20', 'MUNUI', 'LOCVA', 'Noe', NULL, '78794815', '$2a$10$bDYtMvwSXVxLJHwI55iTBuUKU5RrTp6BBDWpdMFDPFJ7FF8oA7OQm', NULL, 3, 1, 1, NULL, '3', '2023-12-21'),
('2303022', 'MAYUS', 'MAYUS', 'OPPOO', '24', 'ooop@gmail.com', '2001-02-12', 'as', 'MAYUS', 'mayus', NULL, '771523315', '$2a$10$kf..PlN.eZUqFflKeR3dRekfx5Z1d5wlHOgA5Jzrj5OVw1nLtjCmm', NULL, 18, 1, 1, NULL, '2', '2023-12-21'),
('2303023', 'campos', 'MARTINEZ', 'ksajdsaosad', '26', 'gdgd@sks.com', '1997-03-05', 'loca', 'pepe', 'ISRAEL', NULL, '77881923', '$2a$10$BxYsSRvBMuNbbswJrZLieuga.imnZaYg5HzfMGWke2RieA6.saInW', NULL, 15, 1, 1, NULL, '1', '2023-12-23'),
('2303024', 'asd', 'asd', 'OWROEWO', '23', 'noelinarte@utmir.edu.mx', '2000-12-23', 'asdasd', 'asdas', 'asd', NULL, '7847848', '$2a$10$J2jGCg5g8Fk/XkEh6mx9SO1ev72WKiw.D3qkl0MRCRVWRswfBnbDm', NULL, 18, 2, 1, NULL, '2', '2023-12-23'),
('2303025', 'DURA', 'DURA', 'TUSADEMELON', '25', 'uncorreo@sjot.com', '1998-05-23', 'SAN AGUSTIN', 'ESCA', 'DURA', NULL, '784155664', '$2a$10$PnJ5HgeE2SPi.CJCUH.GSeU/cNP2APbaeggbjOjCvDlg.aLJpFYdO', NULL, 9, 1, 2, NULL, '1', '2023-12-23');

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
  `verificar_pago` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_pagos`
--

INSERT INTO `utmir_pagos` (`id_pago`, `matricula`, `id_cuota`, `concatenado`, `referencia`, `verificar_pago`) VALUES
(14, '2303002', 5, '300209053', '30020905336874270', 'si'),
(15, '2303003', 5, '300304053', '30030405336954250', 'si'),
(17, '2303016', 5, '301604053', '30160405336954209', 'si'),
(19, '2303017', 5, '301712053', '30171205336974221', 'si'),
(20, '2303018', 5, '301812053', '30181205337004258', 'si'),
(21, '2303019', 5, '301903053', '30190305337004283', 'si'),
(22, '2303005', 5, '300505053', '30050505337044231', 'si'),
(24, '2303020', 5, '302001053', '30200105337064239', 'si'),
(25, '2303021', 5, '302104053', '30210405337094275', 'si'),
(26, '2303022', 5, '302212053', '30221205337095266', NULL),
(27, '2303024', 5, '302409053', '30240905337114215', NULL),
(28, '2303022', 24, '302212243', '30221205337095261', NULL),
(30, '2303025', 5, '302505053', NULL, NULL),
(31, '2303023', 5, '302312053', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utmir_roles`
--

CREATE TABLE `utmir_roles` (
  `id` int(11) NOT NULL,
  `name` enum('ROLE_ADMIN','ROLE_ALUMNO','ROLE_ASPIRANTE','ROLE_BAJA_ABANDONO','ROLE_BAJA_DEFINITIVA','ROLE_BAJA_TEMPORAL','ROLE_EGRESADO_ING_LIC','ROLE_EGRESADO_TSU','ROLE_FINANZAS','ROLE_INACTIVO_FALTA_PAGO','ROLE_VINCULACION') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `utmir_roles`
--

INSERT INTO `utmir_roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_ASPIRANTE'),
(3, 'ROLE_FINANZAS'),
(4, 'ROLE_VINCULACION');

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
-- Indices de la tabla `utmir_genero`
--
ALTER TABLE `utmir_genero`
  ADD PRIMARY KEY (`id_genero`);

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
  MODIFY `id_antecedentes_academicos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  MODIFY `id_carrera` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  MODIFY `id_contacto_emergencia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `utmir_cuotas`
--
ALTER TABLE `utmir_cuotas`
  MODIFY `id_cuota` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `utmir_datos_generales`
--
ALTER TABLE `utmir_datos_generales`
  MODIFY `id_datos_generales` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `utmir_genero`
--
ALTER TABLE `utmir_genero`
  MODIFY `id_genero` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  MODIFY `id_info_medica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `utmir_nacionalidad`
--
ALTER TABLE `utmir_nacionalidad`
  MODIFY `id_nacionalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `utmir_roles`
--
ALTER TABLE `utmir_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Filtros para la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  ADD CONSTRAINT `FK6bwo2ixb7eyfb99v2yhrj2g3m` FOREIGN KEY (`matricula`) REFERENCES `utmir_info_personal` (`matricula`),
  ADD CONSTRAINT `FKj4bssi00tth348nn0ausf20gx` FOREIGN KEY (`id_cuota`) REFERENCES `utmir_cuotas` (`id_cuota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
