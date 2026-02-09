<?php

include_once "../../assest/config/validarUsuarioOpera.php";

include_once '../../assest/controlador/ESPECIES_ADO.php';
include_once '../../assest/controlador/VESPECIES_ADO.php';
include_once '../../assest/controlador/PRODUCTOR_ADO.php';
include_once '../../assest/controlador/TMANEJO_ADO.php';
include_once '../../assest/controlador/TCALIBRE_ADO.php';
include_once '../../assest/controlador/TEMBALAJE_ADO.php';

include_once '../../assest/controlador/CONDUCTOR_ADO.php';
include_once '../../assest/controlador/TRANSPORTE_ADO.php';
include_once '../../assest/controlador/COMPRADOR_ADO.php';

include_once '../../assest/controlador/TPROCESO_ADO.php';
include_once '../../assest/controlador/TREEMBALAJE_ADO.php';
include_once '../../assest/controlador/PROCESO_ADO.php';
include_once '../../assest/controlador/REEMBALAJE_ADO.php';

include_once '../../assest/controlador/EEXPORTACION_ADO.php';
include_once '../../assest/controlador/EINDUSTRIAL_ADO.php';
include_once '../../assest/controlador/ERECEPCION_ADO.php';

include_once '../../assest/controlador/EXIMATERIAPRIMA_ADO.php';
include_once '../../assest/controlador/RECEPCIONMP_ADO.php';
include_once '../../assest/controlador/DESPACHOMP_ADO.php';
include_once '../../assest/controlador/EXIINDUSTRIAL_ADO.php';
include_once '../../assest/controlador/RECEPCIONIND_ADO.php';
include_once '../../assest/controlador/DESPACHOIND_ADO.php';
include_once '../../assest/controlador/EXIEXPORTACION_ADO.php';
include_once '../../assest/controlador/RECEPCIONPT_ADO.php';
include_once '../../assest/controlador/DESPACHOPT_ADO.php';
include_once '../../assest/controlador/DESPACHOEX_ADO.php';
include_once '../../assest/controlador/REPALETIZAJEEX_ADO.php';

include_once '../../assest/controlador/EMPRESA_ADO.php';
include_once '../../assest/controlador/PLANTA_ADO.php';
include_once '../../assest/controlador/TEMPORADA_ADO.php';

include_once '../../assest/controlador/ICARGA_ADO.php';
include_once '../../assest/controlador/DFINAL_ADO.php';
include_once '../../assest/controlador/RFINAL_ADO.php';
include_once '../../assest/controlador/BROKER_ADO.php';
include_once '../../assest/controlador/MERCADO_ADO.php';
include_once '../../assest/controlador/PAIS_ADO.php';

include_once '../../assest/controlador/LDESTINO_ADO.php';
include_once '../../assest/controlador/ADESTINO_ADO.php';
include_once '../../assest/controlador/PDESTINO_ADO.php';

function indexarPorClave($rows, $key)
{
    $map = [];
    if (!$rows || !is_array($rows)) {
        return $map;
    }
    foreach ($rows as $row) {
        if (is_array($row) && isset($row[$key])) {
            $map[$row[$key]] = $row;
        }
    }
    return $map;
}

function obtenerCacheDespachoexDetalladoExportacion($key, $ttl)
{
    $ruta = sys_get_temp_dir() . '/detallado_exportacion_' . md5($key) . '.cache';
    if (!file_exists($ruta)) {
        return null;
    }
    if ((time() - filemtime($ruta)) > $ttl) {
        return null;
    }
    $contenido = file_get_contents($ruta);
    if ($contenido === false) {
        return null;
    }
    $data = @unserialize($contenido);
    if (!is_array($data)) {
        return null;
    }
    return $data;
}

function guardarCacheDespachoexDetalladoExportacion($key, $data)
{
    $ruta = sys_get_temp_dir() . '/detallado_exportacion_' . md5($key) . '.cache';
    @file_put_contents($ruta, serialize($data), LOCK_EX);
    return $ruta;
}

function cargarDespachoexDetalladoExportacionData($temporada, $empresa, $ttl = 900, $forzar = false)
{
    $cacheKey = implode('|', [session_id(), (string) $empresa, (string) $temporada]);
    if (!$forzar) {
        $cache = obtenerCacheDespachoexDetalladoExportacion($cacheKey, $ttl);
        if ($cache) {
            return $cache;
        }
    }

    $ESPECIES_ADO =  new ESPECIES_ADO();
    $VESPECIES_ADO =  new VESPECIES_ADO();
    $PRODUCTOR_ADO = new PRODUCTOR_ADO();
    $TMANEJO_ADO =  new TMANEJO_ADO();
    $TCALIBRE_ADO =  new TCALIBRE_ADO();
    $TEMBALAJE_ADO =  new TEMBALAJE_ADO();
    $CONDUCTOR_ADO =  new CONDUCTOR_ADO();
    $TRANSPORTE_ADO =  new TRANSPORTE_ADO();
    $COMPRADOR_ADO =  new COMPRADOR_ADO();
    $TPROCESO_ADO =  new TPROCESO_ADO();
    $TREEMBALAJE_ADO =  new TREEMBALAJE_ADO();
    $PROCESO_ADO =  new PROCESO_ADO();
    $REEMBALAJE_ADO =  new REEMBALAJE_ADO();
    $EEXPORTACION_ADO =  new EEXPORTACION_ADO();
    $EINDUSTRIAL_ADO =  new EINDUSTRIAL_ADO();
    $ERECEPCION_ADO =  new ERECEPCION_ADO();
    $EXIMATERIAPRIMA_ADO =  new EXIMATERIAPRIMA_ADO();
    $RECEPCIONMP_ADO =  new RECEPCIONMP_ADO();
    $DESPACHOMP_ADO =  new DESPACHOMP_ADO();
    $EXIINDUSTRIAL_ADO =  new EXIINDUSTRIAL_ADO();
    $RECEPCIONIND_ADO =  new RECEPCIONIND_ADO();
    $DESPACHOIND_ADO =  new DESPACHOIND_ADO();
    $EXIEXPORTACION_ADO =  new EXIEXPORTACION_ADO();
    $RECEPCIONPT_ADO =  new RECEPCIONPT_ADO();
    $DESPACHOPT_ADO =  new DESPACHOPT_ADO();
    $DESPACHOEX_ADO =  new DESPACHOEX_ADO();
    $REPALETIZAJEEX_ADO =  new REPALETIZAJEEX_ADO();
    $EMPRESA_ADO = new EMPRESA_ADO();
    $PLANTA_ADO = new PLANTA_ADO();
    $TEMPORADA_ADO = new TEMPORADA_ADO();
    $ICARGA_ADO =  new ICARGA_ADO();
    $DFINAL_ADO =  new DFINAL_ADO();
    $RFINAL_ADO =  new RFINAL_ADO();
    $BROKER_ADO =  new BROKER_ADO();
    $MERCADO_ADO =  new MERCADO_ADO();
    $PAIS_ADO = new PAIS_ADO();
    $LDESTINO_ADO =  new LDESTINO_ADO();
    $ADESTINO_ADO =  new ADESTINO_ADO();
    $PDESTINO_ADO =  new PDESTINO_ADO();

    if ($temporada) {
        $ARRAYDESPACHOEX = $DESPACHOEX_ADO->listarDespachoexTemporadaCBX($temporada);
    } else {
        $ARRAYDESPACHOEX = [];
    }
    $ARRAYDESPACHOEX = filtrarPorEmpresa($ARRAYDESPACHOEX, $empresa);

    if (empty($ARRAYDESPACHOEX)) {
        $data = [
            'despachoex' => [],
            'exiexportacion_por_despacho' => [],
            'maps' => [
                'transporte' => [],
                'conductor' => [],
                'empresa' => [],
                'planta' => [],
                'temporada' => [],
                'pais' => [],
                'ldestino' => [],
                'adestino' => [],
                'pdestino' => [],
                'mercado' => [],
                'rfinal' => [],
                'broker' => [],
                'icarga' => [],
                'productor' => [],
                'vespecies' => [],
                'especies' => [],
                'estandar' => [],
                'tmanejo' => [],
                'tcalibre' => [],
                'tembalaje' => [],
                'tproceso' => [],
                'treembalaje' => [],
            ],
            'map_recepcion' => [],
            'map_despacho2' => [],
            'map_proceso' => [],
            'map_reembalaje' => [],
            'map_repaletizaje' => [],
            'map_recepcion_mp_proceso' => [],
            'map_recepcion_mp_reembalaje' => [],
        ];
        guardarCacheDespachoexDetalladoExportacion($cacheKey, $data);
        return $data;
    }

    $MAP_TRANSPORTE = indexarPorClave($TRANSPORTE_ADO->listarTransporteCBX(), 'ID_TRANSPORTE');
    $MAP_CONDUCTOR = indexarPorClave($CONDUCTOR_ADO->listarConductorCBX(), 'ID_CONDUCTOR');
    $MAP_EMPRESA = indexarPorClave($EMPRESA_ADO->listarEmpresaCBX(), 'ID_EMPRESA');
    $MAP_PLANTA = indexarPorClave($PLANTA_ADO->listarPlantaCBX(), 'ID_PLANTA');
    $MAP_TEMPORADA = indexarPorClave($TEMPORADA_ADO->listarTemporadaCBX(), 'ID_TEMPORADA');
    $MAP_PAIS = indexarPorClave($PAIS_ADO->listarPaisCBX(), 'ID_PAIS');
    $MAP_LDESTINO = indexarPorClave($LDESTINO_ADO->listarLdestinoCBX(), 'ID_LDESTINO');
    $MAP_ADESTINO = indexarPorClave($ADESTINO_ADO->listarAdestinoCBX(), 'ID_ADESTINO');
    $MAP_PDESTINO = indexarPorClave($PDESTINO_ADO->listarPdestinoCBX(), 'ID_PDESTINO');
    $MAP_MERCADO = indexarPorClave($MERCADO_ADO->listarMercadoCBX(), 'ID_MERCADO');
    $MAP_RFINAL = indexarPorClave($RFINAL_ADO->listarRfinalCBX(), 'ID_RFINAL');
    $MAP_BROKER = indexarPorClave($BROKER_ADO->listarBrokerCBX(), 'ID_BROKER');
    $MAP_ICARGA = indexarPorClave($ICARGA_ADO->listarIcargaCBX(), 'ID_ICARGA');
    $MAP_PRODUCTOR = indexarPorClave($PRODUCTOR_ADO->listarProductorCBX(), 'ID_PRODUCTOR');
    $MAP_VESPECIES = indexarPorClave($VESPECIES_ADO->listarVespeciesCBX(), 'ID_VESPECIES');
    $MAP_ESPECIES = indexarPorClave($ESPECIES_ADO->listarEspeciesCBX(), 'ID_ESPECIES');
    $MAP_ESTANDAR = indexarPorClave($EEXPORTACION_ADO->listarEstandarCBX(), 'ID_ESTANDAR');
    $MAP_TMANEJO = indexarPorClave($TMANEJO_ADO->listarTmanejoCBX(), 'ID_TMANEJO');
    $MAP_TCALIBRE = indexarPorClave($TCALIBRE_ADO->listarCalibreCBX(), 'ID_TCALIBRE');
    $MAP_TEMBALAJE = indexarPorClave($TEMBALAJE_ADO->listarEmbalajeCBX(), 'ID_TEMBALAJE');
    $MAP_TPROCESO = indexarPorClave($TPROCESO_ADO->listarTprocesoCBX(), 'ID_TPROCESO');
    $MAP_TREEMBALAJE = indexarPorClave($TREEMBALAJE_ADO->listarTreembalajeCBX(), 'ID_TREEMBALAJE');

    $DESPACHO_IDS = array_map('intval', array_column($ARRAYDESPACHOEX, 'ID_DESPACHOEX'));
    $ARRAYTOMADOEX = $EXIEXPORTACION_ADO->buscarPorDespachoExLista($DESPACHO_IDS);
    $EXIEXPORTACION_POR_DESPACHO = [];
    foreach ($ARRAYTOMADOEX as $filaExportacion) {
        $ID_DESPACHOEX = (int) $filaExportacion['ID_DESPACHOEX'];
        $EXIEXPORTACION_POR_DESPACHO[$ID_DESPACHOEX][] = $filaExportacion;
    }

    $RECEPCION_IDS = array_unique(array_filter(array_map('intval', array_column($ARRAYTOMADOEX, 'ID_RECEPCION'))));
    $DESPACHO2_IDS = array_unique(array_filter(array_map('intval', array_column($ARRAYTOMADOEX, 'ID_DESPACHO2'))));
    $PROCESO_IDS = array_unique(array_filter(array_map('intval', array_column($ARRAYTOMADOEX, 'ID_PROCESO'))));
    $REEMBALAJE_IDS = array_unique(array_filter(array_map('intval', array_column($ARRAYTOMADOEX, 'ID_REEMBALAJE'))));
    $REPALETIZAJE_IDS = array_unique(array_filter(array_map('intval', array_column($ARRAYTOMADOEX, 'ID_REPALETIZAJE'))));

    $MAP_RECEPCION = indexarPorClave($RECEPCIONPT_ADO->verRecepcion2Lista($RECEPCION_IDS), 'ID_RECEPCION');
    $MAP_DESPACHO2 = indexarPorClave($DESPACHOPT_ADO->verDespachoptLista($DESPACHO2_IDS), 'ID_DESPACHO');
    $MAP_PROCESO = indexarPorClave($PROCESO_ADO->verProceso2Lista($PROCESO_IDS), 'ID_PROCESO');
    $MAP_REEMBALAJE = indexarPorClave($REEMBALAJE_ADO->verReembalaje2Lista($REEMBALAJE_IDS), 'ID_REEMBALAJE');
    $MAP_REPALETIZAJE = indexarPorClave($REPALETIZAJEEX_ADO->verRepaletizaje2Lista($REPALETIZAJE_IDS), 'ID_REPALETIZAJE');
    $MAP_RECEPCION_MP_PROCESO = indexarPorClave($PROCESO_ADO->buscarRecepcionMpExistenciaEnProcesoLista($PROCESO_IDS), 'ID_PROCESO');
    $MAP_RECEPCION_MP_REEMBALAJE = indexarPorClave($REEMBALAJE_ADO->buscarProcesoRecepcionMpExistenciaEnReembalajeLista($REEMBALAJE_IDS), 'ID_REEMBALAJE');

    $data = [
        'despachoex' => $ARRAYDESPACHOEX,
        'exiexportacion_por_despacho' => $EXIEXPORTACION_POR_DESPACHO,
        'maps' => [
            'transporte' => $MAP_TRANSPORTE,
            'conductor' => $MAP_CONDUCTOR,
            'empresa' => $MAP_EMPRESA,
            'planta' => $MAP_PLANTA,
            'temporada' => $MAP_TEMPORADA,
            'pais' => $MAP_PAIS,
            'ldestino' => $MAP_LDESTINO,
            'adestino' => $MAP_ADESTINO,
            'pdestino' => $MAP_PDESTINO,
            'mercado' => $MAP_MERCADO,
            'rfinal' => $MAP_RFINAL,
            'broker' => $MAP_BROKER,
            'icarga' => $MAP_ICARGA,
            'productor' => $MAP_PRODUCTOR,
            'vespecies' => $MAP_VESPECIES,
            'especies' => $MAP_ESPECIES,
            'estandar' => $MAP_ESTANDAR,
            'tmanejo' => $MAP_TMANEJO,
            'tcalibre' => $MAP_TCALIBRE,
            'tembalaje' => $MAP_TEMBALAJE,
            'tproceso' => $MAP_TPROCESO,
            'treembalaje' => $MAP_TREEMBALAJE,
        ],
        'map_recepcion' => $MAP_RECEPCION,
        'map_despacho2' => $MAP_DESPACHO2,
        'map_proceso' => $MAP_PROCESO,
        'map_reembalaje' => $MAP_REEMBALAJE,
        'map_repaletizaje' => $MAP_REPALETIZAJE,
        'map_recepcion_mp_proceso' => $MAP_RECEPCION_MP_PROCESO,
        'map_recepcion_mp_reembalaje' => $MAP_RECEPCION_MP_REEMBALAJE,
    ];

    guardarCacheDespachoexDetalladoExportacion($cacheKey, $data);
    return $data;
}
