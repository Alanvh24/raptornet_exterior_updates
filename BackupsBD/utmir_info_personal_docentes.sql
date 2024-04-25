-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2024 a las 19:27:31
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
-- Base de datos: `utmir_raptornet`
--

--
-- Volcado de datos para la tabla `utmir_info_personal`
--

INSERT INTO `utmir_info_personal` (`matricula`, `ap_materno`, `ap_paterno`, `curp`, `edad`, `email`, `fecha_nacimiento`, `localidad_nacimiento`, `municipio_nacimiento`, `nombre`, `nss`, `numero_telefonico`, `password`, `rfc`, `id_estados_mexico`, `id_genero`, `id_nacionalidad`, `id_status`, `asp_etapa`, `fecha_registro`) VALUES
('111', 'ANAYA', 'VILLEGAS', NULL, NULL, 'belen.villegas@utmir.edu.mx', NULL, NULL, NULL, 'BELEN', NULL, NULL, '$2a$10$4BGZpPvbT3Z0PeKWHx1vGeUEzbdMq8hQSTWtP2X0nNPnCuAaHWh0.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('114', 'ESQUIVEL', 'GARCÍA', NULL, NULL, 'yarely.garcia@utmir.edu.mx', NULL, NULL, NULL, 'YARELY ', NULL, NULL, '$2a$10$VoDI101hqofeiwtYfFhfy.7ZwdP.zvZuKvb9AZc8VHmfB19leFq4m', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('135', 'OLIVARES', 'REYES', NULL, NULL, 'yessica.reyes@utmir.edu.mx', NULL, NULL, NULL, 'YESSICA ITZEL', NULL, NULL, '$2a$10$3iob0L9SdI9zo98KLE1ymeunf4atLJHILUEgdJ2zzgl80lFu2qup.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('142', 'PÉREZ', 'REYES', NULL, NULL, 'diana.reyes@utmir.edu.mx', NULL, NULL, NULL, 'DIANA', NULL, NULL, '$2a$10$zvm04/UIXMYz0c/Iysu68eNkWbSzjw0jWr/3/0sAfqLjeZFHKFQi.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('145', 'ACUAHUTLA', 'HERNÁNDEZ', NULL, NULL, 'erick.hernandez@utmir.edu.mx', NULL, NULL, NULL, 'ERICK ', NULL, NULL, '$2a$10$MZbB4kTaBHCccNqPg2g6geKft1Mw9KuLgit49F1noLkLxOXn8zQam', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('15', 'ANAYA', 'NARANJO', NULL, NULL, 'alfonso.naranjo@utmir.edu.mx', NULL, NULL, NULL, 'ALFONSO', NULL, NULL, '$2a$10$snmYu/sucM35ikRFTFToFeic7tq0i.LtJ7tczirhrPYmwM8lRW8N2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('2408DA', 'HERNANDEZ', 'VELAZQUEZ', NULL, NULL, 'alanda@test.com', NULL, NULL, NULL, 'ALAN', NULL, NULL, '$2a$10$2ppBLESOds/o0xcOiB4fceDvL5.eVe.w9nIQBoMKGvooinSkCgvmK', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('32', 'PINEDA', 'RIOS', NULL, NULL, 'hugo.rios@utmir.edu.mx', NULL, NULL, NULL, 'HUGO', NULL, NULL, '$2a$10$XkNaNa7H3eD9qOEtcPXlTOfXmMy040MDfkSf3a/CgM8qY/R9Q8cre', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('42', 'VARGAS', 'BUSTOS', NULL, NULL, 'edgar.bustos@utmir.edu.mx', NULL, NULL, NULL, 'EDGAR PASCUAL', NULL, NULL, '$2a$10$HLwszwDWEoXL2aP9.GxHZ.PraFYQUoyTT3TTeJ7.yKM460.IlK1Em', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('60', 'PICHARDO', 'JIMENEZ', NULL, NULL, 'rodrigo.jimenez@utmir.edu.mx', NULL, NULL, NULL, 'RODRIGO', NULL, NULL, '$2a$10$XovSPUVmaMfaj5WVL4I5U.mC0TtoSBJiSHlpeGN4jfVf8rKlrGop2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11'),
('85', 'RIVERA', 'VARGAS', NULL, NULL, 'karina.vargas@utmir.edu.mx', NULL, NULL, NULL, 'KARINA', NULL, NULL, '$2a$10$QSx3.PhYGiw/6nqN3bkUrupKAnD3f5ZDn39uVDJOvrHEh6d8PRNRq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
