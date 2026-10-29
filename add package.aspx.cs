using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace woox_travel_app_
{
    public partial class travel_packages : System.Web.UI.Page
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
                fillPackages();
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

        void fillPackages()
        {
            try
            {
                getcon();

                da = new SqlDataAdapter("Select * from TravelPackages", con);
                ds = new DataSet();
                da.Fill(ds);

                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<b style='color:red'>Error: " + ex.Message + "</b>");
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}