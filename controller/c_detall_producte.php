
<?php
    require_once __DIR__ . "/../model/connectaBD.php";
    require_once __DIR__ . "/../model/m_detall_producte.php";

    $con = connectaBD();

    $idProducto = $_GET['producte_id'] ?? null;

    if ($idProducto !== null) {
        $producto = consultaDetallProducte($con, $idProducto);

        include_once __DIR__ . "/../view/v_detall_producte.php";
    }
?>
