<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ELEDOM</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/funcions.js"></script>
</head>

<body>

    <header>
        <h1><a href="index.php" id="logo">ELEDOM</a></h1>
    </header>

    <nav id="menu-categorias">

        <?php include_once __DIR__ . "/../controller/c_categories.php"; ?>

    </nav>

    <main id="container-principal">

        <section id="container-bienvenida">
            <h3>¡Bienvenido a ELEDOM!</h3>
            <p>Explora nuestra amplia selección de electrodomésticos de calidad.</p>
        </section> 

        <h2 class="titulo-seccion">
            Nuestros productos
        </h2>

        <div class="flex-productos">

            <?php foreach ($productos as $producto) { ?>

                <article class="tarjeta-producto">
                    <img src="img/<?php echo $producto['img']; ?>" alt="<?php echo $producto['nombre']; ?>">
                    <h3><?php echo $producto['nombre']; ?></h3>
                    <p><?php echo $producto['precio']; ?>€</p>
                    <button class="boton-ver-mas" type="button" onclick="carregaDetallProducte(<?php echo $producto['id']; ?>)"> 
                        Ver más 
                    </button>
                </article>

            <?php } ?>

        </div>

    </main>

    <footer>
        <p>&copy; 2026 - ELEDOM electrodomésticos</p>
    </footer>

</body>
</html>