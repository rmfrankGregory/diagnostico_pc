<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "baseconocimiento_pc1";

$con = mysqli_connect($host, $user, $pass, $db);

if (mysqli_connect_errno()) {
    die("Error al conectar a la base de datos: " . mysqli_connect_error());
}
?>
