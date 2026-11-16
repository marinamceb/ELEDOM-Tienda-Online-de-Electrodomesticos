<?php
    function consultaProductes($con, $idCategoria) {
        $sql = "SELECT id, nombre, precio, img, descripcion FROM producto WHERE categoria = $1";
        $consulta = pg_query_params($con, $sql, array($idCategoria)) or die ("Error SQL productos");
        $res = pg_fetch_all($consulta) ?? [];
        return($res);
    }

    function consultaProductesPortada($con) {
        $sql = "SELECT *
                FROM producto
                ORDER BY precio ASC
                LIMIT 20";

        $consulta = pg_query($con, $sql) or die("Error SQL productos portada");
        $res = pg_fetch_all($consulta) ?? [];

        return($res);
    }
?>