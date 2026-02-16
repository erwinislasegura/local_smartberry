<?php
class REXPORTACIONMERCADO
{
    private $ID_REEXPORTACIONMERCADO;
    private $NUMERO_REEXPORTACIONMERCADO;
    private $ID_ESTANDAR;
    private $ID_MERCADO;
    private $ID_EMPRESA;
    private $ESTADO_REGISTRO;
    private $INGRESO;
    private $MODIFICACION;
    private $ID_USUARIOI;
    private $ID_USUARIOM;

    public function __GET($k)
    {
        return $this->$k;
    }

    public function __SET($k, $v)
    {
        return $this->$k = $v;
    }
}
?>
