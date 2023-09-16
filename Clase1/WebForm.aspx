<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="Clase1.WebForm" %>

<!DOCTYPE html>
<html lang="es-ar" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Calculadora</title>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset>
            <legend>Suma, Resta, Multiplicación, División</legend>

            <label>Número 1:</label>
            <asp:TextBox ID="NumeroA" runat="server" Placeholder="ingresar un número&#8230;" ToolTip="Número 1"/>
            <br/>

            <label>Operación:</label>
            <asp:DropDownList ID="Operacion" runat="server">
                <asp:ListItem Value="Suma" Selected="True">Suma</asp:ListItem>
                <asp:ListItem Value="Resta">Resta</asp:ListItem>
                <asp:ListItem Value="Multiplicacion">Multiplicación</asp:ListItem>
                <asp:ListItem Value="Division">División</asp:ListItem>
            </asp:DropDownList>
            <br/>

            <label>Número 2:</label>
            <asp:TextBox ID="NumeroB" runat="server" Placeholder="ingresar otro número&#8230;" ToolTip="Número 2"/>
            <br/>

            

            <label>Resultado:</label>
            <asp:Label ID="Resultado" runat="server" Visible="false"></asp:Label>
            <br/>

            <asp:Button ID="CalcularButton" runat="server" Text="Calcular" OnClick="CalcularButton_Click"/>
        </fieldset>
    </form>
</body>
</html>