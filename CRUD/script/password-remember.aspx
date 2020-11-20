<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="password-remember.aspx.cs" Inherits="CRUD.script.password_remember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/password-remember.css" rel="Stylesheet" type="text/css"/>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 456px;
        }
    </style>
</head>
<body>
    <form id="formRemember" runat="server">
        <div>
            <table class="auto-style2">
                 <tr>
                    <td>&nbsp;</td>
                     <td>
                         <asp:Panel CssClass="style-panel-two" runat="server" HorizontalAlign="Center" ID="panel_two">
                             <br />
                             <asp:TextBox CssClass="style-txt-email" placeholder="E-Mail" runat="server" MaxLength="250" TabIndex="6" ID="input_email" TextMode="Email"></asp:TextBox>
                             <br />
                             <br />
                         </asp:Panel>
                     </td>
                    <td>&nbsp;</td>
                </tr>
             </table>
        </div>
    </form>
</body>
</html>
