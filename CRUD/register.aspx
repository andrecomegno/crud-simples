<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CRUD.script.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/register.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <form class="form-register" runat="server" id="formRgister">
        <div class="div-main">
            <table class="tab-main">
                <tr>
                    <td class="td-left"></td>
                    <td class="td-center">
                        <asp:Panel ID="panel_one" runat="server" CssClass="style-panel-one">
                            <br />
                            <asp:TextBox CssClass="style-txt-name" placeholder="Nome Completo" runat="server" TabIndex="1" MaxLength="250" ID="input_name"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox CssClass="style-txt-cpf" placeholder="CPF" runat="server" TabIndex="2" MaxLength="11" ID="input_cpf"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-ddd" placeholder="DDD" runat="server" MaxLength="2" TabIndex="3" ID="input_ddd"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-phone" placeholder="Telefone" runat="server" MaxLength="9" TabIndex="4" ID="input_phone"></asp:TextBox>
                            <asp:DropDownList CssClass="style-phone-type" runat="server" ClientIDMode="AutoID" TabIndex="5" ID="input_phone_type">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Residencial</asp:ListItem>
                                <asp:ListItem Value="2">Celular</asp:ListItem>
                                <asp:ListItem Value="3">Outros</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="panel_two" runat="server" CssClass="style-panel-two">
                            <br />
                            <asp:TextBox CssClass="style-txt-zip" placeholder="CEP" runat="server" MaxLength="8" TabIndex="10" ID="input_zip"></asp:TextBox>
                            <asp:Button CssClass="style-bt-search" runat="server" TabIndex="11" Text="Buscar" ID="bt_search" OnClick="bt_search_Click" Font-Bold="True" Font-Size="Medium" />
                            <asp:HyperLink CssClass="style-link-search" runat="server" NavigateUrl="http://www.buscacep.correios.com.br/sistemas/buscacep/buscaCepEndereco.cfm" TabIndex="12" Target="_blank" ID="link_cep">Não Sabe o CEP ?</asp:HyperLink>
                            <br />
                            <asp:TextBox CssClass="style-txt-address" placeholder="Endereço" runat="server" MaxLength="250" TabIndex="13" ID="input_address"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-address-number" placeholder="Número" runat="server" MaxLength="6" TabIndex="14" ID="input_address_number"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-neighborhood" placeholder="Bairro" runat="server" MaxLength="250" TabIndex="15" ID="input_neighborhood"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-city" placeholder="Cidade" runat="server" MaxLength="250" TabIndex="16" ID="input_city"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-state" placeholder="Estado" runat="server" MaxLength="2" TabIndex="17" ID="input_state"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel CssClass="style-panel-three" runat="server" HorizontalAlign="Center" ID="panel_three">
                            <br />
                            <asp:TextBox CssClass="style-txt-email" placeholder="E-Mail" runat="server" MaxLength="250" TabIndex="6" ID="input_email" TextMode="Email"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-password" placeholder="Senha" runat="server" MaxLength="6" TabIndex="8" ID="input_password" TextMode="Password" ValidateRequestMode="Enabled"></asp:TextBox>
                            <br />
                            <asp:TextBox CssClass="style-txt-email" placeholder="Confirmar E-Mail" runat="server" MaxLength="250" TabIndex="7" ID="input_email_confirm" TextMode="Email"></asp:TextBox>
                            <asp:TextBox CssClass="style-txt-password" placeholder="Confirmar Senha" runat="server" MaxLength="6" TabIndex="9" ID="input_password_confirm" TextMode="Password" ValidateRequestMode="Enabled"></asp:TextBox>
                            <asp:Button ID="bt_cancel" runat="server" CssClass="style-bt-cancel" Font-Bold="True" Font-Size="Medium" placeholder="Bairro" PostBackUrl="~/script/login.aspx" TabIndex="18" Text="Cancelar"/>
                            <asp:Button ID="bt_save" runat="server" CssClass="style-bt-save" Font-Bold="True" Font-Size="Medium" OnClick="bt_save_Click" placeholder="Bairro" TabIndex="19" Text="Salvar" />
                            <br />
                        </asp:Panel>                        
                        <asp:Panel CssClass="style-panel-four" runat="server" ID="panel_four" BorderStyle="None">
                            <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>
                        </asp:Panel>
                    </td>
                    <td class="td-right"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
