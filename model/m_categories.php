<?php
function consultaCategories($con) {
    $sql = "SELECT id, nombre FROM categoria";
    $consulta = pg_query($con, $sql) or die ("Error SQL categorias");
    $res = pg_fetch_all($consulta) ?? []; // Si no hay categorias, devuelve una lista vacia
    return($res);
}

function consultaNomCategoria($con, $idCategoria) {
    $sql = "SELECT nombre FROM categoria WHERE id = $1";
    $consulta = pg_query_params($con, $sql, array($idCategoria)) or die ("Error SQL nombre categoria");
    $res = pg_fetch_assoc($consulta); 
    return $res['nombre'] ?? '';
}

?>