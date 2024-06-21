<?php
session_start();
require_once("Conexion.php");

// Inicializar la sesión
$_SESSION["inicio"] = 'no';
$_SESSION["sin"] = 0;
$_SESSION["cont"] = 0;
$_SESSION["x"] = 0;
$_SESSION["id"] = 1; // Empezamos con el primer problema

?>

<html>
<head>
    <title>Sistema Experto para Diagnosticar Fallas en PCs</title>
    <link rel='stylesheet' href='estilo_Pag.css'>
</head>
<body>
<div class="Titulo" id="Titulo">
    <center><img src="Imagen/sml_slogan.png" alt="Logo"></center>
    <h1>Sistema Experto para Diagnosticar Fallas en PCs</h1>
</div>
<div class="Cont" id="Cont">
    <div class="menu">
        <a href="index.php">Inicio</a>
        <a href="listar.php">Listar Problemas</a>
    </div>
    <div class="Inicio">
        <center>
            <br><br>
            
            <p>Bienvenido al sistema experto. Haga clic en el botón de abajo para comenzar el diagnóstico de su PC o laptop.</p>
            <form action="sintomas.php" method="post">
                <input type="submit" name="comenzar" value="Comenzar Diagnóstico" class="uno"/>
            </form>
        </center>
    </div>
</div>
</body>
</html>
