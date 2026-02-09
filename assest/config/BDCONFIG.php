<?php
class BDCONFIG {

    private $HOST;
    private $USER;
    private $PASS;
    private $DBNAME;

    public function __construct()
    {
        $this->HOST = "localhost";
        $this->USER = "root";
        $this->PASS = "";
        $this->DBNAME = "smartberry";

    }

    public function __GET($k) {
        return $this->$k;
    }

    public function __SET($k, $v) {
        $this->$k = $v;
    }

    public function conectar() {
        $hosts = ['127.0.0.1', 'localhost', $this->HOST];
        $lastError = null;

        foreach ($hosts as $host) {
            try {
                $link = new PDO(
                    "mysql:host={$host};dbname={$this->DBNAME};charset=utf8",
                    $this->USER,
                    $this->PASS,
                    [PDO::ATTR_TIMEOUT => 5]
                );
                $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $link;
            } catch (PDOException $e) {
                $lastError = $e->getMessage();
            }
        }
    }
}