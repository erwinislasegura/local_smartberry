<?php

include_once "../../assest/config/validarUsuarioOpera.php";


//LLAMADA ARCHIVOS NECESARIOS PARA LAS OPERACIONES
include_once __DIR__ . '/helpers/despachoexDetalladoExportacionData.php';


if (isset($_GET['precarga'])) {
    cargarDespachoexDetalladoExportacionData($TEMPORADAS, $EMPRESAS);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['status' => 'ok']);
    exit;
}

//INCIALIZAR VARIBALES A OCUPAR PARA LA FUNCIONALIDAD
$TOTALBRUTO = 0;
$TOTALNETO = 0;
$TOTALENVASE = 0;
$FECHADESDE = "";
$FECHAHASTA = "";

$PRODUCTOR = "";
$NUMEROGUIA = "";

//INICIALIZAR ARREGLOS
$ARRAYDESPACHOPT = [];
$ARRAYDESPACHOPTTOTALES = [];
$ARRAYVEREMPRESA = [];
$ARRAYVERPRODUCTOR = [];
$ARRAYVERTRANSPORTE = [];
$ARRAYVERCONDUCTOR = [];
$ARRAYMGUIAPT = [];
$ARRAYRECEPCIONMPORIGEN1 = [];
$ARRAYRECEPCIONMPORIGEN2 = [];

$DATA_EXPORTACION = cargarDespachoexDetalladoExportacionData($TEMPORADAS, $EMPRESAS);
$ARRAYDESPACHOEX = $DATA_EXPORTACION['despachoex'];
$EXIEXPORTACION_POR_DESPACHO = $DATA_EXPORTACION['exiexportacion_por_despacho'];
$MAP_TRANSPORTE = $DATA_EXPORTACION['maps']['transporte'];
$MAP_CONDUCTOR = $DATA_EXPORTACION['maps']['conductor'];
$MAP_EMPRESA = $DATA_EXPORTACION['maps']['empresa'];
$MAP_PLANTA = $DATA_EXPORTACION['maps']['planta'];
$MAP_TEMPORADA = $DATA_EXPORTACION['maps']['temporada'];
$MAP_PAIS = $DATA_EXPORTACION['maps']['pais'];
$MAP_LDESTINO = $DATA_EXPORTACION['maps']['ldestino'];
$MAP_ADESTINO = $DATA_EXPORTACION['maps']['adestino'];
$MAP_PDESTINO = $DATA_EXPORTACION['maps']['pdestino'];
$MAP_MERCADO = $DATA_EXPORTACION['maps']['mercado'];
$MAP_RFINAL = $DATA_EXPORTACION['maps']['rfinal'];
$MAP_BROKER = $DATA_EXPORTACION['maps']['broker'];
$MAP_ICARGA = $DATA_EXPORTACION['maps']['icarga'];
$MAP_PRODUCTOR = $DATA_EXPORTACION['maps']['productor'];
$MAP_VESPECIES = $DATA_EXPORTACION['maps']['vespecies'];
$MAP_ESPECIES = $DATA_EXPORTACION['maps']['especies'];
$MAP_ESTANDAR = $DATA_EXPORTACION['maps']['estandar'];
$MAP_TMANEJO = $DATA_EXPORTACION['maps']['tmanejo'];
$MAP_TCALIBRE = $DATA_EXPORTACION['maps']['tcalibre'];
$MAP_TEMBALAJE = $DATA_EXPORTACION['maps']['tembalaje'];
$MAP_TPROCESO = $DATA_EXPORTACION['maps']['tproceso'];
$MAP_TREEMBALAJE = $DATA_EXPORTACION['maps']['treembalaje'];
$MAP_RECEPCION = $DATA_EXPORTACION['map_recepcion'];
$MAP_DESPACHO2 = $DATA_EXPORTACION['map_despacho2'];
$MAP_PROCESO = $DATA_EXPORTACION['map_proceso'];
$MAP_REEMBALAJE = $DATA_EXPORTACION['map_reembalaje'];
$MAP_REPALETIZAJE = $DATA_EXPORTACION['map_repaletizaje'];
$MAP_RECEPCION_MP_PROCESO = $DATA_EXPORTACION['map_recepcion_mp_proceso'];
$MAP_RECEPCION_MP_REEMBALAJE = $DATA_EXPORTACION['map_recepcion_mp_reembalaje'];

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Detallado de exportacion</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- LLAMADA DE LOS ARCHIVOS NECESARIOS PARA DISEÑO Y FUNCIONES BASE DE LA VISTA -->
    <?php include_once "../../assest/config/urlHead.php"; ?>
    <!-- FUNCIONES BASES -->
    <script type="text/javascript">
        //REDIRECCIONAR A LA PAGINA SELECIONADA
        function irPagina(url) {
            location.href = "" + url;
        }

        function refrescar() {
            document.getElementById("form_reg_dato").submit();
        }

        function abrirPestana(url) {
            var win = window.open(url, '_blank');
            win.focus();
        }
        //FUNCION PARA ABRIR VENTANA QUE SE ENCUENTRA LA OPERACIONES DE DETALLE DE RECEPCION
        function abrirVentana(url) {
            var opciones =
                "'directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=1000, height=800'";
            window.open(url, 'window', opciones);
        }
    </script>
</head>

<body class="hold-transition light-skin fixed sidebar-mini theme-primary sistemRR">
    <div class="wrapper">
        <?php include_once "../../assest/config/menuOpera.php"; ?>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="container-full">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="d-flex align-items-center">
                        <div class="mr-auto">
                            <h3 class="page-title">Detallado </h3>
                            <div class="d-inline-block align-items-center">
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.php"><i class="mdi mdi-home-outline"></i></a></li>
                                        <li class="breadcrumb-item" aria-current="page">Módulo</li>
                                        <li class="breadcrumb-item" aria-current="page">Detallado</li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            <a href="#"> Detallado de exportacion </a>
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <?php include_once "../../assest/config/verIndicadorEconomico.php"; ?>
                    </div>
                </div>
                <!-- Main content -->
                <section class="content">
                    <div class="box">

                        <div class="box-body">
                            <div class="row">
                                <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 col-xs-12">
                                    <div class="table-responsive">
                                        <table id="detalladodex" class="table-hover" style="width: 100%;">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>Número Referencia </th>
                                                    <th>Cliente</th>
                                                    <th>Mercado </th>
                                                    <th>Contenedor </th>
                                                    <th>Tipo Despacho </th>
                                                    <th>Número Despacho </th>
                                                    <th>Fecha Despacho </th>
                                                    <th>Número Guía Despacho </th>
                                                    <th>Destino </th>
                                                    <th>Fecha Corte Documental </th>
                                                    <th>Fecha ETD </th>
                                                    <th>Fecha Real ETD</th>
                                                    <th>Fecha ETA</th>
                                                    <th>Fecha Real ETA</th>
                                                    <th>Recibidor Final</th>
                                                    <th>Tipo Embarque</th>
                                                    <th>Nave</th>
                                                    <th>Número Viaje/Vuelo</th>
                                                    <th>Puerto/Aeropuerto/Lugar Destino</th>
                                                    <th>N° Folio Original</th>
                                                    <th>N° Folio </th>
                                                    <th>Fecha Embalado </th>
                                                    <th>Condición </th>
                                                    <th>Código Estandar</th>
                                                    <th>Envase/Estandar</th>
                                                    <th>CSG</th>
                                                    <th>Productor</th>
                                                    <th>Especies</th>
                                                    <th>Variedad</th>
                                                    <th>Cantidad Envase</th>
                                                    <th>Kilos Neto</th>
                                                    <th>% Deshidratacion</th>
                                                    <th>Kilos Deshidratacion</th>
                                                    <th>Kilos Bruto</th>
                                                    <th>Número Repaletizaje </th>
                                                    <th>Fecha Repaletizaje </th>
                                                    <th>Número Proceso </th>
                                                    <th>Fecha Proceso </th>
                                                    <th>Tipo Proceso </th>
                                                    <th>Número Reembalaje </th>
                                                    <th>Fecha Reembalaje </th>
                                                    <th>Tipo Reembalaje </th>
                                                    <th>Tipo Manejo</th>
                                                    <th>Tipo Calibre </th>
                                                    <th>Tipo Embalaje </th>
                                                    <th>Stock</th>
                                                    <th>Embolsado</th>
                                                    <th>Gasificacion</th>
                                                    <th>Prefrío</th>
                                                    <th>Transporte </th>
                                                    <th>Nombre Conductor </th>
                                                    <th>Patente Camión </th>
                                                    <th>Patente Carro </th>
                                                    <th>Semana Despacho </th>
                                                    <th>Semana Guía </th>
                                                    <th>Empresa</th>
                                                    <th>Planta</th>
                                                    <th>Temporada</th>
                                                    <th>Bl/AWB</th>
                                                    <th>Número Recepción </th>
                                                    <th>Fecha Recepción </th>
                                                    <th>Tipo Recepción </th>
                                                    <th>Número Guía Recepción </th>
                                                    <th>Fecha Guía Recepción</th>
                                                    <th>Número Recepción MP</th>
                                                    <th>Fecha Recepción MP</th>
                                                    <th>Tipo Recepción MP</th>
                                                    <th>Número Guía Recepción MP</th>
                                                    <th>Fecha Guía Recepción MP </th>
                                                    <th>Planta Recepción MP</th>
                                                    <th>Termógrafo Despacho</th>
                                                    <th>Termógrafo Pallet</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($ARRAYDESPACHOEX as $r) : ?>
                                                    <?php
                                                    // Transporte y conductor
                                                    $ID_TRANSPORTE = (int) $r['ID_TRANSPORTE'];
                                                    if (isset($MAP_TRANSPORTE[$ID_TRANSPORTE])) {
                                                        $NOMBRETRANSPORTE = $MAP_TRANSPORTE[$ID_TRANSPORTE]['NOMBRE_TRANSPORTE'];
                                                    } else {
                                                        $NOMBRETRANSPORTE = "Sin Datos";
                                                    }

                                                    $ID_CONDUCTOR = (int) $r['ID_CONDUCTOR'];
                                                    if (isset($MAP_CONDUCTOR[$ID_CONDUCTOR])) {
                                                        $NOMBRECONDUCTOR = $MAP_CONDUCTOR[$ID_CONDUCTOR]['NOMBRE_CONDUCTOR'];
                                                    } else {
                                                        $NOMBRECONDUCTOR = "Sin Datos";
                                                    }

                                                    // Empresa, planta, temporada
                                                    $ID_EMPRESA = (int) $r['ID_EMPRESA'];
                                                    if (isset($MAP_EMPRESA[$ID_EMPRESA])) {
                                                        $NOMBREEMPRESA = $MAP_EMPRESA[$ID_EMPRESA]['NOMBRE_EMPRESA'];
                                                    } else {
                                                        $NOMBREEMPRESA = "Sin Datos";
                                                    }

                                                    $ID_PLANTA = (int) $r['ID_PLANTA'];
                                                    if (isset($MAP_PLANTA[$ID_PLANTA])) {
                                                        $NOMBREPLANTA = $MAP_PLANTA[$ID_PLANTA]['NOMBRE_PLANTA'];
                                                    } else {
                                                        $NOMBREPLANTA = "Sin Datos";
                                                    }

                                                    $ID_TEMPORADA = (int) $r['ID_TEMPORADA'];
                                                    if (isset($MAP_TEMPORADA[$ID_TEMPORADA])) {
                                                        $NOMBRETEMPORADA = $MAP_TEMPORADA[$ID_TEMPORADA]['NOMBRE_TEMPORADA'];
                                                    } else {
                                                        $NOMBRETEMPORADA = "Sin Datos";
                                                    }

                                                    // Termógrafo de despacho
                                                    $TERMOGRAFODESPACHOEX = $r['TERMOGRAFO_DESPACHOEX'];

                                                    // Datos de ICARGA (si existe)
                                                    $NOMBREDESTINO = "Sin Datos";
                                                    $TEMBARQUE = "Sin Datos";
                                                    $NAVE = "Sin Datos";
                                                    $NVIAJE = "Sin Datos";
                                                    $DESTINO = "Sin Datos";
                                                    $ID_ICARGA = (int) $r["ID_ICARGA"];
                                                    if (isset($MAP_ICARGA[$ID_ICARGA])) {
                                                        $ARRAYICARGA = $MAP_ICARGA[$ID_ICARGA];
                                                        $NUMEROREFERENCIA   = $ARRAYICARGA['NREFERENCIA_ICARGA'];
                                                        $BOLAWBCRTICARGA    = $ARRAYICARGA['BOLAWBCRT_ICARGA'];
                                                        $FECHAETD           = $ARRAYICARGA['FECHAETD_ICARGA'];
                                                        $FECHAETDREAL       = $ARRAYICARGA['FECHAETDREAL_ICARGA'];
                                                        $FECHAETA           = $ARRAYICARGA['FECHAETA_ICARGA'];
                                                        $FECHAETAREAL       = $ARRAYICARGA['FECHAETAREAL_ICARGA'];
                                                        $FECHACDOCUMENTAL   = $ARRAYICARGA['FECHA_CDOCUMENTAL_ICARGA'];
                                                        $ID_PAIS = (int) $ARRAYICARGA['ID_PAIS'];
                                                        if (isset($MAP_PAIS[$ID_PAIS])) {
                                                            $DESTINO = $MAP_PAIS[$ID_PAIS]['NOMBRE_PAIS'];
                                                        }

                                                        if ($ARRAYICARGA['TEMBARQUE_ICARGA'] == "1") {
                                                            $TEMBARQUE = "Terrestre";
                                                            $NVIAJE = "No Aplica";
                                                            $NAVE   = "No Aplica";
                                                            $ID_LDESTINO = (int) $ARRAYICARGA['ID_LDESTINO'];
                                                            if (isset($MAP_LDESTINO[$ID_LDESTINO])) {
                                                                $NOMBREDESTINO = $MAP_LDESTINO[$ID_LDESTINO]["NOMBRE_LDESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }
                                                        if ($ARRAYICARGA['TEMBARQUE_ICARGA'] == "2") {
                                                            $TEMBARQUE = "Aereo";
                                                            $NAVE = $ARRAYICARGA['NAVE_ICARGA'];
                                                            $NVIAJE = $ARRAYICARGA['NVIAJE_ICARGA'];
                                                            $ID_ADESTINO = (int) $ARRAYICARGA['ID_ADESTINO'];
                                                            if (isset($MAP_ADESTINO[$ID_ADESTINO])) {
                                                                $NOMBREDESTINO = $MAP_ADESTINO[$ID_ADESTINO]["NOMBRE_ADESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }
                                                        if ($ARRAYICARGA['TEMBARQUE_ICARGA'] == "3") {
                                                            $TEMBARQUE = "Maritimo";
                                                            $NAVE  = $ARRAYICARGA['NAVE_ICARGA'];
                                                            $NVIAJE = $ARRAYICARGA['NVIAJE_ICARGA'];
                                                            $ID_PDESTINO = (int) $ARRAYICARGA['ID_PDESTINO'];
                                                            if (isset($MAP_PDESTINO[$ID_PDESTINO])) {
                                                                $NOMBREDESTINO = $MAP_PDESTINO[$ID_PDESTINO]["NOMBRE_PDESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }

                                                        $ID_MERCADO = (int) $ARRAYICARGA["ID_MERCADO"];
                                                        if (isset($MAP_MERCADO[$ID_MERCADO])) {
                                                            $NOMBREMERCADO = $MAP_MERCADO[$ID_MERCADO]["NOMBRE_MERCADO"];
                                                        } else {
                                                            $NOMBREMERCADO = "Sin Datos";
                                                        }

                                                        $ID_RFINAL = (int) $ARRAYICARGA["ID_RFINAL"];
                                                        if (isset($MAP_RFINAL[$ID_RFINAL])) {
                                                            $NOMBRERFINAL = $MAP_RFINAL[$ID_RFINAL]["NOMBRE_RFINAL"];
                                                        } else {
                                                            $NOMBRERFINAL = "Sin Datos";
                                                        }

                                                        $ID_BROKER = (int) $ARRAYICARGA["ID_BROKER"];
                                                        if (isset($MAP_BROKER[$ID_BROKER])) {
                                                            $NOMBREBROKER = $MAP_BROKER[$ID_BROKER]["NOMBRE_BROKER"];
                                                        } else {
                                                            $NOMBREBROKER = "Sin Datos";
                                                        }
                                                    } else {
                                                        $NUMEROREFERENCIA = "No Aplica";
                                                        $NOMBREBROKER = "No Aplica";
                                                        $BOLAWBCRTICARGA = "No Aplica";
                                                        $FECHAETD = $r['FECHAETD_DESPACHOEX'];
                                                        $FECHAETDREAL = "";
                                                        $FECHAETA = $r['FECHAETA_DESPACHOEX'];
                                                        $FECHAETAREAL = "";
                                                        $FECHACDOCUMENTAL = "";
                                                        $ID_PAIS = (int) $r['ID_PAIS'];
                                                        if (isset($MAP_PAIS[$ID_PAIS])) {
                                                            $DESTINO = $MAP_PAIS[$ID_PAIS]['NOMBRE_PAIS'];
                                                        }
                                                        if ($r['TEMBARQUE_DESPACHOEX'] == "1") {
                                                            $TEMBARQUE = "Terrestre";
                                                            $NVIAJE = "No Aplica";
                                                            $NAVE = "No Aplica";
                                                            $ID_LDESTINO = (int) $r['ID_LDESTINO'];
                                                            if (isset($MAP_LDESTINO[$ID_LDESTINO])) {
                                                                $NOMBREDESTINO = $MAP_LDESTINO[$ID_LDESTINO]["NOMBRE_LDESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }
                                                        if ($r['TEMBARQUE_DESPACHOEX'] == "2") {
                                                            $TEMBARQUE = "Aereo";
                                                            $NAVE = $r['NAVE_DESPACHOEX'];
                                                            $NVIAJE = $r['NVIAJE_DESPACHOEX'];
                                                            $ID_ADESTINO = (int) $r['ID_ADESTINO'];
                                                            if (isset($MAP_ADESTINO[$ID_ADESTINO])) {
                                                                $NOMBREDESTINO = $MAP_ADESTINO[$ID_ADESTINO]["NOMBRE_ADESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }
                                                        if ($r['TEMBARQUE_DESPACHOEX'] == "3") {
                                                            $TEMBARQUE = "Maritimo";
                                                            $NAVE  = $r['NAVE_DESPACHOEX'];
                                                            $NVIAJE = $r['NVIAJE_DESPACHOEX'];
                                                            $ID_PDESTINO = (int) $r['ID_PDESTINO'];
                                                            if (isset($MAP_PDESTINO[$ID_PDESTINO])) {
                                                                $NOMBREDESTINO = $MAP_PDESTINO[$ID_PDESTINO]["NOMBRE_PDESTINO"];
                                                            } else {
                                                                $NOMBREDESTINO = "Sin Datos";
                                                            }
                                                        }
                                                        $ID_MERCADO = (int) $r["ID_MERCADO"];
                                                        if (isset($MAP_MERCADO[$ID_MERCADO])) {
                                                            $NOMBREMERCADO = $MAP_MERCADO[$ID_MERCADO]["NOMBRE_MERCADO"];
                                                        } else {
                                                            $NOMBREMERCADO = "Sin Datos";
                                                        }
                                                        $ID_RFINAL = (int) $r["ID_RFINAL"];
                                                        if (isset($MAP_RFINAL[$ID_RFINAL])) {
                                                            $NOMBRERFINAL = $MAP_RFINAL[$ID_RFINAL]["NOMBRE_RFINAL"];
                                                        } else {
                                                            $NOMBRERFINAL = "Sin Datos";
                                                        }
                                                    }

                                                    // Existencias del despacho
                                                    $ID_DESPACHOEX = (int) $r['ID_DESPACHOEX'];
                                                    $ARRAYTOMADOEX = $EXIEXPORTACION_POR_DESPACHO[$ID_DESPACHOEX] ?? [];
                                                    ?>

                                                    <?php foreach ($ARRAYTOMADOEX as $s) : ?>
                                                        <?php
                                                        // Estado SAG
                                                        $ESTADOSAG = "Sin Condición";
                                                        switch ($s['TESTADOSAG']) {
                                                            case "1":
                                                                $ESTADOSAG = "En Inspección";
                                                                break;
                                                            case "2":
                                                                $ESTADOSAG = "Aprobado Origen";
                                                                break;
                                                            case "3":
                                                                $ESTADOSAG = "Aprobado USLA";
                                                                break;
                                                            case "4":
                                                                $ESTADOSAG = "Fumigado";
                                                                break;
                                                            case "5":
                                                                $ESTADOSAG = "Rechazado";
                                                                break;
                                                        }

                                                        // Productor
                                                        $ID_PRODUCTOR = (int) $s['ID_PRODUCTOR'];
                                                        if (isset($MAP_PRODUCTOR[$ID_PRODUCTOR])) {
                                                            $CSGPRODUCTOR = $MAP_PRODUCTOR[$ID_PRODUCTOR]['CSG_PRODUCTOR'];
                                                            $NOMBREPRODUCTOR = $MAP_PRODUCTOR[$ID_PRODUCTOR]['NOMBRE_PRODUCTOR'];
                                                        } else {
                                                            $CSGPRODUCTOR = "Sin Datos";
                                                            $NOMBREPRODUCTOR = "Sin Datos";
                                                        }

                                                        // Variedad / especie
                                                        $ID_VESPECIES = (int) $s['ID_VESPECIES'];
                                                        if (isset($MAP_VESPECIES[$ID_VESPECIES])) {
                                                            $NOMBREVARIEDAD = $MAP_VESPECIES[$ID_VESPECIES]['NOMBRE_VESPECIES'];
                                                            $ID_ESPECIES = (int) $MAP_VESPECIES[$ID_VESPECIES]['ID_ESPECIES'];
                                                            if (isset($MAP_ESPECIES[$ID_ESPECIES])) {
                                                                $NOMBRESPECIES = $MAP_ESPECIES[$ID_ESPECIES]['NOMBRE_ESPECIES'];
                                                            } else {
                                                                $NOMBRESPECIES = "Sin Datos";
                                                            }
                                                        } else {
                                                            $NOMBREVARIEDAD = "Sin Datos";
                                                            $NOMBRESPECIES = "Sin Datos";
                                                        }

                                                        // Estandar
                                                        $ID_ESTANDAR = (int) $s['ID_ESTANDAR'];
                                                        if (isset($MAP_ESTANDAR[$ID_ESTANDAR])) {
                                                            $CODIGOESTANDAR = $MAP_ESTANDAR[$ID_ESTANDAR]['CODIGO_ESTANDAR'];
                                                            $NOMBREESTANDAR = $MAP_ESTANDAR[$ID_ESTANDAR]['NOMBRE_ESTANDAR'];
                                                        } else {
                                                            $NOMBREESTANDAR = "Sin Datos";
                                                            $CODIGOESTANDAR = "Sin Datos";
                                                        }

                                                        // Tipo manejo / calibre / embalaje
                                                        $ID_TMANEJO = (int) $s['ID_TMANEJO'];
                                                        if (isset($MAP_TMANEJO[$ID_TMANEJO])) {
                                                            $NOMBRETMANEJO = $MAP_TMANEJO[$ID_TMANEJO]['NOMBRE_TMANEJO'];
                                                        } else {
                                                            $NOMBRETMANEJO = "Sin Datos";
                                                        }

                                                        $ID_TCALIBRE = (int) $s['ID_TCALIBRE'];
                                                        if (isset($MAP_TCALIBRE[$ID_TCALIBRE])) {
                                                            $NOMBRETCALIBRE = $MAP_TCALIBRE[$ID_TCALIBRE]['NOMBRE_TCALIBRE'];
                                                        } else {
                                                            $NOMBRETCALIBRE = "Sin Datos";
                                                        }

                                                        $ID_TEMBALAJE = (int) $s['ID_TEMBALAJE'];
                                                        if (isset($MAP_TEMBALAJE[$ID_TEMBALAJE])) {
                                                            $NOMBRETEMBALAJE = $MAP_TEMBALAJE[$ID_TEMBALAJE]['NOMBRE_TEMBALAJE'];
                                                        } else {
                                                            $NOMBRETEMBALAJE = "Sin Datos";
                                                        }

                                                        // Embolsado
                                                        $EMBOLSADO = ($s['EMBOLSADO'] == "1") ? "SI" : "NO";

                                                        // Stock
                                                        $STOCK = ($s['STOCK'] != "") ? $s['STOCK'] : "Sin Datos";

                                                        // Gasificado
                                                        if ($s['GASIFICADO'] == "1") {
                                                            $GASIFICADO = "SI";
                                                        } else if ($s['GASIFICADO'] == "0") {
                                                            $GASIFICADO = "NO";
                                                        } else {
                                                            $GASIFICADO = "Sin Datos";
                                                        }

                                                        // Prefrío
                                                        if ($s['PREFRIO'] == "0") {
                                                            $PREFRIO = "NO";
                                                        } else if ($s['PREFRIO'] == "1") {
                                                            $PREFRIO = "SI";
                                                        } else {
                                                            $PREFRIO = "Sin Datos";
                                                        }

                                                        // Recepción PT / despacho interplanta
                                                        $ID_RECEPCION = (int) $s['ID_RECEPCION'];
                                                        $ID_DESPACHO2 = (int) $s['ID_DESPACHO2'];
                                                        if (isset($MAP_RECEPCION[$ID_RECEPCION])) {
                                                            $RECEPCION_ROW = $MAP_RECEPCION[$ID_RECEPCION];
                                                            $NUMERORECEPCION = $RECEPCION_ROW["NUMERO_RECEPCION"];
                                                            $FECHARECEPCION = $RECEPCION_ROW["FECHA"];
                                                            $NUMEROGUIARECEPCION = $RECEPCION_ROW["NUMERO_GUIA_RECEPCION"];
                                                            $FECHAGUIARECEPCION = $RECEPCION_ROW["GUIA"];
                                                            if ($RECEPCION_ROW["TRECEPCION"] == 1) {
                                                                $TIPORECEPCION = "Desde Productor";
                                                            }
                                                            if ($RECEPCION_ROW["TRECEPCION"] == 2) {
                                                                $TIPORECEPCION = "Planta Externa";
                                                            }
                                                        } else if (isset($MAP_DESPACHO2[$ID_DESPACHO2])) {
                                                            $DESPACHO2_ROW = $MAP_DESPACHO2[$ID_DESPACHO2];
                                                            $NUMERORECEPCION = $DESPACHO2_ROW["NUMERO_DESPACHO"];
                                                            $FECHARECEPCION = $DESPACHO2_ROW["FECHA"];
                                                            $NUMEROGUIARECEPCION = $DESPACHO2_ROW["NUMERO_GUIA_DESPACHO"];
                                                            $TIPORECEPCION = "Interplanta";
                                                            $FECHAGUIARECEPCION = "";
                                                            $ID_PLANTA2 = (int) $DESPACHO2_ROW['ID_PLANTA'];
                                                            if (isset($MAP_PLANTA[$ID_PLANTA2])) {
                                                                $ORIGEN = $MAP_PLANTA[$ID_PLANTA2]['NOMBRE_PLANTA'];
                                                                $CSGCSPORIGEN = $MAP_PLANTA[$ID_PLANTA2]['CODIGO_SAG_PLANTA'];
                                                            } else {
                                                                $ORIGEN = "Sin Datos";
                                                                $CSGCSPORIGEN = "Sin Datos";
                                                            }
                                                        } else {
                                                            $NUMERORECEPCION = "Sin Datos";
                                                            $FECHARECEPCION = "";
                                                            $NUMEROGUIARECEPCION = "Sin Datos";
                                                            $FECHAGUIARECEPCION = "";
                                                            $TIPORECEPCION = "Sin Datos";
                                                        }

                                                        // Proceso
                                                        $ID_PROCESO = (int) $s['ID_PROCESO'];
                                                        if (isset($MAP_PROCESO[$ID_PROCESO])) {
                                                            $PROCESO_ROW = $MAP_PROCESO[$ID_PROCESO];
                                                            $NUMEROPROCESO = $PROCESO_ROW["NUMERO_PROCESO"];
                                                            $FECHAPROCESO = $PROCESO_ROW["FECHA"];
                                                            $PORCENTAJEEXPO = number_format($PROCESO_ROW["PDEXPORTACION_PROCESO"], 2);
                                                            $PORCENTAJEINDUSTRIAL = number_format($PROCESO_ROW["PDINDUSTRIAL_PROCESO"], 2);
                                                            $PORCENTAJETOTAL = number_format($PROCESO_ROW["PORCENTAJE_PROCESO"], 2);
                                                            $ID_TPROCESO = (int) $PROCESO_ROW["ID_TPROCESO"];
                                                            if (isset($MAP_TPROCESO[$ID_TPROCESO])) {
                                                                $TPROCESO = $MAP_TPROCESO[$ID_TPROCESO]["NOMBRE_TPROCESO"];
                                                            } else {
                                                                $TPROCESO = "Sin datos";
                                                            }
                                                        } else {
                                                            $NUMEROPROCESO = "Sin datos";
                                                            $PORCENTAJEEXPO = "Sin datos";
                                                            $PORCENTAJEINDUSTRIAL = "Sin datos";
                                                            $PORCENTAJETOTAL = "Sin datos";
                                                            $FECHAPROCESO = "";
                                                            $TPROCESO = "Sin datos";
                                                        }

                                                        // Reembalaje
                                                        $ID_REEMBALAJE = (int) $s['ID_REEMBALAJE'];
                                                        if (isset($MAP_REEMBALAJE[$ID_REEMBALAJE])) {
                                                            $REEMBALAJE_ROW = $MAP_REEMBALAJE[$ID_REEMBALAJE];
                                                            $NUMEROREEMBALEJE = $REEMBALAJE_ROW["NUMERO_REEMBALAJE"];
                                                            $FECHAREEMBALEJE = $REEMBALAJE_ROW["FECHA"];
                                                            $ID_TREEMBALAJE = (int) $REEMBALAJE_ROW["ID_TREEMBALAJE"];
                                                            if (isset($MAP_TREEMBALAJE[$ID_TREEMBALAJE])) {
                                                                $TREEMBALAJE = $MAP_TREEMBALAJE[$ID_TREEMBALAJE]["NOMBRE_TREEMBALAJE"];
                                                            } else {
                                                                $TREEMBALAJE = "Sin datos";
                                                            }
                                                        } else {
                                                            $NUMEROREEMBALEJE = "Sin datos";
                                                            $FECHAREEMBALEJE = "";
                                                            $TREEMBALAJE = "Sin datos";
                                                        }

                                                        // Recepción MP origen (proceso / reembalaje)
                                                        if (isset($MAP_RECEPCION_MP_PROCESO[$ID_PROCESO])) {
                                                            $RECEPCION_MP_ROW = $MAP_RECEPCION_MP_PROCESO[$ID_PROCESO];
                                                            $NUMERORECEPCIONMP = $RECEPCION_MP_ROW["NUMERO"];
                                                            $FECHARECEPCIONMP = $RECEPCION_MP_ROW["FECHA"];
                                                            $NUMEROGUIARECEPCIONMP = $RECEPCION_MP_ROW["NUMEROGUIA"];
                                                            $FECHAGUIARECEPCIONMP = $RECEPCION_MP_ROW["FECHAGUIA"];
                                                            $TIPORECEPCIONMP = $RECEPCION_MP_ROW["TRECEPCION"];
                                                            $ORIGENRECEPCIONMP = $RECEPCION_MP_ROW["ORIGEN"];
                                                            $PLANTARECEPCIONMP = $RECEPCION_MP_ROW["PLANTA"];
                                                        } else if (isset($MAP_RECEPCION_MP_REEMBALAJE[$ID_REEMBALAJE])) {
                                                            $RECEPCION_MP_ROW = $MAP_RECEPCION_MP_REEMBALAJE[$ID_REEMBALAJE];
                                                            $NUMERORECEPCIONMP = $RECEPCION_MP_ROW["NUMERO"];
                                                            $FECHARECEPCIONMP = $RECEPCION_MP_ROW["FECHA"];
                                                            $NUMEROGUIARECEPCIONMP = $RECEPCION_MP_ROW["NUMEROGUIA"];
                                                            $FECHAGUIARECEPCIONMP = $RECEPCION_MP_ROW["FECHAGUIA"];
                                                            $TIPORECEPCIONMP = $RECEPCION_MP_ROW["TRECEPCION"];
                                                            $ORIGENRECEPCIONMP = $RECEPCION_MP_ROW["ORIGEN"];
                                                            $PLANTARECEPCIONMP = $RECEPCION_MP_ROW["PLANTA"];
                                                        } else {
                                                            $NUMERORECEPCIONMP = "Sin Datos";
                                                            $FECHARECEPCIONMP = "";
                                                            $NUMEROGUIARECEPCIONMP = "Sin Datos";
                                                            $FECHAGUIARECEPCIONMP = "";
                                                            $TIPORECEPCIONMP = "Sin Datos";
                                                            $ORIGENRECEPCIONMP = "Sin Datos";
                                                            $PLANTARECEPCIONMP = "Sin Datos";
                                                        }

                                                        // Repaletizaje
                                                        $ID_REPALETIZAJE = (int) $s['ID_REPALETIZAJE'];
                                                        if (isset($MAP_REPALETIZAJE[$ID_REPALETIZAJE])) {
                                                            $REPALETIZAJE_ROW = $MAP_REPALETIZAJE[$ID_REPALETIZAJE];
                                                            $FECHAREPALETIZAJE = $REPALETIZAJE_ROW["INGRESO"];
                                                            $NUMEROREPALETIZAJE = $REPALETIZAJE_ROW["NUMERO_REPALETIZAJE"];
                                                        } else {
                                                            $NUMEROREPALETIZAJE = "Sin Datos";
                                                            $FECHAREPALETIZAJE = "";
                                                        }

                                                        // Termógrafo por pallet (folio)
                                                        if (!empty($s['N_TERMOGRAFO'])) {
                                                            $termografoPallet = $s['N_TERMOGRAFO'];
                                                        } else {
                                                            $termografoPallet = "Sin Datos";
                                                        }
                                                        ?>
                                                        <tr class="text-center">
                                                            <td><?php echo $NUMEROREFERENCIA; ?></td>
                                                            <td><?php echo $NOMBREBROKER; ?></td>
                                                            <td><?php echo $NOMBREMERCADO; ?></td>
                                                            <td><?php echo $r['NUMERO_CONTENEDOR_DESPACHOEX']; ?></td>
                                                            <td><?php echo "Exportación"; ?></td>
                                                            <td><?php echo $r['NUMERO_DESPACHOEX']; ?></td>
                                                            <td><?php echo $r['FECHA']; ?></td>
                                                            <td><?php echo $r['NUMERO_GUIA_DESPACHOEX']; ?></td>
                                                            <td><?php echo $DESTINO; ?></td>
                                                            <td><?php echo $FECHACDOCUMENTAL; ?></td>
                                                            <td><?php echo $FECHAETD; ?></td>
                                                            <td><?php echo $FECHAETDREAL; ?></td>
                                                            <td><?php echo $FECHAETA; ?></td>
                                                            <td><?php echo $FECHAETAREAL; ?></td>
                                                            <td><?php echo $NOMBRERFINAL; ?></td>
                                                            <td><?php echo $TEMBARQUE; ?></td>
                                                            <td><?php echo $NAVE; ?></td>
                                                            <td><?php echo $NVIAJE; ?></td>
                                                            <td><?php echo $NOMBREDESTINO; ?></td>
                                                            <td><?php echo $s['FOLIO_EXIEXPORTACION']; ?></td>
                                                            <td><?php echo $s['FOLIO_AUXILIAR_EXIEXPORTACION']; ?></td>
                                                            <td><?php echo $s['EMBALADO']; ?></td>
                                                            <td><?php echo $ESTADOSAG; ?></td>
                                                            <td><?php echo $CODIGOESTANDAR; ?></td>
                                                            <td><?php echo $NOMBREESTANDAR; ?></td>
                                                            <td><?php echo $CSGPRODUCTOR; ?></td>
                                                            <td><?php echo $NOMBREPRODUCTOR; ?></td>
                                                            <td><?php echo $NOMBRESPECIES; ?></td>
                                                            <td><?php echo $NOMBREVARIEDAD; ?></td>
                                                            <td><?php echo $s['ENVASE']; ?></td>
                                                            <td><?php echo $s['NETO']; ?></td>
                                                            <td><?php echo $s['PORCENTAJE']; ?></td>
                                                            <td><?php echo $s['DESHIRATACION']; ?></td>
                                                            <td><?php echo $s['BRUTO']; ?></td>
                                                            <td><?php echo $NUMEROREPALETIZAJE; ?></td>
                                                            <td><?php echo $FECHAREPALETIZAJE; ?></td>
                                                            <td><?php echo $NUMEROPROCESO; ?></td>
                                                            <td><?php echo $FECHAPROCESO; ?></td>
                                                            <td><?php echo $TPROCESO; ?></td>
                                                            <td><?php echo $NUMEROREEMBALEJE; ?></td>
                                                            <td><?php echo $FECHAREEMBALEJE; ?></td>
                                                            <td><?php echo $TREEMBALAJE; ?></td>
                                                            <td><?php echo $NOMBRETMANEJO; ?></td>
                                                            <td><?php echo $NOMBRETCALIBRE; ?></td>
                                                            <td><?php echo $NOMBRETEMBALAJE; ?></td>
                                                            <td><?php echo $STOCK; ?></td>
                                                            <td><?php echo $EMBOLSADO; ?></td>
                                                            <td><?php echo $GASIFICADO; ?></td>
                                                            <td><?php echo $PREFRIO; ?></td>
                                                            <td><?php echo $NOMBRETRANSPORTE; ?></td>
                                                            <td><?php echo $NOMBRECONDUCTOR; ?></td>
                                                            <td><?php echo $r['PATENTE_CAMION']; ?></td>
                                                            <td><?php echo $r['PATENTE_CARRO']; ?></td>
                                                            <td><?php echo $r['SEMANA']; ?></td>
                                                            <td><?php echo $r['SEMANAGUIA']; ?></td>
                                                            <td><?php echo $NOMBREEMPRESA; ?></td>
                                                            <td><?php echo $NOMBREPLANTA; ?></td>
                                                            <td><?php echo $NOMBRETEMPORADA; ?></td>
                                                            <td><?php echo $BOLAWBCRTICARGA; ?></td>
                                                            <td><?php echo $NUMERORECEPCION; ?></td>
                                                            <td><?php echo $FECHARECEPCION; ?></td>
                                                            <td><?php echo $TIPORECEPCION; ?></td>
                                                            <td><?php echo $NUMEROGUIARECEPCION; ?></td>
                                                            <td><?php echo $FECHAGUIARECEPCION; ?></td>
                                                            <td><?php echo $NUMERORECEPCIONMP; ?></td>
                                                            <td><?php echo $FECHARECEPCIONMP; ?></td>
                                                            <td><?php echo $TIPORECEPCIONMP; ?></td>
                                                            <td><?php echo $NUMEROGUIARECEPCIONMP; ?></td>
                                                            <td><?php echo $FECHAGUIARECEPCIONMP; ?></td>
                                                            <td><?php echo $PLANTARECEPCIONMP; ?></td>
                                                            <td><?php echo $TERMOGRAFODESPACHOEX; ?></td>
                                                            <td><?php echo $termografoPallet; ?></td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="btn-toolbar mb-3" role="toolbar" aria-label="Datos generales">
                                    <div class="form-row align-items-center" role="group" aria-label="Datos">
                                        <div class="col-auto">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Total Envase</div>
                                                    <button class="btn btn-default" id="TOTALENVASEV" name="TOTALENVASEV">
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Total Neto</div>
                                                    <button class="btn btn-default" id="TOTALNETOV" name="TOTALNETOV">
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Total Bruto</div>
                                                    <button class="btn btn-default" id="TOTALBRUTOV" name="TOTALBRUTOV">
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </div>
                        <!-- /.box -->
                    </div>
                </section>
                <!-- /.content -->
            </div>
        </div>
        <?php include_once "../../assest/config/footer.php"; ?>
        <?php include_once "../../assest/config/menuExtraOpera.php"; ?>
    </div>
    <?php include_once "../../assest/config/urlBase.php"; ?>
</body>
</html>
