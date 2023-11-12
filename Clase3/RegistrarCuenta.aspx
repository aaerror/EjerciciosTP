<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarCuenta.aspx.cs" Inherits="Clase3.RegistrarCuenta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Registrar Cuenta</title>
        <style type="text/css">
            .auto-style1 {
                height: 39px;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource_Cuentas"
                               runat="server"
                               ConnectionString="<%$ ConnectionStrings:TP3ConnectionString %>"
                               SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]"
                               InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" 
                               UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id"
                               DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView_Cuentas" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Descripcion"
                                          PropertyName="Text"
                                          Name="descripcion"
                                          Type="String"/>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink_RegistrarCuenta"
                                       runat="server"
                                       NavigateUrl="~/RegistrosContables.aspx"
                                       Text="Volver"/>
                    </td>
                </tr>
            </table>
            <fieldset>
                <legend>Gestión de Cuentas</legend>
                <table style="width: 20%;">
                    <tr>
                        <td>
                            <label>Cuenta:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="Descripcion"
                                         runat="server"
                                         Placeholder="nombre de la cuenta&#8230;"
                                         MaxLength="50"
                                         Width="250"/>
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
                            <asp:Button ID="NuevaCuenta"
                                        runat="server"
                                        Text="Registrar"
                                        OnClick="NuevaCuenta_Click"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Cuentas</legend>
                <asp:GridView ID="GridCuentas"
                              runat="server"
                              AutoGenerateColumns="False"
                              DataKeyNames="id"
                              DataSourceID="SqlDataSource_Cuentas" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id"
                                        HeaderText="ID"
                                        InsertVisible="False"
                                        ReadOnly="True"
                                        SortExpression="id"/>
                        <asp:BoundField DataField="descripcion"
                                        HeaderText="Descripción"
                                        SortExpression="descripcion"/>
                        <asp:CommandField HeaderText="Comandos" 
                                          ShowEditButton="True"
                                          ShowDeleteButton="True"/>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </fieldset>
        </form>
    </body>
</html>
