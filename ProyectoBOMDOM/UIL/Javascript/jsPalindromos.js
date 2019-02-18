function ValidarNumero(e) {
    key = e.keyCode || e.which;

    teclado = String.fromCharCode(key).toLowerCase();

    letras = " abcdefghijklmnñopqrstuvwxyzáéíóú";

    especiales = "8-37-38-46";

    teclado_especiales = false;

    for (var i in especiales) {
        if (key == especiales[i]) {
            teclado_especiales = true;
            break;
        }

        if ((letras.indexOf(teclado) == -1) && (!teclado_especiales)) {
            alert("No se pueden ingresar numeros");
            return false;
        }
        else {
            return true;
        }
    }
}
