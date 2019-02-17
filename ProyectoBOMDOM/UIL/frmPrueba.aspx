<%@ Page Title="" Language="C#" MasterPageFile="~/frmMaster.Master" AutoEventWireup="true" CodeBehind="frmPrueba.aspx.cs" Inherits="UIL.frmPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="Estilos/cssCalculadora.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                alert(resultado);
                if (resultado != true) {
                    if (Cadena.value.length == 0) {
                        Cadena.value += "0" + Valor;
                    } else {
                        Cadena.value += Valor.trim();
                        document.getElementById("txtValores").innerHTML = Cadena.value;
                    }
                }
            } else
                alert("else");
            var inputNombre = document.getElementById("txtValores");
            alert(Valor);
            alert(inputNombre + "nfhjsd");
            var porId = document.getElementById("pruebatxt").textContent;
            alert(Valor + "de prueba");
            document.getElementById("txtValores").innerHTML = Valor;
            alert(porId);
            if (inputNombre.value.charAt(0) == "0" && inputNombre.value.charAt(1) == "") {
                alert("if");
                inputNombre.value = Valor.trim();
                document.getElementById("txtValores").innerHTML = Valor.value;
            } else {
                alert("else");
                inputNombre.value += Valor.trim();
                document.getElementById("txtValores").innerHTML += Valor.value;
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
            return true;
        }

        function ValidacionBoton() {
            alert("HOLA");
            return true;
        }
    </script>

    <form id="form1Prueba" name="calculator" runat="server">
        <h3>Calculadora</h3>
        <p>Haz algun calculo para ver el resultado.</p>
        <input type="text" runat="server" id="txtEjecuciones" readonly="" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <asp:TextBox runat="server" ID="pruebatxt" Width="335px" />
        <input type="text" runat="server" id="txtValores" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <%--<asp:RegularExpressionValidator ID="regexpNumeros" runat="server" ErrorMessage="**No se permiten letras" ControlToValidate="txtValores" ValidationExpression="\d*\.?\d*" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqNumeros" runat="server" ControlToValidate="txtValores" ErrorMessage="Debe completar el campo" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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
        <asp:Button Text="text" OnClientClick="ValidacionBoton();" runat="server" />
        <asp:Button ID="bntIgualP" runat="server" Text="=" class="PuntoIgual" />
        <br />

    </form>
</asp:Content>

