<?php
class OPROCESO {
    private $ID_OPROCESO;
    private $NUMERO_OPROCESO;
    private $FECHA_TERMINO_ESTIMADA;
    private $CANTIDAD_CAJA;
    private $OBSERVACION_OPROCESO;
    private $ESTADO_REGISTRO;
    private $ID_EMPRESA;
    private $ID_USUARIOI;
    private $ID_USUARIOM;

    public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}
?>
