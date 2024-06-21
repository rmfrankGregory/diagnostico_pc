<?php
require_once("Conexion.php");

// Obtener la lista de problemas
$sql = "SELECT id_prob, nom_prob FROM problema";
$result = mysqli_query($con, $sql);
$problemas = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Verificar si se ha seleccionado un problema
$selected_problem_id = isset($_GET['id_prob']) ? $_GET['id_prob'] : null;
$selected_problem = null;
$sintomas = [];
$soluciones = [];

if ($selected_problem_id) {
    // Obtener los detalles del problema seleccionado
    $sql = "SELECT * FROM problema WHERE id_prob = '" . $selected_problem_id . "'";
    $result = mysqli_query($con, $sql);
    $selected_problem = mysqli_fetch_assoc($result);

    // Obtener los síntomas del problema seleccionado
    $sql = "SELECT nom_sint FROM sintoma WHERE id_prob = '" . $selected_problem_id . "'";
    $result = mysqli_query($con, $sql);
    $sintomas = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // Obtener las soluciones del problema seleccionado
    $sql = "SELECT desc_sol FROM solucion WHERE id_prob = '" . $selected_problem_id . "'";
    $result = mysqli_query($con, $sql);
    $soluciones = mysqli_fetch_all($result, MYSQLI_ASSOC);
}
?>

<html>
<head>
    <title>Lista de Problemas - Sistema Experto para Diagnosticar Fallas en PCs</title>
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
    <h1>Lista de Problemas</h1>
    <form method="get" action="listar.php">
        <label for="id_prob">Seleccione un problema:</label>
        <select name="id_prob" id="id_prob" onchange="this.form.submit()">
            <option value="">--Seleccione un problema--</option>
            <?php foreach ($problemas as $problema): ?>
                <option value="<?php echo $problema['id_prob']; ?>" <?php if ($selected_problem_id == $problema['id_prob']) echo 'selected'; ?>>
                    <?php echo $problema['nom_prob']; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </form>

    <?php if ($selected_problem): ?>
        <div class="problema">
            <h2><?php echo $selected_problem['nom_prob']; ?></h2>
            <p><?php echo $selected_problem['desc_prob']; ?></p>
            <h3>Síntomas:</h3>
            <ul>
                <?php foreach ($sintomas as $sintoma): ?>
                    <li><?php echo $sintoma['nom_sint']; ?></li>
                <?php endforeach; ?>
            </ul>
            <h3>Soluciones:</h3>
            <ul>
                <?php foreach ($soluciones as $solucion): ?>
                    <li><?php echo $solucion['desc_sol']; ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
</div>
</body>
</html>
