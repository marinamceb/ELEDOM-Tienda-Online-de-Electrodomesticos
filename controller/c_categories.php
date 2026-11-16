<?php
    require_once __DIR__ . "/../model/connectaBD.php";
    require_once __DIR__ . "/../model/m_categories.php";
    $con = connectaBD();
    $categorias = consultaCategories($con);
    include_once __DIR__ . "/../view/v_categories.php";
?>