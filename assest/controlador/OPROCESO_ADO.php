<?php
include_once '../../assest/modelo/OPROCESO.php';
include_once '../../assest/config/BDCONFIG.php';

class OPROCESO_ADO {
    private $conexion;

    public function __CONSTRUCT() {
        try {
            $BDCONFIG = new BDCONFIG();
            $this->conexion = new PDO(
                'mysql:host=' . $BDCONFIG->__GET('HOST') . ';dbname=' . $BDCONFIG->__GET('DBNAME'),
                $BDCONFIG->__GET('USER'),
                $BDCONFIG->__GET('PASS')
            );
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function listarOrdenProcesoPorEmpresa($IDEMPRESA) {
        $sql = "SELECT * FROM exportadora_oproceso WHERE ID_EMPRESA = ? AND ESTADO_REGISTRO = 1 ORDER BY ID_OPROCESO DESC";
        $stmt = $this->conexion->prepare($sql);
        $stmt->execute(array($IDEMPRESA));
        return $stmt->fetchAll();
    }

    public function listarOrdenProcesoCBX($IDEMPRESA) {
        $sql = "SELECT ID_OPROCESO, NUMERO_OPROCESO FROM exportadora_oproceso WHERE ID_EMPRESA = ? AND ESTADO_REGISTRO = 1 ORDER BY ID_OPROCESO DESC";
        $stmt = $this->conexion->prepare($sql);
        $stmt->execute(array($IDEMPRESA));
        return $stmt->fetchAll();
    }

    public function verOrdenProceso($ID) {
        $stmt = $this->conexion->prepare("SELECT * FROM exportadora_oproceso WHERE ID_OPROCESO = ?");
        $stmt->execute(array($ID));
        return $stmt->fetchAll();
    }

    public function agregarOrdenProceso(OPROCESO $OPROCESO) {
        $sql = "INSERT INTO exportadora_oproceso (
                    NUMERO_OPROCESO, FECHA_TERMINO_ESTIMADA, CANTIDAD_CAJA, OBSERVACION_OPROCESO,
                    ID_EMPRESA, ID_USUARIOI, ID_USUARIOM, INGRESO, MODIFICACION, ESTADO_REGISTRO
                ) VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE(), SYSDATE(), 1)";
        $this->conexion->prepare($sql)->execute(array(
            $OPROCESO->__GET('NUMERO_OPROCESO'),
            $OPROCESO->__GET('FECHA_TERMINO_ESTIMADA'),
            $OPROCESO->__GET('CANTIDAD_CAJA'),
            $OPROCESO->__GET('OBSERVACION_OPROCESO'),
            $OPROCESO->__GET('ID_EMPRESA'),
            $OPROCESO->__GET('ID_USUARIOI'),
            $OPROCESO->__GET('ID_USUARIOM')
        ));
        return $this->conexion->lastInsertId();
    }

    public function actualizarOrdenProceso(OPROCESO $OPROCESO) {
        $sql = "UPDATE exportadora_oproceso
                SET NUMERO_OPROCESO = ?,
                    FECHA_TERMINO_ESTIMADA = ?,
                    CANTIDAD_CAJA = ?,
                    OBSERVACION_OPROCESO = ?,
                    ID_USUARIOM = ?,
                    MODIFICACION = SYSDATE()
                WHERE ID_OPROCESO = ?";
        $this->conexion->prepare($sql)->execute(array(
            $OPROCESO->__GET('NUMERO_OPROCESO'),
            $OPROCESO->__GET('FECHA_TERMINO_ESTIMADA'),
            $OPROCESO->__GET('CANTIDAD_CAJA'),
            $OPROCESO->__GET('OBSERVACION_OPROCESO'),
            $OPROCESO->__GET('ID_USUARIOM'),
            $OPROCESO->__GET('ID_OPROCESO')
        ));
    }

    public function limpiarDetalleOrdenProceso($IDOP) {
        $this->conexion->prepare("DELETE FROM exportadora_oproceso_mercado WHERE ID_OPROCESO = ?")->execute(array($IDOP));
        $this->conexion->prepare("DELETE FROM exportadora_oproceso_productor_variedad WHERE ID_OPROCESO = ?")->execute(array($IDOP));
        $this->conexion->prepare("DELETE FROM exportadora_oproceso_estandar WHERE ID_OPROCESO = ?")->execute(array($IDOP));
    }

    public function agregarMercado($IDOP, $IDMERCADO) {
        $this->conexion->prepare("INSERT INTO exportadora_oproceso_mercado (ID_OPROCESO, ID_MERCADO) VALUES (?, ?)")->execute(array($IDOP, $IDMERCADO));
    }

    public function agregarProductorVariedad($IDOP, $IDPRODUCTOR, $IDVESPECIES) {
        $this->conexion->prepare("INSERT INTO exportadora_oproceso_productor_variedad (ID_OPROCESO, ID_PRODUCTOR, ID_VESPECIES) VALUES (?, ?, ?)")->execute(array($IDOP, $IDPRODUCTOR, $IDVESPECIES));
    }

    public function agregarEstandar($IDOP, $IDESTANDAR) {
        $this->conexion->prepare("INSERT INTO exportadora_oproceso_estandar (ID_OPROCESO, ID_ESTANDAR) VALUES (?, ?)")->execute(array($IDOP, $IDESTANDAR));
    }

    public function listarMercadosPorOp($IDOP) {
        $stmt = $this->conexion->prepare("SELECT ID_MERCADO FROM exportadora_oproceso_mercado WHERE ID_OPROCESO = ?");
        $stmt->execute(array($IDOP));
        return $stmt->fetchAll();
    }

    public function listarProductorVariedadPorOp($IDOP) {
        $stmt = $this->conexion->prepare("SELECT ID_PRODUCTOR, ID_VESPECIES FROM exportadora_oproceso_productor_variedad WHERE ID_OPROCESO = ?");
        $stmt->execute(array($IDOP));
        return $stmt->fetchAll();
    }

    public function listarEstandarPorOp($IDOP) {
        $stmt = $this->conexion->prepare("SELECT ID_ESTANDAR FROM exportadora_oproceso_estandar WHERE ID_OPROCESO = ?");
        $stmt->execute(array($IDOP));
        return $stmt->fetchAll();
    }

    public function contarProcesosAsociados($IDOP) {
        $stmt = $this->conexion->prepare("SELECT COUNT(*) AS TOTAL FROM fruta_proceso WHERE ID_OPROCESO = ?");
        $stmt->execute(array($IDOP));
        $r = $stmt->fetch();
        return $r ? (int)$r['TOTAL'] : 0;
    }

    public function deshabilitarOrdenProceso($IDOP, $IDUSUARIO) {
        $sql = "UPDATE exportadora_oproceso
                SET ESTADO_REGISTRO = 0,
                    ID_USUARIOM = ?,
                    MODIFICACION = SYSDATE()
                WHERE ID_OPROCESO = ?";
        $this->conexion->prepare($sql)->execute(array($IDUSUARIO, $IDOP));
    }
}
?>
