<h2 class="titulo-seccion">
    <?php echo $nombreCategoria; ?>
</h2>

<div class="flex-productos">
    <?php foreach ($productos as $producto) { ?>

        <article class="tarjeta-producto">

            <img src="img/<?php echo $producto['img']; ?>" alt="<?php echo $producto['nombre']; ?>">

            <h3><?php echo $producto['nombre']; ?> </h3>

            <p> <?php echo $producto['precio']; ?>€</p>

            <button class="boton-ver-mas" type="button" onclick="carregaDetallProducte(<?php echo $producto['id']; ?>)"> 
                Ver más 
            </button>

        </article>

    <?php } ?>

</div>
