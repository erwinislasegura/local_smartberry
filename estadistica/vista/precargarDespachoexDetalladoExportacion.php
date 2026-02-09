<?php

include_once "../../assest/config/validarUsuarioOpera.php";
include_once __DIR__ . '/helpers/despachoexDetalladoExportacionData.php';

header('Content-Type: application/json; charset=utf-8');

try {
    cargarDespachoexDetalladoExportacionData($TEMPORADAS, $EMPRESAS, 900, true);
    echo json_encode(['status' => 'ok']);
} catch (Exception $e) {
    echo json_encode(['status' => 'error']);
}
