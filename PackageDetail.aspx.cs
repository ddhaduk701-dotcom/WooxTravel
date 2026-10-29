using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace woox_travel_app_
{
    public partial class PackageDetail : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["WooxTravelDB"].ConnectionString;

        void getcon()
        {
            if (con == null || con.State == ConnectionState.Closed)
            {
                con = new SqlConnection(s);
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default travel date to tomorrow
                txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                string id = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(id))
                {
                    ViewState["pid"] = id;
                    filldetails(id);
                }
                else
                {
                    Response.Redirect("add package.aspx");
                }
            }
        }

        void filldetails(string id)
        {
            getcon();
            da = new SqlDataAdapter("Select * from TravelPackages where PackageId = " + id, con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];

                lblPackageName.Text  = row["PackageName"].ToString();
                lblLocation.Text     = row["Location"].ToString();
                lblDescription.Text  = row["Description"].ToString();
                lblDuration.Text     = row["Duration"].ToString();
                lblDurationSpec.Text = row["Duration"].ToString();

                // Strip any stray symbols – only keep digits, commas, dots
                string rawPrice   = row["Price"].ToString();
                string cleanPrice = System.Text.RegularExpressions.Regex.Replace(rawPrice, @"[^\d,\.]", "").Trim();
                lblPrice.Text = cleanPrice;

                // ── Gallery: use the package's own image for all 5 slots ──
                string imgUrl = row["ImageUrl"].ToString();
                if (string.IsNullOrEmpty(imgUrl))
                    imgUrl = "~/images/bali.jpg"; // safe fallback

                imgMain.ImageUrl = imgUrl;
                imgMain.AlternateText = row["PackageName"].ToString();

                thumb0.ImageUrl = imgUrl;  thumb0.AlternateText = row["PackageName"].ToString();
                thumb1.ImageUrl = imgUrl;  thumb1.AlternateText = row["PackageName"].ToString();
                thumb2.ImageUrl = imgUrl;  thumb2.AlternateText = row["PackageName"].ToString();
                thumb3.ImageUrl = imgUrl;  thumb3.AlternateText = row["PackageName"].ToString();
                thumb4.ImageUrl = imgUrl;  thumb4.AlternateText = row["PackageName"].ToString();
            }
            else
            {
                panelNotFound.Visible = true;
                panelContent.Visible  = false;
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (ViewState["pid"] != null)
            {
                string travelers = hfTravelers.Value;
                string date      = txtTravelDate.Text;
                Response.Redirect("reservation booking.aspx?id=" + ViewState["pid"].ToString()
                    + "&travelers=" + travelers + "&date=" + Server.UrlEncode(date));
            }
            else
            {
                Response.Redirect("add package.aspx");
            }
        }
    }
}
