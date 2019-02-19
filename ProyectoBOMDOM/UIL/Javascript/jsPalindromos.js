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


function ValidacionBoton() {
    var palabraIngresada = document.getElementById("cphBody_txtValores").value;

    if (palabraIngresada.trim() === "" || palabraIngresada.length < 3) {
        document.getElementById("cphBody_lblError").innerHTML = "Por favor ingresar una frase o palabra debe contener minimo 3 letras / No se admite el campo vacío";
        document.getElementById("cphBody_lblError").style.color = "red";
        return false;
    } else {
        document.getElementById("cphBody_lblError").innerHTML = "";
        
        return true;
    }

}