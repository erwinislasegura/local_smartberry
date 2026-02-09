-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2026 a las 06:26:35
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `smartberry_produccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_eap`
--

CREATE TABLE `control_eap` (
  `ID_EAP` bigint(20) NOT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_eau`
--

CREATE TABLE `control_eau` (
  `ID_EAU` bigint(20) NOT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIO` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_servicios`
--

CREATE TABLE `descripcion_servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_descripcion` varchar(255) NOT NULL,
  `verifica_estados` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL,
  `query_excel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_anticipo`
--

CREATE TABLE `detalle_anticipo` (
  `id_detalle_anticipo` bigint(20) NOT NULL,
  `id_anticipo` bigint(20) NOT NULL,
  `nombre_anticipo` varchar(255) NOT NULL,
  `moneda` int(11) NOT NULL,
  `fecha_anticipo` date NOT NULL,
  `valor_anticipo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_proceso`
--

CREATE TABLE `empresa_proceso` (
  `id` int(11) NOT NULL,
  `id_temporada` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_planta` int(11) NOT NULL,
  `id_proceso` int(11) NOT NULL,
  `moneda` varchar(3) NOT NULL,
  `monto` decimal(11,3) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar_ecomercial`
--

CREATE TABLE `estandar_ecomercial` (
  `ID_ECOMERCIAL` bigint(20) NOT NULL,
  `CODIGO_ECOMERCIAL` varchar(300) DEFAULT NULL,
  `NOMBRE_ECOMERCIAL` varchar(300) DEFAULT NULL,
  `DESCRIPCION_ECOMERCIAL` varchar(300) DEFAULT NULL,
  `PESO_NETO_ECOMERCIAL` decimal(20,5) DEFAULT NULL,
  `PESO_BRUTO_ECOMERCIAL` decimal(20,5) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar_eexportacion`
--

CREATE TABLE `estandar_eexportacion` (
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `CODIGO_ESTANDAR` varchar(300) DEFAULT NULL,
  `NOMBRE_ESTANDAR` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_ESTANDAR` int(11) DEFAULT NULL,
  `PESO_NETO_ESTANDAR` decimal(20,5) DEFAULT NULL,
  `PDESHIDRATACION_ESTANDAR` decimal(10,2) DEFAULT NULL,
  `PESO_BRUTO_ESTANDAR` decimal(20,5) DEFAULT NULL,
  `PESO_ENVASE_ESTANDAR` decimal(20,5) DEFAULT NULL,
  `PESO_PALLET_ESTANDAR` decimal(10,2) DEFAULT NULL,
  `TFRUTA_ESTANDAR` int(11) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `STOCK` int(11) DEFAULT 0,
  `TCATEGORIA` int(11) DEFAULT 0,
  `TCOLOR` int(11) DEFAULT 0,
  `TVARIEDAD` int(11) DEFAULT 0,
  `TREFERENCIA` int(11) DEFAULT 0,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_ESPECIES` bigint(20) NOT NULL,
  `ID_TETIQUETA` bigint(20) NOT NULL,
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `ID_ECOMERCIAL` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar_eindustrial`
--

CREATE TABLE `estandar_eindustrial` (
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `CODIGO_ESTANDAR` varchar(300) DEFAULT NULL,
  `NOMBRE_ESTANDAR` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_ESTANDAR` int(11) DEFAULT NULL,
  `PESO_ENVASE_ESTANDAR` decimal(20,5) DEFAULT NULL,
  `PESO_PALLET_ESTANDAR` decimal(10,2) DEFAULT NULL,
  `TESTANDAR` int(11) DEFAULT 0,
  `COBRO` int(11) DEFAULT 0,
  `TFRUTA_ESTANDAR` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_ESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `AGRUPACION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar_erecepcion`
--

CREATE TABLE `estandar_erecepcion` (
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `CODIGO_ESTANDAR` varchar(300) DEFAULT NULL,
  `NOMBRE_ESTANDAR` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_ESTANDAR` int(11) DEFAULT NULL,
  `PESO_ENVASE_ESTANDAR` decimal(20,5) DEFAULT NULL,
  `PESO_PALLET_ESTANDAR` decimal(10,2) DEFAULT NULL,
  `TFRUTA_ESTANDAR` int(11) DEFAULT NULL,
  `TRATAMIENTO1` int(11) DEFAULT 0,
  `TRATAMIENTO2` int(11) DEFAULT 0,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_ESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_AGERENCIAL` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_aaduana`
--

CREATE TABLE `fruta_aaduana` (
  `ID_AADUANA` bigint(20) NOT NULL,
  `RUT_AADUANA` varchar(20) DEFAULT NULL,
  `DV_AADUANA` varchar(300) DEFAULT NULL,
  `NUMERO_AADUANA` varchar(300) DEFAULT NULL,
  `NOMBRE_AADUANA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_AADUANA` varchar(300) DEFAULT NULL,
  `GIRO_AADUANA` varchar(300) DEFAULT NULL,
  `DIRECCION_AADUANA` varchar(300) DEFAULT NULL,
  `CONTACTO_AADUANA` varchar(300) DEFAULT NULL,
  `EMAIL_AADUANA` varchar(300) DEFAULT NULL,
  `TELEFONO_AADUANA` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_acarga`
--

CREATE TABLE `fruta_acarga` (
  `ID_ACARGA` bigint(20) NOT NULL,
  `NUMERO_ACARGA` int(11) DEFAULT NULL,
  `NOMBRE_ACARGA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_adestino`
--

CREATE TABLE `fruta_adestino` (
  `ID_ADESTINO` bigint(20) NOT NULL,
  `NUMERO_ADESTINO` int(11) DEFAULT NULL,
  `NOMBRE_ADESTINO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_agcarga`
--

CREATE TABLE `fruta_agcarga` (
  `ID_AGCARGA` bigint(20) NOT NULL,
  `NUMERO_AGCARGA` int(11) DEFAULT NULL,
  `RUT_AGCARGA` varchar(20) DEFAULT NULL,
  `DV_AGCARGA` varchar(45) DEFAULT NULL,
  `NOMBRE_AGCARGA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_AGCARGA` varchar(300) DEFAULT NULL,
  `GIRO_AGCARGA` varchar(300) DEFAULT NULL,
  `CODIGO_SAG_AGCARGA` int(11) DEFAULT NULL,
  `DIRECCION_AGCARGA` varchar(300) DEFAULT NULL,
  `CONTACTO_AGCARGA` varchar(300) DEFAULT NULL,
  `EMAIL_AGCARGA` varchar(300) DEFAULT NULL,
  `TELEFONO_AGCARGA` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_atmosfera`
--

CREATE TABLE `fruta_atmosfera` (
  `ID_ATMOSFERA` bigint(20) NOT NULL,
  `NUMERO_ATMOSFERA` bigint(20) DEFAULT NULL,
  `NOMBRE_ATMOSFERA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_broker`
--

CREATE TABLE `fruta_broker` (
  `ID_BROKER` bigint(20) NOT NULL,
  `NUMERO_BROKER` int(11) DEFAULT NULL,
  `NOMBRE_BROKER` varchar(300) DEFAULT NULL,
  `EORI_BROKER` varchar(300) DEFAULT NULL,
  `DIRECCION_BROKER` varchar(300) DEFAULT NULL,
  `CONTACTO1_BROKER` varchar(300) DEFAULT NULL,
  `CARGO1_BROKER` varchar(300) DEFAULT NULL,
  `EMAIL1_BROKER` varchar(300) DEFAULT NULL,
  `CONTACTO2_BROKER` varchar(300) DEFAULT NULL,
  `CARGO2_BROKER` varchar(300) DEFAULT NULL,
  `EMAIL2_BROKER` varchar(300) DEFAULT NULL,
  `CONTACTO3_BROKER` varchar(300) DEFAULT NULL,
  `CARGO3_BROKER` varchar(300) DEFAULT NULL,
  `EMAIL3_BROKER` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_ccalidad`
--

CREATE TABLE `fruta_ccalidad` (
  `ID_CCALIDAD` bigint(20) NOT NULL,
  `NUMERO_CCALIDAD` bigint(20) DEFAULT NULL,
  `NOMBRE_CCALIDAD` varchar(30) DEFAULT NULL,
  `RGB_CCALIDAD` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_cfolio`
--

CREATE TABLE `fruta_cfolio` (
  `ID_CFOLIO` bigint(20) NOT NULL,
  `FOLIOORIGINAL` varchar(300) DEFAULT NULL,
  `FOLIONUEVO` varchar(300) DEFAULT NULL,
  `MOTIVO` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `ID_EXIEXPORTACION` bigint(20) NOT NULL,
  `ID_USUARIO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_cicarga`
--

CREATE TABLE `fruta_cicarga` (
  `ID_CICARGA` bigint(20) NOT NULL,
  `MOTIVO` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `ID_ICARGAO` bigint(20) DEFAULT NULL,
  `ID_ICARGAN` bigint(20) DEFAULT NULL,
  `ID_EXIEXPORTACION` bigint(20) NOT NULL,
  `ID_USUARIO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_comprador`
--

CREATE TABLE `fruta_comprador` (
  `ID_COMPRADOR` bigint(20) NOT NULL,
  `NUMERO_COMPRADOR` bigint(20) DEFAULT NULL,
  `RUT_COMPRADOR` varchar(30) DEFAULT NULL,
  `DV_COMPRADOR` varchar(45) DEFAULT NULL,
  `NOMBRE_COMPRADOR` varchar(300) DEFAULT NULL,
  `DIRECCION_COMPRADOR` varchar(300) DEFAULT NULL,
  `TELEFONO_COMPRADOR` int(11) DEFAULT NULL,
  `EMAIL_COMPRADOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_consignatario`
--

CREATE TABLE `fruta_consignatario` (
  `ID_CONSIGNATARIO` bigint(20) NOT NULL,
  `NUMERO_CONSIGNATARIO` int(11) DEFAULT NULL,
  `NOMBRE_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `EORI_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `DIRECCION_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `TELEFONO_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CONTACTO1_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CARGO1_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `EMAIL1_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CONTACTO2_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CARGO2_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `EMAIL2_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CONTACTO3_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `CARGO3_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `EMAIL3_CONSIGNATARIO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_contraparte`
--

CREATE TABLE `fruta_contraparte` (
  `ID_CONTRAPARTE` bigint(20) NOT NULL,
  `NUMERO_CONTRAPARTE` int(11) DEFAULT NULL,
  `NOMBRE_CONTRAPARTE` varchar(300) DEFAULT NULL,
  `DIRECCION_CONTRAPARTE` varchar(300) DEFAULT NULL,
  `TELEFONO_CONTRAPARTE` int(11) DEFAULT NULL,
  `EMAIL_CONTRAPARTE` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_cuartel`
--

CREATE TABLE `fruta_cuartel` (
  `ID_CUARTEL` bigint(20) NOT NULL,
  `NUMERO_CUARTEL` int(11) DEFAULT NULL,
  `NOMBRE_CUARTEL` varchar(300) DEFAULT NULL,
  `TIEMPO_PRODUCCION_ANO_CUARTEL` int(11) DEFAULT NULL,
  `ANO_PLANTACION_CUARTEL` int(11) DEFAULT NULL,
  `HECTAREAS_CUARTEL` int(11) DEFAULT NULL,
  `PLANTAS_EN_HECTAREAS` int(11) DEFAULT NULL,
  `DISTANCIA_PLANTA_CUARTEL` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_cventa`
--

CREATE TABLE `fruta_cventa` (
  `ID_CVENTA` bigint(20) NOT NULL,
  `NUMERO_CVENTA` int(11) DEFAULT NULL,
  `NOMBRE_CVENTA` varchar(300) DEFAULT NULL,
  `NOTA_CVENTA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_despachoex`
--

CREATE TABLE `fruta_despachoex` (
  `ID_DESPACHOEX` bigint(20) NOT NULL,
  `NUMERO_DESPACHOEX` int(11) DEFAULT NULL,
  `FECHA_DESPACHOEX` date DEFAULT NULL,
  `SNICARGA` int(11) DEFAULT NULL,
  `NUMERO_SELLO_DESPACHOEX` int(11) DEFAULT NULL,
  `FECHA_GUIA_DESPACHOEX` date DEFAULT NULL,
  `NUMERO_GUIA_DESPACHOEX` int(11) DEFAULT NULL,
  `NUMERO_CONTENEDOR_DESPACHOEX` varchar(300) DEFAULT NULL,
  `NUMERO_PLANILLA_DESPACHOEX` int(11) DEFAULT NULL,
  `TERMOGRAFO_DESPACHOEX` varchar(300) DEFAULT NULL,
  `VGM` int(11) DEFAULT NULL,
  `TEMBARQUE_DESPACHOEX` int(11) DEFAULT NULL,
  `BOOKING_DESPACHOEX` varchar(300) DEFAULT NULL,
  `FECHAETD_DESPACHOEX` date DEFAULT NULL,
  `FECHAETA_DESPACHOEX` date DEFAULT NULL,
  `CRT_DESPACHOEX` varchar(100) DEFAULT NULL,
  `FECHASTACKING_DESPACHOEX` date DEFAULT NULL,
  `NVIAJE_DESPACHOEX` varchar(100) DEFAULT NULL,
  `NAVE_DESPACHOEX` varchar(300) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `CANTIDAD_ENVASE_DESPACHOEX` int(11) DEFAULT NULL,
  `KILOS_NETO_DESPACHOEX` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DESPACHOEX` decimal(11,2) DEFAULT NULL,
  `OBSERVACION_DESPACHOEX` varchar(300) DEFAULT NULL,
  `TINPUSDA` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ICARGA` bigint(20) DEFAULT NULL,
  `ID_EXPPORTADORA` bigint(20) DEFAULT NULL,
  `ID_RFINAL` bigint(20) DEFAULT NULL,
  `ID_AGCARGA` bigint(20) DEFAULT NULL,
  `ID_DFINAL` bigint(20) DEFAULT NULL,
  `ID_INPECTOR` bigint(20) DEFAULT NULL,
  `ID_MERCADO` bigint(20) DEFAULT NULL,
  `ID_PAIS` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE2` bigint(20) DEFAULT NULL,
  `ID_LCARGA` bigint(20) DEFAULT NULL,
  `ID_LDESTINO` bigint(20) DEFAULT NULL,
  `ID_LAREA` bigint(20) DEFAULT NULL,
  `ID_AERONAVE` bigint(20) DEFAULT NULL,
  `ID_ACARGA` bigint(20) DEFAULT NULL,
  `ID_ADESTINO` bigint(20) DEFAULT NULL,
  `ID_NAVIERA` bigint(20) DEFAULT NULL,
  `ID_PCARGA` bigint(20) DEFAULT NULL,
  `ID_PDESTINO` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_CONTRAPARTE` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_despachoind`
--

CREATE TABLE `fruta_despachoind` (
  `ID_DESPACHO` bigint(20) NOT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `NUMERO_GUIA_DESPACHO` int(11) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TDESPACHO` int(11) DEFAULT NULL,
  `OBSERVACION_DESPACHO` varchar(300) DEFAULT NULL,
  `KILOS_NETO_DESPACHO` decimal(11,2) DEFAULT NULL,
  `TOTAL_PRECIO` decimal(11,2) DEFAULT NULL,
  `REGALO_DESPACHO` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_DESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_COMPRADOR` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `CANTIDADENVASE1` int(11) DEFAULT NULL,
  `CANTIDADENVASE2` int(11) DEFAULT NULL,
  `CANTIDADENVASE3` int(11) DEFAULT NULL,
  `CANTIDADENVASE4` int(11) DEFAULT NULL,
  `CANTIDADENVASE5` int(11) DEFAULT NULL,
  `CANTIDADENVASE6` int(11) DEFAULT NULL,
  `CANTIDADENVASE7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_despachomp`
--

CREATE TABLE `fruta_despachomp` (
  `ID_DESPACHO` bigint(20) NOT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `NUMERO_GUIA_DESPACHO` int(11) DEFAULT NULL,
  `CANTIDAD_ENVASE_DESPACHO` int(11) DEFAULT NULL,
  `KILOS_NETO_DESPACHO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DESPACHO` decimal(11,2) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `REGALO_DESPACHO` varchar(300) DEFAULT NULL,
  `TDESPACHO` int(11) DEFAULT NULL,
  `OBSERVACION_DESPACHO` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_DESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_COMPRADOR` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_despachopt`
--

CREATE TABLE `fruta_despachopt` (
  `ID_DESPACHO` bigint(20) NOT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `TDESPACHO` int(11) DEFAULT NULL,
  `NUMERO_GUIA_DESPACHO` mediumtext DEFAULT NULL,
  `NUMERO_SELLO_DESPACHO` varchar(300) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `REGALO_DESPACHO` varchar(300) DEFAULT NULL,
  `VGM` int(11) DEFAULT NULL,
  `CANTIDAD_ENVASE_DESPACHO` int(11) DEFAULT NULL,
  `KILOS_NETO_DESPACHO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DESPACHO` decimal(11,2) DEFAULT NULL,
  `TOTAL_PRECIO` decimal(11,2) DEFAULT NULL,
  `OBSERVACION_DESPACHO` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_DESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_COMPRADOR` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_dfinal`
--

CREATE TABLE `fruta_dfinal` (
  `ID_DFINAL` bigint(20) NOT NULL,
  `NUMERO_DFINAL` int(11) DEFAULT NULL,
  `NOMBRE_DFINAL` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_dicarga`
--

CREATE TABLE `fruta_dicarga` (
  `ID_DICARGA` bigint(20) NOT NULL,
  `CANTIDAD_ENVASE_DICARGA` int(11) DEFAULT NULL,
  `CANTIDAD_PALLET_DICARGA` int(11) DEFAULT NULL,
  `KILOS_NETO_DICARGA` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DICARGA` decimal(11,2) DEFAULT NULL,
  `PRECIO_US_DICARGA` decimal(11,2) DEFAULT NULL,
  `TOTAL_PRECIO_US_DICARGA` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_ICARGA` bigint(20) NOT NULL,
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `ID_TMONEDA` bigint(20) DEFAULT NULL,
  `ID_TMANEJO` bigint(20) DEFAULT NULL,
  `ID_VESPECIES` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_dnotadc`
--

CREATE TABLE `fruta_dnotadc` (
  `ID_DNOTA` bigint(20) NOT NULL,
  `TNOTA` int(11) DEFAULT NULL,
  `CANTIDAD` decimal(20,2) DEFAULT NULL,
  `TOTAL` decimal(20,2) DEFAULT NULL,
  `NOTA` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_NOTA` bigint(20) NOT NULL,
  `ID_DICARGA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_dpexportacion`
--

CREATE TABLE `fruta_dpexportacion` (
  `ID_DPEXPORTACION` bigint(20) NOT NULL,
  `FOLIO_DPEXPORTACION` int(11) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_DPEXPORTACION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_DPEXPORTACION` int(11) DEFAULT NULL,
  `KILOS_NETO_DPEXPORTACION` decimal(11,2) DEFAULT NULL,
  `PDESHIDRATACION_DPEXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_DESHIDRATACION_DPEXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DPEXPORTACION` decimal(11,2) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_PROCESO` bigint(20) NOT NULL,
  `ID_TCATEGORIA` bigint(20) DEFAULT NULL,
  `ID_ICARGA` bigint(20) DEFAULT NULL,
  `ESTADO_FOLIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_dpindustrial`
--

CREATE TABLE `fruta_dpindustrial` (
  `ID_DPINDUSTRIAL` bigint(20) NOT NULL,
  `FOLIO_DPINDUSTRIAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_DPINDUSTRIAL` date DEFAULT NULL,
  `KILOS_NETO_DPINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_PROCESO` bigint(20) NOT NULL,
  `ID_TCALIBREIND` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drecepcionind`
--

CREATE TABLE `fruta_drecepcionind` (
  `ID_DRECEPCION` bigint(20) NOT NULL,
  `FOLIO_DRECEPCION` int(11) DEFAULT NULL,
  `FOLIO_MANUAL` tinyint(1) NOT NULL DEFAULT 0,
  `FECHA_EMBALADO_DRECEPCION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_DRECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_PROMEDIO_DRECEPCION` decimal(11,5) DEFAULT NULL,
  `PESO_PALLET_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `GASIFICADO_DRECEPCION` int(11) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_RECEPCION` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drecepcionmp`
--

CREATE TABLE `fruta_drecepcionmp` (
  `ID_DRECEPCION` bigint(20) NOT NULL,
  `FOLIO_DRECEPCION` bigint(20) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_COSECHA_DRECEPCION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_DRECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_PROMEDIO_DRECEPCION` decimal(11,5) DEFAULT NULL,
  `PESO_PALLET_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `GASIFICADO_DRECEPCION` int(11) DEFAULT NULL,
  `NOTA_DRECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_RECEPCION` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_TTRATAMIENTO1` bigint(20) DEFAULT NULL,
  `ID_TTRATAMIENTO2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drecepcionpt`
--

CREATE TABLE `fruta_drecepcionpt` (
  `ID_DRECEPCION` bigint(20) NOT NULL,
  `FOLIO_DRECEPCION` int(15) DEFAULT NULL,
  `FOLIO_MANUAL` int(15) DEFAULT NULL,
  `FECHA_EMBALADO_DRECEPCION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_RECIBIDO_DRECEPCION` int(11) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECHAZADO_DRECEPCION` int(11) DEFAULT NULL,
  `CANTIDAD_ENVASE_APROBADO_DRECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_REAL_DRECEPCION` bigint(20) DEFAULT NULL,
  `KILOS_NETO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `PDESHIDRATACION_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_DESHIDRATACION_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `PESO_PALLET_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `GASIFICADO_DRECEPCION` int(11) DEFAULT NULL,
  `EMBOLSADO_DRECEPCION` int(11) DEFAULT NULL,
  `STOCK_DRECEPCION` varchar(300) DEFAULT NULL,
  `TEMPERATURA_DRECEPCION` decimal(11,2) DEFAULT NULL,
  `PREFRIO_DRECEPCION` int(11) DEFAULT NULL,
  `NOTA_DRECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_RECEPCION` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `ID_TCATEGORIA` bigint(20) DEFAULT NULL,
  `ID_TCOLOR` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drepaletizajeex`
--

CREATE TABLE `fruta_drepaletizajeex` (
  `ID_DREPALETIZAJE` bigint(20) NOT NULL,
  `FOLIO_NUEVO_DREPALETIZAJE` bigint(20) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_DREPALETIZAJE` date DEFAULT NULL,
  `CANTIDAD_ENVASE_DREPALETIZAJE` int(11) DEFAULT NULL,
  `KILOS_NETO_DREPALETIZAJE` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DREPALETIZAJE` decimal(11,2) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `STOCK` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) DEFAULT NULL,
  `ID_TCALIBRE` bigint(20) DEFAULT NULL,
  `ID_TEMBALAJE` bigint(20) DEFAULT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_REPALETIZAJE` bigint(20) NOT NULL,
  `ID_EXIEXPORTACION` bigint(20) DEFAULT NULL,
  `ESTADO_FOLIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drexportacion`
--

CREATE TABLE `fruta_drexportacion` (
  `ID_DREXPORTACION` bigint(20) NOT NULL,
  `FOLIO_DREXPORTACION` int(11) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_DREXPORTACION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_DREXPORTACION` int(11) DEFAULT NULL,
  `KILOS_NETO_DREXPORTACION` decimal(11,2) DEFAULT NULL,
  `PDESHIDRATACION_DREXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_DESHIDRATACION_DREXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_DREXPORTACION` decimal(11,2) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_REEMBALAJE` bigint(20) NOT NULL,
  `ID_TCATEGORIA` bigint(20) DEFAULT NULL,
  `ID_ICARGA` bigint(20) DEFAULT NULL,
  `ESTADO_FOLIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_drindustrial`
--

CREATE TABLE `fruta_drindustrial` (
  `ID_DRINDUSTRIAL` bigint(20) NOT NULL,
  `FOLIO_DRINDUSTRIAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_DRINDUSTRIAL` date DEFAULT NULL,
  `KILOS_NETO_DRINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_REEMBALAJE` bigint(20) NOT NULL,
  `ID_TCALIBREIND` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_emisionbl`
--

CREATE TABLE `fruta_emisionbl` (
  `ID_EMISIONBL` bigint(20) NOT NULL,
  `NUMERO_EMISIONBL` bigint(20) DEFAULT NULL,
  `NOMBRE_EMISIONBL` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_especies`
--

CREATE TABLE `fruta_especies` (
  `ID_ESPECIES` bigint(20) NOT NULL,
  `NOMBRE_ESPECIES` varchar(300) DEFAULT NULL,
  `CODIGO_SAG_ESPECIES` varchar(300) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) DEFAULT NULL,
  `ID_USUARIOM` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_exiexportacion`
--

CREATE TABLE `fruta_exiexportacion` (
  `ID_EXIEXPORTACION` bigint(20) NOT NULL,
  `FOLIO_EXIEXPORTACION` int(12) DEFAULT NULL,
  `FOLIO_AUXILIAR_EXIEXPORTACION` int(12) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_EMBALADO_EXIEXPORTACION` date DEFAULT NULL,
  `CANTIDAD_ENVASE_EXIEXPORTACION` int(11) DEFAULT NULL,
  `KILOS_NETO_EXIEXPORTACION` decimal(11,2) DEFAULT NULL,
  `PDESHIDRATACION_EXIEXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_DESHIRATACION_EXIEXPORTACION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_EXIEXPORTACION` decimal(11,2) DEFAULT NULL,
  `OBSERVACION_EXIESPORTACION` varchar(300) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO_EXIESPORTACION` varchar(150) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO_EXIESPORTACION` varchar(300) DEFAULT NULL,
  `STOCK` varchar(300) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `GASIFICADO` int(11) DEFAULT NULL,
  `PREFRIO` int(11) DEFAULT NULL,
  `TESTADOSAG` int(11) DEFAULT NULL,
  `PRECIO_PALLET` decimal(11,2) DEFAULT NULL,
  `VGM` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_PROCESO` date DEFAULT NULL,
  `FECHA_REEMBALAJE` date DEFAULT NULL,
  `FECHA_REPALETIZAJE` date DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `FECHA_DESPACHOEX` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TCATEGORIA` bigint(20) DEFAULT NULL,
  `ID_TCOLOR` bigint(20) DEFAULT NULL,
  `ID_RECEPCION` bigint(20) DEFAULT NULL,
  `ID_PROCESO` bigint(20) DEFAULT NULL,
  `ID_REPALETIZAJE` bigint(20) DEFAULT NULL,
  `ID_REEMBALAJE` bigint(20) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) DEFAULT NULL,
  `ID_DESPACHOEX` bigint(20) DEFAULT NULL,
  `ID_INPSAG` bigint(20) DEFAULT NULL,
  `ID_PCDESPACHO` bigint(20) DEFAULT NULL,
  `ID_ICARGA` bigint(20) DEFAULT NULL,
  `ID_RECHAZADO` bigint(20) DEFAULT NULL,
  `ID_LEVANTAMIENTO` bigint(20) DEFAULT NULL,
  `ID_DESPACHO2` bigint(20) DEFAULT NULL,
  `ID_INPSAG2` bigint(20) DEFAULT NULL,
  `ID_REPALETIZAJE2` bigint(20) DEFAULT NULL,
  `ID_EXIEXPORTACION2` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ESTADO_FOLIO` int(11) DEFAULT NULL,
  `REFERENCIA` varchar(255) DEFAULT NULL,
  `N_TERMOGRAFO` varchar(255) DEFAULT NULL,
  `LOTE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_exiindustrial`
--

CREATE TABLE `fruta_exiindustrial` (
  `ID_EXIINDUSTRIAL` bigint(20) NOT NULL,
  `FOLIO_EXIINDUSTRIAL` int(12) DEFAULT NULL,
  `FOLIO_AUXILIAR_EXIINDUSTRIAL` int(12) DEFAULT NULL,
  `FOLIO_MANUAL` tinyint(1) NOT NULL DEFAULT 0,
  `FECHA_EMBALADO_EXIINDUSTRIAL` date DEFAULT NULL,
  `CANTIDAD_ENVASE_EXIINDUSTRIAL` int(11) DEFAULT NULL,
  `KILOS_NETO_EXIINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `PDESHIDRATACION_EXIINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `KILOS_DESHIRATACION_EXIINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_EXIINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `KILOS_PROMEDIO_EXIINDUSTRIAL` decimal(20,5) DEFAULT NULL,
  `PESO_PALLET_EXIINDUSTRIAL` decimal(11,2) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO_EXIINDUSTRIAL` varchar(300) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO_EXIINDUSTRIAL` varchar(300) DEFAULT NULL,
  `STOCK` varchar(300) DEFAULT NULL,
  `EMBOLSADO` int(11) DEFAULT NULL,
  `PREFRIO` int(11) DEFAULT NULL,
  `TESTADOSAG` int(11) DEFAULT NULL,
  `GASIFICADO` int(11) DEFAULT NULL,
  `PRECIO_KILO` decimal(11,2) DEFAULT NULL,
  `TCOBRO` int(11) DEFAULT 0,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_PROCESO` date DEFAULT NULL,
  `FECHA_REEMBALAJE` date DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) DEFAULT NULL,
  `ID_ESTANDAR` bigint(20) DEFAULT NULL,
  `ID_TCALIBRE` bigint(20) DEFAULT NULL,
  `ID_TEMBALAJE` bigint(20) DEFAULT NULL,
  `ID_TTRATAMIENTO1` bigint(20) DEFAULT NULL,
  `ID_TTRATAMIENTO2` bigint(20) DEFAULT NULL,
  `ID_ESTANDARMP` bigint(20) DEFAULT NULL,
  `ID_RECHAZADOMP` bigint(20) DEFAULT NULL,
  `ID_LEVANTAMIENTOMP` bigint(20) DEFAULT NULL,
  `ID_RECEPCION` bigint(20) DEFAULT NULL,
  `ID_PROCESO` bigint(20) DEFAULT NULL,
  `ID_REEMBALAJE` bigint(20) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) DEFAULT NULL,
  `ID_DESPACHO2` bigint(20) DEFAULT NULL,
  `ID_DESPACHO3` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_EXIINDUSTRIAL2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_eximateriaprima`
--

CREATE TABLE `fruta_eximateriaprima` (
  `ID_EXIMATERIAPRIMA` bigint(20) NOT NULL,
  `FOLIO_EXIMATERIAPRIMA` bigint(20) DEFAULT NULL,
  `FOLIO_AUXILIAR_EXIMATERIAPRIMA` bigint(20) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `FECHA_COSECHA_EXIMATERIAPRIMA` date DEFAULT NULL,
  `CANTIDAD_ENVASE_EXIMATERIAPRIMA` int(11) DEFAULT NULL,
  `KILOS_NETO_EXIMATERIAPRIMA` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_EXIMATERIAPRIMA` decimal(11,2) DEFAULT NULL,
  `KILOS_PROMEDIO_EXIMATERIAPRIMA` decimal(11,5) DEFAULT NULL,
  `PESO_PALLET_EXIMATERIAPRIMA` decimal(11,2) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO_EXIMATERIAPRIMA` varchar(150) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO_EXIMATERIAPRIMA` varchar(300) DEFAULT NULL,
  `GASIFICADO` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_PROCESO` date DEFAULT NULL,
  `FECHA_REPALETIZAJE` date DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TMANEJO` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TTRATAMIENTO1` bigint(20) DEFAULT NULL,
  `ID_TTRATAMIENTO2` bigint(20) DEFAULT NULL,
  `ID_RECEPCION` bigint(20) DEFAULT NULL,
  `ID_PROCESO` bigint(20) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) DEFAULT NULL,
  `ID_PROCESO2` bigint(20) DEFAULT NULL,
  `ID_DESPACHO2` bigint(20) DEFAULT NULL,
  `ID_DESPACHO3` bigint(20) DEFAULT NULL,
  `ID_RECHAZADO` bigint(20) DEFAULT NULL,
  `ID_LEVANTAMIENTO` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_EXIMATERIAPRIMA2` bigint(20) DEFAULT NULL,
  `ID_PCDESPACHO` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_exportadora`
--

CREATE TABLE `fruta_exportadora` (
  `ID_EXPORTADORA` bigint(20) NOT NULL,
  `NUMERO_EXPORTADORA` int(11) DEFAULT NULL,
  `RUT_EXPORTADORA` varchar(20) DEFAULT NULL,
  `DV_EXPORTADORA` varchar(45) DEFAULT NULL,
  `NOMBRE_EXPORTADORA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_EXPORTADORA` varchar(300) DEFAULT NULL,
  `GIRO_EXPORTADORA` varchar(300) DEFAULT NULL,
  `DIRECCION_EXPORTADORA` varchar(300) DEFAULT NULL,
  `CONTACTO1_EXPORTADORA` varchar(300) DEFAULT NULL,
  `EMAIL1_EXPORTADORA` varchar(300) DEFAULT NULL,
  `TELEFONO1_EXPORTADORA` int(11) DEFAULT NULL,
  `CONTACTO2_EXPORTADORA` varchar(300) DEFAULT NULL,
  `EMAIL2_EXPORTADORA` varchar(300) DEFAULT NULL,
  `TELEFONO2_EXPORTADORA` int(11) DEFAULT NULL,
  `LOGO_EXPORTADORA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_folio`
--

CREATE TABLE `fruta_folio` (
  `ID_FOLIO` bigint(20) NOT NULL,
  `NUMERO_FOLIO` bigint(20) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO` varchar(300) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `TFOLIO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_fpago`
--

CREATE TABLE `fruta_fpago` (
  `ID_FPAGO` bigint(20) NOT NULL,
  `NUMERO_FPAGO` int(11) DEFAULT NULL,
  `NOMBRE_FPAGO` varchar(300) DEFAULT NULL,
  `FECHA_PAGO_FPAGO` date DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_icarga`
--

CREATE TABLE `fruta_icarga` (
  `ID_ICARGA` bigint(20) NOT NULL,
  `NUMERO_ICARGA` int(11) DEFAULT NULL,
  `FECHA_ICARGA` date DEFAULT NULL,
  `TEMBARQUE_ICARGA` int(11) DEFAULT NULL,
  `BOOKING_ICARGA` varchar(300) DEFAULT NULL,
  `NCONTENEDOR_ICARGA` varchar(300) DEFAULT NULL,
  `NCOURIER_ICARGA` varchar(300) DEFAULT NULL,
  `FECHAETD_ICARGA` date DEFAULT NULL,
  `FECHAETA_ICARGA` date DEFAULT NULL,
  `FECHAETAREAL_ICARGA` date DEFAULT NULL,
  `FECHAETDREAL_ICARGA` date DEFAULT NULL,
  `NVIAJE_ICARGA` varchar(100) DEFAULT NULL,
  `FDA_ICARGA` bigint(20) DEFAULT NULL,
  `CRT_ICARGA` varchar(100) DEFAULT NULL,
  `NAVE_ICARGA` varchar(300) DEFAULT NULL,
  `FECHASTACKING_ICARGA` date DEFAULT NULL,
  `FECHASTACKINGF_ICARGA` date DEFAULT NULL,
  `FUMIGADO_ICARGA` int(11) DEFAULT NULL,
  `T_ICARGA` decimal(11,1) DEFAULT NULL,
  `O2_ICARGA` decimal(11,1) DEFAULT NULL,
  `C02_ICARGA` decimal(11,1) DEFAULT NULL,
  `ALAMPA_ICARGA` mediumtext DEFAULT NULL,
  `DUS_ICARGA` int(11) DEFAULT NULL,
  `BOLAWBCRT_ICARGA` varchar(45) DEFAULT NULL,
  `NETO_ICARGA` decimal(11,1) DEFAULT NULL,
  `REBATE_ICARGA` decimal(11,1) DEFAULT NULL,
  `PUBLICA_ICARGA` decimal(11,0) DEFAULT NULL,
  `COSTO_FLETE_ICARGA` decimal(11,1) DEFAULT NULL,
  `FECHA_CDOCUMENTAL_ICARGA` date DEFAULT NULL,
  `OBSERVACION_ICARGA` varchar(300) DEFAULT NULL,
  `OBSERVACIONI_ICARGA` varchar(300) DEFAULT NULL,
  `NREFERENCIA_ICARGA` varchar(300) DEFAULT NULL,
  `TOTAL_ENVASE_ICAGRA` int(11) DEFAULT NULL,
  `TOTAL_NETO_ICARGA` decimal(11,2) DEFAULT NULL,
  `TOTAL_BRUTO_ICARGA` decimal(11,2) DEFAULT NULL,
  `TOTAL_US_ICARGA` decimal(11,2) DEFAULT NULL,
  `LIQUIDACION` int(11) DEFAULT NULL,
  `PAGO` int(11) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_ICARGA` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TSERVICIO` bigint(20) DEFAULT NULL,
  `ID_EXPPORTADORA` bigint(20) DEFAULT NULL,
  `ID_CONSIGNATARIO` bigint(20) DEFAULT NULL,
  `ID_NOTIFICADOR` bigint(20) DEFAULT NULL,
  `ID_BROKER` bigint(20) DEFAULT NULL,
  `ID_RFINAL` bigint(20) DEFAULT NULL,
  `ID_MERCADO` bigint(20) DEFAULT NULL,
  `ID_AADUANA` bigint(20) DEFAULT NULL,
  `ID_AGCARGA` bigint(20) DEFAULT NULL,
  `ID_DFINAL` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) DEFAULT NULL,
  `ID_LCARGA` bigint(20) DEFAULT NULL,
  `ID_LDESTINO` bigint(20) DEFAULT NULL,
  `ID_LAREA` bigint(20) DEFAULT NULL,
  `ID_AEROLINEA` bigint(20) DEFAULT NULL,
  `ID_AERONAVE` bigint(20) DEFAULT NULL,
  `ID_ACARGA` bigint(20) DEFAULT NULL,
  `ID_ADESTINO` bigint(20) DEFAULT NULL,
  `ID_NAVIERA` bigint(20) DEFAULT NULL,
  `ID_PDESTINO` bigint(20) DEFAULT NULL,
  `ID_PCARGA` bigint(20) DEFAULT NULL,
  `ID_FPAGO` bigint(20) DEFAULT NULL,
  `ID_CVENTA` bigint(20) DEFAULT NULL,
  `ID_MVENTA` bigint(20) DEFAULT NULL,
  `ID_TFLETE` bigint(20) DEFAULT NULL,
  `ID_TCONTENEDOR` bigint(20) DEFAULT NULL,
  `ID_ATMOSFERA` bigint(20) DEFAULT NULL,
  `ID_PAIS` bigint(20) DEFAULT NULL,
  `ID_SEGURO` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_EMISIONBL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_inpector`
--

CREATE TABLE `fruta_inpector` (
  `ID_INPECTOR` bigint(20) NOT NULL,
  `NUMERO_INPECTOR` int(11) DEFAULT NULL,
  `NOMBRE_INPECTOR` varchar(300) DEFAULT NULL,
  `DIRECCION_INPECTOR` varchar(300) DEFAULT NULL,
  `TELEFONO_INPECTOR` int(11) DEFAULT NULL,
  `EMAIL_INPECTOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_inpsag`
--

CREATE TABLE `fruta_inpsag` (
  `ID_INPSAG` bigint(20) NOT NULL,
  `NUMERO_INPSAG` varchar(45) DEFAULT NULL,
  `CORRELATIVO_INPSAG` int(11) DEFAULT NULL,
  `FECHA_INPSAG` date DEFAULT NULL,
  `CANTIDAD_ENVASE_INPSAG` int(11) DEFAULT NULL,
  `KILOS_NETO_INPSAG` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_INPSAG` decimal(11,2) DEFAULT NULL,
  `CIF_INPSAG` int(11) DEFAULT NULL,
  `OBSERVACION_INPSAG` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `TESTADOSAG` bigint(20) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PAIS1` bigint(20) DEFAULT NULL,
  `ID_PAIS2` bigint(20) DEFAULT NULL,
  `ID_PAIS3` bigint(20) DEFAULT NULL,
  `ID_PAIS4` bigint(20) DEFAULT NULL,
  `ID_INPECTOR` bigint(20) NOT NULL,
  `ID_CONTRAPARTE` bigint(20) NOT NULL,
  `ID_TINPSAG` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_MANEJO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_lcarga`
--

CREATE TABLE `fruta_lcarga` (
  `ID_LCARGA` bigint(20) NOT NULL,
  `NUMERO_LCARGA` int(11) DEFAULT NULL,
  `NOMBRE_LCARGA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_ldestino`
--

CREATE TABLE `fruta_ldestino` (
  `ID_LDESTINO` bigint(20) NOT NULL,
  `NUMERO_LDESTINO` int(11) DEFAULT NULL,
  `NOMBRE_LDESTINO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_leamp`
--

CREATE TABLE `fruta_leamp` (
  `ID_LEVANTAMIENTO` bigint(20) NOT NULL,
  `ID_EXIMATERIAPRIMA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_leapt`
--

CREATE TABLE `fruta_leapt` (
  `ID_LEVANTAMIENTO` bigint(20) NOT NULL,
  `ID_EXIEXPORTACION` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_levantamientomp`
--

CREATE TABLE `fruta_levantamientomp` (
  `ID_LEVANTAMIENTO` bigint(20) NOT NULL,
  `NUMERO_LEVANTAMIENTO` int(11) DEFAULT NULL,
  `FECHA_LEVANTAMIENTO` date DEFAULT NULL,
  `TLEVANTAMIENTO` int(11) DEFAULT NULL,
  `RESPONSBALE_LEVANTAMIENTO` varchar(300) DEFAULT NULL,
  `MOTIVO_LEVANTAMIENTO` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_LEVANTAMIENTO` int(11) DEFAULT NULL,
  `KILOS_NETO_LEVANTAMIENTO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_LEVANTAMIENTO` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_levantamientopt`
--

CREATE TABLE `fruta_levantamientopt` (
  `ID_LEVANTAMIENTO` bigint(20) NOT NULL,
  `NUMERO_LEVANTAMIENTO` int(11) DEFAULT NULL,
  `FECHA_LEVANTAMIENTO` date DEFAULT NULL,
  `TLEVANTAMIENTO` int(11) DEFAULT NULL,
  `RESPONSBALE_LEVANTAMIENTO` varchar(300) DEFAULT NULL,
  `MOTIVO_LEVANTAMIENTO` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_LEVANTAMIENTO` int(11) DEFAULT NULL,
  `KILOS_NETO_LEVANTAMIENTO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_LEVANTAMIENTO` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_mercado`
--

CREATE TABLE `fruta_mercado` (
  `ID_MERCADO` bigint(20) NOT NULL,
  `NUMERO_MERCADO` int(11) DEFAULT NULL,
  `NOMBRE_MERCADO` varchar(100) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_mguiaind`
--

CREATE TABLE `fruta_mguiaind` (
  `ID_MGUIA` bigint(20) NOT NULL,
  `NUMERO_MGUIA` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `NUMERO_GUIA` int(11) DEFAULT NULL,
  `MOTIVO_MGUIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_mguiamp`
--

CREATE TABLE `fruta_mguiamp` (
  `ID_MGUIA` bigint(20) NOT NULL,
  `NUMERO_MGUIA` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `NUMERO_GUIA` int(11) DEFAULT NULL,
  `MOTIVO_MGUIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_mguiapt`
--

CREATE TABLE `fruta_mguiapt` (
  `ID_MGUIA` bigint(20) NOT NULL,
  `NUMERO_MGUIA` int(11) DEFAULT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `NUMERO_GUIA` int(11) DEFAULT NULL,
  `MOTIVO_MGUIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `ID_DESPACHO` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_mventa`
--

CREATE TABLE `fruta_mventa` (
  `ID_MVENTA` bigint(20) NOT NULL,
  `NUMERO_MVENTA` int(11) DEFAULT NULL,
  `NOMBRE_MVENTA` varchar(300) DEFAULT NULL,
  `NOTA_MVENTA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_notadc`
--

CREATE TABLE `fruta_notadc` (
  `ID_NOTA` bigint(20) NOT NULL,
  `NUMERO_NOTA` int(11) DEFAULT NULL,
  `FECHA_NOTA` date DEFAULT NULL,
  `TNOTA` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ICARGA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_notificador`
--

CREATE TABLE `fruta_notificador` (
  `ID_NOTIFICADOR` bigint(20) NOT NULL,
  `NUMERO_NOTIFICADOR` int(11) DEFAULT NULL,
  `NOMBRE_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `EORI_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `DIRECCION_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `TELEFONO_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CONTACTO1_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CARGO1_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `EMAIL1_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CONTACTO2_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CARGO2_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `EMAIL2_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CONTACTO3_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `CARGO3_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `EMAIL3_NOTIFICADOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_pcarga`
--

CREATE TABLE `fruta_pcarga` (
  `ID_PCARGA` bigint(20) NOT NULL,
  `NUMERO_PCARGA` int(11) DEFAULT NULL,
  `NOMBRE_PCARGA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_pcdespacho`
--

CREATE TABLE `fruta_pcdespacho` (
  `ID_PCDESPACHO` bigint(20) NOT NULL,
  `NUMERO_PCDESPACHO` int(11) DEFAULT NULL,
  `MOTIVO_PCDESPACHO` varchar(300) DEFAULT NULL,
  `FECHA_PCDESPACHO` date DEFAULT NULL,
  `FECHA_INGRESO_PCDESPACHO` datetime DEFAULT NULL,
  `FECHA_MODIFCIACION_PCDESPACHO` datetime DEFAULT NULL,
  `CANTIDAD_ENVASE_PCDESPACHO` int(11) DEFAULT NULL,
  `KILOS_NETO_PCDESPACHO` decimal(11,2) DEFAULT NULL,
  `TINPUSDA` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_PCDESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_DESPACHOEX` bigint(20) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_pcdespachomp`
--

CREATE TABLE `fruta_pcdespachomp` (
  `ID_PCDESPACHO` bigint(20) NOT NULL,
  `NUMERO_PCDESPACHO` int(11) DEFAULT NULL,
  `MOTIVO_PCDESPACHO` varchar(300) DEFAULT NULL,
  `FECHA_PCDESPACHO` date DEFAULT NULL,
  `FECHA_INGRESO_PCDESPACHO` datetime DEFAULT NULL,
  `FECHA_MODIFCIACION_PCDESPACHO` datetime DEFAULT NULL,
  `CANTIDAD_ENVASE_PCDESPACHO` int(11) DEFAULT NULL,
  `KILOS_NETO_PCDESPACHO` decimal(11,2) DEFAULT NULL,
  `TINPUSDA` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_PCDESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_DESPACHOEX` bigint(20) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_ESTANDAR` bigint(20) DEFAULT NULL,
  `ID_VARIEDAD` bigint(20) DEFAULT NULL,
  `ID_PROCESOMP` bigint(20) DEFAULT NULL,
  `ID_DESPACHOMP` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_pdestino`
--

CREATE TABLE `fruta_pdestino` (
  `ID_PDESTINO` bigint(20) NOT NULL,
  `NUMERO_PDESTINO` int(11) DEFAULT NULL,
  `NOMBRE_PDESTINO` varchar(300) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_proceso`
--

CREATE TABLE `fruta_proceso` (
  `ID_PROCESO` bigint(20) NOT NULL,
  `NUMERO_PROCESO` int(11) DEFAULT NULL,
  `FECHA_PROCESO` date DEFAULT NULL,
  `TURNO` int(11) DEFAULT NULL,
  `KILOS_NETO_ENTRADA` decimal(11,2) DEFAULT NULL,
  `KILOS_NETO_PROCESO` decimal(11,2) DEFAULT NULL,
  `KILOS_EXPORTACION_PROCESO` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIAL_PROCESO` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIALSC_PROCESO` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIALNC_PROCESO` decimal(11,2) DEFAULT NULL,
  `PDEXPORTACION_PROCESO` decimal(11,2) DEFAULT NULL,
  `PDEXPORTACIONCD_PROCESO` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIAL_PROCESO` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIALSC_PROCESO` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIALNC_PROCESO` decimal(11,2) DEFAULT NULL,
  `PORCENTAJE_PROCESO` varchar(45) DEFAULT NULL,
  `OBSERVACIONE_PROCESO` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_TPROCESO` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_productor`
--

CREATE TABLE `fruta_productor` (
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `NUMERO_PRODUCTOR` int(11) DEFAULT NULL,
  `RUT_PRODUCTOR` varchar(300) DEFAULT NULL,
  `DV_PRODUCTOR` varchar(45) DEFAULT NULL,
  `NOMBRE_PRODUCTOR` varchar(300) DEFAULT NULL,
  `DIRECCION_PRODUCTOR` varchar(300) DEFAULT NULL,
  `TELEFONO_PRODUCTOR` bigint(30) DEFAULT NULL,
  `EMAIL_PRODUCTOR` varchar(300) DEFAULT NULL,
  `GIRO_PRODUCTOR` varchar(300) DEFAULT NULL,
  `CSG_PRODUCTOR` int(11) DEFAULT NULL,
  `GGN_PRODUCTOR` bigint(20) DEFAULT NULL,
  `SDP_PRODUCTOR` int(11) DEFAULT NULL,
  `PRB_PRODUCTOR` int(11) DEFAULT NULL,
  `CODIGO_ASOCIADO_PRODUCTOR` int(11) DEFAULT NULL,
  `NOMBRE_ASOCIADO_PRODUCTOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TPRODUCTOR` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL,
  `ID_PROVINCIA` bigint(20) DEFAULT NULL,
  `ID_REGION` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_reamp`
--

CREATE TABLE `fruta_reamp` (
  `ID_RECHAZO` bigint(20) NOT NULL,
  `ID_EXIMATERIAPRIMA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_reapt`
--

CREATE TABLE `fruta_reapt` (
  `ID_RECHAZO` bigint(20) NOT NULL,
  `ID_EXIEXPORTACION` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_recepcionind`
--

CREATE TABLE `fruta_recepcionind` (
  `ID_RECEPCION` bigint(20) NOT NULL,
  `NUMERO_RECEPCION` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_GUIA_RECEPCION` date DEFAULT NULL,
  `HORA_RECEPCION` varchar(45) DEFAULT NULL,
  `NUMERO_GUIA_RECEPCION` varchar(100) DEFAULT NULL,
  `TOTAL_KILOS_GUIA_RECEPCION` decimal(11,2) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `PATENTE_CAMION` varchar(300) DEFAULT NULL,
  `PATENTE_CARRO` varchar(300) DEFAULT NULL,
  `TRECEPCION` bigint(20) DEFAULT NULL,
  `OBSERVACION_RECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_recepcionmp`
--

CREATE TABLE `fruta_recepcionmp` (
  `ID_RECEPCION` bigint(20) NOT NULL,
  `NUMERO_RECEPCION` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_GUIA_RECEPCION` date DEFAULT NULL,
  `HORA_RECEPCION` varchar(100) DEFAULT NULL,
  `NUMERO_GUIA_RECEPCION` varchar(100) DEFAULT NULL,
  `TOTAL_KILOS_GUIA_RECEPCION` decimal(11,0) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `PATENTE_CAMION` varchar(300) DEFAULT NULL,
  `PATENTE_CARRO` varchar(300) DEFAULT NULL,
  `TRECEPCION` int(11) DEFAULT NULL,
  `OBSERVACION_RECEPCION` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_recepcionpt`
--

CREATE TABLE `fruta_recepcionpt` (
  `ID_RECEPCION` bigint(20) NOT NULL,
  `NUMERO_RECEPCION` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_GUIA_RECEPCION` date DEFAULT NULL,
  `HORA_RECEPCION` varchar(45) DEFAULT NULL,
  `NUMERO_GUIA_RECEPCION` varchar(100) DEFAULT NULL,
  `TOTAL_KILOS_GUIA_RECEPCION` decimal(11,2) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECEPCION` int(11) DEFAULT NULL,
  `KILOS_NETO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_RECEPCION` decimal(11,2) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TRECEPCION` bigint(20) DEFAULT NULL,
  `OBSERVACION_RECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_rechazomp`
--

CREATE TABLE `fruta_rechazomp` (
  `ID_RECHAZO` bigint(20) NOT NULL,
  `NUMERO_RECHAZO` int(11) DEFAULT NULL,
  `FECHA_RECHAZO` date DEFAULT NULL,
  `TRECHAZO` int(11) DEFAULT NULL,
  `RESPONSBALE_RECHAZO` varchar(300) DEFAULT NULL,
  `MOTIVO_RECHAZO` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECHAZO` int(11) DEFAULT NULL,
  `KILOS_NETO_RECHAZO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_RECHAZO` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_rechazopt`
--

CREATE TABLE `fruta_rechazopt` (
  `ID_RECHAZO` bigint(20) NOT NULL,
  `NUMERO_RECHAZO` int(11) DEFAULT NULL,
  `FECHA_RECHAZO` date DEFAULT NULL,
  `TRECHAZO` int(11) DEFAULT NULL,
  `RESPONSBALE_RECHAZO` varchar(300) DEFAULT NULL,
  `MOTIVO_RECHAZO` varchar(300) DEFAULT NULL,
  `CANTIDAD_ENVASE_RECHAZO` int(11) DEFAULT NULL,
  `KILOS_NETO_RECHAZO` decimal(11,2) DEFAULT NULL,
  `KILOS_BRUTO_RECHAZO` decimal(11,2) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_reembalaje`
--

CREATE TABLE `fruta_reembalaje` (
  `ID_REEMBALAJE` bigint(20) NOT NULL,
  `NUMERO_REEMBALAJE` int(11) DEFAULT NULL,
  `FECHA_REEMBALAJE` date DEFAULT NULL,
  `TURNO` int(11) DEFAULT NULL,
  `KILOS_NETO_ENTRADA` decimal(11,2) DEFAULT NULL,
  `KILOS_NETO_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `KILOS_EXPORTACION_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIAL_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIALSC_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `KILOS_INDUSTRIALNC_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PDEXPORTACION_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PDEXPORTACIONCD_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIAL_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIALSC_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PDINDUSTRIALNC_REEMBALAJE` decimal(11,2) DEFAULT NULL,
  `PORCENTAJE_REEMBALAJE` varchar(45) DEFAULT NULL,
  `OBSERVACIONE_REEMBALAJE` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_VESPECIES` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_TREEMBALAJE` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_repaletizajeex`
--

CREATE TABLE `fruta_repaletizajeex` (
  `ID_REPALETIZAJE` bigint(20) NOT NULL,
  `NUMERO_REPALETIZAJE` int(11) DEFAULT NULL,
  `CANTIDAD_ENVASE_REPALETIZAJE` int(11) DEFAULT NULL,
  `KILOS_NETO_REPALETIZAJE` decimal(11,2) DEFAULT NULL,
  `CANTIDAD_ENVASE_ORIGINAL` int(11) DEFAULT NULL,
  `KILOS_NETO_ORIGINAL` decimal(11,2) DEFAULT NULL,
  `MOTIVO_REPALETIZAJE` varchar(100) DEFAULT NULL,
  `SINPSAG` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ESTADO_FOLIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_rfinal`
--

CREATE TABLE `fruta_rfinal` (
  `ID_RFINAL` bigint(20) NOT NULL,
  `NUMERO_RFINAL` int(11) DEFAULT NULL,
  `NOMBRE_RFINAL` varchar(300) DEFAULT NULL,
  `DIRECCION_RFINAL` varchar(300) DEFAULT NULL,
  `CONTACTO1_RFINAL` varchar(300) DEFAULT NULL,
  `CARGO1_RFINAL` varchar(300) DEFAULT NULL,
  `EMAIL1_RFINAL` varchar(300) DEFAULT NULL,
  `CONTACTO2_RFINAL` varchar(300) DEFAULT NULL,
  `CARGO2_RFINAL` varchar(300) DEFAULT NULL,
  `EMAIL2_RFINAL` varchar(300) DEFAULT NULL,
  `CONTACTO3_RFINAL` varchar(300) DEFAULT NULL,
  `CARGO3_RFINAL` varchar(300) DEFAULT NULL,
  `EMAIL3_RFINAL` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_rmercado`
--

CREATE TABLE `fruta_rmercado` (
  `ID_RMERCADO` bigint(20) NOT NULL,
  `NUMERO_RMERCADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_MERCADO` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_seguro`
--

CREATE TABLE `fruta_seguro` (
  `ID_SEGURO` bigint(20) NOT NULL,
  `NUMERO_SEGURO` int(11) DEFAULT NULL,
  `NOMBRE_SEGURO` varchar(300) DEFAULT NULL,
  `ESTIMADO_SEGURO` decimal(11,2) DEFAULT NULL,
  `REAL_SEGURO` decimal(11,2) DEFAULT NULL,
  `SUMA_SEGURO` decimal(11,2) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tcalibre`
--

CREATE TABLE `fruta_tcalibre` (
  `ID_TCALIBRE` bigint(20) NOT NULL,
  `NUMERO_TCALIBRE` int(11) DEFAULT NULL,
  `NOMBRE_TCALIBRE` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ORDEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tcalibreind`
--

CREATE TABLE `fruta_tcalibreind` (
  `ID_TCALIBREIND` int(11) NOT NULL,
  `NUMERO_TCALIBREIND` int(11) DEFAULT NULL,
  `NOMBRE_TCALIBREIND` varchar(200) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) DEFAULT NULL,
  `ID_USUARIOM` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tcategoria`
--

CREATE TABLE `fruta_tcategoria` (
  `ID_TCATEGORIA` bigint(20) NOT NULL,
  `NUMERO_TCATEGORIA` int(11) DEFAULT NULL,
  `NOMBRE_TCATEGORIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tcolor`
--

CREATE TABLE `fruta_tcolor` (
  `ID_TCOLOR` bigint(20) NOT NULL,
  `NUMERO_TCOLOR` int(11) DEFAULT NULL,
  `NOMBRE_TCOLOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tcontenedor`
--

CREATE TABLE `fruta_tcontenedor` (
  `ID_TCONTENEDOR` bigint(20) NOT NULL,
  `NUMERO_TCONTENEDOR` int(11) DEFAULT NULL,
  `NOMBRE_TCONTENEDOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tembalaje`
--

CREATE TABLE `fruta_tembalaje` (
  `ID_TEMBALAJE` bigint(20) NOT NULL,
  `NUMERO_TEMBALAJE` int(11) DEFAULT NULL,
  `NOMBRE_TEMBALAJE` varchar(300) DEFAULT NULL,
  `PESO_TEMBALAJE` decimal(11,2) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tetiqueta`
--

CREATE TABLE `fruta_tetiqueta` (
  `ID_TETIQUETA` bigint(20) NOT NULL,
  `NUMERO_TETIQUETA` int(11) DEFAULT NULL,
  `NOMBRE_TETIQUETA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tflete`
--

CREATE TABLE `fruta_tflete` (
  `ID_TFLETE` bigint(20) NOT NULL,
  `NUMERO_TFLETE` int(11) DEFAULT NULL,
  `NOMBRE_TFLETE` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tinpsag`
--

CREATE TABLE `fruta_tinpsag` (
  `ID_TINPSAG` bigint(20) NOT NULL,
  `NOMBRE_TINPSAG` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tmanejo`
--

CREATE TABLE `fruta_tmanejo` (
  `ID_TMANEJO` bigint(20) NOT NULL,
  `NOMBRE_TMANEJO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tmoneda`
--

CREATE TABLE `fruta_tmoneda` (
  `ID_TMONEDA` bigint(20) NOT NULL,
  `NUMERO_TMONEDA` int(11) DEFAULT NULL,
  `NOMBRE_TMONEDA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tproceso`
--

CREATE TABLE `fruta_tproceso` (
  `ID_TPROCESO` bigint(20) NOT NULL,
  `NOMBRE_TPROCESO` varchar(100) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tproductor`
--

CREATE TABLE `fruta_tproductor` (
  `ID_TPRODUCTOR` bigint(20) NOT NULL,
  `NUMERO_TPRODUCTOR` int(11) DEFAULT NULL,
  `NOMBRE_TPRODUCTOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tratamineto1`
--

CREATE TABLE `fruta_tratamineto1` (
  `ID_TTRATAMIENTO` bigint(20) NOT NULL,
  `NUMERO_TTRATAMIENTO` int(11) DEFAULT NULL,
  `NOMBRE_TTRATAMIENTO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tratamineto2`
--

CREATE TABLE `fruta_tratamineto2` (
  `ID_TTRATAMIENTO` bigint(20) NOT NULL,
  `NUMERO_TTRATAMIENTO` int(11) DEFAULT NULL,
  `NOMBRE_TTRATAMIENTO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_treembalaje`
--

CREATE TABLE `fruta_treembalaje` (
  `ID_TREEMBALAJE` bigint(20) NOT NULL,
  `NOMBRE_TREEMBALAJE` varchar(100) DEFAULT NULL,
  `ESTADO_REGISTRO` varchar(45) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_tservicio`
--

CREATE TABLE `fruta_tservicio` (
  `ID_TSERVICIO` bigint(20) NOT NULL,
  `NUMERO_TSERVICIO` int(11) DEFAULT NULL,
  `NOMBRE_TSERVICIO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta_vespecies`
--

CREATE TABLE `fruta_vespecies` (
  `ID_VESPECIES` bigint(20) NOT NULL,
  `NUMERO_VESPECIES` int(11) DEFAULT NULL,
  `NOMBRE_VESPECIES` varchar(300) DEFAULT NULL,
  `CODIGO_SAG_VESPECIES` varchar(300) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_ESPECIES` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_anticipo`
--

CREATE TABLE `liquidacion_anticipo` (
  `id_anticipo` bigint(20) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_broker` int(11) NOT NULL,
  `estado_registro` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_perfil_usuario` int(11) NOT NULL,
  `id_temporada` int(11) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_ddvalor`
--

CREATE TABLE `liquidacion_ddvalor` (
  `ID_DDVALOR` bigint(20) NOT NULL,
  `VALOR_DDVALOR` int(11) DEFAULT 0,
  `CALIBRE` int(11) DEFAULT 0,
  `ESTANDAR` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ESTANDAR` bigint(20) DEFAULT NULL,
  `ID_TCALIBRE` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_DVALOR` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_dvalor`
--

CREATE TABLE `liquidacion_dvalor` (
  `ID_DVALOR` bigint(20) NOT NULL,
  `VALOR_DVALOR` decimal(22,4) DEFAULT NULL,
  `DETALLE` int(11) DEFAULT 0,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VALOR` bigint(20) NOT NULL,
  `ID_TITEM` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_dvalorp`
--

CREATE TABLE `liquidacion_dvalorp` (
  `ID_DVALOR` bigint(20) NOT NULL,
  `VALOR_DVALOR` decimal(11,2) DEFAULT NULL,
  `FECHA_DVALOR` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_VALOR` bigint(20) NOT NULL,
  `ID_TITEM` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_EMPRESA` int(11) NOT NULL,
  `ID_BROKER` int(11) NOT NULL,
  `ID_TEMPORADA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_titem`
--

CREATE TABLE `liquidacion_titem` (
  `ID_TITEM` bigint(20) NOT NULL,
  `NUMERO_TITEM` int(11) DEFAULT NULL,
  `NOMBRE_TITEM` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `TAITEM` bigint(20) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_valor`
--

CREATE TABLE `liquidacion_valor` (
  `ID_VALOR` bigint(20) NOT NULL,
  `NUMERO_VALOR` int(11) DEFAULT NULL,
  `FECHA_VALOR` date DEFAULT NULL,
  `OBSERVACION_VALOR` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ICARGA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_valorp`
--

CREATE TABLE `liquidacion_valorp` (
  `ID_VALOR` bigint(20) NOT NULL,
  `NUMERO_VALOR` int(11) DEFAULT NULL,
  `FECHA_VALOR` date DEFAULT NULL,
  `OBSERVACION_VALOR` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_ICARGA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_cliente`
--

CREATE TABLE `material_cliente` (
  `ID_CLIENTE` bigint(20) NOT NULL,
  `RUT_CLIENTE` varchar(45) DEFAULT NULL,
  `DV_CLIENTE` varchar(45) DEFAULT NULL,
  `RAZON_CLIENTE` varchar(300) DEFAULT NULL,
  `NUMERO_CLIENTE` int(11) DEFAULT NULL,
  `NOMBRE_CLIENTE` varchar(300) DEFAULT NULL,
  `GIRO_CLIENTE` varchar(300) DEFAULT NULL,
  `DIRECCION_CLIENTE` varchar(300) DEFAULT NULL,
  `TELEFONO_CLIENTE` varchar(45) DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_despachoe`
--

CREATE TABLE `material_despachoe` (
  `ID_DESPACHO` bigint(20) NOT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `NUMERO_DOCUMENTO` varchar(45) DEFAULT NULL,
  `CANTIDAD_DESPACHO` int(11) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TDESPACHO` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(300) DEFAULT NULL,
  `REGALO_DESPACHO` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_DESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TDOCUMENTO` bigint(20) NOT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_BODEGA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_PROVEEDOR` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_COMPRADOR` bigint(20) DEFAULT NULL,
  `ID_DESPACHOMP` bigint(20) DEFAULT NULL,
  `ID_BODEGAO` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_despachom`
--

CREATE TABLE `material_despachom` (
  `ID_DESPACHO` bigint(20) NOT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `NUMERO_DOCUMENTO` varchar(45) DEFAULT NULL,
  `CANTIDAD_DESPACHO` int(11) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TDESPACHO` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(300) DEFAULT NULL,
  `REGALO_DESPACHO` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_DESPACHO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TDOCUMENTO` bigint(20) NOT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_BODEGA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_PROVEEDOR` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_CLIENTE` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_dficha`
--

CREATE TABLE `material_dficha` (
  `ID_DFICHA` bigint(20) NOT NULL,
  `FACTOR_CONSUMO_DFICHA` decimal(11,5) DEFAULT NULL,
  `CONSUMO_PALLET_DFICHA` decimal(11,2) DEFAULT NULL,
  `PALLET_CARGA_DFICHA` int(11) DEFAULT NULL,
  `CONSUMO_CONTENEDOR_DFICHA` decimal(11,2) DEFAULT NULL,
  `OBSERVACIONES_DFICHA` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_FICHA` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_docompra`
--

CREATE TABLE `material_docompra` (
  `ID_DOCOMPRA` bigint(20) NOT NULL,
  `CANTIDAD_DOCOMPRA` int(11) DEFAULT NULL,
  `CANTIDAD_INGRESADA_DOCOMPRA` int(11) DEFAULT NULL,
  `VALOR_UNITARIO_DOCOMPRA` decimal(11,5) DEFAULT NULL,
  `DESCRIPCION_DOCOMPRA` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_OCOMPRA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_drecepcionm`
--

CREATE TABLE `material_drecepcionm` (
  `ID_DRECEPCION` bigint(20) NOT NULL,
  `NUMERO_DRECEPCION` varchar(45) DEFAULT NULL,
  `DESCRIPCION_DRECEPCION` varchar(300) DEFAULT NULL,
  `CANTIDAD_DOCOMPRA` int(11) DEFAULT NULL,
  `CANTIDAD_DRECEPCION` int(11) DEFAULT NULL,
  `VALOR_UNITARIO_DRECEPCION` decimal(11,5) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_RECEPCION` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_DOCOMPRA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_familia`
--

CREATE TABLE `material_familia` (
  `ID_FAMILIA` bigint(20) NOT NULL,
  `NUMERO_FAMILIA` int(11) DEFAULT NULL,
  `NOMBRE_FAMILIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_ficha`
--

CREATE TABLE `material_ficha` (
  `ID_FICHA` bigint(20) NOT NULL,
  `NUMERO_FICHA` int(11) DEFAULT NULL,
  `OBSERVACIONES_FICHA` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_ESTANDAR` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_folio`
--

CREATE TABLE `material_folio` (
  `ID_FOLIO` bigint(20) NOT NULL,
  `NUMERO_FOLIO` int(10) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO` varchar(300) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO` varchar(300) DEFAULT NULL,
  `TFOLIO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_fpago`
--

CREATE TABLE `material_fpago` (
  `ID_FPAGO` bigint(20) NOT NULL,
  `NUMERO_FPAGO` int(11) DEFAULT NULL,
  `NOMBRE_FPAGO` varchar(300) DEFAULT NULL,
  `FECHA_FPAGO` date DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_inventarioe`
--

CREATE TABLE `material_inventarioe` (
  `ID_INVENTARIO` bigint(20) NOT NULL,
  `TRECEPCION` int(11) DEFAULT NULL,
  `VALOR_UNITARIO` decimal(11,5) DEFAULT NULL,
  `CANTIDAD_ENTRADA` int(11) DEFAULT NULL,
  `CANTIDAD_SALIDA` int(11) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_RECEPCION` bigint(20) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) DEFAULT NULL,
  `ID_BODEGA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_DOCOMPRA` bigint(20) DEFAULT NULL,
  `ID_DESPACHO2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_inventariom`
--

CREATE TABLE `material_inventariom` (
  `ID_INVENTARIO` bigint(20) NOT NULL,
  `FOLIO_INVENTARIO` int(11) DEFAULT NULL,
  `FOLIO_AUXILIAR_INVENTARIO` int(11) DEFAULT NULL,
  `ALIAS_DINAMICO_FOLIO` varchar(300) DEFAULT NULL,
  `ALIAS_ESTATICO_FOLIO` varchar(300) DEFAULT NULL,
  `TRECEPCION` int(11) DEFAULT NULL,
  `VALOR_UNITARIO` decimal(11,5) DEFAULT NULL,
  `CANTIDAD_INVENTARIO` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_DESPACHO` date DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `ID_TCONTENEDOR` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_RECEPCION` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PLANTA3` bigint(20) DEFAULT NULL,
  `ID_PROVEEDOR` bigint(20) DEFAULT NULL,
  `ID_OCOMPRA` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) DEFAULT NULL,
  `ID_DESPACHO2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_mguiae`
--

CREATE TABLE `material_mguiae` (
  `ID_MGUIA` bigint(20) NOT NULL,
  `NUMERO_MGUIA` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `NUMERO_DOCUMENTO` int(11) DEFAULT NULL,
  `MOTIVO_MGUIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_mguiam`
--

CREATE TABLE `material_mguiam` (
  `ID_MGUIA` bigint(20) NOT NULL,
  `NUMERO_MGUIA` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `NUMERO_DESPACHO` int(11) DEFAULT NULL,
  `NUMERO_DOCUMENTO` int(11) DEFAULT NULL,
  `MOTIVO_MGUIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_DESPACHO` bigint(20) NOT NULL,
  `ID_PLANTA2` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_mocompra`
--

CREATE TABLE `material_mocompra` (
  `ID_MOCOMPRA` bigint(20) NOT NULL,
  `NUMERO_MOCOMPRA` int(11) DEFAULT NULL,
  `FECHA_INGRESO_MOCOMPRA` datetime DEFAULT NULL,
  `NUMERO_OCOMPRA` int(11) DEFAULT NULL,
  `NUMEROI_OCOMPRA` int(11) DEFAULT NULL,
  `MOTIVO_MOCOMPRA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_OCOMPRA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_ocompra`
--

CREATE TABLE `material_ocompra` (
  `ID_OCOMPRA` bigint(20) NOT NULL,
  `NUMERO_OCOMPRA` int(11) DEFAULT NULL,
  `NUMEROI_OCOMPRA` varchar(300) DEFAULT NULL,
  `FECHA_OCOMPRA` date DEFAULT NULL,
  `TCAMBIO_OCOMPRA` decimal(11,2) DEFAULT NULL,
  `TOTAL_CANTIDAD_OCOMPRA` int(11) DEFAULT NULL,
  `TOTAL_VALOR_OCOMPRA` decimal(11,2) DEFAULT NULL,
  `OBSERVACIONES_OCOMPRA` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_OCOMPRA` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_RESPONSABLE` bigint(20) NOT NULL,
  `ID_PROVEEDOR` bigint(20) NOT NULL,
  `ID_FPAGO` bigint(20) NOT NULL,
  `ID_TMONEDA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_producto`
--

CREATE TABLE `material_producto` (
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `CODIGO_PRODUCTO` varchar(300) DEFAULT NULL,
  `NUMERO_PRODUCTO` int(11) DEFAULT NULL,
  `NOMBRE_PRODUCTO` varchar(300) DEFAULT NULL,
  `OPTIMO` int(11) DEFAULT NULL,
  `CRITICO` int(11) DEFAULT NULL,
  `BAJO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_FAMILIA` bigint(20) NOT NULL,
  `ID_SUBFAMILIA` bigint(20) NOT NULL,
  `ID_ESPECIES` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `CODIGO_MANUAL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_proveedor`
--

CREATE TABLE `material_proveedor` (
  `ID_PROVEEDOR` bigint(20) NOT NULL,
  `RUT_PROVEEDOR` varchar(45) DEFAULT NULL,
  `DV_PROVEEDOR` varchar(45) DEFAULT NULL,
  `RAZON_PROVEEDOR` varchar(300) DEFAULT NULL,
  `NUMERO_PROVEEDOR` int(11) DEFAULT NULL,
  `NOMBRE_PROVEEDOR` varchar(300) DEFAULT NULL,
  `GIRO_PROVEEDOR` varchar(300) DEFAULT NULL,
  `DIRECCION_PROVEEDOR` varchar(300) DEFAULT NULL,
  `TELEFONO_PROVEEDOR` varchar(45) DEFAULT NULL,
  `EMAIL_PROVEEDOR` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_recepcione`
--

CREATE TABLE `material_recepcione` (
  `ID_RECEPCION` bigint(20) NOT NULL,
  `NUMERO_RECEPCION` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `TRECEPCION` int(11) DEFAULT NULL,
  `SNOCOMPRA` int(11) DEFAULT NULL,
  `NUMERO_DOCUMENTO_RECEPCION` varchar(45) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TOTAL_CANTIDAD_RECEPCION` int(11) DEFAULT NULL,
  `OBSERVACIONES_RECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) NOT NULL,
  `ID_TDOCUMENTO` bigint(20) NOT NULL,
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `ID_PROVEEDOR` bigint(20) DEFAULT NULL,
  `ID_OCOMPRA` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_RECEPCIONMP` bigint(20) DEFAULT NULL,
  `ID_RECEPCIONIND` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_recepcionm`
--

CREATE TABLE `material_recepcionm` (
  `ID_RECEPCION` bigint(20) NOT NULL,
  `NUMERO_RECEPCION` int(11) DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `TRECEPCION` int(11) DEFAULT NULL,
  `SNOCOMPRA` int(11) DEFAULT NULL,
  `NUMERO_DOCUMENTO_RECEPCION` varchar(45) DEFAULT NULL,
  `PATENTE_CAMION` varchar(45) DEFAULT NULL,
  `PATENTE_CARRO` varchar(45) DEFAULT NULL,
  `TOTAL_CANTIDAD_RECEPCION` int(11) DEFAULT NULL,
  `OBSERVACIONES_RECEPCION` varchar(300) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `ID_BODEGA` bigint(20) NOT NULL,
  `ID_TDOCUMENTO` bigint(20) DEFAULT NULL,
  `ID_TRANSPORTE` bigint(20) DEFAULT NULL,
  `ID_CONDUCTOR` bigint(20) DEFAULT NULL,
  `ID_PROVEEDOR` bigint(20) DEFAULT NULL,
  `ID_OCOMPRA` bigint(20) DEFAULT NULL,
  `ID_PLANTA2` bigint(20) DEFAULT NULL,
  `ID_PRODUCTOR` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `RESPONSABLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_responsable`
--

CREATE TABLE `material_responsable` (
  `ID_RESPONSABLE` bigint(20) NOT NULL,
  `RUT_RESPONSABLE` varchar(45) DEFAULT NULL,
  `DV_RESPONSABLE` varchar(45) DEFAULT NULL,
  `NUMERO_RESPONSABLE` int(11) DEFAULT NULL,
  `NOMBRE_RESPONSABLE` varchar(300) DEFAULT NULL,
  `DIRECCION_RESPONSABLE` varchar(300) DEFAULT NULL,
  `TELEFONO_RESPONSABLE` varchar(45) DEFAULT NULL,
  `EMAIL_RESPONSABLE` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIO` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_subfamilia`
--

CREATE TABLE `material_subfamilia` (
  `ID_SUBFAMILIA` bigint(20) NOT NULL,
  `NUMERO_SUBFAMILIA` int(11) DEFAULT NULL,
  `NOMBRE_SUBFAMILIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_FAMILIA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_tarjam`
--

CREATE TABLE `material_tarjam` (
  `ID_TARJA` bigint(20) NOT NULL,
  `FOLIO_TARJA` varchar(45) DEFAULT NULL,
  `ALIAS_DINAMICO_TARJA` varchar(300) DEFAULT NULL,
  `ALIAS_ESTATICO_TARJA` varchar(300) DEFAULT NULL,
  `CANITDAD_CONTENEDOR` int(11) DEFAULT NULL,
  `VALOR_UNITARIO` int(11) DEFAULT NULL,
  `CANTIDAD_TARJA` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_RECEPCION` bigint(20) NOT NULL,
  `ID_PRODUCTO` bigint(20) NOT NULL,
  `ID_TCONTENEDOR` bigint(20) NOT NULL,
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `ID_FOLIO` bigint(20) NOT NULL,
  `ID_DRECEPCION` bigint(20) DEFAULT NULL,
  `FOLIOANTERIOR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_tcontenedor`
--

CREATE TABLE `material_tcontenedor` (
  `ID_TCONTENEDOR` bigint(20) NOT NULL,
  `NUMERO_TCONTENEDOR` bigint(20) DEFAULT NULL,
  `NOMBRE_TCONTENEDOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_tdocumento`
--

CREATE TABLE `material_tdocumento` (
  `ID_TDOCUMENTO` bigint(20) NOT NULL,
  `NUMERO_TDOCUMENTO` int(11) DEFAULT NULL,
  `NOMBRE_TDOCUMENTO` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_tmoneda`
--

CREATE TABLE `material_tmoneda` (
  `ID_TMONEDA` bigint(20) NOT NULL,
  `NUMERO_TMONEDA` int(11) DEFAULT NULL,
  `NOMBRE_TMONEDA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_tumedida`
--

CREATE TABLE `material_tumedida` (
  `ID_TUMEDIDA` bigint(20) NOT NULL,
  `NUMERO_TUMEDIDA` bigint(20) DEFAULT NULL,
  `NOMBRE_TUMEDIDA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_bodega`
--

CREATE TABLE `principal_bodega` (
  `ID_BODEGA` bigint(20) NOT NULL,
  `NOMBRE_BODEGA` varchar(300) DEFAULT NULL,
  `NOMBRE_CONTACTO_BODEGA` varchar(300) DEFAULT NULL,
  `PRINCIPAL` int(11) DEFAULT 0,
  `ENVASES` int(11) DEFAULT 0,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_PLANTA` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `SUBBODEGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_empresa`
--

CREATE TABLE `principal_empresa` (
  `ID_EMPRESA` bigint(20) NOT NULL,
  `RUT_EMPRESA` int(11) DEFAULT NULL,
  `DV_EMPRESA` varchar(45) DEFAULT NULL,
  `NOMBRE_EMPRESA` varchar(255) DEFAULT NULL,
  `RAZON_SOCIAL_EMPRESA` varchar(255) DEFAULT NULL,
  `DIRECCION_EMPRESA` varchar(255) DEFAULT NULL,
  `GIRO_EMPRESA` varchar(255) DEFAULT NULL,
  `TELEFONO_EMPRESA` varchar(255) DEFAULT NULL,
  `ENCARGADO_COMPRA_EMPRESA` varchar(255) DEFAULT NULL,
  `LOGO_EMPRESA` varchar(255) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL,
  `ID_PROVINCIA` bigint(20) DEFAULT NULL,
  `ID_REGION` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `COC` varchar(255) DEFAULT NULL,
  `FOLIO_MANUAL` int(11) DEFAULT NULL,
  `USO_CALIBRE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_planta`
--

CREATE TABLE `principal_planta` (
  `ID_PLANTA` bigint(20) NOT NULL,
  `NOMBRE_PLANTA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_PLANTA` varchar(300) DEFAULT NULL,
  `DIRECCION_PLANTA` varchar(300) DEFAULT NULL,
  `CODIGO_SAG_PLANTA` int(11) DEFAULT NULL,
  `FDA_PLANTA` bigint(20) DEFAULT NULL,
  `TPLANTA` int(11) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_COMUNA` bigint(20) DEFAULT NULL,
  `ID_PROVINCIA` bigint(20) DEFAULT NULL,
  `ID_REGION` bigint(20) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_temporada`
--

CREATE TABLE `principal_temporada` (
  `ID_TEMPORADA` bigint(20) NOT NULL,
  `FECHA_INICIO_TEMPORADA` date DEFAULT NULL,
  `FECHA_TERMINO_TEMPORADA` date DEFAULT NULL,
  `NOMBRE_TEMPORADA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `recepcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `recepcion` (
`FOLIO_DRECEPCION` bigint(20)
,`CANTIDAD_ENVASE_DRECEPCION` int(11)
,`KILOS_NETO_DRECEPCION` decimal(11,2)
,`NOMBRE_VESPECIES` varchar(300)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_calidad`
--

CREATE TABLE `registro_calidad` (
  `ID` int(11) NOT NULL,
  `FOLIO` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `ID_USUARIO` varchar(255) DEFAULT NULL,
  `TIPO` int(11) DEFAULT NULL,
  `BAXLO_PROMEDIO` varchar(255) DEFAULT NULL,
  `PESO_10_FRUTOS` varchar(255) DEFAULT NULL,
  `TEMPERATURA` varchar(255) DEFAULT NULL,
  `BRIX` varchar(255) DEFAULT NULL,
  `PUDRICION_MICELIO` varchar(255) DEFAULT NULL,
  `HERIDAS_ABIERTAS` varchar(255) DEFAULT NULL,
  `DESHIDRATACION` varchar(255) DEFAULT NULL,
  `EXUDACION_JUGO` varchar(255) DEFAULT NULL,
  `BLANDO` varchar(255) DEFAULT NULL,
  `MACHUCON` varchar(255) DEFAULT NULL,
  `INMADURA_ROJA` varchar(255) DEFAULT NULL,
  `QC_CALIDAD` varchar(255) DEFAULT NULL,
  `QC_CONDICION` varchar(255) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `ID_EMPRESA` varchar(255) DEFAULT NULL,
  `Folioex` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_documento`
--

CREATE TABLE `tb_documento` (
  `id_documento` int(11) NOT NULL,
  `productor_documento` int(11) DEFAULT NULL,
  `estado_documento` int(11) DEFAULT NULL,
  `nombre_documento` mediumtext DEFAULT NULL,
  `create_documento` datetime DEFAULT NULL,
  `update_documento` datetime DEFAULT NULL,
  `archivo_documento` mediumtext DEFAULT NULL,
  `vigencia_documento` date DEFAULT NULL,
  `especie_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_aeronave`
--

CREATE TABLE `transporte_aeronave` (
  `ID_AERONAVE` bigint(20) NOT NULL,
  `NUMERO_AERONAVE` int(11) DEFAULT NULL,
  `NOMBRE_AERONAVE` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_LAEREA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_conductor`
--

CREATE TABLE `transporte_conductor` (
  `ID_CONDUCTOR` bigint(20) NOT NULL,
  `NUMERO_CONDUCTOR` int(11) DEFAULT NULL,
  `RUT_CONDUCTOR` varchar(300) DEFAULT NULL,
  `DV_CONDUCTOR` varchar(45) DEFAULT NULL,
  `NOMBRE_CONDUCTOR` varchar(300) DEFAULT NULL,
  `TELEFONO_CONDUCTOR` bigint(20) DEFAULT NULL,
  `EMAIL_CONDUCTOR` varchar(300) DEFAULT NULL,
  `NOTA_CONDUCTOR` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_laerea`
--

CREATE TABLE `transporte_laerea` (
  `ID_LAEREA` bigint(20) NOT NULL,
  `NUMERO_LAEREA` int(11) DEFAULT NULL,
  `RUT_LAEREA` varchar(20) DEFAULT NULL,
  `DV_LAEREA` varchar(45) DEFAULT NULL,
  `NOMBRE_LAEREA` varchar(300) DEFAULT NULL,
  `GIRO_LAEREA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_LAEREA` varchar(300) DEFAULT NULL,
  `DIRECCION_LAEREA` varchar(300) DEFAULT NULL,
  `CONTACTO_LAEREA` varchar(300) DEFAULT NULL,
  `TELEFONO_LAEREA` int(11) DEFAULT NULL,
  `EMAIL_LAEREA` varchar(300) DEFAULT NULL,
  `NOTA_LAEREA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_naviera`
--

CREATE TABLE `transporte_naviera` (
  `ID_NAVIERA` bigint(20) NOT NULL,
  `NUMERO_NAVIERA` int(11) DEFAULT NULL,
  `RUT_NAVIERA` varchar(300) DEFAULT NULL,
  `DV_NAVIERA` varchar(45) DEFAULT NULL,
  `NOMBRE_NAVIERA` varchar(300) DEFAULT NULL,
  `GIRO_NAVIERA` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_NAVIERA` varchar(300) DEFAULT NULL,
  `DIRECCION_NAVIERA` varchar(300) DEFAULT NULL,
  `CONTACTO_NAVIERA` varchar(300) DEFAULT NULL,
  `TELEFONO_NAVIERA` int(11) DEFAULT NULL,
  `EMAIL_NAVIERA` varchar(300) DEFAULT NULL,
  `NOTA_NAVIERA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_transporte`
--

CREATE TABLE `transporte_transporte` (
  `ID_TRANSPORTE` bigint(20) NOT NULL,
  `NUMERO_TRANSPORTE` int(11) DEFAULT NULL,
  `RUT_TRANSPORTE` varchar(20) DEFAULT NULL,
  `DV_TRANSPORTE` varchar(45) DEFAULT NULL,
  `NOMBRE_TRANSPORTE` varchar(300) DEFAULT NULL,
  `GIRO_TRANSPORTE` varchar(300) DEFAULT NULL,
  `RAZON_SOCIAL_TRANSPORTE` varchar(300) DEFAULT NULL,
  `DIRECCION_TRANSPORTE` varchar(300) DEFAULT NULL,
  `CONTACTO_TRANSPORTE` varchar(300) DEFAULT NULL,
  `TELEFONO_TRANSPORTE` int(11) DEFAULT NULL,
  `EMAIL_TRANSPORTE` varchar(45) DEFAULT NULL,
  `NOTA_TRANSPORTE` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_ciudad`
--

CREATE TABLE `ubicacion_ciudad` (
  `ID_CIUDAD` bigint(20) NOT NULL,
  `NOMBRE_CIUDAD` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_COMUNA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_comuna`
--

CREATE TABLE `ubicacion_comuna` (
  `ID_COMUNA` bigint(20) NOT NULL,
  `NOMBRE_COMUNA` varchar(45) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_PROVINCIA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_pais`
--

CREATE TABLE `ubicacion_pais` (
  `ID_PAIS` bigint(20) NOT NULL,
  `CODIGO_SAG_PAIS` int(11) DEFAULT NULL,
  `NOMBRE_PAIS` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_provincia`
--

CREATE TABLE `ubicacion_provincia` (
  `ID_PROVINCIA` bigint(20) NOT NULL,
  `NOMBRE_PROVINCIA` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_REGION` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_region`
--

CREATE TABLE `ubicacion_region` (
  `ID_REGION` bigint(20) NOT NULL,
  `NOMBRE_REGION` varchar(300) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` date DEFAULT NULL,
  `MODIFICACION` date DEFAULT NULL,
  `ID_PAIS` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_ausuario`
--

CREATE TABLE `usuario_ausuario` (
  `ID_AUSUARIO` bigint(20) NOT NULL,
  `NUMERO_REGISTRO` varchar(300) DEFAULT NULL,
  `TMODULO` varchar(300) DEFAULT NULL,
  `TOPERACION` varchar(300) DEFAULT NULL,
  `MENSAJE` varchar(300) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `TABLA` varchar(300) DEFAULT NULL,
  `ID_REGISTRO` bigint(20) DEFAULT NULL,
  `ID_USUARIO` bigint(20) DEFAULT NULL,
  `ID_EMPRESA` bigint(20) DEFAULT NULL,
  `ID_PLANTA` bigint(20) DEFAULT NULL,
  `ID_TEMPORADA` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_aviso`
--

CREATE TABLE `usuario_aviso` (
  `ID_AVISO` bigint(20) NOT NULL,
  `DIA_INICIO` int(11) DEFAULT NULL,
  `DIA_TERMINO` int(11) DEFAULT NULL,
  `MENSAJE` varchar(300) DEFAULT NULL,
  `TAVISO` int(11) DEFAULT NULL,
  `TPRIORIDAD` int(11) DEFAULT NULL,
  `FECHA_TERMINO` date DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empresaproductor`
--

CREATE TABLE `usuario_empresaproductor` (
  `ID_EMPRESAPRODUCTOR` bigint(20) NOT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL,
  `ID_USUARIO` bigint(20) NOT NULL,
  `ID_EMPRESA` bigint(20) NOT NULL,
  `ID_PRODUCTOR` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_mapertura`
--

CREATE TABLE `usuario_mapertura` (
  `ID_MAPERTURA` bigint(20) NOT NULL,
  `MOTIVO_MAPERTURA` varchar(300) DEFAULT NULL,
  `TABLA` varchar(300) DEFAULT NULL,
  `ID_REGISTRO` bigint(20) DEFAULT NULL,
  `ID_USUARIO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_notificacion`
--

CREATE TABLE `usuario_notificacion` (
  `ID_NOTIFICACION` int(11) NOT NULL,
  `MENSAJE` text NOT NULL,
  `DESTINO_TIPO` varchar(20) NOT NULL,
  `DESTINO_ID` int(11) DEFAULT NULL,
  `PRIORIDAD` tinyint(4) DEFAULT 2,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `LEIDO` tinyint(4) DEFAULT 0,
  `INGRESO` datetime DEFAULT current_timestamp(),
  `MODIFICACION` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ESTADO_REGISTRO` tinyint(4) DEFAULT 1,
  `ID_USUARIOI` int(11) DEFAULT NULL,
  `ID_USUARIOM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_ptusuario`
--

CREATE TABLE `usuario_ptusuario` (
  `ID_PTUSUARIO` bigint(20) NOT NULL,
  `FRUTA` tinyint(4) DEFAULT 0,
  `FAVISO` tinyint(4) DEFAULT 0,
  `FRABIERTO` tinyint(4) DEFAULT 0,
  `FGRANEL` tinyint(4) DEFAULT 0,
  `FGRECEPCION` tinyint(4) DEFAULT 0,
  `FGDESPACHO` tinyint(4) DEFAULT 0,
  `FGGUIA` tinyint(4) DEFAULT 0,
  `FPACKING` tinyint(4) DEFAULT 0,
  `FPPROCESO` tinyint(4) DEFAULT 0,
  `FPREEMBALEJE` tinyint(4) DEFAULT 0,
  `FSAG` tinyint(4) DEFAULT 0,
  `FSAGINSPECCION` tinyint(4) DEFAULT 0,
  `FFRIGORIFICO` tinyint(4) DEFAULT 0,
  `FFRECEPCION` tinyint(4) DEFAULT 0,
  `FFRDESPACHO` tinyint(4) DEFAULT 0,
  `FFRGUIA` tinyint(4) DEFAULT 0,
  `FFRREPALETIZAJE` tinyint(4) DEFAULT 0,
  `FFRPC` tinyint(4) DEFAULT 0,
  `FFRCFOLIO` tinyint(4) DEFAULT 0,
  `FCFRUTA` tinyint(4) DEFAULT 0,
  `FCFRECHAZO` tinyint(4) DEFAULT 0,
  `FCFLEVANTAMIENTO` tinyint(4) DEFAULT 0,
  `FEXISTENCIA` tinyint(4) DEFAULT 0,
  `MATERIALES` tinyint(4) DEFAULT 0,
  `MRABIERTO` tinyint(4) DEFAULT 0,
  `MMATERIALES` tinyint(4) DEFAULT 0,
  `MMRECEPION` tinyint(4) DEFAULT 0,
  `MMDEAPCHO` tinyint(4) DEFAULT 0,
  `MMGUIA` tinyint(4) DEFAULT 0,
  `MENVASE` tinyint(4) DEFAULT 0,
  `MERECEPCION` tinyint(4) DEFAULT 0,
  `MEDESPACHO` tinyint(4) DEFAULT 0,
  `MEGUIA` tinyint(4) DEFAULT 0,
  `MADMINISTRACION` tinyint(4) DEFAULT 0,
  `MAOC` tinyint(4) DEFAULT 0,
  `MAOCAR` tinyint(4) DEFAULT 0,
  `MKARDEX` tinyint(4) DEFAULT 0,
  `MKMATERIAL` tinyint(4) DEFAULT 0,
  `MKENVASE` tinyint(4) DEFAULT 0,
  `EXPORTADORA` tinyint(4) DEFAULT 0,
  `EMATERIALES` tinyint(4) DEFAULT 0,
  `EEXPORTACION` tinyint(4) DEFAULT 0,
  `ELIQUIDACION` tinyint(4) DEFAULT 0,
  `EPAGO` tinyint(4) DEFAULT 0,
  `EFRUTA` tinyint(4) DEFAULT 0,
  `EFCICARGA` tinyint(4) DEFAULT 0,
  `EINFORMES` tinyint(4) DEFAULT 0,
  `ESTADISTICA` tinyint(4) DEFAULT 0,
  `ESTARVSP` tinyint(4) DEFAULT 0,
  `ESTASTOPMP` tinyint(4) DEFAULT 0,
  `ESTAINFORME` tinyint(4) DEFAULT 0,
  `ESTAEXISTENCIA` tinyint(4) DEFAULT 0,
  `ESTAPRODUCTOR` tinyint(4) DEFAULT 0,
  `MANTENEDORES` tinyint(4) DEFAULT 0,
  `MREGISTRO` tinyint(4) DEFAULT 0,
  `MEDITAR` tinyint(4) DEFAULT 0,
  `MVER` tinyint(4) DEFAULT 0,
  `MAGRUPADO` tinyint(4) DEFAULT 0,
  `ADMINISTRADOR` tinyint(4) DEFAULT 0,
  `ADUSUARIO` tinyint(4) DEFAULT 0,
  `ADAPERTURA` tinyint(4) DEFAULT 0,
  `ADAVISO` tinyint(4) DEFAULT 0,
  `ESTADO_REGISTRO` int(11) DEFAULT 1,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TUSUARIO` bigint(20) NOT NULL,
  `ID_USUARIOI` bigint(20) NOT NULL,
  `ID_USUARIOM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tusuario`
--

CREATE TABLE `usuario_tusuario` (
  `ID_TUSUARIO` bigint(20) NOT NULL,
  `NOMBRE_TUSUARIO` varchar(100) DEFAULT NULL,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_USUARIOI` bigint(20) DEFAULT NULL,
  `ID_USUARIOM` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuario`
--

CREATE TABLE `usuario_usuario` (
  `ID_USUARIO` bigint(20) NOT NULL,
  `NOMBRE_USUARIO` varchar(100) DEFAULT NULL,
  `PNOMBRE_USUARIO` varchar(300) DEFAULT NULL,
  `SNOMBRE_USUARIO` varchar(300) DEFAULT NULL,
  `PAPELLIDO_USUARIO` varchar(300) DEFAULT NULL,
  `SAPELLIDO_USUARIO` varchar(300) DEFAULT NULL,
  `CONTRASENA_USUARIO` longtext DEFAULT NULL,
  `EMAIL_USUARIO` varchar(300) DEFAULT NULL,
  `TELEFONO_USUARIO` bigint(30) DEFAULT NULL,
  `NINTENTO` int(11) DEFAULT 0,
  `ESTADO_REGISTRO` int(11) DEFAULT NULL,
  `INGRESO` datetime DEFAULT NULL,
  `MODIFICACION` datetime DEFAULT NULL,
  `ID_TUSUARIO` bigint(20) NOT NULL,
  `NIVEL_USUARIO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `⁠ fruta_pcdespachomp ⁠`
--

CREATE TABLE `⁠ fruta_pcdespachomp ⁠` (
  `⁠ ID_PCDESPACHO ⁠` bigint(20) NOT NULL,
  `⁠ NUMERO_PCDESPACHO ⁠` int(11) DEFAULT NULL,
  `⁠ MOTIVO_PCDESPACHO ⁠` varchar(300) DEFAULT NULL,
  `⁠ FECHA_PCDESPACHO ⁠` date DEFAULT NULL,
  `⁠ FECHA_INGRESO_PCDESPACHO ⁠` datetime DEFAULT NULL,
  `⁠ FECHA_MODIFCIACION_PCDESPACHO ⁠` datetime DEFAULT NULL,
  `⁠ CANTIDAD_ENVASE_PCDESPACHO ⁠` int(11) DEFAULT NULL,
  `⁠ KILOS_NETO_PCDESPACHO ⁠` decimal(11,2) DEFAULT NULL,
  `⁠ TINPUSDA ⁠` int(11) DEFAULT 0,
  `⁠ ESTADO ⁠` int(11) DEFAULT NULL,
  `⁠ ESTADO_PCDESPACHO ⁠` int(11) DEFAULT NULL,
  `⁠ ESTADO_REGISTRO ⁠` int(11) DEFAULT NULL,
  `⁠ INGRESO ⁠` datetime DEFAULT NULL,
  `⁠ MODIFICACION ⁠` datetime DEFAULT NULL,
  `⁠ ID_DESPACHOEX ⁠` bigint(20) DEFAULT NULL,
  `⁠ ID_EMPRESA ⁠` bigint(20) NOT NULL,
  `⁠ ID_PLANTA ⁠` bigint(20) NOT NULL,
  `⁠ ID_TEMPORADA ⁠` bigint(20) NOT NULL,
  `⁠ ID_USUARIOI ⁠` bigint(20) NOT NULL,
  `⁠ ID_USUARIOM ⁠` bigint(20) NOT NULL,
  `⁠ ID_PRODUCTOR ⁠` bigint(20) DEFAULT NULL,
  `⁠ ID_ESTANDAR ⁠` bigint(20) DEFAULT NULL,
  `⁠ ID_VARIEDAD ⁠` bigint(20) DEFAULT NULL,
  `⁠ ID_PROCESOMP ⁠` bigint(20) DEFAULT NULL,
  `⁠ ID_DESPACHOMP ⁠` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura para la vista `recepcion`
--
DROP TABLE IF EXISTS `recepcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recepcion`  AS   (select `fruta_drecepcionmp`.`FOLIO_DRECEPCION` AS `FOLIO_DRECEPCION`,`fruta_drecepcionmp`.`CANTIDAD_ENVASE_DRECEPCION` AS `CANTIDAD_ENVASE_DRECEPCION`,`fruta_drecepcionmp`.`KILOS_NETO_DRECEPCION` AS `KILOS_NETO_DRECEPCION`,`fruta_vespecies`.`NOMBRE_VESPECIES` AS `NOMBRE_VESPECIES` from (`fruta_drecepcionmp` join `fruta_vespecies` on(`fruta_drecepcionmp`.`ID_VESPECIES` = `fruta_vespecies`.`ID_VESPECIES`)))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `control_eap`
--
ALTER TABLE `control_eap`
  ADD PRIMARY KEY (`ID_EAP`),
  ADD KEY `fk_control_eap_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_control_eap_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_control_eap_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_control_eap_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `control_eau`
--
ALTER TABLE `control_eau`
  ADD PRIMARY KEY (`ID_EAU`),
  ADD KEY `fk_control_eau_princiapl_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_control_eau_usuario_usuario_idx` (`ID_USUARIO`),
  ADD KEY `fk_control_eau_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_control_eau_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `descripcion_servicios`
--
ALTER TABLE `descripcion_servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `detalle_anticipo`
--
ALTER TABLE `detalle_anticipo`
  ADD PRIMARY KEY (`id_detalle_anticipo`);

--
-- Indices de la tabla `empresa_proceso`
--
ALTER TABLE `empresa_proceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estandar_ecomercial`
--
ALTER TABLE `estandar_ecomercial`
  ADD PRIMARY KEY (`ID_ECOMERCIAL`),
  ADD KEY `fk_estandar_ecomercial_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_estandar_ecomercial_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_estandar_ecomercial_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `estandar_eexportacion`
--
ALTER TABLE `estandar_eexportacion`
  ADD PRIMARY KEY (`ID_ESTANDAR`),
  ADD KEY `fk_estandar_eexportacion_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_estandar_eexportacion_fruta_especies_idx` (`ID_ESPECIES`),
  ADD KEY `fk_estandar_eexportacion_fruta_tetiqueta_idx` (`ID_TETIQUETA`),
  ADD KEY `fk_estandar_eexportacion_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_estandar_eexportacion_estandar_ecomercial_idx` (`ID_ECOMERCIAL`),
  ADD KEY `fk_estandar_eexportacion_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_estandar_eexportacion_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `estandar_eindustrial`
--
ALTER TABLE `estandar_eindustrial`
  ADD PRIMARY KEY (`ID_ESTANDAR`),
  ADD KEY `fk_estandar_eindustrial_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_estandar_eindustrial_fruta_especies_idx` (`ID_ESPECIES`),
  ADD KEY `fk_estandar_eindustrial_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_estandar_eindustrial_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_estandar_eindustrial_material_producto_idx` (`ID_PRODUCTO`);

--
-- Indices de la tabla `estandar_erecepcion`
--
ALTER TABLE `estandar_erecepcion`
  ADD PRIMARY KEY (`ID_ESTANDAR`),
  ADD KEY `fk_estandar_erecepcion_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_estandar_erecepcion_fruta_especies_idx` (`ID_ESPECIES`),
  ADD KEY `fk_estandar_erecepcion_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_estandar_erecepcion_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_estandar_erecepcion_material_producto_idx` (`ID_PRODUCTO`);

--
-- Indices de la tabla `fruta_aaduana`
--
ALTER TABLE `fruta_aaduana`
  ADD PRIMARY KEY (`ID_AADUANA`),
  ADD KEY `fk_fruta_aaduana_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_aaduana_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_aaduana_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_aaduana_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_acarga`
--
ALTER TABLE `fruta_acarga`
  ADD PRIMARY KEY (`ID_ACARGA`),
  ADD KEY `fk_fruta_acarga_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_acarga_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_acarga_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_adestino`
--
ALTER TABLE `fruta_adestino`
  ADD PRIMARY KEY (`ID_ADESTINO`),
  ADD KEY `fk_fruta_adestino_principal_empres_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_adestino_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_adestino_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_agcarga`
--
ALTER TABLE `fruta_agcarga`
  ADD PRIMARY KEY (`ID_AGCARGA`),
  ADD KEY `fk_fruta_agcarga_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_agcarga_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_agcarga_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_agcarga_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_atmosfera`
--
ALTER TABLE `fruta_atmosfera`
  ADD PRIMARY KEY (`ID_ATMOSFERA`),
  ADD KEY `fk_fruta_atmosfera_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_atmosfera_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_atmosfera_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_broker`
--
ALTER TABLE `fruta_broker`
  ADD PRIMARY KEY (`ID_BROKER`),
  ADD KEY `fk_fruta_broker_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_broker_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_broker_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_ccalidad`
--
ALTER TABLE `fruta_ccalidad`
  ADD PRIMARY KEY (`ID_CCALIDAD`),
  ADD KEY `fk_fruta_ccalidad_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_ccalidad_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_ccalidad_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_cfolio`
--
ALTER TABLE `fruta_cfolio`
  ADD PRIMARY KEY (`ID_CFOLIO`),
  ADD KEY `fk_fruta_cfolio_usuario_usuario_idx` (`ID_USUARIO`),
  ADD KEY `fk_fruta_cfolio_fruta_exiexportacion_idx` (`ID_EXIEXPORTACION`);

--
-- Indices de la tabla `fruta_cicarga`
--
ALTER TABLE `fruta_cicarga`
  ADD PRIMARY KEY (`ID_CICARGA`),
  ADD KEY `fk_fruta_cicarga_fruta_icargao_idx` (`ID_ICARGAO`),
  ADD KEY `fk_fruta_cicarga_fruta_icargad_idx` (`ID_ICARGAN`),
  ADD KEY `fk_fruta_cicarga_fruta_exiexportacion_idx` (`ID_EXIEXPORTACION`),
  ADD KEY `fk_fruta_cicarga_usuario_usuario_idx` (`ID_USUARIO`);

--
-- Indices de la tabla `fruta_comprador`
--
ALTER TABLE `fruta_comprador`
  ADD PRIMARY KEY (`ID_COMPRADOR`),
  ADD KEY `fk_fruta_comprador_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_comprador_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_comprador_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_comprador_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_consignatario`
--
ALTER TABLE `fruta_consignatario`
  ADD PRIMARY KEY (`ID_CONSIGNATARIO`),
  ADD KEY `fk_fruta_consignatario_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_consignatario_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_consignatario_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_contraparte`
--
ALTER TABLE `fruta_contraparte`
  ADD PRIMARY KEY (`ID_CONTRAPARTE`),
  ADD KEY `fk_fruta_contraparte_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_contraparte_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_contraparte_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_contraparte_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_cuartel`
--
ALTER TABLE `fruta_cuartel`
  ADD PRIMARY KEY (`ID_CUARTEL`),
  ADD KEY `fk_fruta_cuartel_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_cuartel_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_cuartel_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_cuartel_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_cventa`
--
ALTER TABLE `fruta_cventa`
  ADD PRIMARY KEY (`ID_CVENTA`),
  ADD KEY `fk_fruta_cventa_principal_emrpresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_cventa_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_cventa_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_despachoex`
--
ALTER TABLE `fruta_despachoex`
  ADD PRIMARY KEY (`ID_DESPACHOEX`),
  ADD KEY `fk_fruta_despachoex_fruta_inpector_idx` (`ID_INPECTOR`),
  ADD KEY `fk_fruta_despachoex_fruta_icarga_idx` (`ID_ICARGA`),
  ADD KEY `fk_fruta_despachoex_fruta_dfinal_idx` (`ID_DFINAL`),
  ADD KEY `fk_fruta_despachoex_fruta_exportadora_idx` (`ID_EXPPORTADORA`),
  ADD KEY `fk_fruta_despachoex_fruta_rfinal_idx` (`ID_RFINAL`),
  ADD KEY `fk_fruta_despachoex_fruta_agcarga_idx` (`ID_AGCARGA`),
  ADD KEY `fk_fruta_despachoex_fruta_mercado_idx` (`ID_MERCADO`),
  ADD KEY `fk_fruta_despachoex_ubicacion_pais_idx` (`ID_PAIS`),
  ADD KEY `fk_fruta_despachoex_transporte_transporte2_idx` (`ID_TRANSPORTE2`),
  ADD KEY `fk_fruta_despachoex_fruta_lcarga_idx` (`ID_LCARGA`),
  ADD KEY `fk_fruta_despachoex_fruta_ldestino_idx` (`ID_LDESTINO`),
  ADD KEY `fk_fruta_despachoex_transporte_larea_idx` (`ID_LAREA`),
  ADD KEY `fk_fruta_despachoex_transporte_aeronave_idx` (`ID_AERONAVE`),
  ADD KEY `fk_fruta_despachoex_fruta_acarga_idx` (`ID_ACARGA`),
  ADD KEY `fk_fruta_despachoex_fruta_adestino_idx` (`ID_ADESTINO`),
  ADD KEY `fk_fruta_despachoex_transporte_naviera_idx` (`ID_NAVIERA`),
  ADD KEY `fk_fruta_despachoex_fruta_pcarga_idx` (`ID_PCARGA`),
  ADD KEY `fk_fruta_despachoex_fruta_pdestino_idx` (`ID_PDESTINO`),
  ADD KEY `fk_fruta_despachoex_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_despachoex_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_despachoex_fruta_contraparte_idx` (`ID_CONTRAPARTE`),
  ADD KEY `fk_fruta_despachoex_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_despachoex_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_despachoex_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_despachoex_usuario_usuaioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_despachoex_usuario_usuaiom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_despachoind`
--
ALTER TABLE `fruta_despachoind`
  ADD PRIMARY KEY (`ID_DESPACHO`),
  ADD KEY `fk_fruta_despachoind_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_despachoind_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_despachoind_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_despachoind_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_despachoind_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_despachoind_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_despachoind_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_despachoind_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_despachoind_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_despachoind_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_fruta_despachoind_fruta_comprador_idx` (`ID_COMPRADOR`);

--
-- Indices de la tabla `fruta_despachomp`
--
ALTER TABLE `fruta_despachomp`
  ADD PRIMARY KEY (`ID_DESPACHO`),
  ADD KEY `fk_fruta_despachomp_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_despachomp_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_despachomp_fruta_comprador_idx` (`ID_COMPRADOR`),
  ADD KEY `fk_fruta_despachomp_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_despachomp_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_despachomp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_despachomp_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_despachomp_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_despachomp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_despachomp_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_despachomp_fruta_planta3_idx` (`ID_PLANTA3`);

--
-- Indices de la tabla `fruta_despachopt`
--
ALTER TABLE `fruta_despachopt`
  ADD PRIMARY KEY (`ID_DESPACHO`),
  ADD KEY `fk_fruta_despachopt_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_despachopt_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_despachopt_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_despachopt_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_despachopt_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_despachopt_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_despachopt_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_despachopt_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_despachopt_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_despachopt_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_fruta_despachopt_fruta_comprador_idx` (`ID_COMPRADOR`);

--
-- Indices de la tabla `fruta_dfinal`
--
ALTER TABLE `fruta_dfinal`
  ADD PRIMARY KEY (`ID_DFINAL`),
  ADD KEY `fk_fruta_dfinal_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_dfinal_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_dfinal_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_dicarga`
--
ALTER TABLE `fruta_dicarga`
  ADD PRIMARY KEY (`ID_DICARGA`),
  ADD KEY `fk_fruta_dicarga_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_dicarga_fruta_icarga_idx` (`ID_ICARGA`),
  ADD KEY `fk_fruta_dicarga_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_dicarga_fruta_tmoneda_idx` (`ID_TMONEDA`),
  ADD KEY `fk_fruta_dicarga_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_dicarga_fruta_vespecies_idx` (`ID_VESPECIES`);

--
-- Indices de la tabla `fruta_dnotadc`
--
ALTER TABLE `fruta_dnotadc`
  ADD PRIMARY KEY (`ID_DNOTA`),
  ADD KEY `fk_fruta_dnotadc_fruta_dicarga_idx` (`ID_DICARGA`),
  ADD KEY `fk_fruta_dnotadc_fruta_notadc_idx` (`ID_NOTA`);

--
-- Indices de la tabla `fruta_dpexportacion`
--
ALTER TABLE `fruta_dpexportacion`
  ADD PRIMARY KEY (`ID_DPEXPORTACION`),
  ADD KEY `fk_fruta_dpexportacion_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_dpexportacion_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_dpexportacion_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_dpexportacion_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_dpexportacion_fruta_proceso_idx` (`ID_PROCESO`),
  ADD KEY `fk_fruta_dpexportacion_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_dpexportacion_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_dpexportacion_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_dpexportacion_fruta_tcategoria_idx` (`ID_TCATEGORIA`),
  ADD KEY `fk_fruta_dpexportacion_fruta_icarga_idx` (`ID_ICARGA`);

--
-- Indices de la tabla `fruta_dpindustrial`
--
ALTER TABLE `fruta_dpindustrial`
  ADD PRIMARY KEY (`ID_DPINDUSTRIAL`),
  ADD KEY `fk_fruta_dpindustrial_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_dpindustrial_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_dpindustrial_estandar_eindustrial_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_dpindustrial_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_dpindustrial_frtua_proceso_idx` (`ID_PROCESO`),
  ADD KEY `fk_fruta_dpindustrial_fruta_tmanejo_idx` (`ID_TMANEJO`);

--
-- Indices de la tabla `fruta_drecepcionind`
--
ALTER TABLE `fruta_drecepcionind`
  ADD PRIMARY KEY (`ID_DRECEPCION`),
  ADD KEY `fk_fruta_drecepcionind_frtua_recepcionind_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_drecepcionind_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drecepcionind_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drecepcionind_estandar_eindustrial_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drecepcionind_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drecepcionind_fruta_tmanejo_idx` (`ID_TMANEJO`);

--
-- Indices de la tabla `fruta_drecepcionmp`
--
ALTER TABLE `fruta_drecepcionmp`
  ADD PRIMARY KEY (`ID_DRECEPCION`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drecepcionmp_estandar_erecepcion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_recepcionmp_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_ttratamiento1_idx` (`ID_TTRATAMIENTO1`),
  ADD KEY `fk_fruta_drecepcionmp_fruta_ttratamiento2_idx` (`ID_TTRATAMIENTO2`);

--
-- Indices de la tabla `fruta_drecepcionpt`
--
ALTER TABLE `fruta_drecepcionpt`
  ADD PRIMARY KEY (`ID_DRECEPCION`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_recepcionpt_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_drecepcionpt_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_tcategoria_idx` (`ID_TCATEGORIA`),
  ADD KEY `fk_fruta_drecepcionpt_fruta_tcolor_idx` (`ID_TCOLOR`);

--
-- Indices de la tabla `fruta_drepaletizajeex`
--
ALTER TABLE `fruta_drepaletizajeex`
  ADD PRIMARY KEY (`ID_DREPALETIZAJE`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_repaletizaje_idx` (`ID_REPALETIZAJE`),
  ADD KEY `fk_fruta_drepaletizajeex_fruta_exiexportacion_idx` (`ID_EXIEXPORTACION`);

--
-- Indices de la tabla `fruta_drexportacion`
--
ALTER TABLE `fruta_drexportacion`
  ADD PRIMARY KEY (`ID_DREXPORTACION`),
  ADD KEY `fk_fruta_drexportacion_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drexportacion_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_drexportacion_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drexportacion_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drexportacion_fruta_treembalaje_idx` (`ID_REEMBALAJE`),
  ADD KEY `fk_fruta_drexportacion_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_drexportacion_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drexportacion_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_drexportacion_fruta_tcategoria_idx` (`ID_TCATEGORIA`),
  ADD KEY `fk_fruta_drexportacion_fruta_icarga_idx` (`ID_ICARGA`);

--
-- Indices de la tabla `fruta_drindustrial`
--
ALTER TABLE `fruta_drindustrial`
  ADD PRIMARY KEY (`ID_DRINDUSTRIAL`),
  ADD KEY `fk_fruta_drindustrial_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_drindustrial_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_drindustrial_estandar_eindustrial_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_drindustrial_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_drindustrial_fruta_reembalaje_idx` (`ID_REEMBALAJE`),
  ADD KEY `fk_fruta_drindustrial_fruta_tmanejo_idx` (`ID_TMANEJO`);

--
-- Indices de la tabla `fruta_emisionbl`
--
ALTER TABLE `fruta_emisionbl`
  ADD PRIMARY KEY (`ID_EMISIONBL`) USING BTREE,
  ADD KEY `fk_fruta_emisionbl_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_emisionbl_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_emisionbl_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_especies`
--
ALTER TABLE `fruta_especies`
  ADD PRIMARY KEY (`ID_ESPECIES`),
  ADD KEY `fk_fruta_especies_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_especies_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_exiexportacion`
--
ALTER TABLE `fruta_exiexportacion`
  ADD PRIMARY KEY (`ID_EXIEXPORTACION`),
  ADD KEY `fk_fruta_exiexportacion_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_exiexportacion_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_exiexportacion_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_exiexportacion_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_exiexportacion_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_exiexportacion_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_exiexportacion_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_exiexportacion_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_exiexportacion_fruta_proceso_idx` (`ID_PROCESO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_recepcion_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_exiexportacion_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_exiexportacion_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_fruta_exiexportacion_fruta_repaletizaje_idx` (`ID_REPALETIZAJE`),
  ADD KEY `fk_fruta_exiexportacion_fruta_reembalaje_idx` (`ID_REEMBALAJE`),
  ADD KEY `fk_fruta_exiexportacion_fruta_despacho_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_despachoex_idx` (`ID_DESPACHOEX`),
  ADD KEY `fk_fruta_exiexportacion_fruta_inpsag_idx` (`ID_INPSAG`),
  ADD KEY `fk_fruta_exiexportacion_fruta_pcdespacho_idx` (`ID_PCDESPACHO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_icarga_idx` (`ID_ICARGA`),
  ADD KEY `fk_fruta_exiexportacion_fruta_despacho2_idx` (`ID_DESPACHO2`),
  ADD KEY `fk_fruta_exiexportacion_fruta_rechazopt_idx` (`ID_RECHAZADO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_levantamientopt_idx` (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_exiexportacion_fruta_tcategoria_idx` (`ID_TCATEGORIA`),
  ADD KEY `fk_fruta_exiexportacion_fruta_tcolor_idx` (`ID_TCOLOR`),
  ADD KEY `fk_fruta_exiexportacion_fruta_inpsag2_idx` (`ID_INPSAG2`),
  ADD KEY `fk_fruta_exiexportacion_fruta_exiexportacion2_idx` (`ID_EXIEXPORTACION2`),
  ADD KEY `fk_fruta_exiexportacion_fruta_repaletizaje2_idx` (`ID_REPALETIZAJE2`);

--
-- Indices de la tabla `fruta_exiindustrial`
--
ALTER TABLE `fruta_exiindustrial`
  ADD PRIMARY KEY (`ID_EXIINDUSTRIAL`),
  ADD KEY `fk_fruta_exiindustrial_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_exiindustrial_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_exiindustrial_fruta_estandar_eindustrial_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_exiindustrial_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_exiindustrial_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_exiindustrial_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_exiindustrial_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_exiindustrial_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_exiindustrial_fruta_recepcion_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_exiindustrial_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_exiindustrial_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_fruta_exiindustrial_fruta_proceso_idx` (`ID_PROCESO`),
  ADD KEY `fk_fruta_exiindustrial_principal_reembalaje_idx` (`ID_REEMBALAJE`),
  ADD KEY `fk_fruta_exiindustrial_principal_despacho_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_exiindustrial_fruta_despacho2_idx` (`ID_DESPACHO2`),
  ADD KEY `fk_fruta_exiindustrial_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_exiindustrial_fruta_tembalaje_idx` (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_exiindustrial_fruta_rechazomp_idx` (`ID_RECHAZADOMP`),
  ADD KEY `fk_fruta_exiindustrial_fruta_levantamientomp_idx` (`ID_LEVANTAMIENTOMP`),
  ADD KEY `fk_fruta_exiindustrial_fruta_estandar_erecepcion_idx` (`ID_ESTANDARMP`),
  ADD KEY `fk_fruta_exiindustrial_fruta_ttratamiento1_idx` (`ID_TTRATAMIENTO1`),
  ADD KEY `fk_fruta_exiindustrial_fruta_ttratamiento2_idx` (`ID_TTRATAMIENTO2`),
  ADD KEY `fk_fruta_exiindustrial_fruta_despacho3_idx` (`ID_DESPACHO3`),
  ADD KEY `fk_fruta_exiindustrial_fruta_exiindustrial2_idx` (`ID_EXIINDUSTRIAL2`);

--
-- Indices de la tabla `fruta_eximateriaprima`
--
ALTER TABLE `fruta_eximateriaprima`
  ADD PRIMARY KEY (`ID_EXIMATERIAPRIMA`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_tmanejo_idx` (`ID_TMANEJO`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_fruta_eximateriaprima_estandar_erecepcion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_eximateriaprima_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_eximateriaprima_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_eximateriaprima_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_recepcion_idx` (`ID_RECEPCION`),
  ADD KEY `fk_fruta_eximateriaprima_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_eximateriaprima_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_proceso_idx` (`ID_PROCESO`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_despacho_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_despacho2_idx` (`ID_DESPACHO2`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_rechazomp_idx` (`ID_RECHAZADO`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_levantamientomp_idx` (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_ttratamineto1_idx` (`ID_TTRATAMIENTO1`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_ttratamineto2_idx` (`ID_TTRATAMIENTO2`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_despacho3_idx` (`ID_DESPACHO3`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_proceso2_idx` (`ID_PROCESO2`),
  ADD KEY `fk_fruta_eximateriaprima_fruta_eximateriaprima2_idx` (`ID_EXIMATERIAPRIMA2`);

--
-- Indices de la tabla `fruta_exportadora`
--
ALTER TABLE `fruta_exportadora`
  ADD PRIMARY KEY (`ID_EXPORTADORA`),
  ADD KEY `fk_fruta_exportadora_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_exportadora_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_exportadora_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_exportadora_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_folio`
--
ALTER TABLE `fruta_folio`
  ADD PRIMARY KEY (`ID_FOLIO`),
  ADD KEY `fk_fruta_folio_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_folio_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_folio_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_folio_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_folio_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_fpago`
--
ALTER TABLE `fruta_fpago`
  ADD PRIMARY KEY (`ID_FPAGO`),
  ADD KEY `fk_fruta_fpago_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_fpago_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_fpago_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_icarga`
--
ALTER TABLE `fruta_icarga`
  ADD PRIMARY KEY (`ID_ICARGA`),
  ADD KEY `fk_fruta_icarga_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_icarga_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_icarga_fruta_tservicio_idx` (`ID_TSERVICIO`),
  ADD KEY `fk_fruta_icarga_fruta_exportadora_idx` (`ID_EXPPORTADORA`),
  ADD KEY `fk_fruta_icarga_fruta_consignatario_idx` (`ID_CONSIGNATARIO`),
  ADD KEY `fk_fruta_icarga_fruta_notificador_idx` (`ID_NOTIFICADOR`),
  ADD KEY `fk_fruta_icarga_fruta_broker_idx` (`ID_BROKER`),
  ADD KEY `fk_fruta_icarga_fruta_rfinal_idx` (`ID_RFINAL`),
  ADD KEY `fk_fruta_icarga_fruta_mercado_idx` (`ID_MERCADO`),
  ADD KEY `fk_fruta_icarga_fruta_aduana_idx` (`ID_AADUANA`),
  ADD KEY `fk_fruta_icarga_fruta_agcarga_idx` (`ID_AGCARGA`),
  ADD KEY `fk_fruta_icarga_fruta_dfinal_idx` (`ID_DFINAL`),
  ADD KEY `fk_fruta_icarga_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_icarga_fruta_lcarga_idx` (`ID_LCARGA`),
  ADD KEY `fk_fruta_icarga_fruta_ldestino_idx` (`ID_LDESTINO`),
  ADD KEY `fk_fruta_icarga_transporte_larea_idx` (`ID_LAREA`),
  ADD KEY `fk_fruta_icarga_transporte_aeronave_idx` (`ID_AERONAVE`),
  ADD KEY `fk_fruta_icarga_fruta_acarga_idx` (`ID_ACARGA`),
  ADD KEY `fk_fruta_icarga_fruta_adestino_idx` (`ID_ADESTINO`),
  ADD KEY `fk_fruta_icarga_transporte_naviera_idx` (`ID_NAVIERA`),
  ADD KEY `fk_fruta_icarga_fruta_pcarga_idx` (`ID_PCARGA`),
  ADD KEY `fk_fruta_icarga_fruta_pdestino_idx` (`ID_PDESTINO`),
  ADD KEY `fk_fruta_icarga_fruta_fpago_idx` (`ID_FPAGO`),
  ADD KEY `fk_fruta_icarga_fruta_cventa_idx` (`ID_CVENTA`),
  ADD KEY `fk_fruta_icarga_fruta_mventa_idx` (`ID_MVENTA`),
  ADD KEY `fk_fruta_icarga_fruta_tflete_idx` (`ID_TFLETE`),
  ADD KEY `fk_fruta_icarga_fruta_tcontenedor_idx` (`ID_TCONTENEDOR`),
  ADD KEY `fk_fruta_icarga_fruta_atmosfera_idx` (`ID_ATMOSFERA`),
  ADD KEY `fk_fruta_icarga_ubicacion_pais_idx` (`ID_PAIS`),
  ADD KEY `fk_fruta_icarga_fruta_seguro_idx` (`ID_SEGURO`),
  ADD KEY `fk_fruta_icarga_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_icarga_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_inpector`
--
ALTER TABLE `fruta_inpector`
  ADD PRIMARY KEY (`ID_INPECTOR`),
  ADD KEY `fk_fruta_inpector_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_inpector_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_inpector_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_inpector_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `fruta_inpsag`
--
ALTER TABLE `fruta_inpsag`
  ADD PRIMARY KEY (`ID_INPSAG`),
  ADD KEY `fk_fruta_inpsag_fruta_inspector_idx` (`ID_INPECTOR`),
  ADD KEY `fk_fruta_inpsag_contraparte_idx` (`ID_CONTRAPARTE`),
  ADD KEY `fk_fruta_inpsag_fruta_tinpsag_idx` (`ID_TINPSAG`),
  ADD KEY `fk_fruta_inpsag_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_inpsag_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_inpsag_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_inpsag_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_lcarga`
--
ALTER TABLE `fruta_lcarga`
  ADD PRIMARY KEY (`ID_LCARGA`),
  ADD KEY `fk_fruta_lcarga_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_lcarga_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_lcarga_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_ldestino`
--
ALTER TABLE `fruta_ldestino`
  ADD PRIMARY KEY (`ID_LDESTINO`),
  ADD KEY `fk_fruta_ldestino_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_ldestino_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_ldestino_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_leamp`
--
ALTER TABLE `fruta_leamp`
  ADD PRIMARY KEY (`ID_LEVANTAMIENTO`,`ID_EXIMATERIAPRIMA`),
  ADD KEY `fk_fruta_leamp_fruta_levantamientomp_idx` (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_leamp_fruta_eximateriaprima_idx` (`ID_EXIMATERIAPRIMA`);

--
-- Indices de la tabla `fruta_leapt`
--
ALTER TABLE `fruta_leapt`
  ADD PRIMARY KEY (`ID_LEVANTAMIENTO`,`ID_EXIEXPORTACION`),
  ADD KEY `fk_fruta_leapt_fruta_levantamientopt_idx` (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_leapt_fruta_exiexportacion_idx` (`ID_EXIEXPORTACION`);

--
-- Indices de la tabla `fruta_levantamientomp`
--
ALTER TABLE `fruta_levantamientomp`
  ADD PRIMARY KEY (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_levantamientomp_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_levantamientomp_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_levantamientomp_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_levantamientomp_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_levantamientomp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_levantamientomp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_levantamientomp_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_levantamientopt`
--
ALTER TABLE `fruta_levantamientopt`
  ADD PRIMARY KEY (`ID_LEVANTAMIENTO`),
  ADD KEY `fk_fruta_levantamientopt_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_levantamientopt_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_levantamientopt_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_levantamientopt_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_levantamientopt_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_levantamientopt_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_levantamientopt_usuario_usuarioim_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_mercado`
--
ALTER TABLE `fruta_mercado`
  ADD PRIMARY KEY (`ID_MERCADO`),
  ADD KEY `fk_fruta_mercado_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_mercado_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_mercado_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_mguiaind`
--
ALTER TABLE `fruta_mguiaind`
  ADD PRIMARY KEY (`ID_MGUIA`),
  ADD KEY `fk_fruta_mguiaind_fruta_despacho_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_mguiaind_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_mguiaind_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_mguiaind_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_mguiaind_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_mguiaind_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_mguiaind_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_mguiamp`
--
ALTER TABLE `fruta_mguiamp`
  ADD PRIMARY KEY (`ID_MGUIA`),
  ADD KEY `fk_fruta_mguiamp_fruta_despachomp_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_mguiamp_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_mguiamp_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_mguiamp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_mguiamp_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_mguiamp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_mguiamp_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_mguiapt`
--
ALTER TABLE `fruta_mguiapt`
  ADD PRIMARY KEY (`ID_MGUIA`),
  ADD KEY `fk_fruta_mguiapt_fruta_despacho_idx` (`ID_DESPACHO`),
  ADD KEY `fk_fruta_mguiapt_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_mguiapt_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_mguiapt_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_mguiapt_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_mguiapt_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_mguiapt_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_mventa`
--
ALTER TABLE `fruta_mventa`
  ADD PRIMARY KEY (`ID_MVENTA`),
  ADD KEY `fk_fruta_mventa_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_mventa_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_mventa_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_notadc`
--
ALTER TABLE `fruta_notadc`
  ADD PRIMARY KEY (`ID_NOTA`),
  ADD KEY `fk_fruta_notadc_fruta_icarga_idx` (`ID_ICARGA`),
  ADD KEY `fk_fruta_notadc_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_notadc_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_notadc_usuaio_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_notadc_usuaio_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_notificador`
--
ALTER TABLE `fruta_notificador`
  ADD PRIMARY KEY (`ID_NOTIFICADOR`),
  ADD KEY `fk_fruta_notificador_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_notificador_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_notificador_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_pcarga`
--
ALTER TABLE `fruta_pcarga`
  ADD PRIMARY KEY (`ID_PCARGA`),
  ADD KEY `fk_fruta_pcarga_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_pcarga_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_pcarga_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_pcdespacho`
--
ALTER TABLE `fruta_pcdespacho`
  ADD PRIMARY KEY (`ID_PCDESPACHO`),
  ADD KEY `fk_fruta_pcdespacho_fruta_despachoex_idx` (`ID_DESPACHOEX`),
  ADD KEY `fk_fruta_pcdespacho_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_pcdespacho_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_pcdespacho_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_pcdespacho_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_pcdespacho_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_pcdespachomp`
--
ALTER TABLE `fruta_pcdespachomp`
  ADD PRIMARY KEY (`ID_PCDESPACHO`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_fruta_despachoex_idx` (`ID_DESPACHOEX`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_principal_empresa_idx` (`ID_EMPRESA`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_principal_planta_idx` (`ID_PLANTA`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_principal_temporada_idx` (`ID_TEMPORADA`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_usuario_usuarioi_idx` (`ID_USUARIOI`) USING BTREE,
  ADD KEY `fk_fruta_pcdespacho_usuario_usuariom_idx` (`ID_USUARIOM`) USING BTREE;

--
-- Indices de la tabla `fruta_pdestino`
--
ALTER TABLE `fruta_pdestino`
  ADD PRIMARY KEY (`ID_PDESTINO`),
  ADD KEY `fk_fruta_pdestino_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_pdestino_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_pdestino_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_proceso`
--
ALTER TABLE `fruta_proceso`
  ADD PRIMARY KEY (`ID_PROCESO`),
  ADD KEY `fk_fruta_proceso_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_proceso_fruta_tproceso_idx` (`ID_TPROCESO`),
  ADD KEY `fk_fruta_proceso_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_proceso_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_proceso_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_proceso_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_proceso_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_proceso_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_productor`
--
ALTER TABLE `fruta_productor`
  ADD PRIMARY KEY (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_productor_princiapal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_productor_fruta_tproductor_idx` (`ID_TPRODUCTOR`),
  ADD KEY `fk_fruta_productor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_productor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_productor_ubicacion_comuna_idx` (`ID_COMUNA`),
  ADD KEY `fk_fruta_productor_ubicacion_provincia_idx` (`ID_PROVINCIA`),
  ADD KEY `fk_fruta_productor_ubicacion_region_idx` (`ID_REGION`);

--
-- Indices de la tabla `fruta_reamp`
--
ALTER TABLE `fruta_reamp`
  ADD PRIMARY KEY (`ID_RECHAZO`,`ID_EXIMATERIAPRIMA`),
  ADD KEY `fk_fruta_reamp_fruta_rechazomp_idx` (`ID_RECHAZO`),
  ADD KEY `fk_fruta_reamp_fruta_eximateriaprima_idx` (`ID_EXIMATERIAPRIMA`);

--
-- Indices de la tabla `fruta_reapt`
--
ALTER TABLE `fruta_reapt`
  ADD PRIMARY KEY (`ID_RECHAZO`,`ID_EXIEXPORTACION`),
  ADD KEY `fk_fruta_reapt_fruta_rechazopt_idx` (`ID_RECHAZO`),
  ADD KEY `fk_fruta_reapt_fruta_exiexportacion_idx` (`ID_EXIEXPORTACION`);

--
-- Indices de la tabla `fruta_recepcionind`
--
ALTER TABLE `fruta_recepcionind`
  ADD PRIMARY KEY (`ID_RECEPCION`),
  ADD KEY `fk_fruta_recepcionind_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_recepcionind_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_recepcionind_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_recepcionind_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_recepcionind_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_recepcionind_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_recepcionind_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_recepcionind_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_recepcionind_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_recepcionmp`
--
ALTER TABLE `fruta_recepcionmp`
  ADD PRIMARY KEY (`ID_RECEPCION`),
  ADD KEY `fk_fruta_recepcionmp_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_recepcionmp_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_recepcionmp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_recepcionmp_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_recepcionmp_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_recepcionmp_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_recepcionmp_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_recepcionmp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_recepcionmp_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_recepcionpt`
--
ALTER TABLE `fruta_recepcionpt`
  ADD PRIMARY KEY (`ID_RECEPCION`),
  ADD KEY `fk_fruta_recepcionpt_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_recepcionpt_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_recepcionpt_principal_empresa_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_recepcionpt_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_fruta_recepcionpt_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_recepcionpt_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_fruta_recepcionpt_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_fruta_recepcionpt_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_recepcionpt_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_rechazomp`
--
ALTER TABLE `fruta_rechazomp`
  ADD PRIMARY KEY (`ID_RECHAZO`),
  ADD KEY `fk_fruta_rechazomp_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_rechazomp_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_rechazomp_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_rechazomp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_rechazomp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_rechazomp_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_rechazomp_principal_empresa_idx` (`ID_EMPRESA`);

--
-- Indices de la tabla `fruta_rechazopt`
--
ALTER TABLE `fruta_rechazopt`
  ADD PRIMARY KEY (`ID_RECHAZO`),
  ADD KEY `fk_fruta_rechazopt_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_rechazopt_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_rechazopt_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_rechazopt_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_rechazopt_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_rechazopt_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_rechazopt_usuario_usuarioim_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_reembalaje`
--
ALTER TABLE `fruta_reembalaje`
  ADD PRIMARY KEY (`ID_REEMBALAJE`),
  ADD KEY `fk_fruta_reembalaje_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_reembalaje_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_reembalaje_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_reembalaje_fruta_vespecies_idx` (`ID_VESPECIES`),
  ADD KEY `fk_fruta_reembalaje_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_reembalaje_fruta_treembalaje_idx` (`ID_TREEMBALAJE`),
  ADD KEY `fk_fruta_reembalaje_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_reembalaje_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_repaletizajeex`
--
ALTER TABLE `fruta_repaletizajeex`
  ADD PRIMARY KEY (`ID_REPALETIZAJE`),
  ADD KEY `fk_fruta_repaletizajeex_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_repaletizajeex_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_fruta_repaletizajeex_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_fruta_repaletizajeex_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_repaletizajeex_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_rfinal`
--
ALTER TABLE `fruta_rfinal`
  ADD PRIMARY KEY (`ID_RFINAL`),
  ADD KEY `fk_fruta_rfinal_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_rfinal_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_rfinal_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_rmercado`
--
ALTER TABLE `fruta_rmercado`
  ADD PRIMARY KEY (`ID_RMERCADO`),
  ADD KEY `fk_fruta_rmercado_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_rmercado_fruta_mercado_idx` (`ID_MERCADO`),
  ADD KEY `fk_fruta_rmercado_fruta_productorr_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_fruta_rmercado_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_rmercado_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_seguro`
--
ALTER TABLE `fruta_seguro`
  ADD PRIMARY KEY (`ID_SEGURO`),
  ADD KEY `fk_fruta_seguro_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_seguro_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_seguro_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tcalibre`
--
ALTER TABLE `fruta_tcalibre`
  ADD PRIMARY KEY (`ID_TCALIBRE`),
  ADD KEY `fk_fruta_tcalibre_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tcalibre_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_fruta_tcalibre_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tcalibreind`
--
ALTER TABLE `fruta_tcalibreind`
  ADD PRIMARY KEY (`ID_TCALIBREIND`);

--
-- Indices de la tabla `fruta_tcategoria`
--
ALTER TABLE `fruta_tcategoria`
  ADD PRIMARY KEY (`ID_TCATEGORIA`),
  ADD KEY `fk_fruta_tcategoria_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tcategoria_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_tcategoria_principal_empresa_idx` (`ID_EMPRESA`);

--
-- Indices de la tabla `fruta_tcolor`
--
ALTER TABLE `fruta_tcolor`
  ADD PRIMARY KEY (`ID_TCOLOR`),
  ADD KEY `fk_fruta_tcolor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tcolor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_tcolor_principal_empresa_idx` (`ID_EMPRESA`);

--
-- Indices de la tabla `fruta_tcontenedor`
--
ALTER TABLE `fruta_tcontenedor`
  ADD PRIMARY KEY (`ID_TCONTENEDOR`),
  ADD KEY `fk_fruta_tcontenedor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tcontenedor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_tcontenedor_usuario_usuarioi_idx` (`ID_USUARIOI`);

--
-- Indices de la tabla `fruta_tembalaje`
--
ALTER TABLE `fruta_tembalaje`
  ADD PRIMARY KEY (`ID_TEMBALAJE`),
  ADD KEY `fk_fruta_tembalaje_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tembalaje_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tembalaje_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tetiqueta`
--
ALTER TABLE `fruta_tetiqueta`
  ADD PRIMARY KEY (`ID_TETIQUETA`),
  ADD KEY `fk_fruta_tetiqueta_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tetiqueta_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tetiqueta_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tflete`
--
ALTER TABLE `fruta_tflete`
  ADD PRIMARY KEY (`ID_TFLETE`),
  ADD KEY `fk_fruta_tflete_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tflete_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tflete_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tinpsag`
--
ALTER TABLE `fruta_tinpsag`
  ADD PRIMARY KEY (`ID_TINPSAG`),
  ADD KEY `fk_fruta_tinpsag_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tinpsag_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tmanejo`
--
ALTER TABLE `fruta_tmanejo`
  ADD PRIMARY KEY (`ID_TMANEJO`),
  ADD KEY `fk_fruta_tmanejo_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tmanejo_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tmoneda`
--
ALTER TABLE `fruta_tmoneda`
  ADD PRIMARY KEY (`ID_TMONEDA`),
  ADD KEY `fk_fruta_tmoneda_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tmoneda_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_fruta_tmoneda_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tproceso`
--
ALTER TABLE `fruta_tproceso`
  ADD PRIMARY KEY (`ID_TPROCESO`),
  ADD KEY `fruta_tproceso_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fruta_tproceso_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tproductor`
--
ALTER TABLE `fruta_tproductor`
  ADD PRIMARY KEY (`ID_TPRODUCTOR`),
  ADD KEY `fk_fruta_tproductor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tproductor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tproductor_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tratamineto1`
--
ALTER TABLE `fruta_tratamineto1`
  ADD PRIMARY KEY (`ID_TTRATAMIENTO`),
  ADD KEY `fk_fruta_tratamineto1_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tratamineto1_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_tratamineto1_principal_empresa_idx` (`ID_EMPRESA`);

--
-- Indices de la tabla `fruta_tratamineto2`
--
ALTER TABLE `fruta_tratamineto2`
  ADD PRIMARY KEY (`ID_TTRATAMIENTO`),
  ADD KEY `fk_fruta_tratamineto2_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tratamineto2_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_fruta_tratamineto2_principal_empresa_idx` (`ID_EMPRESA`);

--
-- Indices de la tabla `fruta_treembalaje`
--
ALTER TABLE `fruta_treembalaje`
  ADD PRIMARY KEY (`ID_TREEMBALAJE`),
  ADD KEY `fk_fruta_treembalaje_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_treembalaje_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_tservicio`
--
ALTER TABLE `fruta_tservicio`
  ADD PRIMARY KEY (`ID_TSERVICIO`),
  ADD KEY `fk_fruta_tservicio_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_tservicio_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fruta_tservicio_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `fruta_vespecies`
--
ALTER TABLE `fruta_vespecies`
  ADD PRIMARY KEY (`ID_VESPECIES`),
  ADD KEY `fk_fruta_vespecies_fruta_especies_idx` (`ID_ESPECIES`),
  ADD KEY `fk_fruta_vespecies_principal_idx` (`ID_EMPRESA`),
  ADD KEY `fk_fruta_vespecies_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_fruta_vespecies_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `liquidacion_anticipo`
--
ALTER TABLE `liquidacion_anticipo`
  ADD PRIMARY KEY (`id_anticipo`);

--
-- Indices de la tabla `liquidacion_ddvalor`
--
ALTER TABLE `liquidacion_ddvalor`
  ADD PRIMARY KEY (`ID_DDVALOR`),
  ADD KEY `liquidacion_ddvalor_fruta_tcalibre_idx` (`ID_TCALIBRE`),
  ADD KEY `liquidacion_ddvalor_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `liquidacion_ddvalor_liquidacion_dvalor_idx` (`ID_DVALOR`),
  ADD KEY `liquidacion_ddvalor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `liquidacion_ddvalor_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `liquidacion_dvalor`
--
ALTER TABLE `liquidacion_dvalor`
  ADD PRIMARY KEY (`ID_DVALOR`),
  ADD KEY `fk_liquidacion_dvalor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_liquidacion_dvalor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_liquidacion_dvalor_liquidacion_titem_idx` (`ID_TITEM`),
  ADD KEY `fk_liquidacion_dvalor_liquidacion_valor_idx` (`ID_VALOR`);

--
-- Indices de la tabla `liquidacion_dvalorp`
--
ALTER TABLE `liquidacion_dvalorp`
  ADD PRIMARY KEY (`ID_DVALOR`),
  ADD KEY `fk_liquidacion_dvalorp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_liquidacion_dvalorp_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_liquidacion_dvalorp_liquidacion_titem_idx` (`ID_TITEM`),
  ADD KEY `fk_liquidacion_dvalorp_liquidacion_valor0_idx` (`ID_VALOR`);

--
-- Indices de la tabla `liquidacion_titem`
--
ALTER TABLE `liquidacion_titem`
  ADD PRIMARY KEY (`ID_TITEM`),
  ADD KEY `fk_liquidacion_titem_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_liquidacion_titem_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_liquidacion_titem_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `liquidacion_valor`
--
ALTER TABLE `liquidacion_valor`
  ADD PRIMARY KEY (`ID_VALOR`),
  ADD KEY `fk_liquidacion_valor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_liquidacion_valor_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_liquidacion_valor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_liquidacion_valor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_liquidacion_valor_fruta_icarga_idx` (`ID_ICARGA`);

--
-- Indices de la tabla `liquidacion_valorp`
--
ALTER TABLE `liquidacion_valorp`
  ADD PRIMARY KEY (`ID_VALOR`),
  ADD KEY `fk_liquidacion_valorp_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_liquidacion_valorp_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_liquidacion_valorp_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_liquidacion_valorp_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_liquidacion_valorp_fruta_icarga_idx` (`ID_ICARGA`);

--
-- Indices de la tabla `material_cliente`
--
ALTER TABLE `material_cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD KEY `fk_material_cliente_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_cliente_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_cliente_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_cliente_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `material_despachoe`
--
ALTER TABLE `material_despachoe`
  ADD PRIMARY KEY (`ID_DESPACHO`),
  ADD KEY `fk_material_despachoe_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_despachoe_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_despachoe_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_despachoe_principal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_despachoe_materiales_tdocumento_idx` (`ID_TDOCUMENTO`),
  ADD KEY `fk_material_despachoe_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_material_despachoe_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_material_despachoe_materiales_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_despachoe_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_despachoe_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_despachoe_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_despachoe_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_material_despachoe_principal_bodega2_idx` (`ID_BODEGA2`),
  ADD KEY `fk_material_despachoe_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_material_despachoe_fruta_despachomp_idx` (`ID_DESPACHOMP`),
  ADD KEY `fk_material_despachoe_principal_bodegao_idx` (`ID_BODEGAO`),
  ADD KEY `fk_material_despachoe_fruta_comrpador_idx` (`ID_COMPRADOR`);

--
-- Indices de la tabla `material_despachom`
--
ALTER TABLE `material_despachom`
  ADD PRIMARY KEY (`ID_DESPACHO`),
  ADD KEY `fk_material_despachom_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_despachom_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_despachom_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_despachom_principal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_despachom_materiales_tdocumento_idx` (`ID_TDOCUMENTO`),
  ADD KEY `fk_material_despachom_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_material_despachom_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_material_despachom_materiales_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_despachom_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_despachom_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_despachom_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_despachom_principal_bodega2_idx` (`ID_BODEGA2`),
  ADD KEY `fk_material_despachom_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_material_despachom_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_material_despachom_material_cliente_idx` (`ID_CLIENTE`);

--
-- Indices de la tabla `material_dficha`
--
ALTER TABLE `material_dficha`
  ADD PRIMARY KEY (`ID_DFICHA`),
  ADD KEY `fk_material_dficha_material_ficha_idx` (`ID_FICHA`),
  ADD KEY `fk_material_dficha_material_producto_idx` (`ID_PRODUCTO`);

--
-- Indices de la tabla `material_docompra`
--
ALTER TABLE `material_docompra`
  ADD PRIMARY KEY (`ID_DOCOMPRA`),
  ADD KEY `fk_material_docomprae_materiales_producto_idx` (`ID_PRODUCTO`),
  ADD KEY `fk_material_docomprae_materiales_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_docomprae_materiales_ocomprae_idx` (`ID_OCOMPRA`);

--
-- Indices de la tabla `material_drecepcionm`
--
ALTER TABLE `material_drecepcionm`
  ADD PRIMARY KEY (`ID_DRECEPCION`),
  ADD KEY `fk_material_drecepcionm_material_producto_idx` (`ID_PRODUCTO`),
  ADD KEY `fk_material_drecepcionm_material_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_drecepcionm_material_recepcionm_idx` (`ID_RECEPCION`),
  ADD KEY `fk_material_drecepcionm_material_docompra_idx` (`ID_DOCOMPRA`);

--
-- Indices de la tabla `material_familia`
--
ALTER TABLE `material_familia`
  ADD PRIMARY KEY (`ID_FAMILIA`),
  ADD KEY `fk_material_familia_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_familia_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_familia_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_ficha`
--
ALTER TABLE `material_ficha`
  ADD PRIMARY KEY (`ID_FICHA`),
  ADD KEY `fk_material_ficha_estandar_eexportacion_idx` (`ID_ESTANDAR`),
  ADD KEY `fk_material_ficha_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_ficha_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_ficha_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_ficha_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_folio`
--
ALTER TABLE `material_folio`
  ADD PRIMARY KEY (`ID_FOLIO`),
  ADD KEY `fk_material_folio_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_folio_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_folio_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_folio_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_folio_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_fpago`
--
ALTER TABLE `material_fpago`
  ADD PRIMARY KEY (`ID_FPAGO`),
  ADD KEY `fk_material_fpago_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_fpago_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_fpago_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_inventarioe`
--
ALTER TABLE `material_inventarioe`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD KEY `fk_material_inventarioe_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_inventarioe_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_inventarioe_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_inventarioe_principal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_inventarioe_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_inventarioe_materiales_producto_idx` (`ID_PRODUCTO`),
  ADD KEY `fk_material_inventarioe_materiales_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_inventarioe_materiales_despachoe_idx` (`ID_DESPACHO`),
  ADD KEY `fk_material_inventarioe_materiales_recepcione_idx` (`ID_RECEPCION`),
  ADD KEY `fk_material_inventarioe_material_docompra_idx` (`ID_DOCOMPRA`),
  ADD KEY `fk_material_inventarioe_principal_bodega2_idx` (`ID_BODEGA2`),
  ADD KEY `fk_material_inventarioe_materiales_despachoe2_idx` (`ID_DESPACHO2`);

--
-- Indices de la tabla `material_inventariom`
--
ALTER TABLE `material_inventariom`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD KEY `fk_material_inventariom_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_inventariom_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_inventariom_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_inventariom_principal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_inventariom_materiales_folio_idx` (`ID_FOLIO`),
  ADD KEY `fk_material_inventariom_materiales_producto_idx` (`ID_PRODUCTO`),
  ADD KEY `fk_material_inventariom_materiales_tcontenedor_idx` (`ID_TCONTENEDOR`),
  ADD KEY `fk_material_inventariom_materiales_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_inventariom_materiales_recepcionm_idx` (`ID_RECEPCION`),
  ADD KEY `fk_material_inventariom_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_inventariom_principal_planta3_idx` (`ID_PLANTA3`),
  ADD KEY `fk_material_inventariom_materiales_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_inventariom_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_material_inventariom_materiales_despachom_idx` (`ID_DESPACHO`),
  ADD KEY `fk_material_inventariom_material_ocompra_idx` (`ID_OCOMPRA`),
  ADD KEY `fk_material_inventariom_materiales_despachom2_idx` (`ID_DESPACHO2`);

--
-- Indices de la tabla `material_mguiae`
--
ALTER TABLE `material_mguiae`
  ADD PRIMARY KEY (`ID_MGUIA`),
  ADD KEY `fk_material_mguiae_material_despachoe_idx` (`ID_DESPACHO`),
  ADD KEY `fk_material_mguiae_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_mguiae_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_mguiae_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_mguiae_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_mguiae_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_mguiae_usuario_usuarioim_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_mguiam`
--
ALTER TABLE `material_mguiam`
  ADD PRIMARY KEY (`ID_MGUIA`),
  ADD KEY `fk_material_mguiam_material_despahom_idx` (`ID_DESPACHO`),
  ADD KEY `fk_material_mguiam_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_mguiam_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_mguiam_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_mguiam_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_mguiam_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_mguiam_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_mocompra`
--
ALTER TABLE `material_mocompra`
  ADD PRIMARY KEY (`ID_MOCOMPRA`),
  ADD KEY `fk_material_mocompra_material_ocompra_idx` (`ID_OCOMPRA`),
  ADD KEY `fk_material_mocompra_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_mocompra_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_mocompra_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_mocompra_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_mocompra_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_ocompra`
--
ALTER TABLE `material_ocompra`
  ADD PRIMARY KEY (`ID_OCOMPRA`),
  ADD KEY `fk_material_ocomprae_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_ocomprae_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_ocomprae_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_ocomprae_materiales_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_ocomprae_materiales_responsable_idx` (`ID_RESPONSABLE`),
  ADD KEY `fk_material_ocomprae_materiales_fpago_idx` (`ID_FPAGO`),
  ADD KEY `fk_material_ocomprae_materiales_tmoneda_idx` (`ID_TMONEDA`),
  ADD KEY `fk_material_ocomprae_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_ocomprae_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_producto`
--
ALTER TABLE `material_producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `fk_material_producto_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_producto_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_producto_material_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_producto_material_familia_idx` (`ID_FAMILIA`),
  ADD KEY `fk_material_producto_material_subfamilia_idx` (`ID_SUBFAMILIA`),
  ADD KEY `fk_material_producto_fruta_especies_idx` (`ID_ESPECIES`),
  ADD KEY `fk_material_producto_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_producto_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_proveedor`
--
ALTER TABLE `material_proveedor`
  ADD PRIMARY KEY (`ID_PROVEEDOR`),
  ADD KEY `fk_material_proveedor_princiapl_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_proveedor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_proveedor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_proveedor_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `material_recepcione`
--
ALTER TABLE `material_recepcione`
  ADD PRIMARY KEY (`ID_RECEPCION`),
  ADD KEY `fk_material_recepcione_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_recepcione_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_recepcione_principal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_recepcione_principal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_recepcione_material_tdocumento_idx` (`ID_TDOCUMENTO`),
  ADD KEY `fk_material_recepcione_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_material_recepcione_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_material_recepcione_material_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_recepcione_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_recepcione_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_material_recepcione_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_recepcione_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_recepcione_material_ocomprae_idx` (`ID_OCOMPRA`),
  ADD KEY `fk_material_recepcione_fruta_recepcionmp_idx` (`ID_RECEPCIONMP`),
  ADD KEY `fk_material_recepcione_fruta_recepcionind_idx` (`ID_RECEPCIONIND`);

--
-- Indices de la tabla `material_recepcionm`
--
ALTER TABLE `material_recepcionm`
  ADD PRIMARY KEY (`ID_RECEPCION`),
  ADD KEY `fk_material_recepcionm_princiapal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_recepcionm_princiapal_temporada_idx` (`ID_TEMPORADA`),
  ADD KEY `fk_material_recepcionm_princiapal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_material_recepcionm_princiapal_bodega_idx` (`ID_BODEGA`),
  ADD KEY `fk_material_recepcionm_material_tdocumento_idx` (`ID_TDOCUMENTO`),
  ADD KEY `fk_material_recepcionm_transporte_transporte_idx` (`ID_TRANSPORTE`),
  ADD KEY `fk_material_recepcionm_transporte_conductor_idx` (`ID_CONDUCTOR`),
  ADD KEY `fk_material_recepcionm_material_proveedor_idx` (`ID_PROVEEDOR`),
  ADD KEY `fk_material_recepcionm_principal_planta2_idx` (`ID_PLANTA2`),
  ADD KEY `fk_material_recepcionm_fruta_productor_idx` (`ID_PRODUCTOR`),
  ADD KEY `fk_material_recepcionm_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_recepcionm_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_material_recepcionm_material_ocompra_idx` (`ID_OCOMPRA`);

--
-- Indices de la tabla `material_responsable`
--
ALTER TABLE `material_responsable`
  ADD PRIMARY KEY (`ID_RESPONSABLE`),
  ADD KEY `fk_material_responsable_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_responsable_usuario_usuario_idx` (`ID_USUARIO`),
  ADD KEY `fk_material_responsable_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_responsable_usuario_usuariom_idx1` (`ID_USUARIOM`),
  ADD KEY `fk_material_responsable_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `material_subfamilia`
--
ALTER TABLE `material_subfamilia`
  ADD PRIMARY KEY (`ID_SUBFAMILIA`),
  ADD KEY `fk_material_subfamilia_princiapl_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_subfamilia_material_familia_idx` (`ID_FAMILIA`),
  ADD KEY `fk_material_subfamilia_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_subfamilia_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_tarjam`
--
ALTER TABLE `material_tarjam`
  ADD PRIMARY KEY (`ID_TARJA`),
  ADD KEY `fk_material_tarjam_material_recepcion_idx` (`ID_RECEPCION`),
  ADD KEY `fk_material_tarjam_material_drecepcion_idx` (`ID_DRECEPCION`),
  ADD KEY `fk_material_tarjam_material_producto_idx` (`ID_PRODUCTO`),
  ADD KEY `fk_material_tarjam_material_tcontenedr_idx` (`ID_TCONTENEDOR`),
  ADD KEY `fk_material_tarjam_material_tumedida_idx` (`ID_TUMEDIDA`),
  ADD KEY `fk_material_tarjam_material_folio_idx` (`ID_FOLIO`);

--
-- Indices de la tabla `material_tcontenedor`
--
ALTER TABLE `material_tcontenedor`
  ADD PRIMARY KEY (`ID_TCONTENEDOR`),
  ADD KEY `fk_material_tcontenedor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_tcontenedor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_tcontenedor_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_tdocumento`
--
ALTER TABLE `material_tdocumento`
  ADD PRIMARY KEY (`ID_TDOCUMENTO`),
  ADD KEY `fk_material_tdocumento_prinicipal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_tdocumento_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_tdocumento_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_tmoneda`
--
ALTER TABLE `material_tmoneda`
  ADD PRIMARY KEY (`ID_TMONEDA`),
  ADD KEY `fk_material_tmoneda_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_tmoneda_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_tmoneda_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `material_tumedida`
--
ALTER TABLE `material_tumedida`
  ADD PRIMARY KEY (`ID_TUMEDIDA`),
  ADD KEY `fk_material_tumedida_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_material_tumedida_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_material_tumedida_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `principal_bodega`
--
ALTER TABLE `principal_bodega`
  ADD PRIMARY KEY (`ID_BODEGA`),
  ADD KEY `fk_principal_bodega_principal_planta_idx` (`ID_PLANTA`),
  ADD KEY `fk_principal_bodega_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_principal_bodega_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_principal_bodega_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `principal_empresa`
--
ALTER TABLE `principal_empresa`
  ADD PRIMARY KEY (`ID_EMPRESA`),
  ADD KEY `fk_principal_empresa_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_principal_empresa_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_principal_empresa_ubicacion_comuna_idx` (`ID_COMUNA`),
  ADD KEY `fk_principal_empresa_ubicacion_provincia_idx` (`ID_PROVINCIA`),
  ADD KEY `fk_principal_empresa_ubicacion_region_idx` (`ID_REGION`);

--
-- Indices de la tabla `principal_planta`
--
ALTER TABLE `principal_planta`
  ADD PRIMARY KEY (`ID_PLANTA`),
  ADD KEY `fk_principal_planta_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_principal_planta_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_principal_planta_ubicacion_comuna_idx` (`ID_COMUNA`),
  ADD KEY `fk_principal_planta_ubicacion_provincia_idx` (`ID_PROVINCIA`),
  ADD KEY `fk_principal_planta_ubicacion_region_idx` (`ID_REGION`);

--
-- Indices de la tabla `principal_temporada`
--
ALTER TABLE `principal_temporada`
  ADD PRIMARY KEY (`ID_TEMPORADA`),
  ADD KEY `fk_principal_temporada_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_principal_temporada_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `registro_calidad`
--
ALTER TABLE `registro_calidad`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tb_documento`
--
ALTER TABLE `tb_documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `transporte_aeronave`
--
ALTER TABLE `transporte_aeronave`
  ADD PRIMARY KEY (`ID_AERONAVE`),
  ADD KEY `fk_transporte_aeronave_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_transporte_aeronave_transporte_laerea_idx` (`ID_LAEREA`),
  ADD KEY `fk_transporte_aeronave_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_transporte_aeronave_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `transporte_conductor`
--
ALTER TABLE `transporte_conductor`
  ADD PRIMARY KEY (`ID_CONDUCTOR`),
  ADD KEY `fk_transporte_conductor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_transporte_conductor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_transporte_conductor_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `transporte_laerea`
--
ALTER TABLE `transporte_laerea`
  ADD PRIMARY KEY (`ID_LAEREA`),
  ADD KEY `fk_transporte_laerea_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_transporte_laerea_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_transporte_laerea_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `transporte_naviera`
--
ALTER TABLE `transporte_naviera`
  ADD PRIMARY KEY (`ID_NAVIERA`),
  ADD KEY `fk_transporte_naviera_prinicpal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_transporte_naviera_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_transporte_naviera_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `transporte_transporte`
--
ALTER TABLE `transporte_transporte`
  ADD PRIMARY KEY (`ID_TRANSPORTE`),
  ADD KEY `fk_transporte_transporte_princiapal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_transporte_transporte_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_fk_transporte_transporte_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `ubicacion_ciudad`
--
ALTER TABLE `ubicacion_ciudad`
  ADD PRIMARY KEY (`ID_CIUDAD`),
  ADD KEY `fk_ubicacion_ciudad_ubicacion_comuna_idx` (`ID_COMUNA`);

--
-- Indices de la tabla `ubicacion_comuna`
--
ALTER TABLE `ubicacion_comuna`
  ADD PRIMARY KEY (`ID_COMUNA`),
  ADD KEY `fk_ubicacion_comuna_ubicacion_provincia_idx` (`ID_PROVINCIA`);

--
-- Indices de la tabla `ubicacion_pais`
--
ALTER TABLE `ubicacion_pais`
  ADD PRIMARY KEY (`ID_PAIS`);

--
-- Indices de la tabla `ubicacion_provincia`
--
ALTER TABLE `ubicacion_provincia`
  ADD PRIMARY KEY (`ID_PROVINCIA`),
  ADD KEY `fk_ubicacion_provincia_ubicacion_region_idx` (`ID_REGION`);

--
-- Indices de la tabla `ubicacion_region`
--
ALTER TABLE `ubicacion_region`
  ADD PRIMARY KEY (`ID_REGION`),
  ADD KEY `fk_ubicacion_region_ubicacion_pais_idx` (`ID_PAIS`);

--
-- Indices de la tabla `usuario_aviso`
--
ALTER TABLE `usuario_aviso`
  ADD PRIMARY KEY (`ID_AVISO`),
  ADD KEY `fk_usuario_aviso_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_usuario_aviso_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `usuario_empresaproductor`
--
ALTER TABLE `usuario_empresaproductor`
  ADD PRIMARY KEY (`ID_EMPRESAPRODUCTOR`),
  ADD KEY `fk_usuario_empresaproductor_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_usuario_empresaproductor_usuario_usuariom_idx` (`ID_USUARIOM`),
  ADD KEY `fk_usuario_empresaproductor_usuario_usuario_idx` (`ID_USUARIO`),
  ADD KEY `fk_usuario_empresaproductor_principal_empresa_idx` (`ID_EMPRESA`),
  ADD KEY `fk_usuario_empresaproductor_fruta_productor_idx` (`ID_PRODUCTOR`);

--
-- Indices de la tabla `usuario_mapertura`
--
ALTER TABLE `usuario_mapertura`
  ADD PRIMARY KEY (`ID_MAPERTURA`),
  ADD KEY `fk_usuario_mapertura_usuario_usuario_idx` (`ID_USUARIO`);

--
-- Indices de la tabla `usuario_notificacion`
--
ALTER TABLE `usuario_notificacion`
  ADD PRIMARY KEY (`ID_NOTIFICACION`),
  ADD KEY `idx_destino` (`DESTINO_TIPO`,`DESTINO_ID`),
  ADD KEY `idx_estado` (`ESTADO_REGISTRO`);

--
-- Indices de la tabla `usuario_ptusuario`
--
ALTER TABLE `usuario_ptusuario`
  ADD PRIMARY KEY (`ID_PTUSUARIO`),
  ADD KEY `usuario_ptusuario_usuario_tusuario_idx` (`ID_TUSUARIO`),
  ADD KEY `fk_usuario_ptusuario_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_usuario_ptusuario_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `usuario_tusuario`
--
ALTER TABLE `usuario_tusuario`
  ADD PRIMARY KEY (`ID_TUSUARIO`),
  ADD KEY `fk_usuario_tusuario_usuario_usuarioi_idx` (`ID_USUARIOI`),
  ADD KEY `fk_usuario_tusuario_usuario_usuariom_idx` (`ID_USUARIOM`);

--
-- Indices de la tabla `usuario_usuario`
--
ALTER TABLE `usuario_usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `fk_usuario_usuario_usuario_tusuario_idx` (`ID_TUSUARIO`);

--
-- Indices de la tabla `⁠ fruta_pcdespachomp ⁠`
--
ALTER TABLE `⁠ fruta_pcdespachomp ⁠`
  ADD PRIMARY KEY (`⁠ ID_PCDESPACHO ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_fruta_despachoex_idx ⁠` (`⁠ ID_DESPACHOEX ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_principal_empresa_idx ⁠` (`⁠ ID_EMPRESA ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_principal_planta_idx ⁠` (`⁠ ID_PLANTA ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_principal_temporada_idx ⁠` (`⁠ ID_TEMPORADA ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_usuario_usuarioi_idx ⁠` (`⁠ ID_USUARIOI ⁠`) USING BTREE,
  ADD KEY `⁠ fk_fruta_pcdespacho_usuario_usuariom_idx ⁠` (`⁠ ID_USUARIOM ⁠`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `control_eap`
--
ALTER TABLE `control_eap`
  MODIFY `ID_EAP` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `control_eau`
--
ALTER TABLE `control_eau`
  MODIFY `ID_EAU` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descripcion_servicios`
--
ALTER TABLE `descripcion_servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_anticipo`
--
ALTER TABLE `detalle_anticipo`
  MODIFY `id_detalle_anticipo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa_proceso`
--
ALTER TABLE `empresa_proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estandar_ecomercial`
--
ALTER TABLE `estandar_ecomercial`
  MODIFY `ID_ECOMERCIAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estandar_eexportacion`
--
ALTER TABLE `estandar_eexportacion`
  MODIFY `ID_ESTANDAR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estandar_eindustrial`
--
ALTER TABLE `estandar_eindustrial`
  MODIFY `ID_ESTANDAR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estandar_erecepcion`
--
ALTER TABLE `estandar_erecepcion`
  MODIFY `ID_ESTANDAR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_aaduana`
--
ALTER TABLE `fruta_aaduana`
  MODIFY `ID_AADUANA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_acarga`
--
ALTER TABLE `fruta_acarga`
  MODIFY `ID_ACARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_adestino`
--
ALTER TABLE `fruta_adestino`
  MODIFY `ID_ADESTINO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_agcarga`
--
ALTER TABLE `fruta_agcarga`
  MODIFY `ID_AGCARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_atmosfera`
--
ALTER TABLE `fruta_atmosfera`
  MODIFY `ID_ATMOSFERA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_broker`
--
ALTER TABLE `fruta_broker`
  MODIFY `ID_BROKER` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_ccalidad`
--
ALTER TABLE `fruta_ccalidad`
  MODIFY `ID_CCALIDAD` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_cfolio`
--
ALTER TABLE `fruta_cfolio`
  MODIFY `ID_CFOLIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_cicarga`
--
ALTER TABLE `fruta_cicarga`
  MODIFY `ID_CICARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_comprador`
--
ALTER TABLE `fruta_comprador`
  MODIFY `ID_COMPRADOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_consignatario`
--
ALTER TABLE `fruta_consignatario`
  MODIFY `ID_CONSIGNATARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_contraparte`
--
ALTER TABLE `fruta_contraparte`
  MODIFY `ID_CONTRAPARTE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_cuartel`
--
ALTER TABLE `fruta_cuartel`
  MODIFY `ID_CUARTEL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_cventa`
--
ALTER TABLE `fruta_cventa`
  MODIFY `ID_CVENTA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_despachoex`
--
ALTER TABLE `fruta_despachoex`
  MODIFY `ID_DESPACHOEX` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_despachoind`
--
ALTER TABLE `fruta_despachoind`
  MODIFY `ID_DESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_despachomp`
--
ALTER TABLE `fruta_despachomp`
  MODIFY `ID_DESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_despachopt`
--
ALTER TABLE `fruta_despachopt`
  MODIFY `ID_DESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_dfinal`
--
ALTER TABLE `fruta_dfinal`
  MODIFY `ID_DFINAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_dicarga`
--
ALTER TABLE `fruta_dicarga`
  MODIFY `ID_DICARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_dnotadc`
--
ALTER TABLE `fruta_dnotadc`
  MODIFY `ID_DNOTA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_dpexportacion`
--
ALTER TABLE `fruta_dpexportacion`
  MODIFY `ID_DPEXPORTACION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_dpindustrial`
--
ALTER TABLE `fruta_dpindustrial`
  MODIFY `ID_DPINDUSTRIAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drecepcionind`
--
ALTER TABLE `fruta_drecepcionind`
  MODIFY `ID_DRECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drecepcionmp`
--
ALTER TABLE `fruta_drecepcionmp`
  MODIFY `ID_DRECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drecepcionpt`
--
ALTER TABLE `fruta_drecepcionpt`
  MODIFY `ID_DRECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drepaletizajeex`
--
ALTER TABLE `fruta_drepaletizajeex`
  MODIFY `ID_DREPALETIZAJE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drexportacion`
--
ALTER TABLE `fruta_drexportacion`
  MODIFY `ID_DREXPORTACION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_drindustrial`
--
ALTER TABLE `fruta_drindustrial`
  MODIFY `ID_DRINDUSTRIAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_emisionbl`
--
ALTER TABLE `fruta_emisionbl`
  MODIFY `ID_EMISIONBL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_especies`
--
ALTER TABLE `fruta_especies`
  MODIFY `ID_ESPECIES` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_exiexportacion`
--
ALTER TABLE `fruta_exiexportacion`
  MODIFY `ID_EXIEXPORTACION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_exiindustrial`
--
ALTER TABLE `fruta_exiindustrial`
  MODIFY `ID_EXIINDUSTRIAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_eximateriaprima`
--
ALTER TABLE `fruta_eximateriaprima`
  MODIFY `ID_EXIMATERIAPRIMA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_exportadora`
--
ALTER TABLE `fruta_exportadora`
  MODIFY `ID_EXPORTADORA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_folio`
--
ALTER TABLE `fruta_folio`
  MODIFY `ID_FOLIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_fpago`
--
ALTER TABLE `fruta_fpago`
  MODIFY `ID_FPAGO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_icarga`
--
ALTER TABLE `fruta_icarga`
  MODIFY `ID_ICARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_inpector`
--
ALTER TABLE `fruta_inpector`
  MODIFY `ID_INPECTOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_inpsag`
--
ALTER TABLE `fruta_inpsag`
  MODIFY `ID_INPSAG` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_lcarga`
--
ALTER TABLE `fruta_lcarga`
  MODIFY `ID_LCARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_ldestino`
--
ALTER TABLE `fruta_ldestino`
  MODIFY `ID_LDESTINO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_levantamientomp`
--
ALTER TABLE `fruta_levantamientomp`
  MODIFY `ID_LEVANTAMIENTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_levantamientopt`
--
ALTER TABLE `fruta_levantamientopt`
  MODIFY `ID_LEVANTAMIENTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_mercado`
--
ALTER TABLE `fruta_mercado`
  MODIFY `ID_MERCADO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_mguiaind`
--
ALTER TABLE `fruta_mguiaind`
  MODIFY `ID_MGUIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_mguiamp`
--
ALTER TABLE `fruta_mguiamp`
  MODIFY `ID_MGUIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_mguiapt`
--
ALTER TABLE `fruta_mguiapt`
  MODIFY `ID_MGUIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_mventa`
--
ALTER TABLE `fruta_mventa`
  MODIFY `ID_MVENTA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_notadc`
--
ALTER TABLE `fruta_notadc`
  MODIFY `ID_NOTA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_notificador`
--
ALTER TABLE `fruta_notificador`
  MODIFY `ID_NOTIFICADOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_pcarga`
--
ALTER TABLE `fruta_pcarga`
  MODIFY `ID_PCARGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_pcdespacho`
--
ALTER TABLE `fruta_pcdespacho`
  MODIFY `ID_PCDESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_pcdespachomp`
--
ALTER TABLE `fruta_pcdespachomp`
  MODIFY `ID_PCDESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_pdestino`
--
ALTER TABLE `fruta_pdestino`
  MODIFY `ID_PDESTINO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_proceso`
--
ALTER TABLE `fruta_proceso`
  MODIFY `ID_PROCESO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_productor`
--
ALTER TABLE `fruta_productor`
  MODIFY `ID_PRODUCTOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_recepcionind`
--
ALTER TABLE `fruta_recepcionind`
  MODIFY `ID_RECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_recepcionmp`
--
ALTER TABLE `fruta_recepcionmp`
  MODIFY `ID_RECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_recepcionpt`
--
ALTER TABLE `fruta_recepcionpt`
  MODIFY `ID_RECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_rechazomp`
--
ALTER TABLE `fruta_rechazomp`
  MODIFY `ID_RECHAZO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_rechazopt`
--
ALTER TABLE `fruta_rechazopt`
  MODIFY `ID_RECHAZO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_reembalaje`
--
ALTER TABLE `fruta_reembalaje`
  MODIFY `ID_REEMBALAJE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_repaletizajeex`
--
ALTER TABLE `fruta_repaletizajeex`
  MODIFY `ID_REPALETIZAJE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_rfinal`
--
ALTER TABLE `fruta_rfinal`
  MODIFY `ID_RFINAL` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_rmercado`
--
ALTER TABLE `fruta_rmercado`
  MODIFY `ID_RMERCADO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_seguro`
--
ALTER TABLE `fruta_seguro`
  MODIFY `ID_SEGURO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tcalibre`
--
ALTER TABLE `fruta_tcalibre`
  MODIFY `ID_TCALIBRE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tcalibreind`
--
ALTER TABLE `fruta_tcalibreind`
  MODIFY `ID_TCALIBREIND` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tcategoria`
--
ALTER TABLE `fruta_tcategoria`
  MODIFY `ID_TCATEGORIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tcolor`
--
ALTER TABLE `fruta_tcolor`
  MODIFY `ID_TCOLOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tcontenedor`
--
ALTER TABLE `fruta_tcontenedor`
  MODIFY `ID_TCONTENEDOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tembalaje`
--
ALTER TABLE `fruta_tembalaje`
  MODIFY `ID_TEMBALAJE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tetiqueta`
--
ALTER TABLE `fruta_tetiqueta`
  MODIFY `ID_TETIQUETA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tflete`
--
ALTER TABLE `fruta_tflete`
  MODIFY `ID_TFLETE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tinpsag`
--
ALTER TABLE `fruta_tinpsag`
  MODIFY `ID_TINPSAG` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tmanejo`
--
ALTER TABLE `fruta_tmanejo`
  MODIFY `ID_TMANEJO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tmoneda`
--
ALTER TABLE `fruta_tmoneda`
  MODIFY `ID_TMONEDA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tproceso`
--
ALTER TABLE `fruta_tproceso`
  MODIFY `ID_TPROCESO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tproductor`
--
ALTER TABLE `fruta_tproductor`
  MODIFY `ID_TPRODUCTOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tratamineto1`
--
ALTER TABLE `fruta_tratamineto1`
  MODIFY `ID_TTRATAMIENTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tratamineto2`
--
ALTER TABLE `fruta_tratamineto2`
  MODIFY `ID_TTRATAMIENTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_treembalaje`
--
ALTER TABLE `fruta_treembalaje`
  MODIFY `ID_TREEMBALAJE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_tservicio`
--
ALTER TABLE `fruta_tservicio`
  MODIFY `ID_TSERVICIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fruta_vespecies`
--
ALTER TABLE `fruta_vespecies`
  MODIFY `ID_VESPECIES` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_anticipo`
--
ALTER TABLE `liquidacion_anticipo`
  MODIFY `id_anticipo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_ddvalor`
--
ALTER TABLE `liquidacion_ddvalor`
  MODIFY `ID_DDVALOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_dvalor`
--
ALTER TABLE `liquidacion_dvalor`
  MODIFY `ID_DVALOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_dvalorp`
--
ALTER TABLE `liquidacion_dvalorp`
  MODIFY `ID_DVALOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_titem`
--
ALTER TABLE `liquidacion_titem`
  MODIFY `ID_TITEM` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_valor`
--
ALTER TABLE `liquidacion_valor`
  MODIFY `ID_VALOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion_valorp`
--
ALTER TABLE `liquidacion_valorp`
  MODIFY `ID_VALOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_cliente`
--
ALTER TABLE `material_cliente`
  MODIFY `ID_CLIENTE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_despachoe`
--
ALTER TABLE `material_despachoe`
  MODIFY `ID_DESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_despachom`
--
ALTER TABLE `material_despachom`
  MODIFY `ID_DESPACHO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_dficha`
--
ALTER TABLE `material_dficha`
  MODIFY `ID_DFICHA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_docompra`
--
ALTER TABLE `material_docompra`
  MODIFY `ID_DOCOMPRA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_drecepcionm`
--
ALTER TABLE `material_drecepcionm`
  MODIFY `ID_DRECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_familia`
--
ALTER TABLE `material_familia`
  MODIFY `ID_FAMILIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_ficha`
--
ALTER TABLE `material_ficha`
  MODIFY `ID_FICHA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_folio`
--
ALTER TABLE `material_folio`
  MODIFY `ID_FOLIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_fpago`
--
ALTER TABLE `material_fpago`
  MODIFY `ID_FPAGO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_inventarioe`
--
ALTER TABLE `material_inventarioe`
  MODIFY `ID_INVENTARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_inventariom`
--
ALTER TABLE `material_inventariom`
  MODIFY `ID_INVENTARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_mguiae`
--
ALTER TABLE `material_mguiae`
  MODIFY `ID_MGUIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_mguiam`
--
ALTER TABLE `material_mguiam`
  MODIFY `ID_MGUIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_mocompra`
--
ALTER TABLE `material_mocompra`
  MODIFY `ID_MOCOMPRA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_ocompra`
--
ALTER TABLE `material_ocompra`
  MODIFY `ID_OCOMPRA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_producto`
--
ALTER TABLE `material_producto`
  MODIFY `ID_PRODUCTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_proveedor`
--
ALTER TABLE `material_proveedor`
  MODIFY `ID_PROVEEDOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_recepcione`
--
ALTER TABLE `material_recepcione`
  MODIFY `ID_RECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_recepcionm`
--
ALTER TABLE `material_recepcionm`
  MODIFY `ID_RECEPCION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_responsable`
--
ALTER TABLE `material_responsable`
  MODIFY `ID_RESPONSABLE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_subfamilia`
--
ALTER TABLE `material_subfamilia`
  MODIFY `ID_SUBFAMILIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_tarjam`
--
ALTER TABLE `material_tarjam`
  MODIFY `ID_TARJA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_tcontenedor`
--
ALTER TABLE `material_tcontenedor`
  MODIFY `ID_TCONTENEDOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_tdocumento`
--
ALTER TABLE `material_tdocumento`
  MODIFY `ID_TDOCUMENTO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_tmoneda`
--
ALTER TABLE `material_tmoneda`
  MODIFY `ID_TMONEDA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material_tumedida`
--
ALTER TABLE `material_tumedida`
  MODIFY `ID_TUMEDIDA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `principal_bodega`
--
ALTER TABLE `principal_bodega`
  MODIFY `ID_BODEGA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `principal_empresa`
--
ALTER TABLE `principal_empresa`
  MODIFY `ID_EMPRESA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `principal_planta`
--
ALTER TABLE `principal_planta`
  MODIFY `ID_PLANTA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `principal_temporada`
--
ALTER TABLE `principal_temporada`
  MODIFY `ID_TEMPORADA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_calidad`
--
ALTER TABLE `registro_calidad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_documento`
--
ALTER TABLE `tb_documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte_aeronave`
--
ALTER TABLE `transporte_aeronave`
  MODIFY `ID_AERONAVE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte_conductor`
--
ALTER TABLE `transporte_conductor`
  MODIFY `ID_CONDUCTOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte_laerea`
--
ALTER TABLE `transporte_laerea`
  MODIFY `ID_LAEREA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte_naviera`
--
ALTER TABLE `transporte_naviera`
  MODIFY `ID_NAVIERA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte_transporte`
--
ALTER TABLE `transporte_transporte`
  MODIFY `ID_TRANSPORTE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_ciudad`
--
ALTER TABLE `ubicacion_ciudad`
  MODIFY `ID_CIUDAD` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_comuna`
--
ALTER TABLE `ubicacion_comuna`
  MODIFY `ID_COMUNA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_pais`
--
ALTER TABLE `ubicacion_pais`
  MODIFY `ID_PAIS` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_provincia`
--
ALTER TABLE `ubicacion_provincia`
  MODIFY `ID_PROVINCIA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion_region`
--
ALTER TABLE `ubicacion_region`
  MODIFY `ID_REGION` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_aviso`
--
ALTER TABLE `usuario_aviso`
  MODIFY `ID_AVISO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_empresaproductor`
--
ALTER TABLE `usuario_empresaproductor`
  MODIFY `ID_EMPRESAPRODUCTOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_mapertura`
--
ALTER TABLE `usuario_mapertura`
  MODIFY `ID_MAPERTURA` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_notificacion`
--
ALTER TABLE `usuario_notificacion`
  MODIFY `ID_NOTIFICACION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_ptusuario`
--
ALTER TABLE `usuario_ptusuario`
  MODIFY `ID_PTUSUARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_tusuario`
--
ALTER TABLE `usuario_tusuario`
  MODIFY `ID_TUSUARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_usuario`
--
ALTER TABLE `usuario_usuario`
  MODIFY `ID_USUARIO` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `⁠ fruta_pcdespachomp ⁠`
--
ALTER TABLE `⁠ fruta_pcdespachomp ⁠`
  MODIFY `⁠ ID_PCDESPACHO ⁠` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `control_eap`
--
ALTER TABLE `control_eap`
  ADD CONSTRAINT `fk_control_eap_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eap_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eap_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eap_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `control_eau`
--
ALTER TABLE `control_eau`
  ADD CONSTRAINT `fk_control_eau_princiapl_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eau_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eau_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_control_eau_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `estandar_ecomercial`
--
ALTER TABLE `estandar_ecomercial`
  ADD CONSTRAINT `fk_estandar_ecomercial_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_ecomercial_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_ecomercial_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `estandar_eexportacion`
--
ALTER TABLE `estandar_eexportacion`
  ADD CONSTRAINT `fk_estandar_eexportacion_estandar_ecomercial` FOREIGN KEY (`ID_ECOMERCIAL`) REFERENCES `estandar_ecomercial` (`ID_ECOMERCIAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_fruta_especies` FOREIGN KEY (`ID_ESPECIES`) REFERENCES `fruta_especies` (`ID_ESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_fruta_tetiqueta` FOREIGN KEY (`ID_TETIQUETA`) REFERENCES `fruta_tetiqueta` (`ID_TETIQUETA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eexportacion_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `estandar_eindustrial`
--
ALTER TABLE `estandar_eindustrial`
  ADD CONSTRAINT `fk_estandar_eindustrial_fruta_especies` FOREIGN KEY (`ID_ESPECIES`) REFERENCES `fruta_especies` (`ID_ESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eindustrial_material_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eindustrial_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eindustrial_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_eindustrial_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `estandar_erecepcion`
--
ALTER TABLE `estandar_erecepcion`
  ADD CONSTRAINT `fk_estandar_erecepcion_fruta_especies` FOREIGN KEY (`ID_ESPECIES`) REFERENCES `fruta_especies` (`ID_ESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_erecepcion_material_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_erecepcion_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_erecepcion_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estandar_erecepcion_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_aaduana`
--
ALTER TABLE `fruta_aaduana`
  ADD CONSTRAINT `fk_fruta_aaduana_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_aaduana_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_aaduana_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_aaduana_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_acarga`
--
ALTER TABLE `fruta_acarga`
  ADD CONSTRAINT `fk_fruta_acarga_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_acarga_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_acarga_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_adestino`
--
ALTER TABLE `fruta_adestino`
  ADD CONSTRAINT `fk_fruta_adestino_principal_empres` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_adestino_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_adestino_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_agcarga`
--
ALTER TABLE `fruta_agcarga`
  ADD CONSTRAINT `fk_fruta_agcarga_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_agcarga_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_agcarga_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_agcarga_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_atmosfera`
--
ALTER TABLE `fruta_atmosfera`
  ADD CONSTRAINT `fk_fruta_atmosfera_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_atmosfera_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_atmosfera_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_broker`
--
ALTER TABLE `fruta_broker`
  ADD CONSTRAINT `fk_fruta_broker_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_broker_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_broker_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_ccalidad`
--
ALTER TABLE `fruta_ccalidad`
  ADD CONSTRAINT `fk_fruta_ccalidad_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_ccalidad_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_ccalidad_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_cfolio`
--
ALTER TABLE `fruta_cfolio`
  ADD CONSTRAINT `fk_fruta_cfolio_fruta_exiexportacion` FOREIGN KEY (`ID_EXIEXPORTACION`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cfolio_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_cicarga`
--
ALTER TABLE `fruta_cicarga`
  ADD CONSTRAINT `fk_fruta_cicarga_fruta_exiexportacion` FOREIGN KEY (`ID_EXIEXPORTACION`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cicarga_fruta_icargad` FOREIGN KEY (`ID_ICARGAN`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cicarga_fruta_icargao` FOREIGN KEY (`ID_ICARGAO`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cicarga_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_comprador`
--
ALTER TABLE `fruta_comprador`
  ADD CONSTRAINT `fk_fruta_comprador_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_comprador_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_comprador_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_comprador_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_consignatario`
--
ALTER TABLE `fruta_consignatario`
  ADD CONSTRAINT `fk_fruta_consignatario_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_consignatario_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_consignatario_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_contraparte`
--
ALTER TABLE `fruta_contraparte`
  ADD CONSTRAINT `fk_fruta_contraparte_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_contraparte_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_contraparte_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_contraparte_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_cuartel`
--
ALTER TABLE `fruta_cuartel`
  ADD CONSTRAINT `fk_fruta_cuartel_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cuartel_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cuartel_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cuartel_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_cventa`
--
ALTER TABLE `fruta_cventa`
  ADD CONSTRAINT `fk_fruta_cventa_principal_emrpresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cventa_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_cventa_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_despachoex`
--
ALTER TABLE `fruta_despachoex`
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_acarga` FOREIGN KEY (`ID_ACARGA`) REFERENCES `fruta_acarga` (`ID_ACARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_adestino` FOREIGN KEY (`ID_ADESTINO`) REFERENCES `fruta_adestino` (`ID_ADESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_agcarga` FOREIGN KEY (`ID_AGCARGA`) REFERENCES `fruta_agcarga` (`ID_AGCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_contraparte` FOREIGN KEY (`ID_CONTRAPARTE`) REFERENCES `fruta_contraparte` (`ID_CONTRAPARTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_dfinal` FOREIGN KEY (`ID_DFINAL`) REFERENCES `fruta_dfinal` (`ID_DFINAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_exportadora` FOREIGN KEY (`ID_EXPPORTADORA`) REFERENCES `fruta_exportadora` (`ID_EXPORTADORA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_inpector` FOREIGN KEY (`ID_INPECTOR`) REFERENCES `fruta_inpector` (`ID_INPECTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_lcarga` FOREIGN KEY (`ID_LCARGA`) REFERENCES `fruta_lcarga` (`ID_LCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_ldestino` FOREIGN KEY (`ID_LDESTINO`) REFERENCES `fruta_ldestino` (`ID_LDESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_mercado` FOREIGN KEY (`ID_MERCADO`) REFERENCES `fruta_mercado` (`ID_MERCADO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_pcarga` FOREIGN KEY (`ID_PCARGA`) REFERENCES `fruta_pcarga` (`ID_PCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_pdestino` FOREIGN KEY (`ID_PDESTINO`) REFERENCES `fruta_pdestino` (`ID_PDESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_fruta_rfinal` FOREIGN KEY (`ID_RFINAL`) REFERENCES `fruta_rfinal` (`ID_RFINAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_aeronave` FOREIGN KEY (`ID_AERONAVE`) REFERENCES `transporte_aeronave` (`ID_AERONAVE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_larea` FOREIGN KEY (`ID_LAREA`) REFERENCES `transporte_laerea` (`ID_LAEREA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_naviera` FOREIGN KEY (`ID_NAVIERA`) REFERENCES `transporte_naviera` (`ID_NAVIERA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_transporte_transporte2` FOREIGN KEY (`ID_TRANSPORTE2`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_ubicacion_pais` FOREIGN KEY (`ID_PAIS`) REFERENCES `ubicacion_pais` (`ID_PAIS`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_usuario_usuaioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoex_usuario_usuaiom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_despachoind`
--
ALTER TABLE `fruta_despachoind`
  ADD CONSTRAINT `fk_fruta_despachoind_fruta_comprador` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `fruta_comprador` (`ID_COMPRADOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachoind_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_despachomp`
--
ALTER TABLE `fruta_despachomp`
  ADD CONSTRAINT `fk_fruta_despachomp_fruta_comprador` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `fruta_comprador` (`ID_COMPRADOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_fruta_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachomp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_despachopt`
--
ALTER TABLE `fruta_despachopt`
  ADD CONSTRAINT `fk_fruta_despachopt_fruta_comprador` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `fruta_comprador` (`ID_COMPRADOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_despachopt_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_dfinal`
--
ALTER TABLE `fruta_dfinal`
  ADD CONSTRAINT `fk_fruta_dfinal_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dfinal_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dfinal_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_dicarga`
--
ALTER TABLE `fruta_dicarga`
  ADD CONSTRAINT `fk_fruta_dicarga_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dicarga_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dicarga_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dicarga_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dicarga_fruta_tmoneda` FOREIGN KEY (`ID_TMONEDA`) REFERENCES `fruta_tmoneda` (`ID_TMONEDA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dicarga_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_dnotadc`
--
ALTER TABLE `fruta_dnotadc`
  ADD CONSTRAINT `fk_fruta_dnotadc_fruta_dicarga` FOREIGN KEY (`ID_DICARGA`) REFERENCES `fruta_dicarga` (`ID_DICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dnotadc_fruta_notadc` FOREIGN KEY (`ID_NOTA`) REFERENCES `fruta_notadc` (`ID_NOTA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_dpexportacion`
--
ALTER TABLE `fruta_dpexportacion`
  ADD CONSTRAINT `fk_fruta_dpexportacion_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_proceso` FOREIGN KEY (`ID_PROCESO`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_tcategoria` FOREIGN KEY (`ID_TCATEGORIA`) REFERENCES `fruta_tcategoria` (`ID_TCATEGORIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpexportacion_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_dpindustrial`
--
ALTER TABLE `fruta_dpindustrial`
  ADD CONSTRAINT `fk_fruta_dpindustrial_estandar_eindustrial` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eindustrial` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpindustrial_frtua_proceso` FOREIGN KEY (`ID_PROCESO`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpindustrial_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpindustrial_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpindustrial_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_dpindustrial_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drecepcionind`
--
ALTER TABLE `fruta_drecepcionind`
  ADD CONSTRAINT `fk_fruta_drecepcionind_estandar_eindustrial` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eindustrial` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionind_frtua_recepcionind` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionind` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionind_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionind_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionind_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionind_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drecepcionmp`
--
ALTER TABLE `fruta_drecepcionmp`
  ADD CONSTRAINT `fk_fruta_drecepcionmp_estandar_erecepcion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_erecepcion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_recepcionmp` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionmp` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_ttratamiento1` FOREIGN KEY (`ID_TTRATAMIENTO1`) REFERENCES `fruta_tratamineto1` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_ttratamiento2` FOREIGN KEY (`ID_TTRATAMIENTO2`) REFERENCES `fruta_tratamineto2` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionmp_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drecepcionpt`
--
ALTER TABLE `fruta_drecepcionpt`
  ADD CONSTRAINT `fk_fruta_drecepcionpt_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_recepcionpt` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionpt` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_tcategoria` FOREIGN KEY (`ID_TCATEGORIA`) REFERENCES `fruta_tcategoria` (`ID_TCATEGORIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_tcolor` FOREIGN KEY (`ID_TCOLOR`) REFERENCES `fruta_tcolor` (`ID_TCOLOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drecepcionpt_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drepaletizajeex`
--
ALTER TABLE `fruta_drepaletizajeex`
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_exiexportacion` FOREIGN KEY (`ID_EXIEXPORTACION`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_repaletizaje` FOREIGN KEY (`ID_REPALETIZAJE`) REFERENCES `fruta_repaletizajeex` (`ID_REPALETIZAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drepaletizajeex_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drexportacion`
--
ALTER TABLE `fruta_drexportacion`
  ADD CONSTRAINT `fk_fruta_drexportacion_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_tcategoria` FOREIGN KEY (`ID_TCATEGORIA`) REFERENCES `fruta_tcategoria` (`ID_TCATEGORIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_treembalaje` FOREIGN KEY (`ID_REEMBALAJE`) REFERENCES `fruta_reembalaje` (`ID_REEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drexportacion_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_drindustrial`
--
ALTER TABLE `fruta_drindustrial`
  ADD CONSTRAINT `fk_fruta_drindustrial_estandar_eindustrial` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eindustrial` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drindustrial_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drindustrial_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drindustrial_fruta_reembalaje` FOREIGN KEY (`ID_REEMBALAJE`) REFERENCES `fruta_reembalaje` (`ID_REEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drindustrial_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_drindustrial_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_emisionbl`
--
ALTER TABLE `fruta_emisionbl`
  ADD CONSTRAINT `fruta_emisionbl_ibfk_1` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_emisionbl_ibfk_2` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_emisionbl_ibfk_3` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_especies`
--
ALTER TABLE `fruta_especies`
  ADD CONSTRAINT `fk_fruta_especies_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_especies_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_exiexportacion`
--
ALTER TABLE `fruta_exiexportacion`
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_despacho` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachopt` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_despacho2` FOREIGN KEY (`ID_DESPACHO2`) REFERENCES `fruta_despachopt` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_despachoex` FOREIGN KEY (`ID_DESPACHOEX`) REFERENCES `fruta_despachoex` (`ID_DESPACHOEX`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_exiexportacion2` FOREIGN KEY (`ID_EXIEXPORTACION2`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_inpsag` FOREIGN KEY (`ID_INPSAG`) REFERENCES `fruta_inpsag` (`ID_INPSAG`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_inpsag2` FOREIGN KEY (`ID_INPSAG2`) REFERENCES `fruta_inpsag` (`ID_INPSAG`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_levantamientopt` FOREIGN KEY (`ID_LEVANTAMIENTO`) REFERENCES `fruta_levantamientopt` (`ID_LEVANTAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_pcdespacho` FOREIGN KEY (`ID_PCDESPACHO`) REFERENCES `fruta_pcdespacho` (`ID_PCDESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_proceso` FOREIGN KEY (`ID_PROCESO`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_recepcion` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionpt` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_rechazopt` FOREIGN KEY (`ID_RECHAZADO`) REFERENCES `fruta_rechazopt` (`ID_RECHAZO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_reembalaje` FOREIGN KEY (`ID_REEMBALAJE`) REFERENCES `fruta_reembalaje` (`ID_REEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_repaletizaje` FOREIGN KEY (`ID_REPALETIZAJE`) REFERENCES `fruta_repaletizajeex` (`ID_REPALETIZAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_repaletizaje2` FOREIGN KEY (`ID_REPALETIZAJE2`) REFERENCES `fruta_repaletizajeex` (`ID_REPALETIZAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_tcategoria` FOREIGN KEY (`ID_TCATEGORIA`) REFERENCES `fruta_tcategoria` (`ID_TCATEGORIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_tcolor` FOREIGN KEY (`ID_TCOLOR`) REFERENCES `fruta_tcolor` (`ID_TCOLOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiexportacion_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_exiindustrial`
--
ALTER TABLE `fruta_exiindustrial`
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_despacho2` FOREIGN KEY (`ID_DESPACHO2`) REFERENCES `fruta_despachoind` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_despacho3` FOREIGN KEY (`ID_DESPACHO3`) REFERENCES `fruta_despachoind` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_estandar_eindustrial` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eindustrial` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_estandar_erecepcion` FOREIGN KEY (`ID_ESTANDARMP`) REFERENCES `estandar_erecepcion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_exiindustrial2` FOREIGN KEY (`ID_EXIINDUSTRIAL2`) REFERENCES `fruta_exiindustrial` (`ID_EXIINDUSTRIAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_levantamientomp` FOREIGN KEY (`ID_LEVANTAMIENTOMP`) REFERENCES `fruta_levantamientomp` (`ID_LEVANTAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_proceso` FOREIGN KEY (`ID_PROCESO`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_recepcion` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionind` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_rechazomp` FOREIGN KEY (`ID_RECHAZADOMP`) REFERENCES `fruta_rechazomp` (`ID_RECHAZO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_tembalaje` FOREIGN KEY (`ID_TEMBALAJE`) REFERENCES `fruta_tembalaje` (`ID_TEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_ttratamiento1` FOREIGN KEY (`ID_TTRATAMIENTO1`) REFERENCES `fruta_tratamineto1` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_ttratamiento2` FOREIGN KEY (`ID_TTRATAMIENTO2`) REFERENCES `fruta_tratamineto2` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_despacho` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachoind` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_reembalaje` FOREIGN KEY (`ID_REEMBALAJE`) REFERENCES `fruta_reembalaje` (`ID_REEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exiindustrial_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_eximateriaprima`
--
ALTER TABLE `fruta_eximateriaprima`
  ADD CONSTRAINT `fk_fruta_eximateriaprima_estandar_erecepcion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_erecepcion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_despacho` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachomp` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_despacho2` FOREIGN KEY (`ID_DESPACHO2`) REFERENCES `fruta_despachomp` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_despacho3` FOREIGN KEY (`ID_DESPACHO3`) REFERENCES `fruta_despachomp` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_eximateriaprima2` FOREIGN KEY (`ID_EXIMATERIAPRIMA2`) REFERENCES `fruta_eximateriaprima` (`ID_EXIMATERIAPRIMA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `fruta_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_levantamientomp` FOREIGN KEY (`ID_LEVANTAMIENTO`) REFERENCES `fruta_levantamientomp` (`ID_LEVANTAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_proceso` FOREIGN KEY (`ID_PROCESO`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_proceso2` FOREIGN KEY (`ID_PROCESO2`) REFERENCES `fruta_proceso` (`ID_PROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_recepcion` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `fruta_recepcionmp` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_rechazomp` FOREIGN KEY (`ID_RECHAZADO`) REFERENCES `fruta_rechazomp` (`ID_RECHAZO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_tmanejo` FOREIGN KEY (`ID_TMANEJO`) REFERENCES `fruta_tmanejo` (`ID_TMANEJO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_ttratamineto1` FOREIGN KEY (`ID_TTRATAMIENTO1`) REFERENCES `fruta_tratamineto1` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_ttratamineto2` FOREIGN KEY (`ID_TTRATAMIENTO2`) REFERENCES `fruta_tratamineto2` (`ID_TTRATAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_eximateriaprima_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_exportadora`
--
ALTER TABLE `fruta_exportadora`
  ADD CONSTRAINT `fk_fruta_exportadora_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exportadora_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exportadora_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_exportadora_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_folio`
--
ALTER TABLE `fruta_folio`
  ADD CONSTRAINT `fk_fruta_folio_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_folio_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_folio_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_folio_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_folio_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_fpago`
--
ALTER TABLE `fruta_fpago`
  ADD CONSTRAINT `fk_fruta_fpago_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_fpago_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_fpago_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_icarga`
--
ALTER TABLE `fruta_icarga`
  ADD CONSTRAINT `fk_fruta_icarga_fruta_acarga` FOREIGN KEY (`ID_ACARGA`) REFERENCES `fruta_acarga` (`ID_ACARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_adestino` FOREIGN KEY (`ID_ADESTINO`) REFERENCES `fruta_adestino` (`ID_ADESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_aduana` FOREIGN KEY (`ID_AADUANA`) REFERENCES `fruta_aaduana` (`ID_AADUANA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_agcarga` FOREIGN KEY (`ID_AGCARGA`) REFERENCES `fruta_agcarga` (`ID_AGCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_atmosfera` FOREIGN KEY (`ID_ATMOSFERA`) REFERENCES `fruta_atmosfera` (`ID_ATMOSFERA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_broker` FOREIGN KEY (`ID_BROKER`) REFERENCES `fruta_broker` (`ID_BROKER`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_consignatario` FOREIGN KEY (`ID_CONSIGNATARIO`) REFERENCES `fruta_consignatario` (`ID_CONSIGNATARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_cventa` FOREIGN KEY (`ID_CVENTA`) REFERENCES `fruta_cventa` (`ID_CVENTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_dfinal` FOREIGN KEY (`ID_DFINAL`) REFERENCES `fruta_dfinal` (`ID_DFINAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_exportadora` FOREIGN KEY (`ID_EXPPORTADORA`) REFERENCES `fruta_exportadora` (`ID_EXPORTADORA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_fpago` FOREIGN KEY (`ID_FPAGO`) REFERENCES `fruta_fpago` (`ID_FPAGO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_lcarga` FOREIGN KEY (`ID_LCARGA`) REFERENCES `fruta_lcarga` (`ID_LCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_ldestino` FOREIGN KEY (`ID_LDESTINO`) REFERENCES `fruta_ldestino` (`ID_LDESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_mercado` FOREIGN KEY (`ID_MERCADO`) REFERENCES `fruta_mercado` (`ID_MERCADO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_mventa` FOREIGN KEY (`ID_MVENTA`) REFERENCES `fruta_mventa` (`ID_MVENTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_notificador` FOREIGN KEY (`ID_NOTIFICADOR`) REFERENCES `fruta_notificador` (`ID_NOTIFICADOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_pcarga` FOREIGN KEY (`ID_PCARGA`) REFERENCES `fruta_pcarga` (`ID_PCARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_pdestino` FOREIGN KEY (`ID_PDESTINO`) REFERENCES `fruta_pdestino` (`ID_PDESTINO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_rfinal` FOREIGN KEY (`ID_RFINAL`) REFERENCES `fruta_rfinal` (`ID_RFINAL`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_seguro` FOREIGN KEY (`ID_SEGURO`) REFERENCES `fruta_seguro` (`ID_SEGURO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_tcontenedor` FOREIGN KEY (`ID_TCONTENEDOR`) REFERENCES `fruta_tcontenedor` (`ID_TCONTENEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_tflete` FOREIGN KEY (`ID_TFLETE`) REFERENCES `fruta_tflete` (`ID_TFLETE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_fruta_tservicio` FOREIGN KEY (`ID_TSERVICIO`) REFERENCES `fruta_tservicio` (`ID_TSERVICIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_transporte_aeronave` FOREIGN KEY (`ID_AERONAVE`) REFERENCES `transporte_aeronave` (`ID_AERONAVE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_transporte_larea` FOREIGN KEY (`ID_LAREA`) REFERENCES `transporte_laerea` (`ID_LAEREA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_transporte_naviera` FOREIGN KEY (`ID_NAVIERA`) REFERENCES `transporte_naviera` (`ID_NAVIERA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_ubicacion_pais` FOREIGN KEY (`ID_PAIS`) REFERENCES `ubicacion_pais` (`ID_PAIS`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_icarga_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_inpector`
--
ALTER TABLE `fruta_inpector`
  ADD CONSTRAINT `fk_fruta_inpector_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpector_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpector_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpector_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_inpsag`
--
ALTER TABLE `fruta_inpsag`
  ADD CONSTRAINT `fk_fruta_inpsag_contraparte` FOREIGN KEY (`ID_CONTRAPARTE`) REFERENCES `fruta_contraparte` (`ID_CONTRAPARTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_fruta_inspector` FOREIGN KEY (`ID_INPECTOR`) REFERENCES `fruta_inpector` (`ID_INPECTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_fruta_tinpsag` FOREIGN KEY (`ID_TINPSAG`) REFERENCES `fruta_tinpsag` (`ID_TINPSAG`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_inpsag_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_lcarga`
--
ALTER TABLE `fruta_lcarga`
  ADD CONSTRAINT `fk_fruta_lcarga_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_lcarga_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_lcarga_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_ldestino`
--
ALTER TABLE `fruta_ldestino`
  ADD CONSTRAINT `fk_fruta_ldestino_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_ldestino_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_ldestino_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_leamp`
--
ALTER TABLE `fruta_leamp`
  ADD CONSTRAINT `fk_fruta_leamp_fruta_eximateriaprima` FOREIGN KEY (`ID_EXIMATERIAPRIMA`) REFERENCES `fruta_eximateriaprima` (`ID_EXIMATERIAPRIMA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_leamp_fruta_levantamientomp` FOREIGN KEY (`ID_LEVANTAMIENTO`) REFERENCES `fruta_levantamientomp` (`ID_LEVANTAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_leapt`
--
ALTER TABLE `fruta_leapt`
  ADD CONSTRAINT `fk_fruta_leapt_fruta_exiexportacion` FOREIGN KEY (`ID_EXIEXPORTACION`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_leapt_fruta_levantamientopt` FOREIGN KEY (`ID_LEVANTAMIENTO`) REFERENCES `fruta_levantamientopt` (`ID_LEVANTAMIENTO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_levantamientomp`
--
ALTER TABLE `fruta_levantamientomp`
  ADD CONSTRAINT `fk_fruta_levantamientomp_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientomp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_levantamientopt`
--
ALTER TABLE `fruta_levantamientopt`
  ADD CONSTRAINT `fk_fruta_levantamientopt_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_levantamientopt_usuario_usuarioim` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_mercado`
--
ALTER TABLE `fruta_mercado`
  ADD CONSTRAINT `fk_fruta_mercado_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mercado_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mercado_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_mguiaind`
--
ALTER TABLE `fruta_mguiaind`
  ADD CONSTRAINT `fk_fruta_mguiaind_fruta_despacho` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachoind` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiaind_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_mguiamp`
--
ALTER TABLE `fruta_mguiamp`
  ADD CONSTRAINT `fk_fruta_mguiamp_fruta_despachomp` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachomp` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiamp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_mguiapt`
--
ALTER TABLE `fruta_mguiapt`
  ADD CONSTRAINT `fk_fruta_mguiapt_fruta_despacho` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `fruta_despachopt` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mguiapt_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_mventa`
--
ALTER TABLE `fruta_mventa`
  ADD CONSTRAINT `fk_fruta_mventa_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mventa_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_mventa_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_notadc`
--
ALTER TABLE `fruta_notadc`
  ADD CONSTRAINT `fk_fruta_notadc_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notadc_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notadc_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notadc_usuaio_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notadc_usuaio_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_notificador`
--
ALTER TABLE `fruta_notificador`
  ADD CONSTRAINT `fk_fruta_notificador_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notificador_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_notificador_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_pcarga`
--
ALTER TABLE `fruta_pcarga`
  ADD CONSTRAINT `fk_fruta_pcarga_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcarga_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcarga_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_pcdespacho`
--
ALTER TABLE `fruta_pcdespacho`
  ADD CONSTRAINT `fk_fruta_pcdespacho_fruta_despachoex` FOREIGN KEY (`ID_DESPACHOEX`) REFERENCES `fruta_despachoex` (`ID_DESPACHOEX`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcdespacho_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcdespacho_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcdespacho_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcdespacho_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pcdespacho_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_pcdespachomp`
--
ALTER TABLE `fruta_pcdespachomp`
  ADD CONSTRAINT `fruta_pcdespachomp_ibfk_2` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_pcdespachomp_ibfk_3` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_pcdespachomp_ibfk_4` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_pcdespachomp_ibfk_5` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_pcdespachomp_ibfk_6` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_pdestino`
--
ALTER TABLE `fruta_pdestino`
  ADD CONSTRAINT `fk_fruta_pdestino_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pdestino_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_pdestino_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_proceso`
--
ALTER TABLE `fruta_proceso`
  ADD CONSTRAINT `fk_fruta_proceso_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_fruta_tproceso` FOREIGN KEY (`ID_TPROCESO`) REFERENCES `fruta_tproceso` (`ID_TPROCESO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_proceso_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_productor`
--
ALTER TABLE `fruta_productor`
  ADD CONSTRAINT `fk_fruta_productor_fruta_tproductor` FOREIGN KEY (`ID_TPRODUCTOR`) REFERENCES `fruta_tproductor` (`ID_TPRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_princiapal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_ubicacion_provincia` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `ubicacion_provincia` (`ID_PROVINCIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_ubicacion_region` FOREIGN KEY (`ID_REGION`) REFERENCES `ubicacion_region` (`ID_REGION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_productor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_reamp`
--
ALTER TABLE `fruta_reamp`
  ADD CONSTRAINT `fk_fruta_reamp_fruta_eximateriaprima` FOREIGN KEY (`ID_EXIMATERIAPRIMA`) REFERENCES `fruta_eximateriaprima` (`ID_EXIMATERIAPRIMA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reamp_fruta_rechazomp` FOREIGN KEY (`ID_RECHAZO`) REFERENCES `fruta_rechazomp` (`ID_RECHAZO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_reapt`
--
ALTER TABLE `fruta_reapt`
  ADD CONSTRAINT `fk_fruta_raept_fruta_exiexportacion` FOREIGN KEY (`ID_EXIEXPORTACION`) REFERENCES `fruta_exiexportacion` (`ID_EXIEXPORTACION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_raept_fruta_rechazopt` FOREIGN KEY (`ID_RECHAZO`) REFERENCES `fruta_rechazopt` (`ID_RECHAZO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_recepcionind`
--
ALTER TABLE `fruta_recepcionind`
  ADD CONSTRAINT `fk_fruta_recepcionind_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionind_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_recepcionmp`
--
ALTER TABLE `fruta_recepcionmp`
  ADD CONSTRAINT `fk_fruta_recepcionmp_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionmp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_recepcionpt`
--
ALTER TABLE `fruta_recepcionpt`
  ADD CONSTRAINT `fk_fruta_recepcionpt_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_principal_empresa_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_recepcionpt_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_rechazomp`
--
ALTER TABLE `fruta_rechazomp`
  ADD CONSTRAINT `fk_fruta_rechazomp_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazomp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_rechazopt`
--
ALTER TABLE `fruta_rechazopt`
  ADD CONSTRAINT `fk_fruta_rechazopt_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rechazopt_usuario_usuarioim` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_reembalaje`
--
ALTER TABLE `fruta_reembalaje`
  ADD CONSTRAINT `fk_fruta_reembalaje_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_fruta_treembalaje` FOREIGN KEY (`ID_TREEMBALAJE`) REFERENCES `fruta_treembalaje` (`ID_TREEMBALAJE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_fruta_vespecies` FOREIGN KEY (`ID_VESPECIES`) REFERENCES `fruta_vespecies` (`ID_VESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_reembalaje_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_repaletizajeex`
--
ALTER TABLE `fruta_repaletizajeex`
  ADD CONSTRAINT `fk_fruta_repaletizajeex_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_repaletizajeex_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_repaletizajeex_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_repaletizajeex_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_repaletizajeex_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_rfinal`
--
ALTER TABLE `fruta_rfinal`
  ADD CONSTRAINT `fk_fruta_rfinal_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rfinal_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rfinal_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_rmercado`
--
ALTER TABLE `fruta_rmercado`
  ADD CONSTRAINT `fk_fruta_rmercado_fruta_mercado` FOREIGN KEY (`ID_MERCADO`) REFERENCES `fruta_mercado` (`ID_MERCADO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rmercado_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rmercado_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rmercado_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_rmercado_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_seguro`
--
ALTER TABLE `fruta_seguro`
  ADD CONSTRAINT `fk_fruta_seguro_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_seguro_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_seguro_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tcalibre`
--
ALTER TABLE `fruta_tcalibre`
  ADD CONSTRAINT `fk_fk_fruta_tcalibre_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcalibre_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcalibre_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tcategoria`
--
ALTER TABLE `fruta_tcategoria`
  ADD CONSTRAINT `fk_fruta_tcategoria_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcategoria_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcategoria_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tcolor`
--
ALTER TABLE `fruta_tcolor`
  ADD CONSTRAINT `fk_fruta_tcolor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcolor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcolor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tcontenedor`
--
ALTER TABLE `fruta_tcontenedor`
  ADD CONSTRAINT `fk_fruta_tcontenedor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcontenedor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tcontenedor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tembalaje`
--
ALTER TABLE `fruta_tembalaje`
  ADD CONSTRAINT `fk_fruta_tembalaje_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tembalaje_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tembalaje_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tetiqueta`
--
ALTER TABLE `fruta_tetiqueta`
  ADD CONSTRAINT `fk_fruta_tetiqueta_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tetiqueta_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tetiqueta_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tflete`
--
ALTER TABLE `fruta_tflete`
  ADD CONSTRAINT `fk_fruta_tflete_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tflete_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tflete_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tinpsag`
--
ALTER TABLE `fruta_tinpsag`
  ADD CONSTRAINT `fk_fruta_tinpsag_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tinpsag_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tmanejo`
--
ALTER TABLE `fruta_tmanejo`
  ADD CONSTRAINT `fk_fruta_tmanejo_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tmanejo_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tmoneda`
--
ALTER TABLE `fruta_tmoneda`
  ADD CONSTRAINT `fk_fk_fruta_tmoneda_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tmoneda_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tmoneda_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tproceso`
--
ALTER TABLE `fruta_tproceso`
  ADD CONSTRAINT `fruta_tproceso_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fruta_tproceso_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tproductor`
--
ALTER TABLE `fruta_tproductor`
  ADD CONSTRAINT `fk_fruta_tproductor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tproductor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tproductor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tratamineto1`
--
ALTER TABLE `fruta_tratamineto1`
  ADD CONSTRAINT `fk_fruta_tratamineto1_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tratamineto1_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tratamineto1_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tratamineto2`
--
ALTER TABLE `fruta_tratamineto2`
  ADD CONSTRAINT `fk_fruta_tratamineto2_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tratamineto2_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tratamineto2_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_treembalaje`
--
ALTER TABLE `fruta_treembalaje`
  ADD CONSTRAINT `fk_fruta_treembalaje_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_treembalaje_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_tservicio`
--
ALTER TABLE `fruta_tservicio`
  ADD CONSTRAINT `fk_fruta_tservicio_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tservicio_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_tservicio_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `fruta_vespecies`
--
ALTER TABLE `fruta_vespecies`
  ADD CONSTRAINT `fk_fk_fruta_vespecies_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_vespecies_fruta_especies` FOREIGN KEY (`ID_ESPECIES`) REFERENCES `fruta_especies` (`ID_ESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_vespecies_principal` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fruta_vespecies_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_ddvalor`
--
ALTER TABLE `liquidacion_ddvalor`
  ADD CONSTRAINT `liquidacion_ddvalor_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `liquidacion_ddvalor_fruta_tcalibre` FOREIGN KEY (`ID_TCALIBRE`) REFERENCES `fruta_tcalibre` (`ID_TCALIBRE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `liquidacion_ddvalor_liquidacion_dvalor` FOREIGN KEY (`ID_DVALOR`) REFERENCES `liquidacion_dvalor` (`ID_DVALOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `liquidacion_ddvalor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `liquidacion_ddvalor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_dvalor`
--
ALTER TABLE `liquidacion_dvalor`
  ADD CONSTRAINT `fk_liquidacion_dvalor_liquidacion_titem` FOREIGN KEY (`ID_TITEM`) REFERENCES `liquidacion_titem` (`ID_TITEM`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalor_liquidacion_valor` FOREIGN KEY (`ID_VALOR`) REFERENCES `liquidacion_valor` (`ID_VALOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_dvalorp`
--
ALTER TABLE `liquidacion_dvalorp`
  ADD CONSTRAINT `fk_liquidacion_dvalopr_liquidacion_titem` FOREIGN KEY (`ID_TITEM`) REFERENCES `liquidacion_titem` (`ID_TITEM`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalorp_liquidacion_valorp` FOREIGN KEY (`ID_VALOR`) REFERENCES `liquidacion_valorp` (`ID_VALOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalorp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_dvalorp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_titem`
--
ALTER TABLE `liquidacion_titem`
  ADD CONSTRAINT `fk_liquidacion_titem_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_titem_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_titem_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_valor`
--
ALTER TABLE `liquidacion_valor`
  ADD CONSTRAINT `fk_liquidacion_valor_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valor_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion_valorp`
--
ALTER TABLE `liquidacion_valorp`
  ADD CONSTRAINT `fk_liquidacion_valorp_fruta_icarga` FOREIGN KEY (`ID_ICARGA`) REFERENCES `fruta_icarga` (`ID_ICARGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valorp_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valorp_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valorp_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liquidacion_valorp_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_cliente`
--
ALTER TABLE `material_cliente`
  ADD CONSTRAINT `fk_material_cliente_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_cliente_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_cliente_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_cliente_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_despachoe`
--
ALTER TABLE `material_despachoe`
  ADD CONSTRAINT `fk_material_despachoe_fruta_comrpador` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `fruta_comprador` (`ID_COMPRADOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_fruta_despachomp` FOREIGN KEY (`ID_DESPACHOMP`) REFERENCES `fruta_despachomp` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_materiales_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_materiales_tdocumento` FOREIGN KEY (`ID_TDOCUMENTO`) REFERENCES `material_tdocumento` (`ID_TDOCUMENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_bodega2` FOREIGN KEY (`ID_BODEGA2`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_bodegao` FOREIGN KEY (`ID_BODEGAO`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachoe_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_despachom`
--
ALTER TABLE `material_despachom`
  ADD CONSTRAINT `fk_material_despachom_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_material_cliente` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `material_cliente` (`ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_material_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_materiales_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_materiales_tdocumento` FOREIGN KEY (`ID_TDOCUMENTO`) REFERENCES `material_tdocumento` (`ID_TDOCUMENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_bodega2` FOREIGN KEY (`ID_BODEGA2`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_despachom_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_dficha`
--
ALTER TABLE `material_dficha`
  ADD CONSTRAINT `fk_material_dficha_material_ficha` FOREIGN KEY (`ID_FICHA`) REFERENCES `material_ficha` (`ID_FICHA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_dficha_material_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_docompra`
--
ALTER TABLE `material_docompra`
  ADD CONSTRAINT `fk_material_docomprae_materiales_ocomprae` FOREIGN KEY (`ID_OCOMPRA`) REFERENCES `material_ocompra` (`ID_OCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_docomprae_materiales_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_docomprae_materiales_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_drecepcionm`
--
ALTER TABLE `material_drecepcionm`
  ADD CONSTRAINT `fk_material_drecepcionm_material_docompra` FOREIGN KEY (`ID_DOCOMPRA`) REFERENCES `material_docompra` (`ID_DOCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_drecepcionm_material_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_drecepcionm_material_recepcionm` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `material_recepcionm` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_drecepcionm_material_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_familia`
--
ALTER TABLE `material_familia`
  ADD CONSTRAINT `fk_material_familia_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_familia_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_familia_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_ficha`
--
ALTER TABLE `material_ficha`
  ADD CONSTRAINT `fk_material_ficha_estandar_eexportacion` FOREIGN KEY (`ID_ESTANDAR`) REFERENCES `estandar_eexportacion` (`ID_ESTANDAR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ficha_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ficha_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ficha_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ficha_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_folio`
--
ALTER TABLE `material_folio`
  ADD CONSTRAINT `fk_material_folio_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_folio_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_folio_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_folio_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_folio_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_fpago`
--
ALTER TABLE `material_fpago`
  ADD CONSTRAINT `fk_material_fpago_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_fpago_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_fpago_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_inventarioe`
--
ALTER TABLE `material_inventarioe`
  ADD CONSTRAINT `fk_material_inventarioe_material_docompra` FOREIGN KEY (`ID_DOCOMPRA`) REFERENCES `material_docompra` (`ID_DOCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_materiales_despachoe` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `material_despachoe` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_materiales_despachoe2` FOREIGN KEY (`ID_DESPACHO2`) REFERENCES `material_despachoe` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_materiales_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_materiales_recepcione` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `material_recepcione` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_materiales_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_bodega2` FOREIGN KEY (`ID_BODEGA2`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventarioe_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_inventariom`
--
ALTER TABLE `material_inventariom`
  ADD CONSTRAINT `fk_material_inventariom_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_material_ocompra` FOREIGN KEY (`ID_OCOMPRA`) REFERENCES `material_ocompra` (`ID_OCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_despachom` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `material_despachom` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_despachom2` FOREIGN KEY (`ID_DESPACHO2`) REFERENCES `material_despachom` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `material_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_recepcionm` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `material_recepcionm` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_tcontenedor` FOREIGN KEY (`ID_TCONTENEDOR`) REFERENCES `material_tcontenedor` (`ID_TCONTENEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_materiales_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_planta3` FOREIGN KEY (`ID_PLANTA3`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_inventariom_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_mguiae`
--
ALTER TABLE `material_mguiae`
  ADD CONSTRAINT `fk_material_mguiae_material_despachoe` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `material_despachoe` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiae_usuario_usuarioim` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_mguiam`
--
ALTER TABLE `material_mguiam`
  ADD CONSTRAINT `fk_material_mguiam_material_despahom` FOREIGN KEY (`ID_DESPACHO`) REFERENCES `material_despachom` (`ID_DESPACHO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mguiam_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_mocompra`
--
ALTER TABLE `material_mocompra`
  ADD CONSTRAINT `fk_material_mocompra_material_ocompra` FOREIGN KEY (`ID_OCOMPRA`) REFERENCES `material_ocompra` (`ID_OCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mocompra_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mocompra_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mocompra_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mocompra_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_mocompra_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_ocompra`
--
ALTER TABLE `material_ocompra`
  ADD CONSTRAINT `fk_material_ocomprae_materiales_fpago` FOREIGN KEY (`ID_FPAGO`) REFERENCES `material_fpago` (`ID_FPAGO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_materiales_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_materiales_responsable` FOREIGN KEY (`ID_RESPONSABLE`) REFERENCES `material_responsable` (`ID_RESPONSABLE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_materiales_tmoneda` FOREIGN KEY (`ID_TMONEDA`) REFERENCES `material_tmoneda` (`ID_TMONEDA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_ocomprae_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_producto`
--
ALTER TABLE `material_producto`
  ADD CONSTRAINT `fk_material_producto_fruta_especies` FOREIGN KEY (`ID_ESPECIES`) REFERENCES `fruta_especies` (`ID_ESPECIES`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_material_familia` FOREIGN KEY (`ID_FAMILIA`) REFERENCES `material_familia` (`ID_FAMILIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_material_subfamilia` FOREIGN KEY (`ID_SUBFAMILIA`) REFERENCES `material_subfamilia` (`ID_SUBFAMILIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_material_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_producto_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_proveedor`
--
ALTER TABLE `material_proveedor`
  ADD CONSTRAINT `fk_material_proveedor_princiapl_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_proveedor_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_proveedor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_proveedor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_recepcione`
--
ALTER TABLE `material_recepcione`
  ADD CONSTRAINT `fk_material_recepcione_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_fruta_recepcionind` FOREIGN KEY (`ID_RECEPCIONIND`) REFERENCES `fruta_recepcionind` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_fruta_recepcionmp` FOREIGN KEY (`ID_RECEPCIONMP`) REFERENCES `fruta_recepcionmp` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_material_ocomprae` FOREIGN KEY (`ID_OCOMPRA`) REFERENCES `material_ocompra` (`ID_OCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_material_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_material_tdocumento` FOREIGN KEY (`ID_TDOCUMENTO`) REFERENCES `material_tdocumento` (`ID_TDOCUMENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_principal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_principal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcione_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_recepcionm`
--
ALTER TABLE `material_recepcionm`
  ADD CONSTRAINT `fk_material_recepcionm_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_material_ocompra` FOREIGN KEY (`ID_OCOMPRA`) REFERENCES `material_ocompra` (`ID_OCOMPRA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_material_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `material_proveedor` (`ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_material_tdocumento` FOREIGN KEY (`ID_TDOCUMENTO`) REFERENCES `material_tdocumento` (`ID_TDOCUMENTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_princiapal_bodega` FOREIGN KEY (`ID_BODEGA`) REFERENCES `principal_bodega` (`ID_BODEGA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_princiapal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_princiapal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_princiapal_temporada` FOREIGN KEY (`ID_TEMPORADA`) REFERENCES `principal_temporada` (`ID_TEMPORADA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_principal_planta2` FOREIGN KEY (`ID_PLANTA2`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_transporte_conductor` FOREIGN KEY (`ID_CONDUCTOR`) REFERENCES `transporte_conductor` (`ID_CONDUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_transporte_transporte` FOREIGN KEY (`ID_TRANSPORTE`) REFERENCES `transporte_transporte` (`ID_TRANSPORTE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_recepcionm_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_responsable`
--
ALTER TABLE `material_responsable`
  ADD CONSTRAINT `fk_material_responsable_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_responsable_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_responsable_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_responsable_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_responsable_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_subfamilia`
--
ALTER TABLE `material_subfamilia`
  ADD CONSTRAINT `fk_material_subfamilia_material_familia` FOREIGN KEY (`ID_FAMILIA`) REFERENCES `material_familia` (`ID_FAMILIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_subfamilia_princiapl_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_subfamilia_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_subfamilia_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_tarjam`
--
ALTER TABLE `material_tarjam`
  ADD CONSTRAINT `fk_material_tarjam_material_drecepcion` FOREIGN KEY (`ID_DRECEPCION`) REFERENCES `material_drecepcionm` (`ID_DRECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tarjam_material_folio` FOREIGN KEY (`ID_FOLIO`) REFERENCES `material_folio` (`ID_FOLIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tarjam_material_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `material_producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tarjam_material_recepcion` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `material_recepcionm` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tarjam_material_tcontenedr` FOREIGN KEY (`ID_TCONTENEDOR`) REFERENCES `material_tcontenedor` (`ID_TCONTENEDOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tarjam_material_tumedida` FOREIGN KEY (`ID_TUMEDIDA`) REFERENCES `material_tumedida` (`ID_TUMEDIDA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_tcontenedor`
--
ALTER TABLE `material_tcontenedor`
  ADD CONSTRAINT `fk_material_tcontenedor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tcontenedor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tcontenedor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_tdocumento`
--
ALTER TABLE `material_tdocumento`
  ADD CONSTRAINT `fk_material_tdocumento_prinicipal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tdocumento_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tdocumento_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_tmoneda`
--
ALTER TABLE `material_tmoneda`
  ADD CONSTRAINT `fk_material_tmoneda_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tmoneda_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tmoneda_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `material_tumedida`
--
ALTER TABLE `material_tumedida`
  ADD CONSTRAINT `fk_material_tumedida_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tumedida_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_tumedida_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `principal_bodega`
--
ALTER TABLE `principal_bodega`
  ADD CONSTRAINT `fk_principal_bodega_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_bodega_principal_planta` FOREIGN KEY (`ID_PLANTA`) REFERENCES `principal_planta` (`ID_PLANTA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_bodega_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_bodega_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `principal_empresa`
--
ALTER TABLE `principal_empresa`
  ADD CONSTRAINT `fk_principal_empresa_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_empresa_ubicacion_provincia` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `ubicacion_provincia` (`ID_PROVINCIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_empresa_ubicacion_region` FOREIGN KEY (`ID_REGION`) REFERENCES `ubicacion_region` (`ID_REGION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_empresa_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_empresa_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `principal_planta`
--
ALTER TABLE `principal_planta`
  ADD CONSTRAINT `fk_principal_planta_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_planta_ubicacion_provincia` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `ubicacion_provincia` (`ID_PROVINCIA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_planta_ubicacion_region` FOREIGN KEY (`ID_REGION`) REFERENCES `ubicacion_region` (`ID_REGION`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_planta_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_planta_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `principal_temporada`
--
ALTER TABLE `principal_temporada`
  ADD CONSTRAINT `fk_principal_temporada_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_principal_temporada_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte_aeronave`
--
ALTER TABLE `transporte_aeronave`
  ADD CONSTRAINT `fk_fk_transporte_aeronave_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_aeronave_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_aeronave_transporte_laerea` FOREIGN KEY (`ID_LAEREA`) REFERENCES `transporte_laerea` (`ID_LAEREA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_aeronave_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte_conductor`
--
ALTER TABLE `transporte_conductor`
  ADD CONSTRAINT `fk_transporte_conductor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_conductor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_conductor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte_laerea`
--
ALTER TABLE `transporte_laerea`
  ADD CONSTRAINT `fk_transporte_laerea_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_laerea_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_laerea_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte_naviera`
--
ALTER TABLE `transporte_naviera`
  ADD CONSTRAINT `fk_fk_transporte_naviera_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_naviera_prinicpal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_naviera_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte_transporte`
--
ALTER TABLE `transporte_transporte`
  ADD CONSTRAINT `fk_fk_transporte_transporte_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_transporte_princiapal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transporte_transporte_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion_ciudad`
--
ALTER TABLE `ubicacion_ciudad`
  ADD CONSTRAINT `fk_ubicacion_ciudad_ubicacion_comuna` FOREIGN KEY (`ID_COMUNA`) REFERENCES `ubicacion_comuna` (`ID_COMUNA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion_comuna`
--
ALTER TABLE `ubicacion_comuna`
  ADD CONSTRAINT `fk_ubicacion_comuna_ubicacion_provincia` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `ubicacion_provincia` (`ID_PROVINCIA`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion_provincia`
--
ALTER TABLE `ubicacion_provincia`
  ADD CONSTRAINT `fk_ubicacion_provincia_ubicacion_region` FOREIGN KEY (`ID_REGION`) REFERENCES `ubicacion_region` (`ID_REGION`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion_region`
--
ALTER TABLE `ubicacion_region`
  ADD CONSTRAINT `fk_ubicacion_region_ubicacion_pais` FOREIGN KEY (`ID_PAIS`) REFERENCES `ubicacion_pais` (`ID_PAIS`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_aviso`
--
ALTER TABLE `usuario_aviso`
  ADD CONSTRAINT `fk_usuario_aviso_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_aviso_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_empresaproductor`
--
ALTER TABLE `usuario_empresaproductor`
  ADD CONSTRAINT `fk_usuario_empresaproductor_fruta_productor` FOREIGN KEY (`ID_PRODUCTOR`) REFERENCES `fruta_productor` (`ID_PRODUCTOR`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_empresaproductor_principal_empresa` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `principal_empresa` (`ID_EMPRESA`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_empresaproductor_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_empresaproductor_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_empresaproductor_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_mapertura`
--
ALTER TABLE `usuario_mapertura`
  ADD CONSTRAINT `fk_usuario_mapertura_usuario_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_ptusuario`
--
ALTER TABLE `usuario_ptusuario`
  ADD CONSTRAINT `fk_usuario_ptusuario_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_ptusuario_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ptusuario_usuario_tusuario` FOREIGN KEY (`ID_TUSUARIO`) REFERENCES `usuario_tusuario` (`ID_TUSUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_tusuario`
--
ALTER TABLE `usuario_tusuario`
  ADD CONSTRAINT `fk_usuario_tusuario_usuario_usuarioi` FOREIGN KEY (`ID_USUARIOI`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_tusuario_usuario_usuariom` FOREIGN KEY (`ID_USUARIOM`) REFERENCES `usuario_usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_usuario`
--
ALTER TABLE `usuario_usuario`
  ADD CONSTRAINT `fk_usuario_usuario_usuario_tusuario` FOREIGN KEY (`ID_TUSUARIO`) REFERENCES `usuario_tusuario` (`ID_TUSUARIO`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
