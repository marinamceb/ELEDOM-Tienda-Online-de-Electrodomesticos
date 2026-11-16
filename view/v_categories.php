<?php foreach ($categorias as $categoria){ ?>
    <button onclick="carregaProductes(<?php echo (int)$categoria['id'] ?>)" class="boton-menu">
        <?php echo $categoria['nombre'];?>
    </button>
<?php } ?>