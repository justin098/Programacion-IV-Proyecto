<%@ Page Title="" Language="C#" MasterPageFile="~/frmMaster.Master" AutoEventWireup="true" CodeBehind="frmPalindromos.aspx.cs" Inherits="UIL.frmPalindrom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Estilos/cssPalindromos.css" />
    <link rel="shortcut icon" type="image/x-icon" href="Imagenes/Libros.png" />
    <title>Palíndromos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server"><!--debe ponerse el ContentPlaceHolder_Nombreetiqueta para que funcione en el JS-->
    <form id="form1" name="palindromos" class="formulario" runat="server">
        <h3>Palíndromos</h3>
        <input type="text" runat="server" id="txtValores" class="CampoTexto" onkeypress="return ValidarNumero(event)" value="" style="width: 335px; font-size: 2rem;" />
        <br />
        <asp:Label Text="" runat="server" Visible="true" ID="lblError" />
        <br />
        <asp:Button ID="btnComprobar" runat="server" Text="Comprobar" ValidationGroup="form_ejm" class="Botones" OnClientClick="return ValidacionBoton()" OnClick="btnComprobar_Click" />
        <br />
    </form>
    <script type="text/javascript" src="Javascript/jsPalindromos.js"></script>
</asp:Content>

