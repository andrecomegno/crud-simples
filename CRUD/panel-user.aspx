<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel-user.aspx.cs" Inherits="CRUD.script.panel_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Painel - Usuario</title>
    <link href="css/panel-user.css" rel="Stylesheet" type="text/css"/>
    <link href="css/grindview.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <form id="form_panel_user" runat="server">
        <div class="div-main">
            <table class="tab-main">
            <tr>
                <td class="tb-left">&nbsp;</td>
                <td class="tb-center">
                    <asp:Panel CssClass="style-panel-user-edit" runat="server" Enabled="False" ID="panel_user_edit">
                        <br />
                        <asp:TextBox CssClass="style-txt-name" placeholder="Nome Completo" runat="server" TabIndex="1" MaxLength="250" ID="input_name"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox CssClass="style-txt-cpf" placeholder="CPF" runat="server" TabIndex="2" MaxLength="11" ID="input_cpf" Enabled="False" ReadOnly="True"></asp:TextBox>
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
                        <asp:TextBox CssClass="style-txt-zip" runat="server" MaxLength="8" placeholder="CEP" TabIndex="10" ID="input_zip"></asp:TextBox>
                        <asp:Button CssClass="style-bt-zip" runat="server" Font-Bold="True" Font-Size="Medium" TabIndex="11" Text="Buscar" OnClick="bt_zip_Click" ID="bt_zip" Enabled="False" />
                        <br />
                        <asp:TextBox CssClass="style-txt-address" runat="server" MaxLength="250" placeholder="Endereço" TabIndex="13" ID="input_address"></asp:TextBox>
                        <asp:TextBox CssClass="style-txt-address-number" runat="server" MaxLength="6" placeholder="Número" TabIndex="14" ID="input_address_number"></asp:TextBox>
                        <br />
                        <asp:TextBox CssClass="style-txt-neighborhood" runat="server" MaxLength="250" placeholder="Bairro" TabIndex="15" ID="input_neighborhood"></asp:TextBox>
                        <asp:TextBox CssClass="style-txt-city" runat="server" MaxLength="250" placeholder="Cidade" TabIndex="16" ID="input_city"></asp:TextBox>
                        <asp:TextBox CssClass="style-txt-state" runat="server" MaxLength="2" placeholder="Estado" TabIndex="17" ID="input_state"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox CssClass="style-txt-email" runat="server" MaxLength="250" placeholder="E-Mail" TabIndex="6" TextMode="Email" ID="input_email"></asp:TextBox>
                        <asp:TextBox CssClass="style-txt-password" runat="server" MaxLength="6" placeholder="Nova Senha" TabIndex="8" ID="input_password" ></asp:TextBox>
                        <br />
                        <asp:TextBox CssClass="style-txt-email" runat="server"  MaxLength="250" placeholder="Confirmar E-Mail" TabIndex="7" TextMode="Email" ID="input_email_confirm"></asp:TextBox>
                        <asp:TextBox CssClass="style-txt-password" runat="server" MaxLength="6" placeholder="Confirmar Senha" TabIndex="9" TextMode="Password" ID="input_password_confirm"></asp:TextBox>
                        <br />
                        </asp:Panel>
                    <asp:Panel CssClass="style-bt-user" runat="server" ID="bt_user_edit">                        
                        <asp:Button CssClass="style-bt-save" runat="server" Font-Bold="True" Font-Size="Medium" Text="Salvar" OnClick="bt_save_Click" Enabled="False" ID="bt_save" />
                        <asp:Button CssClass="style-bt-edit" runat="server"  Font-Bold="True" Font-Size="Medium" Text="Editar" OnClick="bt_edit_Click" ID="bt_edit" Enabled="False" />
                        <asp:Button CssClass="style-bt-delete" runat="server"  Font-Bold="True" Font-Size="Medium" Text="Excluir" OnClick="bt_delete_Click" Enabled="False" ID="bt_delete" />
                        <asp:Button CssClass="style-bt-cancel" runat="server"  Font-Bold="True" Font-Size="Medium" Text="Cancelar" OnClick="bt_cancel_Click" Enabled="False" ID="bt_cancel"/>
                    </asp:Panel>
                    <asp:Panel CssClass="style-panel-search" runat="server" ID="panel_search">
                        <br />
                        <asp:TextBox CssClass="style-txt-search" placeholder="Digite um Nome" runat="server" TabIndex="1" MaxLength="250" ID="input_search" ></asp:TextBox>
                        <asp:Button CssClass="style-bt-search" placeholder="Digite CPF para buscar" runat="server" Text="Buscar" TabIndex="2" ID="bt_search" OnClick="bt_search_Click" Font-Bold="True" Font-Size="Medium" />
                        <br />
                        <br />
                        <br />
                    </asp:Panel>                    
                    <asp:Panel CssClass="style-panel-tab" runat="server" ID="panel_tab">
                        <br />
                        <asp:GridView CssClass="style-gridview1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowCustomPaging="True" ShowFooter="True" ID="GridView1" Font-Bold="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                <asp:BoundField DataField="nome" HeaderText="Nome" />
                                <asp:BoundField DataField="cpf" HeaderText="CPF" />                            
                                <asp:CommandField ControlStyle-CssClass="style-gridview-bt" ButtonType="Button" ShowSelectButton="True" Visible="True" />
                            </Columns>
                            <EditRowStyle CssClass="style-gridview-edit-row" />
                            <FooterStyle CssClass="style-gridview-footer" />
                            <HeaderStyle CssClass="style-gridview-header" />
                            <PagerStyle CssClass="style-gridview-page" />
                            <RowStyle CssClass="style-gridview-row" />
                            <SelectedRowStyle CssClass="style-gridview-select-row" />
                            <SortedAscendingCellStyle CssClass="style-gridview-ascending-cell" />
                            <SortedAscendingHeaderStyle CssClass="style-gridview-ascending-header" />
                            <SortedDescendingCellStyle CssClass="style-gridview-descending-cell" />
                            <SortedDescendingHeaderStyle CssClass="style-gridview-descending-header" />
                        </asp:GridView>
                        <br />
                    </asp:Panel>
                    <asp:Panel CssClass="style-panel-bt" runat="server" BorderStyle="None" ID="panel_bt">
                        <asp:Button CssClass="style-bt-exit" runat="server" Text="Sair" TabIndex="3" PostBackUrl="~/script/login.aspx" Font-Bold="True" Font-Size="Medium" ID="bt_exit"/>
                    </asp:Panel>
                    <asp:Panel CssClass="style-panel-error" runat="server" BorderStyle="None" ID="panel_error">
                        <asp:Label runat="server" ForeColor="Red" ID="error"></asp:Label>
                    </asp:Panel>
                </td>
                <td class="tb-right">&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
