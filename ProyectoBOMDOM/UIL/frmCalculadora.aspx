<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCalculadora.aspx.cs" Inherits="UIL.frmCalculadora" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Estilos/Calculadora.css" />
    <title></title>
</head>
<body>
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
        <asp:Button Text="C" CssClass="Botones" ID="btnLimpiar" runat="server"  UseSubmitBehavior="False" />
        <input type="button" class="Botones" id="btnDivision" value="/" onclick="InsertarEjecucion('/');" />
        <input type="button" class="PuntoIgual" id="btnComa" value="." onclick="InsertarNumero('.');" />
        <asp:Button ID="bntIgualP" runat="server" Text="=" class="PuntoIgual" />
        <br />

    </form>
</body>
<script type="text/javascript" src="Javascript/jsCalculadora.js"></script>
</html>
