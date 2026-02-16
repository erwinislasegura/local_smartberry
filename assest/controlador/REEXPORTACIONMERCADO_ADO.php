<?php
include_once '../../assest/modelo/REEXPORTACIONMERCADO.php';
include_once '../../assest/config/BDCONFIG.php';

$HOST = "";
$DBNAME = "";
$USER = "";
$PASS = "";

class REXPORTACIONMERCADO_ADO
{
    private $conexion;

    public function __CONSTRUCT()
    {
        try {
            $BDCONFIG = new BDCONFIG();
            $HOST = $BDCONFIG->__GET('HOST');
            $DBNAME = $BDCONFIG->__GET('DBNAME');
            $USER = $BDCONFIG->__GET('USER');
            $PASS = $BDCONFIG->__GET('PASS');

            $this->conexion = new PDO('mysql:host=' . $HOST . ';dbname=' . $DBNAME, $USER, $PASS);
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function buscarPorEstandar($IDESTANDAR)
    {
        try {
            $datos = $this->conexion->prepare("SELECT * FROM estandar_rexportacion_mercado WHERE ID_ESTANDAR = ? AND ESTADO_REGISTRO = 1;");
            $datos->execute(array($IDESTANDAR));
            $resultado = $datos->fetchAll();
            $datos = null;
            return $resultado;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function eliminarPorEstandar($IDESTANDAR)
    {
        try {
            $query = "DELETE FROM estandar_rexportacion_mercado WHERE ID_ESTANDAR = ?;";
            $this->conexion->prepare($query)->execute(array($IDESTANDAR));
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function guardarMercadosPorEstandar($IDEMPRESA, $IDESTANDAR, $ARRAYMERCADO, $IDUSUARIO)
    {
        try {
            $IDEMPRESA = (int)$IDEMPRESA;
            $IDESTANDAR = (int)$IDESTANDAR;
            $IDUSUARIO = (int)$IDUSUARIO;

            $ARRAYMERCADO = array_unique(array_filter(array_map('intval', (array)$ARRAYMERCADO)));

            $this->eliminarPorEstandar($IDESTANDAR);

            if (!is_array($ARRAYMERCADO) || count($ARRAYMERCADO) == 0) {
                return;
            }

            $datos = $this->conexion->prepare("SELECT IFNULL(MAX(NUMERO_REEXPORTACIONMERCADO),0) AS NUMERO FROM estandar_rexportacion_mercado WHERE ID_EMPRESA = ?;");
            $datos->execute(array($IDEMPRESA));
            $resultado = $datos->fetchAll();
            $datos = null;

            $contador = (int)$resultado[0]['NUMERO'] + 1;

            $query = "INSERT INTO estandar_rexportacion_mercado (
                                            NUMERO_REEXPORTACIONMERCADO,
                                            ID_ESTANDAR,
                                            ID_MERCADO,
                                            ID_EMPRESA,
                                            ID_USUARIOI,
                                            ID_USUARIOM,
                                            INGRESO,
                                            MODIFICACION,
                                            ESTADO_REGISTRO
                                        ) VALUES (?, ?, ?, ?, ?, ?, SYSDATE(), SYSDATE(), 1);";

            foreach ($ARRAYMERCADO as $IDMERCADO) {
                if ($IDMERCADO <= 0) {
                    continue;
                }

                $this->conexion->prepare($query)
                    ->execute(array(
                        $contador,
                        $IDESTANDAR,
                        $IDMERCADO,
                        $IDEMPRESA,
                        $IDUSUARIO,
                        $IDUSUARIO
                    ));
                $contador++;
            }
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
}
