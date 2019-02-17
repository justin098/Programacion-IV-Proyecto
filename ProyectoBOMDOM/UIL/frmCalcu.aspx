<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCalcu.aspx.cs" Inherits="UIL.frmCalcu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="Estilos/cssCalculadora.css" />
    <link rel="stylesheet" href="Estilos/Bootstrap/bootstrap.min.css" />
    <script src="Estilos/Bootstrap/jquery.min.js"></script>
    <script src="Estilos/Bootstrap/bootstrap.min.js"></script>
    <script>
        function InsertarNumero(Valor) {
            if (Valor == '.') {
                var Cadena = document.getElementById("txtValores");
                var resultado = false;
                //alert(resultado);
                for (var i = 0; i < Cadena.value.length; i++) {
                    //alert(Cadena.value.length + " Tamaño de la cadena");
                    var caracter = Cadena.value.charAt(i);
                    //alert(caracter + " <- Caracter | " + i + " <- Posición");
                    if (caracter == '.') {
                        resultado = true;
                        break;
                    }
                }
                //alert(resultado);
                if (resultado != true) {
                    if (Cadena.value.length == 0) {
                        Cadena.value += "0" + Valor;
                    } else {
                        Cadena.value += Valor.trim();
                    }
                }
            } else {
                var inputNombre = document.getElementById("txtValores");

                if (inputNombre.value.charAt(0) == "0" && inputNombre.value.charAt(1) == "") {
                    inputNombre.value = Valor.trim();
                } else {
                    inputNombre.value += Valor.trim();
                }
            }
        }
        function InsertarEjecucion(Ejecucion) {
            var inputValor = document.getElementById("txtValores");
            inputValor.value = inputValor.value.replace(/^0+/, '');
            inputValor.value = inputValor.value.replace(/\s/g, '');

            var regex = /^[0-9.]+$/;
            if (regex.test(inputValor.value)) {
                if (inputValor.value.length != 0) {
                    var inputEjecucion = document.getElementById("txtEjecuciones");
                    if (inputEjecucion.value.indexOf('=') != -1) {
                        inputEjecucion.value = inputValor.value + " " + Ejecucion + " ";
                    } else {
                        inputEjecucion.value += inputValor.value + " " + Ejecucion + " ";
                    }
                    inputValor.value = '0';
                }
            } else {
                inputValor.value = '0';
            }
        }
    </script>

</head>
<body>

    <nav class="navbar" style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Aplicación B & D</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="frmCalculadora.aspx">Calculadora</a></li>
                    <li class="active"><a href="frmPalindromos.aspx">Palíndromos</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" name="calculator" runat="server">
        <h3>Calculadora</h3>
        <p>Haz algun calculo para ver el resultado.</p>
        <input type="text" runat="server" id="txtEjecuciones" readonly="" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <input type="text" runat="server" id="txtValores" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <asp:RegularExpressionValidator ID="regexpNumeros" runat="server" ErrorMessage="**No se permiten letras" ControlToValidate="txtValores" ValidationExpression="\d*\.?\d*" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqNumeros" runat="server" ControlToValidate="txtValores" ErrorMessage="Debe completar el campo" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label Text="text" runat="server" Visible="false" ID="lblError" ForeColor="Red" />
        <br />
        <input type="button" class="Botones" id="btnUno" value="1" onclick="InsertarNumero('1');" />
        <input type="button" id="btnDos" class="Botones" value="2" onclick="InsertarNumero('2');" />
        <input type="button" class="Botones" id="btnTres" value="3" onclick="InsertarNumero('3');" />
        <input type="button" class="Botones" id="btnSuma" value="+" onclick="InsertarEjecucion('+');" />
        <br />
        <input type="button" class="Botones" id="btnCuatro" value="4" onclick="InsertarNumero('4');" />
        <input type="button" class="Botones" id="btnCinco" value="5" onclick="InsertarNumero('5');" />
        <input type="button" class="Botones" id="btnSeis" value="6" onclick="InsertarNumero('6');" />
        <input type="button" class="Botones" id="btnResta" value="-" onclick="InsertarEjecucion('-');" />
        <br />
        <input type="button" class="Botones" id="btnSiete" value="7" onclick="InsertarNumero('7');" />
        <input type="button" class="Botones" id="btnOcho" value="8" onclick="InsertarNumero('8');" />
        <input type="button" class="Botones" id="btnNueve" value="9" onclick="InsertarNumero('9');" />
        <input type="button" class="Botones" id="btnMultiplicacion" value="*" onclick="InsertarEjecucion('*');" />
        <br />
        <input type="button" class="Botones" id="btnCero" value="0" onclick="InsertarNumero('0');" />
        <asp:Button Text="C" CssClass="Botones" ID="btnLimpiar" runat="server" UseSubmitBehavior="False" />
        <input type="button" class="Botones" id="btnDivision" value="/" onclick="InsertarEjecucion('/');" />
        <input type="button" class="PuntoIgual" id="btnComa" value="." onclick="InsertarNumero('.');" />
        <asp:Button ID="bntIgualP" runat="server" Text="=" class="PuntoIgual" />
        <br />

    </form>
</body>
</html>
