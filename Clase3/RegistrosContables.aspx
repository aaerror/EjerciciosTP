<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrosContables.aspx.cs" Inherits="Clase3.RegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource_Cuentas"
                               runat="server"
                               ConnectionString="<%$ ConnectionStrings:TP3ConnectionString %>"
                               SelectCommand="SELECT Cuentas.* FROM Cuentas"/>
            <asp:SqlDataSource ID="SqlDataSource_RegistrosContables"
                               runat="server"
                               ConnectionString="<%$ ConnectionStrings:TP3ConnectionString %>"
                               SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, Cuentas.descripcion, RegistrosContables.monto, RegistrosContables.tipo FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id"
                               InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)"
                               UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id"
                               DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList_Cuentas"
                                          PropertyName="SelectedValue"
                                          Name="idCuenta"
                                          Type="Int32"/>
                    <asp:ControlParameter ControlID="txtBxMonto"
                                          PropertyName="Text"
                                          Name="monto"
                                          Type="Int32"/>
                    <asp:ControlParameter ControlID="RadioButtonList_Tipo"
                                          PropertyName="SelectedIndex"
                                          Name="tipo"
                                          Type="Boolean"/>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32"/>
                    <asp:Parameter Name="monto" Type="Int32"/>
                    <asp:Parameter Name="tipo" Type="Boolean"/>
                    <asp:Parameter Name="id" Type="Int32"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink_RegistrarCuenta"
                                       runat="server"
                                       NavigateUrl="~/RegistrarCuenta.aspx"
                                       Text="Crear Cuenta"/>
                    </td>
                </tr>
            </table>
            <fieldset>
                <legend>Gestión Contable</legend>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblCuenta"
                                       runat="server"
                                       Text="Cuenta"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_Cuentas"
                                              runat="server"
                                              DataSourceID="SqlDataSource_Cuentas"
                                              DataTextField="descripcion"
                                              DataValueField="id"
                                              Height="34px"
                                              Width="266px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMonto"
                                       runat="server"
                                       Text="Monto"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBxMonto"
                                         runat="server"
                                         TextMode="Number"
                                         Height="26px"
                                         Width="257px"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList_Tipo"
                                                 runat="server">
                                <asp:ListItem Value="0" Text="Debe" Selected="True"/>
                                <asp:ListItem Value="1" Text="Haber"/>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="Mensaje"
                                       runat="server"
                                       Text="Mensaje"
                                       Visible="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Registrar"
                                        runat="server"
                                        Text="Registrar" OnClick="Registrar_Click"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Transacciones</legend>
                <asp:GridView ID="GridRegistrosContables"
                              runat="server"
                              BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource_RegistrosContables">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="idCuenta" HeaderText="CuentaID" SortExpression="idCuenta" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                        <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" DataFormatString="{0:C}" />
                        <asp:CheckBoxField DataField="tipo" HeaderText="Tipo de Transacción" SortExpression="tipo" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Comandos" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </fieldset>
        </form>
    </body>
</html>
