using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace woox_travel_app_
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["WooxTravelDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void getcon()
        {
            if (con == null || con.State == ConnectionState.Closed)
            {
                con = new SqlConnection(s);
                con.Open();
            }
        }

        void fillgrid()
        {
            try
            {
                getcon();

                da = new SqlDataAdapter("Select * from Users", con);
                ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<b style='color:red'>DB Error: " + ex.Message + "</b>");
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            try
            {
                getcon();

                // Check if email already exists
                SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email='" + txtEmail.Text + "'", con);
                int exists = Convert.ToInt32(cmdCheck.ExecuteScalar());

                if (exists > 0)
                {
                    Response.Write("<script>alert('This email is already registered.'); window.location='login.aspx';</script>");
                    con.Close();
                    return;
                }

                cmd = new SqlCommand("insert into Users(FullName, Email, Phone, PasswordHash) " +
                    "Values('" + txtFullName.Text + "', '" + txtEmail.Text + "', '" +
                    txtPhone.Text + "', '" + txtPassword.Text + "')", con);

                cmd.ExecuteNonQuery();

                con.Close();

                clear();
                fillgrid();
                Response.Redirect("login.aspx?registered=true");
            }
            catch (Exception ex)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                Response.Write("<script>alert('" + ex.Message.Replace("'", "\\'").Replace("\r", " ").Replace("\n", " ") + "');</script>");
            }
        }
    }
}