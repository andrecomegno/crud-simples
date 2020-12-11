<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="password-remember.aspx.cs" Inherits="CRUD.script.password_remember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/password-remember.css" rel="Stylesheet" type="text/css"/>
    </head>
<body>
    <form class="form-remember" id="form_remember" runat="server">
        <div>
            <table class="tb-main">
                 <tr>
                    <td class="td-left" id="td_left" ></td>
                     <td id="td_center" class="td-center" >
                         <asp:Panel CssClass="style-panel-two" runat="server" ID="panel_email">
                             <br />
                             <asp:TextBox CssClass="style-txt-email" placeholder="E-Mail" runat="server" MaxLength="250" TabIndex="6" ID="input_email" TextMode="Email"></asp:TextBox>
                             <asp:Button  CssClass="style-bt-send" runat="server" Font-Bold="True" Font-Size="Medium" Text="Enviar" ID="bt_send"/>
                             <br />
                             <br />
                         </asp:Panel>
                     </td>
                    <td id="td_right" class="td-right">&nbsp;</td>
                </tr>
             </table>
        </div>
    </form>
</body>
</html>
