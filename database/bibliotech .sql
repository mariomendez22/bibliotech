-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-06-2026 a las 00:18:57
-- Versión del servidor: 8.0.41-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebas_bibliotech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id_autor` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `nombre`, `nacionalidad`, `fecha_nacimiento`) VALUES
(1, 'Abraham Silberschatz', 'Estados Unidos', '1952-01-01'),
(2, 'Henry Korth', 'Estados Unidos', '1947-01-01'),
(3, 'S. Sudarshan', 'India', '1965-01-01'),
(4, 'Roger Pressman', 'Estados Unidos', '1942-01-01'),
(5, 'Ian Sommerville', 'Escocia', '1951-01-01'),
(6, 'Andrew Tanenbaum', 'Países Bajos', '1944-03-16'),
(7, 'Carlos Coronel', 'Estados Unidos', '1955-01-01'),
(8, 'Ramez Elmasri', 'Egipto', '1950-01-01'),
(9, 'Abraham Silberschatz', 'Estados Unidos', '1952-01-01'),
(10, 'Henry Korth', 'Estados Unidos', '1947-01-01'),
(11, 'S. Sudarshan', 'India', '1965-01-01'),
(12, 'Roger Pressman', 'Estados Unidos', '1942-01-01'),
(13, 'Ian Sommerville', 'Escocia', '1951-01-01'),
(14, 'Andrew Tanenbaum', 'Países Bajos', '1944-03-16'),
(15, 'Carlos Coronel', 'Estados Unidos', '1955-01-01'),
(16, 'Ramez Elmasri', 'Egipto', '1950-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Programación', 'Libros relacionados con programación y desarrollo de software'),
(2, 'Bases de Datos', 'Diseño y administración de bases de datos'),
(3, 'Redes', 'Redes de computadoras y telecomunicaciones'),
(4, 'Ingeniería de Software', 'Metodologías y desarrollo de software'),
(5, 'Tecnología', 'Tecnologías de información y computación'),
(6, 'Programación', 'Libros relacionados con programación y desarrollo de software'),
(7, 'Bases de Datos', 'Diseño y administración de bases de datos'),
(8, 'Redes', 'Redes de computadoras y telecomunicaciones'),
(9, 'Ingeniería de Software', 'Metodologías y desarrollo de software'),
(10, 'Tecnología', 'Tecnologías de información y computación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id_editorial` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `correo_contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id_editorial`, `nombre`, `pais`, `correo_contacto`) VALUES
(1, 'Pearson', 'Estados Unidos', 'contacto@pearson.com'),
(2, 'McGraw Hill', 'Estados Unidos', 'info@mcgrawhill.com'),
(3, 'Alfaomega', 'México', 'ventas@alfaomega.com'),
(4, 'Planeta', 'España', 'contacto@planeta.com'),
(5, 'Anaya', 'España', 'info@anaya.es'),
(6, 'Pearson', 'Estados Unidos', 'contacto@pearson.com'),
(7, 'McGraw Hill', 'Estados Unidos', 'info@mcgrawhill.com'),
(8, 'Alfaomega', 'México', 'ventas@alfaomega.com'),
(9, 'Planeta', 'España', 'contacto@planeta.com'),
(10, 'Anaya', 'España', 'info@anaya.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `id_ejemplar` int NOT NULL,
  `codigo_barras` varchar(50) NOT NULL,
  `disponibilidad` tinyint(1) DEFAULT '1',
  `estado_conservacion` enum('Excelente','Bueno','Regular','Deteriorado') NOT NULL,
  `id_libro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`id_ejemplar`, `codigo_barras`, `disponibilidad`, `estado_conservacion`, `id_libro`) VALUES
(1, 'LIB001-01', 1, 'Excelente', 1),
(2, 'LIB001-02', 1, 'Excelente', 1),
(3, 'LIB001-03', 1, 'Bueno', 1),
(4, 'LIB001-04', 1, 'Regular', 1),
(5, 'LIB002-01', 1, 'Excelente', 2),
(6, 'LIB002-02', 1, 'Excelente', 2),
(7, 'LIB002-03', 1, 'Bueno', 2),
(8, 'LIB002-04', 1, 'Regular', 2),
(9, 'LIB003-01', 1, 'Excelente', 3),
(10, 'LIB003-02', 1, 'Excelente', 3),
(11, 'LIB003-03', 1, 'Bueno', 3),
(12, 'LIB003-04', 1, 'Regular', 3),
(13, 'LIB004-01', 1, 'Excelente', 4),
(14, 'LIB004-02', 1, 'Excelente', 4),
(15, 'LIB004-03', 1, 'Bueno', 4),
(16, 'LIB004-04', 1, 'Regular', 4),
(17, 'LIB005-01', 1, 'Excelente', 5),
(18, 'LIB005-02', 1, 'Excelente', 5),
(19, 'LIB005-03', 1, 'Bueno', 5),
(20, 'LIB005-04', 1, 'Regular', 5),
(21, 'LIB006-01', 1, 'Excelente', 6),
(22, 'LIB006-02', 1, 'Excelente', 6),
(23, 'LIB006-03', 1, 'Bueno', 6),
(24, 'LIB006-04', 1, 'Regular', 6),
(25, 'LIB007-01', 1, 'Excelente', 7),
(26, 'LIB007-02', 1, 'Excelente', 7),
(27, 'LIB007-03', 1, 'Bueno', 7),
(28, 'LIB007-04', 1, 'Regular', 7),
(29, 'LIB008-01', 1, 'Excelente', 8),
(30, 'LIB008-02', 1, 'Excelente', 8),
(31, 'LIB008-03', 1, 'Bueno', 8),
(32, 'LIB008-04', 1, 'Regular', 8),
(33, 'LIB009-01', 1, 'Excelente', 9),
(34, 'LIB009-02', 1, 'Excelente', 9),
(35, 'LIB009-03', 1, 'Bueno', 9),
(36, 'LIB009-04', 1, 'Regular', 9),
(37, 'LIB010-01', 1, 'Excelente', 10),
(38, 'LIB010-02', 1, 'Excelente', 10),
(39, 'LIB010-03', 0, 'Bueno', 10),
(40, 'LIB010-04', 1, 'Regular', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `anio_publicacion` year DEFAULT NULL,
  `precio_reposicion` decimal(10,2) DEFAULT NULL,
  `id_editorial` int NOT NULL,
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `isbn`, `titulo`, `anio_publicacion`, `precio_reposicion`, `id_editorial`, `id_categoria`) VALUES
(1, '9789702611905', 'Fundamentos de Bases de Datos', 2021, '850.00', 1, 2),
(2, '9781305627482', 'Database Systems Design', 2020, '920.00', 2, 2),
(3, '9786071503145', 'Ingeniería de Software', 2022, '780.00', 1, 4),
(4, '9780133943030', 'Software Engineering', 2021, '890.00', 2, 4),
(5, '9786071508171', 'Redes de Computadoras', 2020, '760.00', 3, 3),
(6, '9780132126953', 'Computer Networks', 2019, '980.00', 3, 3),
(7, '9786071505002', 'Introducción a la Programación', 2022, '650.00', 4, 1),
(8, '9786071506504', 'Estructuras de Datos', 2021, '700.00', 4, 1),
(9, '9786071507006', 'Tecnologías de Información', 2023, '550.00', 5, 5),
(10, '9786071509000', 'Arquitectura de Computadoras', 2021, '840.00', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_autor`
--

CREATE TABLE `libro_autor` (
  `id_libro` int NOT NULL,
  `id_autor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libro_autor`
--

INSERT INTO `libro_autor` (`id_libro`, `id_autor`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 4),
(7, 4),
(4, 5),
(8, 5),
(5, 6),
(6, 6),
(10, 6),
(2, 7),
(9, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int NOT NULL,
  `numero_nomina` varchar(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `puesto` varchar(80) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `numero_nomina`, `nombre`, `apellidos`, `puesto`, `fecha_contratacion`, `usuario`, `password`) VALUES
(1, 'NOM006', 'Mario', 'Méndez', 'Administrador', '2026-01-15', 'mmendez', 'admin123'),
(2, 'NOM007', 'Gabriel', 'Quiñones', 'Bibliotecario', '2026-02-10', 'gquinones', 'biblio123'),
(3, 'NOM008', 'Juan Carlos', 'López', 'Bibliotecario', '2026-03-05', 'jcarlos', 'biblio123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `estado` enum('Activo','Devuelto','Retrasado') DEFAULT 'Activo',
  `id_socio` int NOT NULL,
  `id_ejemplar` int NOT NULL,
  `id_personal_entrega` int NOT NULL,
  `id_personal_recibe` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `fecha_salida`, `fecha_limite`, `fecha_devolucion_real`, `estado`, `id_socio`, `id_ejemplar`, `id_personal_entrega`, `id_personal_recibe`) VALUES
(1, '2026-06-01', '2026-06-08', '2026-06-10', 'Devuelto', 1, 1, 1, 1),
(2, '2026-06-02', '2026-06-09', '2026-06-08', 'Devuelto', 2, 2, 2, 2),
(3, '2026-05-25', '2026-06-01', '2026-06-01', 'Devuelto', 3, 3, 1, 2),
(4, '2026-06-04', '2026-06-06', '2026-06-08', 'Devuelto', 3, 22, 1, 2),
(5, '2026-06-08', '2026-06-20', NULL, 'Activo', 1, 2, 2, NULL),
(6, '2026-06-08', '2026-06-09', '2026-06-08', 'Devuelto', 4, 37, 2, 1),
(7, '2026-06-08', '2026-06-19', NULL, 'Activo', 7, 39, 1, NULL),
(8, '2026-06-08', '2026-06-17', '2026-06-08', 'Devuelto', 4, 29, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sancion`
--

CREATE TABLE `sancion` (
  `id_sancion` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_sancion` date NOT NULL,
  `estado_pago` enum('Pendiente','Pagado') DEFAULT 'Pendiente',
  `id_prestamo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sancion`
--

INSERT INTO `sancion` (`id_sancion`, `monto`, `fecha_sancion`, `estado_pago`, `id_prestamo`) VALUES
(1, '50.00', '2026-06-02', 'Pendiente', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_socio` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `correo_institucional` varchar(100) DEFAULT NULL,
  `estado_membresia` enum('Activa','Suspendida','Inactiva') DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_socio`, `nombre`, `apellidos`, `telefono`, `fecha_alta`, `correo_institucional`, `estado_membresia`) VALUES
(1, 'Juan', 'Pérez', '5511111111', '2026-01-10', 'juan.perez@universidad.edu', 'Activa'),
(2, 'María', 'López', '5522222222', '2026-01-12', 'maria.lopez@universidad.edu', 'Activa'),
(3, 'Carlos', 'Ramírez', '5533333333', '2026-01-15', 'carlos.ramirez@universidad.edu', 'Activa'),
(4, 'Ana', 'Martínez', '5544444444', '2026-01-18', 'ana.martinez@universidad.edu', 'Activa'),
(5, 'Luis', 'Hernández', '5555555555', '2026-01-20', 'luis.hernandez@universidad.edu', 'Activa'),
(6, 'Pedro', 'García', '5566666666', '2026-01-25', 'pedro.garcia@universidad.edu', 'Activa'),
(7, 'Laura', 'Santos', '5577777777', '2026-02-01', 'laura.santos@universidad.edu', 'Activa'),
(8, 'Miguel', 'Torres', '5588888888', '2026-02-05', 'miguel.torres@universidad.edu', 'Activa'),
(9, 'Diana', 'Flores', '5599999999', '2026-02-10', 'diana.flores@universidad.edu', 'Activa'),
(10, 'Sofía', 'Cruz', '5500000000', '2026-02-15', 'sofia.cruz@universidad.edu', 'Activa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id_editorial`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`id_ejemplar`),
  ADD UNIQUE KEY `codigo_barras` (`codigo_barras`),
  ADD KEY `fk_ejemplar_libro` (`id_libro`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `fk_libro_editorial` (`id_editorial`),
  ADD KEY `fk_libro_categoria` (`id_categoria`);

--
-- Indices de la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD PRIMARY KEY (`id_libro`,`id_autor`),
  ADD KEY `fk_libroautor_autor` (`id_autor`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD UNIQUE KEY `numero_nomina` (`numero_nomina`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `fk_prestamo_socio` (`id_socio`),
  ADD KEY `fk_prestamo_ejemplar` (`id_ejemplar`),
  ADD KEY `fk_prestamo_personal_entrega` (`id_personal_entrega`),
  ADD KEY `fk_prestamo_personal_recibe` (`id_personal_recibe`);

--
-- Indices de la tabla `sancion`
--
ALTER TABLE `sancion`
  ADD PRIMARY KEY (`id_sancion`),
  ADD KEY `fk_sancion_prestamo` (`id_prestamo`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `correo_institucional` (`correo_institucional`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id_editorial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  MODIFY `id_ejemplar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sancion`
--
ALTER TABLE `sancion`
  MODIFY `id_sancion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_socio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `fk_ejemplar_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_libro_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_libro_editorial` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`);

--
-- Filtros para la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `fk_libroautor_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `fk_libroautor_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_ejemplar` FOREIGN KEY (`id_ejemplar`) REFERENCES `ejemplar` (`id_ejemplar`),
  ADD CONSTRAINT `fk_prestamo_personal_entrega` FOREIGN KEY (`id_personal_entrega`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `fk_prestamo_personal_recibe` FOREIGN KEY (`id_personal_recibe`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `fk_prestamo_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Filtros para la tabla `sancion`
--
ALTER TABLE `sancion`
  ADD CONSTRAINT `fk_sancion_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
