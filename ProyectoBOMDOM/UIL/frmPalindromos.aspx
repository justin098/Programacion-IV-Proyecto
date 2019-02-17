<%@ Page Title="" Language="C#" MasterPageFile="~/frmMaster.Master" AutoEventWireup="true" CodeBehind="frmPalindromos.aspx.cs" Inherits="UIL.frmPalindrom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Estilos/cssPalindromos.css" />
    <link rel="shortcut icon" type="image/x-icon" href="Imagenes/Libros.png" />
    <title>Comprobación Palíndromos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" name="palindromos" class="formulario" runat="server">
        <h3>Palíndromos</h3>
        <input type="text" runat="server" id="txtValores" class="CampoTexto" value="" style="width: 335px" />
        <br />
        <asp:RequiredFieldValidator ID="reqTexto" runat="server" ControlToValidate="txtValores" ErrorMessage="Debe completar el campo" ForeColor="Red" ValidationGroup="form_ejm"></asp:RequiredFieldValidator>
        <br />
        <asp:Label Text="text" runat="server" Visible="false" ID="lblError" ForeColor="Red" />
        <br />
        <asp:Button ID="btnComprobar" runat="server" Text="Comprobar" ValidationGroup="form_ejm" class="Botones" OnClientClick="return ValidacionBoton()" OnClick="btnComprobar_Click" />
        <br />
    </form>
    <script type="text/javascript" src="Javascript/jsPalindromos.js"></script>
</asp:Content>

