using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace woox_travel_app_
{
    public partial class reservation_booking : System.Web.UI.Page
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
                string id        = Request.QueryString["id"];
                string travelers = Request.QueryString["travelers"];
                string date      = Request.QueryString["date"];

                // Pre-fill travel date and travelers from query string
                txtDate.Text      = date;
                txtTravelers.Text = travelers;
                lblDate.Text      = date;
                lblTravelers.Text = travelers + " person(s)";

                // Save to ViewState for use on button click
                ViewState["pid"]       = id;
                ViewState["travelers"] = travelers;
                ViewState["date"]      = date;

                // Fetch package details from DB
                if (!string.IsNullOrEmpty(id))
                {
                    getcon();
                    da = new SqlDataAdapter("Select * from TravelPackages where PackageId = " + id, con);
                    ds = new DataSet();
                    da.Fill(ds);
                    con.Close();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];

                        lblPkgName.Text  = row["PackageName"].ToString();
                        lblLocation.Text = row["Location"].ToString();
                        lblDuration.Text = row["Duration"].ToString();

                        // Clean price (remove stray symbols)
                        string rawPrice  = row["Price"].ToString();
                        string cleanPrice = System.Text.RegularExpressions.Regex.Replace(rawPrice, @"[^\d,\.]", "").Trim();
                        lblPriceEach.Text = cleanPrice;

                        // Calculate total
                        int numTravelers = 1;
                        int.TryParse(travelers, out numTravelers);
                        string numericOnly = System.Text.RegularExpressions.Regex.Replace(cleanPrice, @"[^\d]", "");
                        int priceVal = 0;
                        int.TryParse(numericOnly, out priceVal);
                        int total = priceVal * numTravelers;
                        lblTotal.Text = total.ToString("N0");
                    }
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Simple validation
            if (txtName.Text.Trim() == "" || txtEmail.Text.Trim() == "" || txtPhone.Text.Trim() == "")
            {
                lblMsg.Text = "Please fill in Name, Email, and Phone.";
                return;
            }

            string id         = ViewState["pid"] != null ? ViewState["pid"].ToString() : "0";
            string name       = txtName.Text.Trim();
            string email      = txtEmail.Text.Trim();
            string phone      = txtPhone.Text.Trim();
            string date       = txtDate.Text;
            string travelers  = txtTravelers.Text;
            string note       = txtNote.Text.Trim();

            try
            {
                getcon();

                // Insert booking
                string query = "INSERT INTO Bookings (PackageId, FullName, Email, Phone, TravelDate, Travelers, SpecialNote, BookedOn) VALUES (" +
                    id + ", '" + name + "', '" + email + "', '" + phone + "', '" + date + "', " + travelers + ", '" + note + "', GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                // Show success
                panelForm.Visible    = false;
                panelSuccess.Visible = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}