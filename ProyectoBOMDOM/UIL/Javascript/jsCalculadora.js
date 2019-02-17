//function InsertarNumero(Valor) {
//    if (Valor == '.') {
//        var Cadena = document.getElementById("txtValores");
//        var resultado = false;
//        //alert(resultado);
//        for (var i = 0; i < Cadena.value.length; i++) {
//            //alert(Cadena.value.length + " Tamaño de la cadena");
//            var caracter = Cadena.value.charAt(i);
//            //alert(caracter + " <- Caracter | " + i + " <- Posición");
//            if (caracter == '.') {
//                resultado = true;
//                break;
//            }
//        }
//        //alert(resultado);
//        if (resultado != true) {
//            if (Cadena.value.length == 0) {
//                Cadena.value += "0" + Valor;
//            } else {
//                Cadena.value += Valor.trim();
//            }
//        }
//    } else {
//        var inputNombre = document.getElementById("txtValores");

//        if (inputNombre.value.charAt(0) == "0" && inputNombre.value.charAt(1) == "") {
//            inputNombre.value = Valor.trim();
//        } else {
//            inputNombre.value += Valor.trim();
//        }
//    }
//}
//function InsertarEjecucion(Ejecucion) {
//    var inputValor = document.getElementById("txtValores");
//    inputValor.value = inputValor.value.replace(/^0+/, '');
//    inputValor.value = inputValor.value.replace(/\s/g, '');

//    var regex = /^[0-9.]+$/;
//    if (regex.test(inputValor.value)) {
//        if (inputValor.value.length != 0) {
//            var inputEjecucion = document.getElementById("txtEjecuciones");
//            if (inputEjecucion.value.indexOf('=') != -1) {
//                inputEjecucion.value = inputValor.value + " " + Ejecucion + " ";
//                alert(inputEjecucion.value);
//            } else {
//                inputEjecucion.value += inputValor.value + " " + Ejecucion + " ";
//            }
//            inputValor.value = '0';
//            alert(inputValor.value);
//        }
//    } else {
//        inputValor.value = '0';
//    }
//}

function ValidacionBoton() {
    alert("HOLA");
}