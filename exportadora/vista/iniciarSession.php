<?php
require_once '../../api/vendor/autoload.php';
$detect = new Mobile_Detect;

// Cabeceras de seguridad
header('X-Frame-Options: DENY');
header('X-Content-Type-Options: nosniff');
header('X-XSS-Protection: 1; mode=block');

session_start();
if (isset($_SESSION["NOMBRE_USUARIO"])) {
    header('Location: iniciarSessionSeleccion.php');
    exit;
}

include_once '../../assest/controlador/USUARIO_ADO.php';
include_once '../../assest/controlador/PTUSUARIO_ADO.php';
include_once "../../assest/controlador/AUSUARIO_ADO.php";
include_once '../../assest/modelo/USUARIO.php';

$USUARIO_ADO = new USUARIO_ADO();
$PTUSUARIO_ADO = new PTUSUARIO_ADO();
$AUSUARIO_ADO = new AUSUARIO_ADO;
$USUARIO = new USUARIO;

// Generar token CSRF si no existe
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// Helper para escapar salida
function h($string) {
    return htmlspecialchars($string ?? '', ENT_QUOTES, 'UTF-8');
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Acceso Intranet - Volcan Foods</title>
  <link rel="icon" href="../../assest/img/favicon.png">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="../../assest/js/sweetalert2@11.js"></script>
  <style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:'Inter',sans-serif}
    body,html{height:100%}
    .container{display:flex;min-height:100vh}
    .left-panel{flex:1;max-width:420px;background:#fff;padding:40px;display:flex;flex-direction:column;justify-content:center}
    .logo{text-align:center;margin-bottom:30px}
    .logo img{max-width:200px}
    .logo p{margin-top:8px;color:#555;font-size:14px}
    h2{text-align:center;margin-bottom:20px;color:#1a2b4c;font-weight:700}
    .card{border:1px solid #e0e6ef;border-radius:12px;padding:20px;margin-bottom:20px;box-shadow:0 2px 6px rgba(0,0,0,0.05)}
    .card h3{font-size:16px;margin-bottom:15px;color:#1a2b4c}
    .form-input{width:100%;padding:14px;border:1px solid #ccd4e0;border-radius:8px;margin-bottom:15px;font-size:14px}
    .btn{width:100%;padding:14px;border:none;border-radius:8px;font-weight:600;cursor:pointer}
    .btn-login{background:#28a745;color:#fff}
    .btn-login:hover{background:#218838}
    .btn-link{display:block;text-align:center;color:#1a2b4c;text-decoration:none;padding:12px;border:1px solid #ccd4e0;border-radius:8px;margin-top:10px}
    .economics{margin-top:20px}
    .economics h4{font-size:14px;margin-bottom:12px;color:#1a2b4c}
    .eco-list{display:flex;gap:20px}
    .eco-item{font-size:14px;color:#1a2b4c}
    .eco-item span{display:block;color:#c62828;font-weight:700;margin-top:4px}
    .eco-date{text-align:center;font-size:12px;color:#666;margin-top:10px}
    .right-panel{flex:2;position:relative;overflow:hidden}
    .slide{position:absolute;top:0;left:0;width:100%;height:100%;background-size:cover;background-position:center;opacity:0;transition:opacity 1.5s}
    .slide.active{opacity:1}
    .ssl-legend {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-top: 15px;
      color: #2e7d32;
      font-weight: 600;
      font-size: 14px;
    }
    .ssl-legend .material-icons {
      margin-right: 6px;
      font-size: 20px;
    }
    @media(max-width:768px){
       .container{flex-direction:column}
       .left-panel{max-width:none;width:100%}
       .right-panel{min-height:300px}
    }
  </style>
</head>
<body class="sistemRR">
  <div class="container">
    <div class="left-panel">
      <div class="logo">
        <img src="../../assest/img/volcan-foods-logo-original.png" alt="Volcan Foods">
        <p>www.volcanfoods.cl</p>
      </div>
      <h2>SELECCIÓN INTRANET</h2>
      <div class="card">
        <h3>Acceso Interno</h3>
        <form method="post" id="loginForm">
          <input type="hidden" name="csrf_token" value="<?= h($_SESSION['csrf_token']) ?>" />
          <input type="text" class="form-input" placeholder="Usuario" name="NOMBRE" required>
          <input type="password" class="form-input" placeholder="Contraseña (mín. 6 caracteres)" name="CONTRASENA" minlength="6" required>
          <div style="display:flex; align-items:center; gap:8px; font-size:12px; color:#333; margin-bottom:10px;">
            <input type="checkbox" id="PRECARGA_EXPORTACION_EXPORTADORA" style="margin-top:0;">
            <label for="PRECARGA_EXPORTACION_EXPORTADORA" style="margin-bottom:0;">Cargar información pesada en segundo plano</label>
          </div>
          <div class="ssl-legend">
            <span class="material-icons">lock</span>
            Conexión segura por SSL
          </div>
          <button type="submit" name="ENTRAR" class="btn btn-login" style="margin-top:20px">Entrar</button>
        </form>
      </div>
      <a href="/smartberry/estadistica/vista/iniciarSession.php" class="btn-link">Portal Productores</a>
      <div class="economics card">
        <h4>Indicadores Económicos</h4>
        <div class="eco-list">
          <div class="eco-item">UF <span id="uf">...</span></div>
          <div class="eco-item">Dólar <span id="dolar">...</span></div>
          <div class="eco-item">Euro <span id="euro">...</span></div>
        </div>
        <div class="eco-date" id="fechaIndicadores">Cargando...</div>
      </div>
    </div>
    <div class="right-panel">
      <div class="slide active" style="background-image:url('../../assest/img/abeja.jpg')"></div>
      <div class="slide" style="background-image:url('../../assest/img/arandano.jpg')"></div>
      <div class="slide" style="background-image:url('../../assest/img/esparragos.jpg')"></div>
    </div>
  </div>

  <script>
    const slides=document.querySelectorAll('.slide');let idx=0;
    setInterval(()=>{slides[idx].classList.remove('active');idx=(idx+1)%slides.length;slides[idx].classList.add('active');},5000);

    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
      loginForm.addEventListener('submit', () => {
        const precarga = document.getElementById('PRECARGA_EXPORTACION_EXPORTADORA')?.checked;
        if (precarga) {
          localStorage.setItem('prefetch_despachoex_exportacion', '1');
        } else {
          localStorage.removeItem('prefetch_despachoex_exportacion');
        }
      });
    }

    async function cargarIndicadores() {
      try {
        const resp = await fetch("https://mindicador.cl/api");
        const data = await resp.json();
        document.getElementById("uf").innerText = "$" + new Intl.NumberFormat("es-CL", { maximumFractionDigits: 1 }).format(data.uf.valor);
        document.getElementById("dolar").innerText = "$" + new Intl.NumberFormat("es-CL", { maximumFractionDigits: 1 }).format(data.dolar.valor);
        document.getElementById("euro").innerText = "$" + new Intl.NumberFormat("es-CL", { maximumFractionDigits: 1 }).format(data.euro.valor);
        document.getElementById("fechaIndicadores").innerText = "Actualizado: " + new Date(data.fecha).toLocaleDateString("es-CL");
      } catch (e) {
        document.getElementById("uf").innerText = "N/D";
        document.getElementById("dolar").innerText = "N/D";
        document.getElementById("euro").innerText = "N/D";
        document.getElementById("fechaIndicadores").innerText = "Sin conexión";
      }
    }
    cargarIndicadores();
    setInterval(cargarIndicadores, 60000);
  </script>

<?php
// ==== LÓGICA LOGIN ====
if (isset($_POST['ENTRAR'])) {

    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        echo '<script>Swal.fire({ icon:"error", title:"Error de seguridad", text:"Token CSRF inválido. Recarga la página." });</script>';
        exit;
    }

    $NOMBRE = trim($_POST['NOMBRE'] ?? '');
    $CONTRASENA = $_POST['CONTRASENA'] ?? '';

    if ($NOMBRE === '' || $CONTRASENA === '') {
        echo '<script>Swal.fire({ icon:"warning", title:"Alerta", text:"Debes ingresar usuario y contraseña" });</script>';
        exit;
    }

    if (mb_strlen($CONTRASENA) < 6) {
        echo '<script>Swal.fire({ icon:"warning", title:"Contraseña inválida", text:"Debe tener al menos 6 caracteres." });</script>';
        exit;
    }

    $ARRAYINICIOSESSION = $USUARIO_ADO->iniciarSession($NOMBRE, $CONTRASENA);
    if (!$ARRAYINICIOSESSION) {
        echo '<script>Swal.fire({ icon:"error", title:"Error", text:"Usuario o contraseña incorrectos" });</script>';
        exit;
    }

    $_SESSION["ID_USUARIO"] = $ARRAYINICIOSESSION[0]['ID_USUARIO'];
    $_SESSION["NOMBRE_USUARIO"] = $ARRAYINICIOSESSION[0]['NOMBRE_USUARIO'];
    $_SESSION["TIPO_USUARIO"] = $ARRAYINICIOSESSION[0]['ID_TUSUARIO'];
    session_regenerate_id(true);

    echo '<script>
      Swal.fire({
        icon:"success",
        title:"Éxito",
        text:"Inicio de sesión correcto",
        timer:2000,
        timerProgressBar:true,
        showConfirmButton:false,
        willClose:()=>{ window.location.href="iniciarSessionSeleccion.php"; }
      });
    </script>';
    exit;
}
?>
</body>
</html>
