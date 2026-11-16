<?php

$accio = $_GET['accio'] ?? null;

switch ($accio) {
    case 'categories':
        include_once __DIR__ . '/resource_categories.php';
        break;
    case 'productes':
        include_once __DIR__ . '/resource_productes.php';
        break;
    case 'detall-producte':
        include_once __DIR__ . '/resource_detall_producte.php';
        break;
    default:
        include_once __DIR__ . '/resource_portada.php';
        break;
}

?>