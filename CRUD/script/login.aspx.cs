using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace CRUD.script
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {                       
            
        }

        protected void bt_enter_Click(object sender, EventArgs e)
        {
            try
            {
                database database = new database();
                database.openConnection();

                MySqlCommand cmd = new MySqlCommand("select * from pessoa where email=@email and senha=@password", database.getConnection());

                cmd.Parameters.AddWithValue("@email",input_login.Text);
                cmd.Parameters.AddWithValue("@password", input_password.Text);                

                var v = cmd.ExecuteScalar();

                if( v != null)
                {
                    Response.Redirect("panel-user.aspx", false);
                }
                else
                {
                    if (String.IsNullOrEmpty(input_login.Text))
                    {
                        input_login.Focus();
                        error.Text = "Email em branco";
                    }
                    else if (String.IsNullOrEmpty(input_password.Text))
                    {
                        input_password.Focus();
                        error.Text = "Senha em branco";
                    }
                    else
                    {
                        error.Text = "Email / Senha não encontrada";
                    }
                    
                    
                }

                database.closeConnection();                
            }
            catch(System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}