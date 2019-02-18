function ValidacionBoton() {

    var usuario = document.getElementById("txtUsuario").value;
    var contrasena = document.getElementById("txtContrasena").value;

    if (usuario === "" || contrasena === "") {
        document.getElementById("lblMensaje").innerHTML = "*No se permiten campos vacíos";
        document.getElementById("lblMensaje").style.display = "inline";
        return false;
    } else if (usuario == "1234" && contrasena == "admin") {
        document.getElementById("lblMensaje").style.display = "none";
        setCookie("usuario", usuario);
        return true;
    } else {
        document.getElementById("lblMensaje").innerHTML = "Usuario / Contraseña incorrectos";
        document.getElementById("lblMensaje").style.display = "inline";
        return false;
    }
}

function setCookie(cname, cvalue) {
    var d = new Date();
    d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function ValidarIdUsuario(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    var regex = /^[0-9]+$/;

    if (!regex.test(teclado)) {
        document.getElementById("lblMensaje").innerHTML = "*No se permiten letras"; /*O espacios vacíos*/
        document.getElementById("lblMensaje").style.display = "inline";
        return false;
    } else {
        document.getElementById("lblMensaje").style.display = "none";
        return true;
    }
}