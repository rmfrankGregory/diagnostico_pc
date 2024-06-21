<?php
session_start();
require_once("Conexion.php");

if (!isset($_SESSION["inicio"])) {
    $_SESSION["inicio"] = 'no';
    $_SESSION["sin"] = 0;
    $_SESSION["cont"] = 0;
    $_SESSION["x"] = 0;
    $_SESSION["id"] = 1; // Empezamos con el primer problema
}

if ($_SESSION["inicio"] == 'no') {
    $sql = "SELECT * FROM sintoma WHERE id_prob = '" . $_SESSION["id"] . "'";
    $result = mysqli_query($con, $sql);
    $sintomas = mysqli_fetch_all($result, MYSQLI_ASSOC);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['si'])) {
            $_SESSION["sin"]++;
        } elseif (isset($_POST['no'])) {
            $_SESSION["x"]++;
            if ($_SESSION["x"] > 1) {
                $_SESSION["id"]++;
                $_SESSION["sin"] = 0;
                $_SESSION["x"] = 0;
                header("Location: sintomas.php");
                exit;
            } else {
                $_SESSION["sin"]++;
            }
        }

        if ($_SESSION["sin"] < count($sintomas)) {
            header("Location: sintomas.php");
            exit;
        } else {
            $_SESSION["inicio"] = 'si';
            $_SESSION["sin"] = 0;
            $_SESSION["x"] = 0;
        }
    }
}

if ($_SESSION["inicio"] == 'si') {
    $sql = "SELECT * FROM problema WHERE id_prob = '" . $_SESSION["id"] . "'";
    $result = mysqli_query($con, $sql);
    $problema = mysqli_fetch_assoc($result);
    
    $sql = "SELECT * FROM solucion WHERE id_prob = '" . $_SESSION["id"] . "'";
    $result = mysqli_query($con, $sql);
    $soluciones = mysqli_fetch_all($result, MYSQLI_ASSOC);
}
?>

<html>
<head>
    <title>Sistema Experto para Diagnosticar Fallas en PCs</title>
    <link rel='stylesheet' href='estilo_Pag.css'>
</head>
<body>
<div class="Titulo" id="Titulo">
    <center><img src="Imagen/sml_slogan.png" alt="Logo"></center>
</div>
<div class="Cont" id="Cont">
    <div class="menu">
        <a href="index.php">Inicio</a>
        <a href="listar.php">Listar Problemas</a>
    </div>
    <div class="Sintomas">
        <center>
            <?php if ($_SESSION["inicio"] == 'no') : ?>
                <br><br>
                <form action="" method="post">
                    <div class="sintoma-pregunta">
                        <font face="Courier New" size="6"><b><?php echo $sintomas[$_SESSION["sin"]]['nom_sint']; ?></b></font>
                    </div>
                    <div class="sintoma-respuesta">
                        <input type="submit" name="si" value="Sí" class="uno"/>
                        <input type="submit" name="no" value="No" class="uno"/>
                    </div>
                </form>
            <?php else : ?>
                <br><br>
                <?php if (isset($problema)) : ?>
                    <h2 align="justify">
                        <font face="Courier New">El problema identificado es
                            <font face="Courier New" color="#FF0000"><?php echo $problema['nom_prob']; ?></font>:
                            &nbsp;<?php echo $problema['desc_prob']; ?>
                        </font>
                    </h2>
                    <h3>Posibles soluciones:</h3>
                    <ul>
                        <?php foreach ($soluciones as $solucion): ?>
                            <li><?php echo $solucion['desc_sol']; ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else : ?>
                    <h2>No se pudo identificar el problema.</h2>
                <?php endif; ?>
            <?php endif; ?>
        </center>
    </div>
</div>
</body>
</html>
