<?php

function consultaDetallProducte($con, $idProducto) {
    $sql = "SELECT * FROM producto WHERE id = $1";
    $consulta = pg_query_params($con, $sql, array($idProducto)) or die("Error SQL detalle producto");
    $res = pg_fetch_assoc($consulta);
    return($res);
}

?>