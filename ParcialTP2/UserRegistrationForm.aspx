<%@ Page Title="Registro de Usuarios" Language="C#" MasterPageFile="~/MasterPage.Master"
         AutoEventWireup="true"
         EnableSessionState="True"
         CodeBehind="UserRegistrationForm.aspx.cs"
         Inherits="ParcialTP2.UserRegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2"
             ContentPlaceHolderID="MainContent"
             runat="server">
    <fieldset>
        <legend>Registro de Usuarios</legend>
        <table>
            <tr>
                <td><asp:Label ID="lblEmail"
                                runat="server"
                                Text="Email"/></td>
                <td><asp:TextBox ID="txtBxEmail"
                                    runat="server"
                                    Placeholder="correo electrónico&#8230;"/></td>
                <td>
                    <asp:RequiredFieldValidator ID="EmailRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txtBxEmail"
                                                ErrorMessage="Se debe ingresar un e-mail para continuar"
                                                Display="Dynamic"
                                                ForeColor="IndianRed"/>
                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator"
                                                    runat="server"
                                                    ControlToValidate="txtBxEmail"
                                                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                                    ErrorMessage="Formato de e-mail inválido"
                                                    Display="Dynamic"
                                                    ForeColor="IndianRed"/>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblUser"
                                runat="server"
                                Text="Usuario"/></td>
                <td><asp:TextBox ID="txtBxUser"
                                    runat="server"
                                    Placeholder="usuario&#8230;"/></td>
                <td><asp:RequiredFieldValidator ID="UserRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txtBxUser"
                                                ErrorMessage="Se debe ingresar el nombre de usuario"
                                                Display="Dynamic"
                                                ForeColor="IndianRed"/></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPassword"
                                runat="server"
                                Text="Contraseña"/></td>
                <td><asp:TextBox ID="txtBxPassword"
                                    runat="server"
                                    TextMode="Password"
                                    Placeholder="ingresar contraseña&#8230;"/></td>
                <td>
                    <asp:RequiredFieldValidator ID="PasswordRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txtBxPassword"
                                                ErrorMessage="Se debe ingresar una contraseña"
                                                Display="Dynamic"
                                                ForeColor="IndianRed"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:TextBox ID="txtBxPasswordRepeat"
                                    runat="server"
                                    TextMode="Password"
                                    Placeholder="repetir contraseña&#8230;"/></td>
                <td><asp:RequiredFieldValidator ID="PasswordRepeatRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txtBxPasswordRepeat"
                                                ErrorMessage="Se debe ingresar la contraseña nuevamente"
                                                Display="Dynamic"
                                                ForeColor="IndianRed"/>
                    <asp:CompareValidator ID="PasswordCompareValidator"
                                            runat="server"
                                            ControlToCompare="txtBxPassword"
                                            ControlToValidate="txtBxPasswordRepeat"
                                            ErrorMessage="Las contraseñas no coinciden"
                                            Display="Dynamic"
                                            ForeColor="IndianRed"/></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblAge"
                                runat="server"
                                Text="Edad"/></td>
                <td><asp:TextBox ID="txtBxAge"
                                    runat="server"
                                    TextMode="Number"
                                    Placeholder="ingresar edad&#8230;"/></td>
                <td><asp:RequiredFieldValidator ID="AgeRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txtBxAge"
                                                ErrorMessage="Se debe ingresar la edad"
                                                Display="Dynamic"
                                                ForeColor="IndianRed"/>
                    <asp:RangeValidator ID="AgeValidator"
                                        runat="server"
                                        ControlToValidate="txtBxAge"
                                        Type="Integer"
                                        MinimumValue="16"
                                        MaximumValue="100"
                                        ErrorMessage="La edad debe estar comprendida entre los 16 años y los 100 años"
                                        Display="Dynamic"
                                        ForeColor="IndianRed"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblMessage"
                               runat="server"
                               Text="Message"
                               Visible="false"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnGuardar"
                                runat="server"
                                Text="Guardar"
                                OnClick="btnGuardar_Click"/></td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
