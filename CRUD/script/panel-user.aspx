<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel-user.aspx.cs" Inherits="CRUD.script.panel_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/panel-user.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <form id="form_panel_user" runat="server">
        <div class="div-main">
            <table class="tab-main">
            <tr>
                <td class="tb-left">&nbsp;</td>
                <td class="tb-center">
                    <asp:Panel CssClass="style-panel-user" runat="server" HorizontalAlign="Center">
                        <br />
                        <asp:TextBox CssClass="style-txt-search" runat="server"  TabIndex="1" MaxLength="250" ID="txt_search"></asp:TextBox>
                        <asp:Button CssClass="style-bt-search" placeholder="Digite CPF para buscar" runat="server" Text="Buscar" TabIndex="2" ID="bt_search"/>
                        <br />
                        <br />
                        <asp:GridView CssClass="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ID="GridView1" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="Codigo" />
                                <asp:BoundField DataField="Nome" HeaderText="Nome" />
                                <asp:BoundField DataField="CPF" HeaderText="CPF" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" Wrap="False" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:Button CssClass="style-bt-exit" runat="server"  TabIndex="3" Text="Sair" ID="bt_exit"/>
                        <asp:Button CssClass="style-bt-edit" runat="server"  TabIndex="4" Text="Editar" ID="bt_edit" />
                        <asp:Button CssClass="style-bt-delete" runat="server" TabIndex="5" Text="Deletar" ID="bt_delete"/>
                        <br />
                        <br />
                    </asp:Panel>
                </td>
                <td class="tb-right">&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
