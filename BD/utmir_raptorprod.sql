-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 17:00:22
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
-- Base de datos: `utmir_raptorprod`
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
('164', 1);

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
  `id_informacion_academica` bigint(20) DEFAULT NULL,
  `sin_derecho` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
('164', NULL, NULL, NULL, NULL, 'alan.velazquez@utmir.edu.mx', NULL, NULL, NULL, NULL, NULL, NULL, '$2a$10$1IM1xaI66Eg4lQiHeXUho.gANKIMvwJByDT6w4KW69jJBjYvAE5Mi', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 'Se registró en RaptorNet', '2024-03-01 09:58:56.000000', '164');

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
  `referencia_asignada` bit(1) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  MODIFY `id_antecedentes_academicos` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_asignacion_asignatura`
--
ALTER TABLE `utmir_asignacion_asignatura`
  MODIFY `id_asignacion_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `utmir_asignatura`
--
ALTER TABLE `utmir_asignatura`
  MODIFY `id_asignaturas` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT de la tabla `utmir_asistencias`
--
ALTER TABLE `utmir_asistencias`
  MODIFY `id_asistencias` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_calificaciones`
--
ALTER TABLE `utmir_calificaciones`
  MODIFY `id_calificaciones` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_calificaciones_unidad`
--
ALTER TABLE `utmir_calificaciones_unidad`
  MODIFY `id_calificacion_unidad` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_catalogo_carreras`
--
ALTER TABLE `utmir_catalogo_carreras`
  MODIFY `id_carrera` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `utmir_clase_asignatura`
--
ALTER TABLE `utmir_clase_asignatura`
  MODIFY `id_horarios_clase` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_contacto_emergencia`
--
ALTER TABLE `utmir_contacto_emergencia`
  MODIFY `id_contacto_emergencia` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_datos_generales` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_estadistica_aspirantes`
--
ALTER TABLE `utmir_estadistica_aspirantes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_estadistica_aspirantes_carrera`
--
ALTER TABLE `utmir_estadistica_aspirantes_carrera`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_evaluacion_unidad`
--
ALTER TABLE `utmir_evaluacion_unidad`
  MODIFY `id_evaluacion_unidad` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_examen_admision`
--
ALTER TABLE `utmir_examen_admision`
  MODIFY `id_examen_admision` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_fecha_unidades`
--
ALTER TABLE `utmir_fecha_unidades`
  MODIFY `id_fechas_unidades` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_informacion_medica`
--
ALTER TABLE `utmir_informacion_medica`
  MODIFY `id_info_medica` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_log`
--
ALTER TABLE `utmir_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `utmir_nacionalidad`
--
ALTER TABLE `utmir_nacionalidad`
  MODIFY `id_nacionalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utmir_objetivos_asignatura`
--
ALTER TABLE `utmir_objetivos_asignatura`
  MODIFY `id_objetivo_asignatura` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_pagos`
--
ALTER TABLE `utmir_pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_periodos`
--
ALTER TABLE `utmir_periodos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_planeaciones`
--
ALTER TABLE `utmir_planeaciones`
  MODIFY `id_planeacion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utmir_proyecto_asignatura`
--
ALTER TABLE `utmir_proyecto_asignatura`
  MODIFY `id_proyecto_asignatura` bigint(20) NOT NULL AUTO_INCREMENT;

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
