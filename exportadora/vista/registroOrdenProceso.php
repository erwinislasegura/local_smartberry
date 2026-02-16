<?php
include_once "../../assest/config/validarUsuarioExpo.php";
include_once '../../assest/controlador/OPROCESO_ADO.php';
include_once '../../assest/controlador/MERCADO_ADO.php';
include_once '../../assest/controlador/PRODUCTOR_ADO.php';
include_once '../../assest/controlador/VESPECIES_ADO.php';
include_once '../../assest/controlador/EEXPORTACION_ADO.php';
include_once '../../assest/modelo/OPROCESO.php';

$OPROCESO_ADO = new OPROCESO_ADO();
$MERCADO_ADO = new MERCADO_ADO();
$PRODUCTOR_ADO = new PRODUCTOR_ADO();
$VESPECIES_ADO = new VESPECIES_ADO();
$EEXPORTACION_ADO = new EEXPORTACION_ADO();
$OPROCESO = new OPROCESO();

$ARRAYMERCADO = $MERCADO_ADO->listarMercadoPorEmpresaCBX($EMPRESAS);
$ARRAYPRODUCTOR = $PRODUCTOR_ADO->listarProductorPorEmpresaCBX($EMPRESAS);
$ARRAYVESPECIES = $VESPECIES_ADO->listarVespeciesPorEmpresaCBX($EMPRESAS);
$ARRAYESTANDAR = $EEXPORTACION_ADO->listarEstandarPorEmpresaCBX($EMPRESAS);
$ARRAYOP = $OPROCESO_ADO->listarOrdenProcesoPorEmpresa($EMPRESAS);

if (isset($_POST['CREAR'])) {
    $OPROCESO->__SET('NUMERO_OPROCESO', $_POST['NUMERO_OPROCESO']);
    $OPROCESO->__SET('FECHA_TERMINO_ESTIMADA', $_POST['FECHA_TERMINO_ESTIMADA']);
    $OPROCESO->__SET('CANTIDAD_CAJA', $_POST['CANTIDAD_CAJA']);
    $OPROCESO->__SET('OBSERVACION_OPROCESO', $_POST['OBSERVACION_OPROCESO']);
    $OPROCESO->__SET('ID_EMPRESA', $EMPRESAS);
    $OPROCESO->__SET('ID_USUARIOI', $IDUSUARIOS);
    $OPROCESO->__SET('ID_USUARIOM', $IDUSUARIOS);

    $IDOP = $OPROCESO_ADO->agregarOrdenProceso($OPROCESO);

    if (isset($_POST['MERCADOS']) && is_array($_POST['MERCADOS'])) {
        foreach ($_POST['MERCADOS'] as $idMercado) {
            if ((int)$idMercado > 0) {
                $OPROCESO_ADO->agregarMercado($IDOP, (int)$idMercado);
            }
        }
    }

    if (isset($_POST['PRODUCTORES']) && is_array($_POST['PRODUCTORES']) && isset($_POST['VARIEDADES']) && is_array($_POST['VARIEDADES'])) {
        foreach ($_POST['PRODUCTORES'] as $idProductor) {
            foreach ($_POST['VARIEDADES'] as $idVariedad) {
                if ((int)$idProductor > 0 && (int)$idVariedad > 0) {
                    $OPROCESO_ADO->agregarProductorVariedad($IDOP, (int)$idProductor, (int)$idVariedad);
                }
            }
        }
    }

    if (isset($_POST['ESTANDARES']) && is_array($_POST['ESTANDARES'])) {
        foreach ($_POST['ESTANDARES'] as $idEstandar) {
            if ((int)$idEstandar > 0) {
                $OPROCESO_ADO->agregarEstandar($IDOP, (int)$idEstandar);
            }
        }
    }

    echo "<script>location.href='registroOrdenProceso.php';</script>";
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Ordenes de Proceso</title>
    <?php include_once "../../assest/config/urlHead.php"; ?>
</head>
<body class="hold-transition light-skin fixed sidebar-mini theme-primary">
<div class="wrapper">
    <?php include_once "../../assest/config/menuExpo.php"; ?>
    <div class="content-wrapper">
        <section class="content-header"><h1>Ordenes de Proceso (OP)</h1></section>
        <section class="content">
            <div class="box">
                <div class="box-body">
                    <form method="post">
                        <div class="row">
                            <div class="col-md-3"><label>Número OP</label><input class="form-control" name="NUMERO_OPROCESO" required></div>
                            <div class="col-md-3"><label>Cantidad de cajas</label><input type="number" class="form-control" name="CANTIDAD_CAJA" min="1" required></div>
                            <div class="col-md-3"><label>Fecha estimada de termino</label><input type="date" class="form-control" name="FECHA_TERMINO_ESTIMADA" required></div>
                        </div><br>
                        <div class="row">
                            <div class="col-md-4"><label>Mercados</label><select class="form-control select2" name="MERCADOS[]" multiple>
                                <?php foreach($ARRAYMERCADO as $r){ echo '<option value="'.$r['ID_MERCADO'].'">'.$r['NOMBRE_MERCADO'].'</option>'; } ?>
                            </select></div>
                            <div class="col-md-4"><label>Productor</label><select class="form-control select2" name="PRODUCTORES[]" multiple>
                                <?php foreach($ARRAYPRODUCTOR as $r){ echo '<option value="'.$r['ID_PRODUCTOR'].'">'.$r['CSG_PRODUCTOR'].' : '.$r['NOMBRE_PRODUCTOR'].'</option>'; } ?>
                            </select></div>
                            <div class="col-md-4"><label>Variedad por productor</label><select class="form-control select2" name="VARIEDADES[]" multiple>
                                <?php foreach($ARRAYVESPECIES as $r){ echo '<option value="'.$r['ID_VESPECIES'].'">'.$r['NOMBRE_VESPECIES'].'</option>'; } ?>
                            </select></div>
                        </div><br>
                        <div class="row">
                            <div class="col-md-6"><label>Estándar</label><select class="form-control select2" name="ESTANDARES[]" multiple>
                                <?php foreach($ARRAYESTANDAR as $r){ echo '<option value="'.$r['ID_ESTANDAR'].'">'.$r['CODIGO_ESTANDAR'].' : '.$r['NOMBRE_ESTANDAR'].'</option>'; } ?>
                            </select></div>
                            <div class="col-md-6"><label>Observación</label><textarea class="form-control" name="OBSERVACION_OPROCESO"></textarea></div>
                        </div><br>
                        <button class="btn btn-primary" name="CREAR" value="CREAR">Guardar OP</button>
                    </form>
                </div>
            </div>
            <div class="box">
                <div class="box-header with-border"><h4 class="box-title">OP Registradas</h4></div>
                <div class="box-body table-responsive">
                    <table class="table table-bordered">
                        <thead><tr><th>ID</th><th>Número</th><th>Cajas</th><th>Fecha termino</th><th>Ingreso</th></tr></thead>
                        <tbody>
                        <?php foreach($ARRAYOP as $r){ echo '<tr><td>'.$r['ID_OPROCESO'].'</td><td>'.$r['NUMERO_OPROCESO'].'</td><td>'.$r['CANTIDAD_CAJA'].'</td><td>'.$r['FECHA_TERMINO_ESTIMADA'].'</td><td>'.$r['INGRESO'].'</td></tr>'; } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
    <?php include_once "../../assest/config/menuExtraExpo.php"; ?>
</div>
<?php include_once "../../assest/config/urlBase.php"; ?>
</body>
</html>
