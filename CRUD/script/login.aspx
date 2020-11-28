<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRUD.script.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Be Welcome</title>
    <link href="../css/home.css" rel="Stylesheet" type="text/css"/>
</head>
    <body>
    <form class="form-login" runat="server" id="formLogin" >
        <table class="tab-main">
            <tr>
                <td class="td-left">&nbsp;</td>
                <td class="td-center">
                    <asp:Panel CssClass="style-panel-login" runat="server" HorizontalAlign="Center">
                        <br />
                        <br />
                        <asp:TextBox CssClass="style-input" placeholder="E-Mail" runat="server" MaxLength="150" TabIndex="1" ValidateRequestMode="Enabled" ID="input_login"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox CssClass="style-input" placeholder="Senha" runat="server"  MaxLength="8" TabIndex="2" TextMode="Password" ID="input_password"></asp:TextBox>
                        <br />
                        <asp:Label ID="error" runat="server" ForeColor="#CC3300"></asp:Label>
                        <br />
                        <asp:Button CssClass="style-bt-login" runat="server" Text="Entrar" TabIndex="3" ID="bt_enter" OnClick="bt_enter_Click" Font-Bold="True" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                        <br />
                        <asp:LinkButton ID="link_remember" runat="server" CssClass="style-txt-remember" PostBackUrl="~/script/password-remember.aspx" TabIndex="5">Esqueceu a senha ?</asp:LinkButton>
                        <br />
                        <br />                        
                        <asp:Button CssClass="style-bt-register" runat="server" TabIndex="4" Text="Cadastrar" ID="bt_register" Font-Bold="True" Font-Size="Medium" PostBackUrl="~/script/register.aspx" />
                        <br />
                        <br />
                    </asp:Panel>
                </td>
                <td class="td-right"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
