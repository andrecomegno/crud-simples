using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;
using MySql.Data.MySqlClient;
using CRUD.WSCorreios;

namespace CRUD.script
{
    public partial class panel_user : System.Web.UI.Page
    {
        static string id = "";
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewLogic();
            }

            BTlogic();
        }

        protected void bt_zip_Click(object sender, EventArgs e)
        {
            using (var ws = new WSCorreios.AtendeClienteClient())
            {
                try
                {
                    var resultado = ws.consultaCEP(input_zip.Text);
                    input_address.Text = resultado.end;
                    input_city.Text = resultado.cidade;
                    input_neighborhood.Text = resultado.bairro;
                    input_state.Text = resultado.uf;

                    error.Text = "";
                }
                catch
                {
                    if (String.IsNullOrEmpty(input_zip.Text))
                    {
                        error.Text = "* Preencha o seu CEP";
                        input_zip.Focus();
                        input_zip.Text = "";
                    }

                    error.Text = "CEP não encontrado !";
                }
            }
        }

        protected void bt_search_Click(object sender, EventArgs e)
        {
            try
            {
                database database = new database();
                database.openConnection();

                MySqlCommand cmd = new MySqlCommand("select id, nome, cpf from cadastro.pessoa where nome like @name '%' ", database.getConnection());
                cmd.Parameters.AddWithValue("@name", input_search.Text);

                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    input_search.Text = "";
                }
               
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);                
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {    
                database database = new database();
                database.openConnection();

                MySqlCommand cmd = new MySqlCommand("select pt.ID_PESSOA, pt.ID_TELEFONE, p.ENDERECO, t.TIPO, p.id, p.nome, p.cpf, t.DDD, t.NUMERO, tp.TIPO, e.CEP, e.LOGRADOURO, e.NUMERO, e.BAIRRO, e.CIDADE, e.ESTADO, p.email, p.senha from cadastro.pessoa p join cadastro.endereco e on p.ID = e.ID join cadastro.telefone t on t.ID = e.ID join cadastro.telefone_tipo tp on tp.ID = e.ID join cadastro.pessoa_telefone pt on pt.ID_PESSOA = p.ID", database.getConnection());
                DataTable dt = new DataTable();
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);                

                i = GridView1.SelectedIndex;

                id = dt.Rows[i][0].ToString();
                id = dt.Rows[i][1].ToString();
                id = dt.Rows[i][2].ToString();
                id = dt.Rows[i][3].ToString();
                id = dt.Rows[i][4].ToString();

                input_name.Text = dt.Rows[i][5].ToString();
                input_cpf.Text = dt.Rows[i][6].ToString();
                input_ddd.Text = dt.Rows[i][7].ToString();
                input_phone.Text = dt.Rows[i][8].ToString();
                input_phone_type.Text = dt.Rows[i][9].ToString();

                input_zip.Text = dt.Rows[i][10].ToString();
                input_address.Text = dt.Rows[i][11].ToString();
                input_address_number.Text = dt.Rows[i][12].ToString();
                input_neighborhood.Text = dt.Rows[i][13].ToString();
                input_city.Text = dt.Rows[i][14].ToString();
                input_state.Text = dt.Rows[i][15].ToString();

                input_email.Text = dt.Rows[i][16].ToString();
                input_password.Text = dt.Rows[i][17].ToString();

                bt_edit.Enabled = true;
                if (bt_edit.Enabled)
                {
                    bt_edit.CssClass = "style-bt-edit";
                }

                database.closeConnection();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        protected void bt_save_Click(object sender, EventArgs e)
        {
            SaveLogic();

            try
            {
                database database = new database();
                database.openConnection();

                MySqlCommand cmd = new MySqlCommand("update cadastro.pessoa p join cadastro.endereco e on p.ID = e.ID join cadastro.telefone t on t.ID = e.ID join cadastro.telefone_tipo tp on tp.ID = e.ID set p.nome=@name, p.cpf=@cpf, t.DDD=@ddd, t.NUMERO=@phoneNumber, tp.TIPO=@type, e.CEP=@cep, e.LOGRADOURO=@address, e.NUMERO=@address_n, e.BAIRRO=@neighborhood, e.CIDADE=@city, e.ESTADO=@state, p.email=@email, p.senha=@password where p.ID=@id", database.getConnection());

                cmd.Parameters.AddWithValue("@name", input_name.Text);
                cmd.Parameters.AddWithValue("@cpf", input_cpf.Text);
                cmd.Parameters.AddWithValue("@ddd", input_ddd.Text);
                cmd.Parameters.AddWithValue("@phoneNumber", input_phone.Text);
                cmd.Parameters.AddWithValue("@type", input_phone_type.Text);
                cmd.Parameters.AddWithValue("@cep", input_zip.Text);
                cmd.Parameters.AddWithValue("@address", input_address.Text);
                cmd.Parameters.AddWithValue("@address_n", input_address_number.Text);
                cmd.Parameters.AddWithValue("@neighborhood", input_neighborhood.Text);
                cmd.Parameters.AddWithValue("@city", input_city.Text);
                cmd.Parameters.AddWithValue("@state", input_state.Text);
                cmd.Parameters.AddWithValue("@email", input_email.Text);
                cmd.Parameters.AddWithValue("@password", input_password.Text);

                cmd.Parameters.AddWithValue("@id", id);

                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    GridView1.EditIndex = -1;
                    GridViewLogic();
                }

                database.closeConnection();
                error.ForeColor = System.Drawing.Color.Green;
                error.Text = "Cadastro atualizado com sucesso !";
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);                
            }
            finally
            {
                input_name.Text = "";
                input_cpf.Text = "";
                input_ddd.Text = "";
                input_phone.Text = "";
                input_phone_type.Text = "";
                input_zip.Text = "";
                input_address.Text = "";
                input_address_number.Text = "";
                input_neighborhood.Text = "";
                input_city.Text = "";
                input_state.Text = "";
                input_email.Text = "";
                input_email_confirm.Text = "";
                input_password.Text = "";
                input_password_confirm.Text = "";
                id = "";                
            }
        }

        protected void bt_edit_Click(object sender, EventArgs e)
        {
            panel_user_edit.Enabled = true;
            panel_tab.Enabled = false;

            bt_edit.Enabled = false;
            if (!bt_edit.Enabled)
            {
                bt_save.Enabled = true;
                bt_save.CssClass = "style-bt-save";

                bt_delete.Enabled = true;
                bt_delete.CssClass = "style-bt-delete";

                bt_cancel.Enabled = true;
                bt_cancel.CssClass = "style-bt-cancel";

                bt_edit.Enabled = false;
                bt_edit.CssClass = "style-bt-edit-off";

                bt_zip.Enabled = true;
                bt_zip.CssClass = "style-bt-zip";
            }

            error.Text = "";
        }

        protected void bt_delete_Click(object sender, EventArgs e)
        {
            DeleteLogic();

            try
            {
                database database = new database();
                database.openConnection();

                MySqlCommand cmdEndereco = new MySqlCommand("delete from cadastro.endereco where ID=@id", database.getConnection());
                cmdEndereco.Parameters.AddWithValue("@id", id);
                cmdEndereco.ExecuteNonQuery();

                MySqlCommand cmdPessoa = new MySqlCommand("delete from cadastro.pessoa where ID=@id and ENDERECO=@id", database.getConnection());
                cmdPessoa.Parameters.AddWithValue("@id", id);
                cmdPessoa.ExecuteNonQuery();

                MySqlCommand cmdTelefoneTipo = new MySqlCommand("delete from cadastro.telefone_tipo where ID=@id", database.getConnection());
                cmdTelefoneTipo.Parameters.AddWithValue("@id", id);
                cmdTelefoneTipo.ExecuteNonQuery();

                MySqlCommand cmdTelefone = new MySqlCommand("delete from cadastro.telefone where ID=@id and TIPO=@id", database.getConnection());
                cmdTelefone.Parameters.AddWithValue("@id", id);
                cmdTelefone.ExecuteNonQuery();

                MySqlCommand cmdPessoaTelefone = new MySqlCommand("delete from cadastro.pessoa_telefone where ID_PESSOA=@id and ID_TELEFONE=@id", database.getConnection());
                cmdPessoaTelefone.Parameters.AddWithValue("@id", id);
                cmdPessoaTelefone.ExecuteNonQuery();

                MySqlCommand cmd = new MySqlCommand("select p.ID, p.nome, p.cpf, t.DDD, t.NUMERO, tp.TIPO, p.email, p.senha, e.CEP, e.LOGRADOURO, e.NUMERO, e.BAIRRO, e.CIDADE, e.ESTADO from cadastro.pessoa p join cadastro.endereco e on p.ID = e.ID join cadastro.telefone t on t.ID = e.ID join cadastro.telefone_tipo tp on tp.ID = e.ID", database.getConnection());
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

                error.ForeColor = System.Drawing.Color.Red;
                error.Text = "Cadastro excluido com sucesso !";

                database.closeConnection();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);                
            }
            finally
            {
                input_name.Text = "";
                input_cpf.Text = "";
                input_ddd.Text = "";
                input_phone.Text = "";
                input_phone_type.Text = "";
                input_zip.Text = "";
                input_address.Text = "";
                input_address_number.Text = "";
                input_neighborhood.Text = "";
                input_city.Text = "";
                input_state.Text = "";
                input_email.Text = "";
                input_email_confirm.Text = "";
                input_password.Text = "";
                input_email_confirm.Text = "";
                id = "";
            }
        }

        protected void bt_cancel_Click(object sender, EventArgs e)
        {
            try
            {
                panel_user_edit.Enabled = false;
                panel_tab.Enabled = true;

                bt_edit.Enabled = true;
                if (bt_edit.Enabled)
                {
                    bt_save.Enabled = false;
                    bt_save.CssClass = "style-bt-save-off";

                    bt_delete.Enabled = false;
                    bt_delete.CssClass = "style-bt-delete-off";

                    bt_cancel.Enabled = false;
                    bt_cancel.CssClass = "style-bt-cancel-off";

                    bt_edit.Enabled = false;
                    bt_edit.CssClass = "style-bt-edit-off";

                    bt_zip.Enabled = false;
                    bt_zip.CssClass = "style-bt-zip-off";

                    input_name.Text = "";
                    input_cpf.Text = "";
                    input_ddd.Text = "";
                    input_phone.Text = "";
                    input_phone_type.Text = "";
                    input_zip.Text = "";
                    input_address.Text = "";
                    input_address_number.Text = "";
                    input_neighborhood.Text = "";
                    input_city.Text = "";
                    input_state.Text = "";
                    input_email.Text = "";
                    input_email_confirm.Text = "";
                    input_password.Text = "";
                    input_email_confirm.Text = "";
                    id = "";
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        protected void GridViewLogic()
        {
            database database = new database();
            database.openConnection();
            MySqlCommand cmd = new MySqlCommand("select p.ID, p.nome, p.cpf, t.DDD, t.NUMERO, tp.TIPO, p.email, p.senha, e.CEP, e.LOGRADOURO, e.NUMERO, e.BAIRRO, e.CIDADE, e.ESTADO from cadastro.pessoa p join cadastro.endereco e on p.ID = e.ID join cadastro.telefone t on t.ID = e.ID join cadastro.telefone_tipo tp on tp.ID = e.ID", database.getConnection());

            MySqlDataReader dt = cmd.ExecuteReader();
            if (dt.HasRows == true)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            GridView1.Columns[0].ItemStyle.Width = 20;
            GridView1.Columns[1].ItemStyle.Width = 300;
            GridView1.Columns[3].ItemStyle.Width = 110;            
        }

        protected void DeleteLogic()
        {
            panel_user_edit.Enabled = false;
            panel_tab.Enabled = true;

            bt_edit.Enabled = true;
            if (bt_edit.Enabled)
            {
                bt_save.Enabled = false;
                bt_save.CssClass = "style-bt-save-off";

                bt_delete.Enabled = false;
                bt_delete.CssClass = "style-bt-delete-off";

                bt_cancel.Enabled = false;
                bt_cancel.CssClass = "style-bt-cancel-off";

                bt_edit.Enabled = false;
                bt_edit.CssClass = "style-bt-edit-off";

                bt_zip.Enabled = false;
                bt_zip.CssClass = "style-bt-zip-off";
            }
        }

        protected void SaveLogic()
        {
            panel_user_edit.Enabled = false;
            panel_tab.Enabled = true;

            bt_edit.Enabled = true;
            if (bt_edit.Enabled)
            {
                bt_save.Enabled = false;
                bt_save.CssClass = "style-bt-save-off";

                bt_delete.Enabled = false;
                bt_delete.CssClass = "style-bt-delete-off";

                bt_cancel.Enabled = false;
                bt_cancel.CssClass = "style-bt-cancel-off";

                bt_edit.Enabled = false;
                bt_edit.CssClass = "style-bt-edit-off";

                bt_zip.Enabled = false;
                bt_zip.CssClass = "style-bt-zip-off";
            }
        }

        protected void BTlogic()
        {
            if (!bt_save.Enabled)
            {
                bt_save.CssClass = "style-bt-save-off";
            }

            if (!bt_delete.Enabled)
            {
                bt_delete.CssClass = "style-bt-delete-off";
            }

            if (!bt_cancel.Enabled)
            {
                bt_cancel.CssClass = "style-bt-cancel-off";
            }

            if (!bt_edit.Enabled)
            {
                bt_edit.CssClass = "style-bt-edit-off";
            }

            if (!bt_zip.Enabled)
            {
                bt_zip.CssClass = "style-bt-zip-off";
            }
        }

    }
}