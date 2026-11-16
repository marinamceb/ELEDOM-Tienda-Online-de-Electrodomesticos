<?php if ($producto) { ?>

    <h2 class="titulo-seccion"> 
        <?php echo $producto['nombre']; ?>
    </h2>


    <div class="grid-detalle">

        <div style="grid-area: imagen;" id="imagen-producto">
            <img src="img/<?php echo $producto['img'] ?>" alt="<?php echo $producto['nombre'] ?>">
        </div>

        <div style="grid-area: descripcion;">
            <p id="descripcion-producto">
                <b>Descripción: </b><?php echo $producto['descripcion'] ?>
            </p>
        </div>

        <div style="grid-area: precio;">
            <h3 id="precio-producto">
                <?php echo $producto['precio'] ?>€
            </h3>
        </div>

        <div style="grid-area: disponibilidad;">
            <p id="disponibilidad-producto" class="<?php echo $producto['disponibilidad'] ?>">
                <?php echo $producto['disponibilidad'] ?>
            </p>
        </div>

        <div style="grid-area: boton;">
            <button type="button" id="boton-add-carrito" onclick="anadirCarrito(<?php echo $producto['id'] ?>)">
                Añadir al carrito
            </button>
        </div>

    </div>

<?php } else { ?>
        Producto no encontrado.
<?php } ?>




        



        