window.onload = Cargar;

function ImprimirPantalla() {
    window.print();
}

function ZoomPlus() {
    alert("prueba");
    var zoom = 1.5;
    alert(zoom);
    var docViewer = getBrowser().mCurrentBrowser.markupDocumentViewer;
    alert(docViewer);
    docViewer.fullZoom = zoom;
    alert(zoom);

    //var zoom = document.body.style.zoom.toString();
    //zoom = zoom.replace('%', '');
    //zoom = (parseInt(zoom) + 10) + "%";
    //document.body.style.zoom = zoom.toString();
    return false;
}

function ZoomSub() {
    var zoom = document.body.style.zoom.toString();
    zoom = zoom.replace('%', '');
    zoom = (parseInt(zoom) - 10) + "%";
    document.body.style.zoom = zoom.toString();
    return false;
}

function Cargar() {
    startTime();
    document.body.style.zoom = "100%";

    getLocation();

    obtenerCookie("usuario");
}

function AbrirPalindromos() {
    var titulopag = document.title;
    if (titulopag === "Palíndromos") {
        window.open("frmPalindromos.aspx", "", "fullscreen,scrollbars");
    } else {
        window.location.assign("frmPalindromos.aspx")
    }
}

function AbrirCalculadora() {
    var titulopag = document.title;
    if (titulopag === "Calculadora") {
        window.open("frmCalculadora.aspx", "", "fullscreen,scrollbars");
    } else {
        window.location.assign("frmCalculadora.aspx");
    }

}

function AbrirURL() {
    var a = document.createElement("a");
    a.target = "_blank";
    a.href = "https://www.google.com/";
    a.click();
}

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    document.getElementById('lblHora').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
    return false;
}


function Cambio1() {
    document.body.style.backgroundImage = "url(Imagenes/Fondolibros.jpg)";
}

function Cambio2() {
    document.body.style.backgroundImage = "url(Imagenes/ventana.png)";
}


function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        document.getElementById('lblInicio').setAttribute('title',"Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
    document.getElementById('lblInicio').setAttribute('title', "Latitude: " + position.coords.latitude +
    " Longitude: " + position.coords.longitude);
}


function obtenerCookie(clave) {
    var name = clave + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) == 0) {
            //alert(c.substring(name.length, c.length));
            document.getElementById('lblUsuario').innerHTML = c.substring(name.length, c.length);
        }
    }
    return "";
}

function CerrarSesion() {
    document.cookie = "usuario=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
    window.location.assign("frmLogin.aspx")
}