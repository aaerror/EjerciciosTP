<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibrosManagement.aspx.cs" Inherits="ParcialTP.LibrosManagement" %>

<!DOCTYPE html>
<html lang="es-ar" xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Libros Management</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <fieldset>
                <legend>Registro de Libros</legend>
                    <asp:SqlDataSource ID="SQLDataSource_Generos"
                                       runat="server"
                                       ConnectionString="<%$ ConnectionStrings:connection %>"
                                       SelectCommand="SELECT * FROM [generos]"
                                       UpdateCommand="UPDATE [generos] SET [descripcion] = @descripcion WHERE [genero_id] = @genero_id"
                                       DeleteCommand="DELETE FROM [generos] WHERE [genero_id] = @genero_id" InsertCommand="INSERT INTO [generos] ([descripcion]) VALUES (@descripcion)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="Genre"
                                                  Name="descripcion"
                                                  PropertyName="Text"
                                                  Type="String"/>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="descripcion"
                                           Type="String"/>
                            <asp:Parameter Name="genero_id"
                                           Type="Int32"/>
                        </UpdateParameters>
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GenreList"
                                                  Name="genero_id"
                                                  PropertyName="SelectedValue"
                                                  Type="Int32"/>
                        </DeleteParameters>
                    </asp:SqlDataSource>
                <table style="width: 20%;">
                    <tr>
                        <td>
                            <label>Título</label>
                        </td>
                        <td>
                            <asp:TextBox ID="Title"
                                         runat="server"
                                         Placeholder="título del libro&#8230;"
                                         MaxLength="200"
                                         Height="26"
                                         Width="250"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Género</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="GenreList"
                                              runat="server"
                                              Height="26px"
                                              Width="257px"
                                              DataSourceID="SQLDataSource_Generos"
                                              DataValueField="genero_id"
                                              DataTextField="descripcion"/>
                        </td>
                        <td>
                            <asp:Button ID="DeleteGenre"
                                        runat="server"
                                        Text="&#8211;"
                                        Width="30" OnClick="DeleteGenre_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:TextBox ID="Genre"
                                         runat="server"
                                         Placeholder="nuevo género&#8230;"
                                         Height="26"
                                         Width="250"/>
                        </td>
                        <td>
                            <asp:Button ID="NewGenre"
                                        runat="server"
                                        Text="+"
                                        Width="30" OnClick="NewGenre_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:Label ID="Message"
                                       runat="server"
                                       Text="Texto de error"
                                       Visible="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:Button ID="EditBook"
                                        runat="server"
                                        Text="Actualizar"
                                        Height="28"
                                        Width="127"
                                        OnClick="EditBook_Click"/>
                            <asp:Button ID="NewBook"
                                        runat="server"
                                        Text="Agregar"
                                        Height="28"
                                        Width="127"
                                        OnClick="NewBook_Click"/>
                        </td>
                    </tr>
                </table>
            </fieldset>

            <fieldset>
                <legend>Libros Management</legend>
                <asp:Label ID="MessageList"
                           runat="server"
                           Text="Mensajes"
                           Visible="false"/>
                <table>
                    <tr>
                        <td>
                            <label>Género</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="FILTER_GenreList"
                                              runat="server"
                                              Height="26px"
                                              Width="257px"
                                              DataSourceID="SQLDataSource_Generos"
                                              DataValueField="genero_id"
                                              DataTextField="descripcion"/>
                        </td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <asp:Button ID="Filtrar"
                                        runat="server"
                                        Text="Filtrar"
                                        Height="28"
                                        Width="127"
                                        OnClick="Filtrar_Click"/>
                            <asp:Button ID="QuitarFiltro"
                                        runat="server"
                                        Text="Quitar Filtro"
                                        Height="28"
                                        Width="127" OnClick="QuitarFiltro_Click"/>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridLibros"
                              runat="server"
                              AutoGenerateColumns="False"
                              DataKeyNames="libros_id"
                              DataSourceID="SqlDataSource_Libros"
                              CellPadding="4"
                              ForeColor="#333333"
                              GridLines="None"
                              OnSelectedIndexChanged="GridLibros_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White"
                                         ForeColor="#284775"/>
                    <Columns>
                        <asp:BoundField DataField="libros_id"
                                        HeaderText="libros_id"
                                        InsertVisible="False"
                                        ReadOnly="True"
                                        SortExpression="libros_id"
                                        Visible="False"/>
                        <asp:BoundField DataField="titulo"
                                        HeaderText="Título"
                                        SortExpression="titulo"/>
                        <asp:BoundField DataField="genero_id"
                                        SortExpression="genero_id" ShowHeader="False"/>
                        <asp:BoundField DataField="descripcion"
                                        HeaderText="Descripción"
                                        SortExpression="descripcion"/>
                        <asp:CommandField ButtonType="Button"
                                          ShowDeleteButton="True"
                                          ShowSelectButton="True"/>
                    </Columns>
                    <EditRowStyle BackColor="#999999"/>
                    <FooterStyle BackColor="#5D7B9D"
                                 Font-Bold="True"
                                 ForeColor="White"/>
                    <HeaderStyle BackColor="#5D7B9D"
                                 Font-Bold="True"
                                 ForeColor="White"/>
                    <PagerStyle BackColor="#284775"
                                ForeColor="White"
                                HorizontalAlign="Center"/>
                    <RowStyle BackColor="#F7F6F3"
                              ForeColor="#333333"/>
                    <SelectedRowStyle BackColor="#E2DED6"
                                      Font-Bold="True"
                                      ForeColor="#333333"/>
                    <SortedAscendingCellStyle BackColor="#E9E7E2"/>
                    <SortedAscendingHeaderStyle BackColor="#506C8C"/>
                    <SortedDescendingCellStyle BackColor="#FFFDF8"/>
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"/>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_Libros"
                                   runat="server"
                                   ConnectionString="<%$ ConnectionStrings:connection %>"
                                   SelectCommand="SELECT libros.libros_id, libros.titulo, libros.genero_id, generos.descripcion FROM libros INNER JOIN generos ON libros.genero_id = generos.genero_id"
                                   InsertCommand="INSERT INTO [libros] ([titulo], [genero_id]) VALUES (@titulo, @genero_id)"
                                   UpdateCommand="UPDATE [libros] SET [titulo] = @titulo, [genero_id] = @genero_id WHERE [libros_id] = @libros_id"
                                   DeleteCommand="DELETE FROM [libros] WHERE [libros_id] = @libros_id">
                    <InsertParameters>
                        <asp:Parameter Name="titulo"
                                       Type="String"/>
                        <asp:Parameter Name="genero_id"
                                       Type="Int32"/>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="Title"
                                              Name="titulo"
                                              PropertyName="Text"
                                              Type="String"/>
                        <asp:ControlParameter ControlID="GenreList"
                                              Name="genero_id"
                                              PropertyName="SelectedValue"
                                              Type="Int32"/>
                        <asp:ControlParameter ControlID="GridLibros"
                                              Name="libros_id"
                                              PropertyName="SelectedValue"
                                              Type="Int32"/>
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="libros_id"
                                       Type="Int32"/>
                    </DeleteParameters>
                </asp:SqlDataSource>
            </fieldset>
        </form>
    </body>
</html>
