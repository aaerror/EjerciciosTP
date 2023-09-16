<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="Clase2.WebForm" %>
<!DOCTYPE html>
<html lang="es-ar" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Movimientos Bancario</title>
</head>
    <body>
        <form id="form1" runat="server">
            <fieldset>
                <legend>TRANSACCIÓN BANCARIA</legend>
                
                <table style="width: 20%;">
                    <tr>
                        <td>
                            <label>Concepto</label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Concepto"
                                runat="server"
                                Placeholder="concepto del movimiento bancario&#8230;"
                                MaxLength="140"
                                Width="250"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Fecha:</label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Fecha"
                                runat="server"
                                TextMode="Date"
                                Placeholder="ingresar la fecha&#8230;"
                                min="01/01/2000"
                                Width="250"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Naturaleza:</label>
                        </td>
                        <td>
                            <asp:RadioButtonList
                                ID="DebeHaber"
                                runat="server">
                                <asp:ListItem
                                    Value="0"
                                    Text="Debe"
                                    Selected="True"/>
                                <asp:ListItem
                                    Value="1"
                                    Text="Haber"/>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Importe:</label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Importe"
                                runat="server"
                                TextMode="Number"
                                Placeholder="importe de la transacción&#8230;"
                                Width="250"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:TextBox
                                ID="Mensaje"
                                runat="server"
                                TextMode="MultiLine"
                                Visible="false"
                                Height="100"
                                Width="250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:Button
                                ID="Guardar"
                                runat="server"
                                Text="Guardar"
                                Height="28"
                                Width="80"
                                OnClick="GuardarButton_Click"/>
                        </td>
                    </tr>
                </table>
            </fieldset>

            <fieldset>
                <legend>HISTÓRICO DE MOVIMIENTOS</legend>
                <table style="width: 20%;">
                    <tr>
                        <td>
                            <asp:DropDownList
                                ID="Mes"
                                runat="server">
                                <asp:ListItem
                                    Value="1"
                                    Selected="True"
                                    Text="Enero"/>
                                <asp:ListItem
                                    Value="2"
                                    Text="Febrero"/>
                                <asp:ListItem
                                    Value="3"
                                    Text="Marzo"/>
                                <asp:ListItem
                                    Value="4"
                                    Text="Abril"/>
                                <asp:ListItem
                                    Value="5"
                                    Text="Mayo"/>
                                <asp:ListItem
                                    Value="6"
                                    Text="Junio"/>
                                <asp:ListItem
                                    Value="7"
                                    Text="Julio"/>
                                <asp:ListItem
                                    Value="8"
                                    Text="Agosto"/>
                                <asp:ListItem
                                    Value="9"
                                    Text="Septiembre"/>
                                <asp:ListItem
                                    Value="10"
                                    Text="Octubre"/>
                                <asp:ListItem
                                    Value="11"
                                    Text="Noviembre"/>
                                <asp:ListItem
                                    Value="12"
                                    Text="Diciembre"/>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Balance"
                                runat="server"
                                Visible="false"
                                Width="250"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox
                                ID="Registros"
                                runat="server"
                                TextMode="MultiLine"
                                Height="100px"
                                Width="387"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button
                                ID="Mostrar"
                                runat="server"
                                Text="Ver Movimientos"
                                Height="28"
                                Width="130"
                                OnClick="Mostrar_Click"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </body>
</html>