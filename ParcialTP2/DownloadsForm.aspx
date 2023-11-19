<%@ Page Title="Downloads" Language="C#" MasterPageFile="~/MasterPage.Master"
         AutoEventWireup="true"
         EnableSessionState="True"
         CodeBehind="DownloadsForm.aspx.cs"
         Inherits="ParcialTP2.DownloadsForm"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 39px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>Archivos</legend>
        <table>
            <tr>
                <td>
                    <div>
                        <p>Buscar un archivo para subirlo al sistema</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage"
                               runat="server"
                               Text="Message"
                               Visible="false"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="FileUpload_Files"
                                    runat="server"
                                    AllowMultiple="True"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="Button_FileUpload"
                                runat="server"
                                Text="Subir Archivo"
                                OnClick="Button_FileUpload_Click"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView_Files"
                                  runat="server"
                                  OnRowCommand="GridView_Files_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                        <Columns>
                            <asp:ButtonField Text="Descargar"
                                             CommandName="Descargar"/>

                        </Columns>
                        <EditRowStyle BackColor="#999999"/>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center"/>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"/>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"/>
                        <SortedAscendingCellStyle BackColor="#E9E7E2"/>
                        <SortedAscendingHeaderStyle BackColor="#506C8C"/>
                        <SortedDescendingCellStyle BackColor="#FFFDF8"/>
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE"/>
                      </asp:GridView>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
