<?php
    require_once __DIR__ . "/../model/connectaBD.php";
    require_once __DIR__ . "/../model/m_productes.php";

    $con = connectaBD();
    $productos = consultaProductesPortada($con);

    include_once __DIR__ . "/../view/v_portada.php";
?>