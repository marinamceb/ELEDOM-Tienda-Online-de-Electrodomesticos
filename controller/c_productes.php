<?php
    require_once __DIR__ . "/../model/connectaBD.php";
    require_once __DIR__ . "/../model/m_productes.php";
    require_once __DIR__ . "/../model/m_categories.php";
    $con = connectaBD();

    $idCategoria = $_GET['categoria_id'] ?? null;

    if ($idCategoria !== null) {
        $productos = consultaProductes($con, $idCategoria);
        $nombreCategoria = consultaNomCategoria($con, $idCategoria);

        include_once __DIR__ . "/../view/v_productes.php";
    }
?>