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
            fillgrid();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("Select * from Users", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

            getcon();

            cmd = new SqlCommand("insert into Users(FullName, Email, Phone, PasswordHash) " +
                "Values('" + txtFullName.Text + "', '" + txtEmail.Text + "', '" +
                txtPhone.Text + "', '" + txtPassword.Text + "')", con);

            cmd.ExecuteNonQuery();

            con.Close();

            clear();
            fillgrid();
        }
    
    }
}


            
       
            