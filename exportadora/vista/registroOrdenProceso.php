<?php
include_once "../../assest/config/validarUsuarioExpo.php";
include_once '../../assest/controlador/OPROCESO_ADO.php';
include_once '../../assest/controlador/MERCADO_ADO.php';
include_once '../../assest/controlador/PRODUCTOR_ADO.php';
include_once '../../assest/controlador/VESPECIES_ADO.php';
include_once '../../assest/controlador/EEXPORTACION_ADO.php';
include_once '../../assest/controlador/RMERCADO_ADO.php';
include_once '../../assest/controlador/REEXPORTACIONMERCADO_ADO.php';
include_once '../../assest/modelo/OPROCESO.php';

$OPROCESO_ADO = new OPROCESO_ADO();
$MERCADO_ADO = new MERCADO_ADO();
$PRODUCTOR_ADO = new PRODUCTOR_ADO();
$VESPECIES_ADO = new VESPECIES_ADO();
$EEXPORTACION_ADO = new EEXPORTACION_ADO();
$RMERCADO_ADO = new RMERCADO_ADO();
$REEXPORTACIONMERCADO_ADO = new REEXPORTACIONMERCADO_ADO();
$OPROCESO = new OPROCESO();

$IDOP = "";
$ACCION = "";
$NUMERO_OPROCESO = "";
$FECHA_TERMINO_ESTIMADA = "";
$CANTIDAD_CAJA = "";
$OBSERVACION_OPROCESO = "";
$MENSAJE = "";
$TIPOMENSAJE = "success";

$MERCADOS_SEL = array();
$PRODUCTORES_SEL = array();
$VARIEDADES_SEL = array();
$ESTANDARES_SEL = array();

$ARRAYMERCADO = $MERCADO_ADO->listarMercadoPorEmpresaCBX($EMPRESAS);
$ARRAYPRODUCTOR = $PRODUCTOR_ADO->listarProductorPorEmpresaCBX($EMPRESAS);
$ARRAYVESPECIES = $VESPECIES_ADO->listarVespeciesPorEmpresaCBX($EMPRESAS);
$ARRAYESTANDAR = $EEXPORTACION_ADO->listarEstandarPorEmpresaCBX($EMPRESAS);
$ARRAYRMERCADO = $RMERCADO_ADO->listarRmercadoPorEmpresaCBX($EMPRESAS);

$LISTAMERCADOS = array();
$LISTAPRODUCTORES = array();
$LISTAESTANDARES = array();
$MERCADOSPRODUCTOR = array();
$MERCADOSESTANDAR = array();

if ($ARRAYMERCADO) {
    foreach ($ARRAYMERCADO as $r) {
        $LISTAMERCADOS[(int)$r['ID_MERCADO']] = $r['NOMBRE_MERCADO'];
    }
}
if ($ARRAYPRODUCTOR) {
    foreach ($ARRAYPRODUCTOR as $r) {
        $LISTAPRODUCTORES[(int)$r['ID_PRODUCTOR']] = $r['CSG_PRODUCTOR'] . ' : ' . $r['NOMBRE_PRODUCTOR'];
    }
}
if ($ARRAYESTANDAR) {
    foreach ($ARRAYESTANDAR as $r) {
        $IDEST = (int)$r['ID_ESTANDAR'];
        $LISTAESTANDARES[$IDEST] = $r['CODIGO_ESTANDAR'] . ' : ' . $r['NOMBRE_ESTANDAR'];
        $MERCADOSESTANDAR[$IDEST] = array();
        $ARRAYREX = $REEXPORTACIONMERCADO_ADO->buscarPorEstandar($IDEST);
        if ($ARRAYREX) {
            foreach ($ARRAYREX as $rx) {
                $MERCADOSESTANDAR[$IDEST][] = (int)$rx['ID_MERCADO'];
            }
            $MERCADOSESTANDAR[$IDEST] = array_values(array_unique($MERCADOSESTANDAR[$IDEST]));
        }
    }
}
if ($ARRAYRMERCADO) {
    foreach ($ARRAYRMERCADO as $r) {
        $IDPROD = (int)$r['ID_PRODUCTOR'];
        $IDMER = (int)$r['ID_MERCADO'];
        if (!isset($MERCADOSPRODUCTOR[$IDPROD])) {
            $MERCADOSPRODUCTOR[$IDPROD] = array();
        }
        if (!in_array($IDMER, $MERCADOSPRODUCTOR[$IDPROD])) {
            $MERCADOSPRODUCTOR[$IDPROD][] = $IDMER;
        }
    }
}

function validarCompatibilidadMercadosOP($MERCADOS_SEL, $PRODUCTORES_SEL, $ESTANDARES_SEL, $MERCADOSPRODUCTOR, $MERCADOSESTANDAR, $LISTAPRODUCTORES, $LISTAESTANDARES, $LISTAMERCADOS)
{
    $MERCADOS_SEL = array_values(array_unique(array_filter(array_map('intval', (array)$MERCADOS_SEL))));
    $PRODUCTORES_SEL = array_values(array_unique(array_filter(array_map('intval', (array)$PRODUCTORES_SEL))));
    $ESTANDARES_SEL = array_values(array_unique(array_filter(array_map('intval', (array)$ESTANDARES_SEL))));

    if (count($MERCADOS_SEL) == 0) {
        return array(true, "");
    }

    $ERRORES = array();

    foreach ($PRODUCTORES_SEL as $IDPROD) {
        $MERCADOSPROD = isset($MERCADOSPRODUCTOR[$IDPROD]) ? $MERCADOSPRODUCTOR[$IDPROD] : array();
        $FALTAN = array_values(array_diff($MERCADOS_SEL, $MERCADOSPROD));
        if (count($FALTAN) > 0) {
            $NOMBRES = array();
            foreach ($FALTAN as $idm) {
                if (isset($LISTAMERCADOS[$idm])) {
                    $NOMBRES[] = $LISTAMERCADOS[$idm];
                }
            }
            $ERRORES[] = "Productor <strong>" . (isset($LISTAPRODUCTORES[$IDPROD]) ? $LISTAPRODUCTORES[$IDPROD] : $IDPROD) . "</strong> no habilitado en: " . implode(', ', $NOMBRES);
        }
    }

    foreach ($ESTANDARES_SEL as $IDEST) {
        $MERCEST = isset($MERCADOSESTANDAR[$IDEST]) ? $MERCADOSESTANDAR[$IDEST] : array();
        $FALTAN = array_values(array_diff($MERCADOS_SEL, $MERCEST));
        if (count($FALTAN) > 0) {
            $NOMBRES = array();
            foreach ($FALTAN as $idm) {
                if (isset($LISTAMERCADOS[$idm])) {
                    $NOMBRES[] = $LISTAMERCADOS[$idm];
                }
            }
            $ERRORES[] = "Estándar <strong>" . (isset($LISTAESTANDARES[$IDEST]) ? $LISTAESTANDARES[$IDEST] : $IDEST) . "</strong> no habilitado en: " . implode(', ', $NOMBRES);
        }
    }

    if (count($ERRORES) > 0) {
        return array(false, implode("<br>", $ERRORES));
    }

    return array(true, "");
}

if (isset($_GET['id']) && isset($_GET['a'])) {
    $IDOP = (int)$_GET['id'];
    $ACCION = $_GET['a'];
    if ($ACCION == 'editar' && $IDOP > 0) {
        $ARRAYOPID = $OPROCESO_ADO->verOrdenProceso($IDOP);
        if ($ARRAYOPID) {
            $NUMERO_OPROCESO = $ARRAYOPID[0]['NUMERO_OPROCESO'];
            $FECHA_TERMINO_ESTIMADA = $ARRAYOPID[0]['FECHA_TERMINO_ESTIMADA'];
            $CANTIDAD_CAJA = $ARRAYOPID[0]['CANTIDAD_CAJA'];
            $OBSERVACION_OPROCESO = $ARRAYOPID[0]['OBSERVACION_OPROCESO'];

            $ARRAYM = $OPROCESO_ADO->listarMercadosPorOp($IDOP);
            foreach ($ARRAYM as $r) {
                $MERCADOS_SEL[] = (int)$r['ID_MERCADO'];
            }

            $ARRAYPV = $OPROCESO_ADO->listarProductorVariedadPorOp($IDOP);
            foreach ($ARRAYPV as $r) {
                $PRODUCTORES_SEL[] = (int)$r['ID_PRODUCTOR'];
                $VARIEDADES_SEL[] = (int)$r['ID_VESPECIES'];
            }
            $PRODUCTORES_SEL = array_values(array_unique($PRODUCTORES_SEL));
            $VARIEDADES_SEL = array_values(array_unique($VARIEDADES_SEL));

            $ARRAYE = $OPROCESO_ADO->listarEstandarPorOp($IDOP);
            foreach ($ARRAYE as $r) {
                $ESTANDARES_SEL[] = (int)$r['ID_ESTANDAR'];
            }
            $ESTANDARES_SEL = array_values(array_unique($ESTANDARES_SEL));
        }
    }
}

if (isset($_POST['CREAR'])) {
    $NUMERO_OPROCESO = $_POST['NUMERO_OPROCESO'];
    $FECHA_TERMINO_ESTIMADA = $_POST['FECHA_TERMINO_ESTIMADA'];
    $CANTIDAD_CAJA = $_POST['CANTIDAD_CAJA'];
    $OBSERVACION_OPROCESO = $_POST['OBSERVACION_OPROCESO'];

    $MERCADOS_SEL = isset($_POST['MERCADOS']) ? array_values(array_unique(array_map('intval', $_POST['MERCADOS']))) : array();
    $PRODUCTORES_SEL = isset($_POST['PRODUCTORES']) ? array_values(array_unique(array_map('intval', $_POST['PRODUCTORES']))) : array();
    $VARIEDADES_SEL = isset($_POST['VARIEDADES']) ? array_values(array_unique(array_map('intval', $_POST['VARIEDADES']))) : array();
    $ESTANDARES_SEL = isset($_POST['ESTANDARES']) ? array_values(array_unique(array_map('intval', $_POST['ESTANDARES']))) : array();

    list($VALIDO, $DETALLEERROR) = validarCompatibilidadMercadosOP(
        $MERCADOS_SEL,
        $PRODUCTORES_SEL,
        $ESTANDARES_SEL,
        $MERCADOSPRODUCTOR,
        $MERCADOSESTANDAR,
        $LISTAPRODUCTORES,
        $LISTAESTANDARES,
        $LISTAMERCADOS
    );

    if (!$VALIDO) {
        $MENSAJE = "Validación de mercados no cumplida:<br>" . $DETALLEERROR;
        $TIPOMENSAJE = "warning";
    } else {
        $OPROCESO->__SET('NUMERO_OPROCESO', $NUMERO_OPROCESO);
        $OPROCESO->__SET('FECHA_TERMINO_ESTIMADA', $FECHA_TERMINO_ESTIMADA);
        $OPROCESO->__SET('CANTIDAD_CAJA', $CANTIDAD_CAJA);
        $OPROCESO->__SET('OBSERVACION_OPROCESO', $OBSERVACION_OPROCESO);
        $OPROCESO->__SET('ID_EMPRESA', $EMPRESAS);
        $OPROCESO->__SET('ID_USUARIOI', $IDUSUARIOS);
        $OPROCESO->__SET('ID_USUARIOM', $IDUSUARIOS);

        $IDNUEVAOP = $OPROCESO_ADO->agregarOrdenProceso($OPROCESO);

        foreach ($MERCADOS_SEL as $idMercado) {
            if ((int)$idMercado > 0) {
                $OPROCESO_ADO->agregarMercado($IDNUEVAOP, (int)$idMercado);
            }
        }

        foreach ($PRODUCTORES_SEL as $idProductor) {
            foreach ($VARIEDADES_SEL as $idVariedad) {
                if ((int)$idProductor > 0 && (int)$idVariedad > 0) {
                    $OPROCESO_ADO->agregarProductorVariedad($IDNUEVAOP, (int)$idProductor, (int)$idVariedad);
                }
            }
        }

        foreach ($ESTANDARES_SEL as $idEstandar) {
            if ((int)$idEstandar > 0) {
                $OPROCESO_ADO->agregarEstandar($IDNUEVAOP, (int)$idEstandar);
            }
        }

        $MENSAJE = "OP creada correctamente";
        $TIPOMENSAJE = "success";

        $NUMERO_OPROCESO = "";
        $FECHA_TERMINO_ESTIMADA = "";
        $CANTIDAD_CAJA = "";
        $OBSERVACION_OPROCESO = "";
        $MERCADOS_SEL = array();
        $PRODUCTORES_SEL = array();
        $VARIEDADES_SEL = array();
        $ESTANDARES_SEL = array();
    }
}

if (isset($_POST['GUARDAR'])) {
    $IDOPPOST = (int)$_POST['ID_OPROCESO'];
    $IDOP = $IDOPPOST;
    $ACCION = 'editar';

    $NUMERO_OPROCESO = $_POST['NUMERO_OPROCESO'];
    $FECHA_TERMINO_ESTIMADA = $_POST['FECHA_TERMINO_ESTIMADA'];
    $CANTIDAD_CAJA = $_POST['CANTIDAD_CAJA'];
    $OBSERVACION_OPROCESO = $_POST['OBSERVACION_OPROCESO'];

    $MERCADOS_SEL = isset($_POST['MERCADOS']) ? array_values(array_unique(array_map('intval', $_POST['MERCADOS']))) : array();
    $PRODUCTORES_SEL = isset($_POST['PRODUCTORES']) ? array_values(array_unique(array_map('intval', $_POST['PRODUCTORES']))) : array();
    $VARIEDADES_SEL = isset($_POST['VARIEDADES']) ? array_values(array_unique(array_map('intval', $_POST['VARIEDADES']))) : array();
    $ESTANDARES_SEL = isset($_POST['ESTANDARES']) ? array_values(array_unique(array_map('intval', $_POST['ESTANDARES']))) : array();

    list($VALIDO, $DETALLEERROR) = validarCompatibilidadMercadosOP(
        $MERCADOS_SEL,
        $PRODUCTORES_SEL,
        $ESTANDARES_SEL,
        $MERCADOSPRODUCTOR,
        $MERCADOSESTANDAR,
        $LISTAPRODUCTORES,
        $LISTAESTANDARES,
        $LISTAMERCADOS
    );

    if (!$VALIDO) {
        $MENSAJE = "Validación de mercados no cumplida:<br>" . $DETALLEERROR;
        $TIPOMENSAJE = "warning";
    } else if ($IDOPPOST > 0) {
        $OPROCESO->__SET('ID_OPROCESO', $IDOPPOST);
        $OPROCESO->__SET('NUMERO_OPROCESO', $NUMERO_OPROCESO);
        $OPROCESO->__SET('FECHA_TERMINO_ESTIMADA', $FECHA_TERMINO_ESTIMADA);
        $OPROCESO->__SET('CANTIDAD_CAJA', $CANTIDAD_CAJA);
        $OPROCESO->__SET('OBSERVACION_OPROCESO', $OBSERVACION_OPROCESO);
        $OPROCESO->__SET('ID_USUARIOM', $IDUSUARIOS);

        $OPROCESO_ADO->actualizarOrdenProceso($OPROCESO);
        $OPROCESO_ADO->limpiarDetalleOrdenProceso($IDOPPOST);

        foreach ($MERCADOS_SEL as $idMercado) {
            if ((int)$idMercado > 0) {
                $OPROCESO_ADO->agregarMercado($IDOPPOST, (int)$idMercado);
            }
        }

        foreach ($PRODUCTORES_SEL as $idProductor) {
            foreach ($VARIEDADES_SEL as $idVariedad) {
                if ((int)$idProductor > 0 && (int)$idVariedad > 0) {
                    $OPROCESO_ADO->agregarProductorVariedad($IDOPPOST, (int)$idProductor, (int)$idVariedad);
                }
            }
        }

        foreach ($ESTANDARES_SEL as $idEstandar) {
            if ((int)$idEstandar > 0) {
                $OPROCESO_ADO->agregarEstandar($IDOPPOST, (int)$idEstandar);
            }
        }

        $MENSAJE = "OP actualizada correctamente";
        $TIPOMENSAJE = "success";
        $ACCION = "";
        $IDOP = "";
        $NUMERO_OPROCESO = "";
        $FECHA_TERMINO_ESTIMADA = "";
        $CANTIDAD_CAJA = "";
        $OBSERVACION_OPROCESO = "";
        $MERCADOS_SEL = array();
        $PRODUCTORES_SEL = array();
        $VARIEDADES_SEL = array();
        $ESTANDARES_SEL = array();
    }
}

if (isset($_POST['ELIMINAR'])) {
    $IDELIMINAR = (int)$_POST['ID_OPROCESO'];
    if ($IDELIMINAR > 0) {
        $TOTALASOCIADOS = $OPROCESO_ADO->contarProcesosAsociados($IDELIMINAR);
        if ($TOTALASOCIADOS > 0) {
            $MENSAJE = "No se puede eliminar la OP, tiene procesos asociados.";
            $TIPOMENSAJE = "warning";
        } else {
            $OPROCESO_ADO->deshabilitarOrdenProceso($IDELIMINAR, $IDUSUARIOS);
            $MENSAJE = "OP eliminada correctamente";
            $TIPOMENSAJE = "success";
        }
    }
}

$ARRAYOP = $OPROCESO_ADO->listarOrdenProcesoPorEmpresa($EMPRESAS);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Ordenes de Proceso</title>
    <?php include_once "../../assest/config/urlHead.php"; ?>
    <style>
        /* sistemRR */
        #form_op .form-control,
        #form_op .select2-container--default .select2-selection--single,
        #form_op .select2-container--default .select2-selection--multiple {
            border-radius: 14px !important;
            min-height: 34px !important;
            font-size: 12px;
        }

        #form_op .select2-container--default .select2-selection--multiple {
            min-height: 36px !important;
        }

        .table-minimal thead th,
        .table-minimal tbody td {
            padding: 0.35rem 0.5rem;
            vertical-align: middle;
        }

        .table-minimal tbody tr:hover {
            background-color: #f7f8fa;
        }
    </style>
</head>
<body class="hold-transition light-skin fixed sidebar-mini theme-primary sistemRR">
<div class="wrapper">
    <?php include_once "../../assest/config/menuExpo.php"; ?>
    <div class="content-wrapper">
        <section class="content-header"><h1>Ordenes de Proceso (OP)</h1></section>
        <section class="content">
            <div class="box">
                <div class="box-header with-border">
                    <h4 class="box-title"><?php echo ($ACCION == 'editar') ? 'Editar OP' : 'Registrar OP'; ?></h4>
                </div>
                <div class="box-body">
                    <form method="post" id="form_op">
                        <input type="hidden" name="ID_OPROCESO" value="<?php echo $IDOP; ?>">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Número OP</label>
                                <input class="form-control" name="NUMERO_OPROCESO" value="<?php echo $NUMERO_OPROCESO; ?>" required>
                            </div>
                            <div class="col-md-3">
                                <label>Cantidad de cajas</label>
                                <input type="number" class="form-control" name="CANTIDAD_CAJA" min="1" value="<?php echo $CANTIDAD_CAJA; ?>" required>
                            </div>
                            <div class="col-md-3">
                                <label>Fecha estimada de termino</label>
                                <input type="date" class="form-control" name="FECHA_TERMINO_ESTIMADA" value="<?php echo $FECHA_TERMINO_ESTIMADA; ?>" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Mercados</label>
                                <select class="form-control select2" name="MERCADOS[]" multiple>
                                    <?php foreach ($ARRAYMERCADO as $r) { ?>
                                        <option value="<?php echo $r['ID_MERCADO']; ?>" <?php echo in_array((int)$r['ID_MERCADO'], $MERCADOS_SEL) ? 'selected' : ''; ?>>
                                            <?php echo $r['NOMBRE_MERCADO']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label>Productor</label>
                                <select class="form-control select2" name="PRODUCTORES[]" multiple>
                                    <?php foreach ($ARRAYPRODUCTOR as $r) { ?>
                                        <option value="<?php echo $r['ID_PRODUCTOR']; ?>" <?php echo in_array((int)$r['ID_PRODUCTOR'], $PRODUCTORES_SEL) ? 'selected' : ''; ?>>
                                            <?php echo $r['CSG_PRODUCTOR'] . ' : ' . $r['NOMBRE_PRODUCTOR']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label>Variedad por productor</label>
                                <select class="form-control select2" name="VARIEDADES[]" multiple>
                                    <?php foreach ($ARRAYVESPECIES as $r) { ?>
                                        <option value="<?php echo $r['ID_VESPECIES']; ?>" <?php echo in_array((int)$r['ID_VESPECIES'], $VARIEDADES_SEL) ? 'selected' : ''; ?>>
                                            <?php echo $r['NOMBRE_VESPECIES']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Estándar</label>
                                <select class="form-control select2" name="ESTANDARES[]" multiple>
                                    <?php foreach ($ARRAYESTANDAR as $r) { ?>
                                        <option value="<?php echo $r['ID_ESTANDAR']; ?>" <?php echo in_array((int)$r['ID_ESTANDAR'], $ESTANDARES_SEL) ? 'selected' : ''; ?>>
                                            <?php echo $r['CODIGO_ESTANDAR'] . ' : ' . $r['NOMBRE_ESTANDAR']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Observación</label>
                                <textarea class="form-control" name="OBSERVACION_OPROCESO"><?php echo $OBSERVACION_OPROCESO; ?></textarea>
                            </div>
                        </div><br>
                        <?php if ($ACCION == 'editar') { ?>
                            <button class="btn btn-warning" name="GUARDAR" value="GUARDAR">Guardar cambios</button>
                            <a href="registroOrdenProceso.php" class="btn btn-secondary">Cancelar</a>
                        <?php } else { ?>
                            <button class="btn btn-primary" name="CREAR" value="CREAR">Guardar OP</button>
                        <?php } ?>
                    </form>
                </div>
            </div>

            <div class="box">
                <div class="box-header with-border"><h4 class="box-title">OP Registradas</h4></div>
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-minimal">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Número</th>
                                <th>Cajas</th>
                                <th>Fecha término</th>
                                <th>Ingreso</th>
                                <th style="width: 170px;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($ARRAYOP as $r) { ?>
                            <tr>
                                <td><?php echo $r['ID_OPROCESO']; ?></td>
                                <td><?php echo $r['NUMERO_OPROCESO']; ?></td>
                                <td><?php echo $r['CANTIDAD_CAJA']; ?></td>
                                <td><?php echo $r['FECHA_TERMINO_ESTIMADA']; ?></td>
                                <td><?php echo $r['INGRESO']; ?></td>
                                <td>
                                    <a href="registroOrdenProceso.php?id=<?php echo $r['ID_OPROCESO']; ?>&a=editar" class="btn btn-sm btn-warning">Editar</a>
                                    <form method="post" style="display:inline;" onsubmit="return confirm('¿Eliminar esta OP?');">
                                        <input type="hidden" name="ID_OPROCESO" value="<?php echo $r['ID_OPROCESO']; ?>">
                                        <button class="btn btn-sm btn-danger" name="ELIMINAR" value="ELIMINAR">Borrar</button>
                                    </form>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
    <?php include_once "../../assest/config/menuExtraExpo.php"; ?>
</div>
<?php include_once "../../assest/config/urlBase.php"; ?>
<?php if ($MENSAJE != "") { ?>
<script>
    Swal.fire({
        icon: '<?php echo $TIPOMENSAJE; ?>',
        title: 'Ordenes de Proceso',
        html: '<?php echo $MENSAJE; ?>',
        confirmButtonText: 'Entendido'
    });
</script>
<?php } ?>
</body>
</html>
