using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace woox_travel_app_
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["WooxTravelDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["registered"] == "true")
                {
                    lblMessage.Text = "Account created successfully! Please login.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(s);
                con.Open();

                string sql = "SELECT COUNT(*) FROM Users WHERE Email='"
                 + txtEmail.Text +
                 "' AND PasswordHash='"
                 + txtPassword.Text + "'";

                cmd = new SqlCommand(sql, con);

                int i = Convert.ToInt32(cmd.ExecuteScalar());

                con.Close();

                if (i > 0)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("Invalid username or Password");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnGoogle_Click(object sender, EventArgs e)
        {
            Response.Write("Google Login button clicked");
        }
    }
}