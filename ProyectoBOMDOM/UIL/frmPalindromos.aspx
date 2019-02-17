<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPalindromos.aspx.cs" Inherits="UIL.frmPalindromos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Estilos/cssPalindromos.css" />
    <title>Comprobación Palíndromos</title>
</head>
<body>
    <form id="form1" name="palindromos" class="formulario" runat="server">
        <h3>Palíndromos</h3>
        <input type="text" runat="server" id="txtValores" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <asp:RequiredFieldValidator ID="reqTexto" runat="server" ControlToValidate="txtValores" ErrorMessage="Debe completar el campo" ForeColor="Red" ValidationGroup="form_ejm"></asp:RequiredFieldValidator>
        <br />
        <asp:Label Text="text" runat="server" Visible="false" ID="lblError" ForeColor="Red" />
        <br />
        <asp:Button ID="btnComprobar" runat="server" Text="Comprobar" ValidationGroup="form_ejm" class="Botones" OnClick="btnComprobar_Click" />
        <br />
    </form>
</body>
</html>
