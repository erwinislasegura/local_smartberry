<?php
$rootPath = __DIR__ . "/../../";
include_once $rootPath . "assest/config/validarUsuarioOpera.php";

//LLAMADA ARCHIVOS NECESARIOS PARA LAS OPERACIONES
include_once $rootPath . "assest/controlador/CONSULTA_ADO.php";
include_once $rootPath . "assest/controlador/EMPRESAPRODUCTOR_ADO.php";
include_once $rootPath . "assest/controlador/RECEPCIONMP_ADO.php";
include_once $rootPath . "assest/controlador/DRECEPCIONMP_ADO.php";
include_once $rootPath . "assest/controlador/VESPECIES_ADO.php";


//INICIALIZAR CONTROLADOR
$CONSULTA_ADO =  NEW CONSULTA_ADO;
$EMPRESAPRODUCTOR_ADO = new EMPRESAPRODUCTOR_ADO();
$RECEPCIONMP_ADO = new RECEPCIONMP_ADO();
$DRECEPCIONMP_ADO = new DRECEPCIONMP_ADO();
$VESPECIES_ADO = new VESPECIES_ADO();
//INCIALIZAR VARIBALES A OCUPAR PARA LA FUNCIONALIDAD


//INICIALIZAR ARREGLOS
$ARRAYLISTAREMPRESA="";
$ARRAYLISTARPLANTA="";

//DEFINIR ARREGLOS CON LOS DATOS OBTENIDOS DE LAS FUNCIONES DE LOS CONTROLADORES
$ARRAYLISTAREMPRESA=$EMPRESA_ADO->listarEmpresaCBX();
$ARRAYLISTARPLANTA=$PLANTA_ADO->listarPlantaPropiaCBX();

$ARRAYEXISTENCIAMP=$CONSULTA_ADO->existenciaDisponibleMpEst($TEMPORADAS, $ESPECIE);
$TOTALEXISTENCIAMP=isset($ARRAYEXISTENCIAMP[0]["NETO"]) ? $ARRAYEXISTENCIAMP[0]["NETO"] : 0;



$ARRAYRECEPCIONMP=$CONSULTA_ADO->acumuladoRecepcionMpEst($TEMPORADAS, $ESPECIE);
$ARRAYRECEPCIONBULKMP=$CONSULTA_ADO->acumuladoRecepcionMpBulkEst($TEMPORADAS, $ESPECIE);
$TOTALRECECPCIOANDO=isset($ARRAYRECEPCIONMP[0]["NETO"]) ? $ARRAYRECEPCIONMP[0]["NETO"] : 0;
$TOTALRECECPCIOANDOBULK=isset($ARRAYRECEPCIONBULKMP[0]["NETO"]) ? $ARRAYRECEPCIONBULKMP[0]["NETO"] : 0;
$TOTALRECEPCIONGENERAL=(float)$TOTALRECECPCIOANDO + (float)$TOTALRECECPCIOANDOBULK;




$ARRAYPROCESADOMP=$CONSULTA_ADO->acumuladoProcesadoMpEst($TEMPORADAS, $ESPECIE);
$TOTALPROCESADO=isset($ARRAYPROCESADOMP[0]["NETO"]) ? $ARRAYPROCESADOMP[0]["NETO"] : 0;

$TOTALMPNETO = 0;
$TOTALMPBRUTO = 0;
$TOTALMPENVASE = 0;
$TOTALRECEPCIONES = 0;
$TOTALGUIAS = 0;
$ULTIMAFECHARECEPCION = "";
$NETOPORSEMANA = [];
$NETOPORVARIEDAD = [];

$ARRAYEMPRESAPRODUCTOR = $EMPRESAPRODUCTOR_ADO->buscarEmpresaProductorPorUsuarioCBX($IDUSUARIOS);
if ($ARRAYEMPRESAPRODUCTOR) {
    foreach ($ARRAYEMPRESAPRODUCTOR as $a) {
        $ARRAYRECEPCIONMP = $RECEPCIONMP_ADO->listarRecepcionEmpresaPlantaTemporadaCBXProductorEstadisticas(
            $a["ID_EMPRESA"],
            $a["ID_PRODUCTOR"],
            $TEMPORADAS,
            $ESPECIE
        );
        foreach ($ARRAYRECEPCIONMP as $r) {
            $TOTALRECEPCIONES++;
            $NETORECEPCION = 0;
            if (!empty($r['NUMERO_GUIA_RECEPCION'])) {
                $TOTALGUIAS++;
            }
            if (!empty($r['FECHA']) && $r['FECHA'] > $ULTIMAFECHARECEPCION) {
                $ULTIMAFECHARECEPCION = $r['FECHA'];
            }
            $ARRAYTOMADO = $DRECEPCIONMP_ADO->buscarPorRecepcion($r['ID_RECEPCION']);
            foreach ($ARRAYTOMADO as $s) {
                $ARRAYVERVESPECIESID = $VESPECIES_ADO->verVespecies($s['ID_VESPECIES']);
                if ($ARRAYVERVESPECIESID && $ARRAYVERVESPECIESID[0]['ID_ESPECIES'] != $_SESSION["ID_ESPECIE"]) {
                    continue;
                }
                $TOTALMPENVASE += (float)$s['ENVASE'];
                $TOTALMPNETO += (float)$s['NETO'];
                $TOTALMPBRUTO += (float)$s['BRUTO'];
                $NETORECEPCION += (float)$s['NETO'];

                $semana = $r['SEMANA'] ?: "Sin semana";
                $NETOPORSEMANA[$semana] = ($NETOPORSEMANA[$semana] ?? 0) + (float)$s['NETO'];

                if ($ARRAYVERVESPECIESID) {
                    $NOMBREVARIEDAD = $ARRAYVERVESPECIESID[0]['NOMBRE_VESPECIES'];
                } else {
                    $NOMBREVARIEDAD = "Sin Datos";
                }
                $NETOPORVARIEDAD[$NOMBREVARIEDAD] = ($NETOPORVARIEDAD[$NOMBREVARIEDAD] ?? 0) + (float)$s['NETO'];
            }

        }
    }
}

$SEMANAS = array_keys($NETOPORSEMANA);
$SEMANASNUM = array_filter($SEMANAS, static function ($value) {
    return is_numeric($value);
});
$SEMANASNOMBRES = array_diff($SEMANAS, $SEMANASNUM);
sort($SEMANASNUM, SORT_NUMERIC);
$SEMANAS = array_merge($SEMANASNUM, $SEMANASNOMBRES);
$SEMANASVALORES = [];
foreach ($SEMANAS as $semana) {
    $SEMANASVALORES[] = $NETOPORSEMANA[$semana];
}

arsort($NETOPORVARIEDAD);
$VARIEDADES = array_slice(array_keys($NETOPORVARIEDAD), 0, 6);
$VARIEDADESVALORES = [];
foreach ($VARIEDADES as $variedad) {
    $VARIEDADESVALORES[] = $NETOPORVARIEDAD[$variedad];
}


?>


<!DOCTYPE html>
<html lang="es">

<head>
    <title>INICIO</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="author" content="">
    <!- LLAMADA DE LOS ARCHIVOS NECESARIOS PARA DISEÑO Y FUNCIONES BASE DE LA VISTA -!>
        <?php include_once $rootPath . "assest/config/urlHead.php"; ?>
        <!- FUNCIONES BASES -!>
        <script type="text/javascript">
            //REDIRECCIONAR A LA PAGINA SELECIONADA
            function irPagina(url) {
                location.href = "" + url;
            }
            //FUNCION PARA OBTENER HORA Y FECHA
        
        </script>
</head>
<body class="hold-transition light-skin fixed sidebar-mini theme-primary" >
    <div class="wrapper">
        <!- LLAMADA AL MENU PRINCIPAL DE LA PAGINA-!>
            <?php include_once $rootPath . "assest/config/menuOpera.php"; ?>
            <div class="content-wrapper">
                <div class="container-full">                   
                    <section class="content">
                        <div class="row">      
                            <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 col-xs-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="box-title">Dashboard Materia Prima</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-primary-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Kilos netos</h6>
                                                                <h3 class="mb-0"><?php echo $TOTALMPNETO; ?></h3>
                                                            </div>
                                                            <span class="ti-import font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Recepción total | <?php echo $TOTALRECEPCIONES; ?> recepciones</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-success-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Kilos brutos</h6>
                                                                <h3 class="mb-0"><?php echo $TOTALMPBRUTO; ?></h3>
                                                            </div>
                                                            <span class="ti-package font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Promedio <?php echo $TOTALRECEPCIONES ? round($TOTALMPBRUTO / $TOTALRECEPCIONES, 2) : 0; ?> kg/rec</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-info-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Envases</h6>
                                                                <h3 class="mb-0"><?php echo $TOTALMPENVASE; ?></h3>
                                                            </div>
                                                            <span class="ti-layers font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Promedio <?php echo $TOTALRECEPCIONES ? round($TOTALMPENVASE / $TOTALRECEPCIONES, 2) : 0; ?> env/rec</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-warning-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Recepciones</h6>
                                                                <h3 class="mb-0"><?php echo $TOTALRECEPCIONES; ?></h3>
                                                            </div>
                                                            <span class="ti-settings font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Guías: <?php echo $TOTALGUIAS; ?> | Especie <?php echo $ESPECIE; ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-danger-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Última recepción</h6>
                                                                <h3 class="mb-0"><?php echo $ULTIMAFECHARECEPCION ?: "Sin datos"; ?></h3>
                                                            </div>
                                                            <span class="ti-archive font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Última fecha registrada</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                                <div class="box bg-secondary-light">
                                                    <div class="box-body">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <h6 class="mb-0">Existencia MP</h6>
                                                                <h3 class="mb-0"><?php echo $TOTALEXISTENCIAMP; ?></h3>
                                                            </div>
                                                            <span class="ti-archive font-size-28"></span>
                                                        </div>
                                                        <p class="mb-0 mt-5 text-muted">Stock disponible</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-20">
                                            <div class="col-xxl-6 col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="box">
                                                    <div class="box-header">
                                                        <h4 class="box-title">Recepción neta por semana</h4>
                                                    </div>
                                                    <div class="box-body">
                                                        <div id="chart-neto-semana" style="height: 280px;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-6 col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="box">
                                                    <div class="box-header">
                                                        <h4 class="box-title">Top variedades (kilos netos)</h4>
                                                    </div>
                                                    <div class="box-body">
                                                        <div id="chart-neto-variedad" style="height: 280px;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if($PESTARVSP=="1"){ ?>               
                                <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 col-xs-12">				
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="box-title">Recepcion VS Proceso</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">                                            
                                                <table class="table  table-hover" style="width: 100%;" id="resumen">        
                                                    <thead>             
                                                        <tr>
                                                            <th>Empresa/Planta</th>                           
                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>                                
                                                                <th  class="right"> <?php echo $s["NOMBRE_PLANTA"];?> <br> Recepcion   </th>                                   
                                                                <th  class="left"> <?php echo $s["NOMBRE_PLANTA"];?> <br> Proceso  </th>                                                       
                                                            <?php endforeach; ?>
                                                            <th class="right">Total <br> Recepción</th>  
                                                            <th class="left">Total <br> Procesado</th>                                                          
                                                        </tr>   
                                                    </thead>
                                                    <tbody>                                                    
                                                    <?php foreach ($ARRAYLISTAREMPRESA as $r) : ?>
                                                        <?php $ARRAYRECEPCIONMPEMPRESA=$CONSULTA_ADO->acumuladoRecepcionMpPorEmpresa($r["ID_EMPRESA"],$TEMPORADAS)?>
                                                        <?php $ARRAYPROCESADOMPEMPRESA=$CONSULTA_ADO->acumuladoProcesadoMpPorEmpresa($r["ID_EMPRESA"],$TEMPORADAS)?>
                                                            <tr >
                                                            <th> <?php echo $r["NOMBRE_EMPRESA"];?> </th>                    
                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>     
                                                                <?php $ARRAYRECEPCIONMPEMPRESAPLANTA=$CONSULTA_ADO->acumuladoRecepcionMpPorEmpresaPlanta($r["ID_EMPRESA"],$s["ID_PLANTA"],$TEMPORADAS)?>  
                                                                <?php $ARRAYPROCESADOMPEMPRESAPLANTA=$CONSULTA_ADO->acumuladoProcesadoMpPorEmpresaPlanta($r["ID_EMPRESA"],$s["ID_PLANTA"],$TEMPORADAS)?>  
                                                                <td class="right"><?php echo $ARRAYRECEPCIONMPEMPRESAPLANTA[0]["NETO"]; ?></td>
                                                                <td class="left"><?php echo $ARRAYPROCESADOMPEMPRESAPLANTA[0]["NETO"]; ?></td>                                                                                                                        
                                                            <?php endforeach; ?>    
                                                            <td class="right"><?php echo $ARRAYRECEPCIONMPEMPRESA[0]["NETO"]; ?></td>
                                                            <td class="left"><?php echo $ARRAYPROCESADOMPEMPRESA[0]["NETO"]; ?></td>
                                                        </tr>    
                                                    <?php endforeach; ?>       
                                                    </tbody>
                                                    <tfoot>                                                                                                         
                                                        <tr>
                                                            <th>Sub Total</th>                           
                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>    
                                                                <?php $ARRAYRECEPCIONMPPLANTA=$CONSULTA_ADO->acumuladoRecepcionMpPorPlanta($s["ID_PLANTA"],$TEMPORADAS)?>        
                                                                <?php $ARRAYPROCESADOMPPLANTA=$CONSULTA_ADO->acumuladoProcesadoMpPorPlanta($s["ID_PLANTA"],$TEMPORADAS)?>      
                                                                <td class="right"><?php echo $ARRAYRECEPCIONMPPLANTA[0]["NETO"]; ?></td>    
                                                                <td class="left"><?php echo $ARRAYPROCESADOMPPLANTA[0]["NETO"]; ?></td>
                                                            <?php endforeach; ?>  
                                                            <td class="right"><?php echo $TOTALRECECPCIOANDO;?> </td>
                                                            <td class="left"><?php echo $TOTALPROCESADO;?> </td>                                                                                                                  
                                                        </tr>  
                                                    </tfoot>
                                                </table> 
                                            </div>                            
                                        </div>
                                    </div>
                                </div>    
                            <?php  } ?>                        
                            <?php if($PESTASTOPMP=="1"){ ?>        
                                <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 col-xs-12">				
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="box-title">Existencia MP</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">                           
                                                <table class="table  table-hover" style="width: 100%;"  id="stockmp">        
                                                    <thead>                                        
                                                        <tr>
                                                            <th>Empresa/Planta</th>                           
                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>                                
                                                                <th> <?php echo $s["NOMBRE_PLANTA"];?> </th>                                                        
                                                            <?php endforeach; ?>
                                                            <th>Total</th>    
                                                        </tr>
                                                    </thead>
                                                        <tbody>
                                                            <?php foreach ($ARRAYLISTAREMPRESA as $r) : ?>
                                                                <?php $ARRAYEXISTENCIAMPEMPRESA=$CONSULTA_ADO->existenciaDisponibleMpPorEmpresa($r["ID_EMPRESA"],$TEMPORADAS);?>    
                                                                        <tr >
                                                                            <th> <?php echo $r["NOMBRE_EMPRESA"];?> </th>                    
                                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>    
                                                                                <?php $ARRAYEXISTENCIAMPEMPRESAPLANTA=$CONSULTA_ADO->existenciaDisponibleMpPorEmpresaPlanta($r["ID_EMPRESA"],$s["ID_PLANTA"],$TEMPORADAS);?>       
                                                                                <td><?php echo $ARRAYEXISTENCIAMPEMPRESAPLANTA[0]["NETO"]; ?></td>                                              
                                                                            <?php endforeach; ?>    
                                                                            <td><?php echo $ARRAYEXISTENCIAMPEMPRESA[0]["NETO"]; ?></td>                                                                                                    
                                                                        </tr>      
                                                            <?php endforeach; ?>                                                                                                 
                                                        </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Total</th>
                                                            <?php foreach ($ARRAYLISTARPLANTA as $s) : ?>  
                                                                <?php $ARRAYEXISTENCIAMPEMPRESAPLANTA=$CONSULTA_ADO->existenciaDisponibleMpPorPlanta($s["ID_PLANTA"],$TEMPORADAS);?> 
                                                                <td><?php echo $ARRAYEXISTENCIAMPEMPRESAPLANTA[0]["NETO"]; ?></td>                                                                                                         
                                                            <?php endforeach; ?>
                                                            <td><?php echo $TOTALEXISTENCIAMP;?> </td>
                                                        </tr>
                                                    </tfoot>
                                                </table> 
                                            </div>                            
                                        </div>
                                    </div>
                                </div> 
                            <?php  } ?> 

                        </div>
                    </section>             
                </div>
            </div>    
            <!- LLAMADA ARCHIVO DEL DISEÑO DEL FOOTER Y MENU USUARIO -!>
            <?php include_once $rootPath . "assest/config/footer.php"; ?>
            <?php include_once $rootPath . "assest/config/menuExtraOpera.php"; ?>
    </div>
    <!- LLAMADA URL DE ARCHIVOS DE DISEÑO Y JQUERY E OTROS -!>
        <?php include_once $rootPath . "assest/config/urlBase.php"; ?>
        <script type="text/javascript">
            const weekCategories = <?php echo json_encode($SEMANAS); ?>;
            const weekValues = <?php echo json_encode($SEMANASVALORES); ?>;
            const varietyLabels = <?php echo json_encode($VARIEDADES); ?>;
            const varietyValues = <?php echo json_encode($VARIEDADESVALORES); ?>;
            if (weekCategories.length) {
                c3.generate({
                    bindto: '#chart-neto-semana',
                    data: {
                        columns: [['Kilos netos', ...weekValues]],
                        type: 'bar'
                    },
                    axis: {
                        x: {
                            type: 'category',
                            categories: weekCategories,
                            label: { text: 'Semana', position: 'outer-center' }
                        },
                        y: {
                            label: { text: 'Kilos netos', position: 'outer-middle' }
                        }
                    },
                    color: { pattern: ['#4caf50'] },
                    bar: {
                        width: { ratio: 0.6 }
                    }
                });
            } else {
                document.getElementById('chart-neto-semana').innerHTML = 'Sin datos';
            }

            if (varietyLabels.length) {
                c3.generate({
                    bindto: '#chart-neto-variedad',
                    data: {
                        columns: [['Kilos netos', ...varietyValues]],
                        type: 'bar'
                    },
                    axis: {
                        x: {
                            type: 'category',
                            categories: varietyLabels,
                            label: { text: 'Variedad', position: 'outer-center' }
                        },
                        y: {
                            label: { text: 'Kilos netos', position: 'outer-middle' }
                        }
                    },
                    color: { pattern: ['#2196f3'] },
                    bar: {
                        width: { ratio: 0.6 }
                    }
                });
            } else {
                document.getElementById('chart-neto-variedad').innerHTML = 'Sin datos';
            }
        </script>
</body>
</html>
