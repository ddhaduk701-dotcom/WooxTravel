using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace woox_travel_app_
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["WooxTravelDB"].ConnectionString);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadFeaturedPackages();
            }
        }

        void loadFeaturedPackages()
        {
            getcon();
            da = new SqlDataAdapter("SELECT TOP 6 * FROM TravelPackages ORDER BY PackageId DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                dlDestinations.DataSource = ds;
                dlDestinations.DataBind();
                lblNoPackages.Visible = false;
            }
            else
            {
                dlDestinations.DataSource = null;
                dlDestinations.DataBind();
                lblNoPackages.Visible = true;
            }
        }

        protected void btnSearchHome_Click(object sender, EventArgs e)
        {
            string search = txtSearchLocation.Text.Trim();
            if (!string.IsNullOrEmpty(search))
            {
                searchPackages(search);
                // scroll to results
                ClientScript.RegisterStartupScript(GetType(), "scroll", "setTimeout(function(){ document.getElementById('resultsSection').scrollIntoView({behavior:'smooth'}); }, 200);", true);
            }
            else
            {
                loadFeaturedPackages();
            }
        }

        void searchPackages(string keyword)
        {
            getcon();
            string sql = @"SELECT * FROM TravelPackages 
                           WHERE PackageName LIKE @kw 
                              OR Location LIKE @kw 
                              OR Description LIKE @kw
                           ORDER BY PackageId DESC";
            da = new SqlDataAdapter(sql, con);
            da.SelectCommand.Parameters.AddWithValue("@kw", "%" + keyword + "%");
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                dlDestinations.DataSource = ds;
                dlDestinations.DataBind();
                lblNoPackages.Visible = false;
                lblSectionTitle.Text = "Search Results for &ldquo;" + keyword + "&rdquo;";
            }
            else
            {
                dlDestinations.DataSource = null;
                dlDestinations.DataBind();
                lblNoPackages.Visible = true;
                lblNoPackages.Text = "No packages found for \"" + keyword + "\". Try a different keyword.";
                lblSectionTitle.Text = "Search Results";
            }
        }

        protected void dlDestinations_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            ViewState["pid"] = id;

            if (e.CommandName == "cmd_pkgid")
            {
                Response.Redirect("PackageDetail.aspx?id=" + id.ToString());
            }
            else if (e.CommandName == "cmd_book")
            {
                Response.Redirect("reservation booking.aspx?pkgId=" + id.ToString());
            }
        }
    }
}