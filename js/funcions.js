async function carregaProductes(idCategoria) {
    const res = await fetch("index.php?accio=productes&categoria_id=" + idCategoria);
    const htmlProductes = await res.text();
    document.getElementById("container-principal").innerHTML = htmlProductes;
}

async function carregaDetallProducte(idProducto) {
    const res = await fetch("index.php?accio=detall-producte&producte_id=" + idProducto);
    const htmlProducte = await res.text();
    document.getElementById("container-principal").innerHTML = htmlProducte;
}

async function anadirCarrito(idProducto) {

}