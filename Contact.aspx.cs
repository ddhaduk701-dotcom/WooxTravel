using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace woox_travel_app_
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name    = txtName.Text.Trim();
            string email   = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (name == "" || email == "" || message == "")
            {
                lblResult.Text = "Please fill all required fields.";
                lblResult.CssClass = "msg-error";
                return;
            }

            try
            {
                SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["WooxTravelDB"].ConnectionString);
                con.Open();

                string sql = "INSERT INTO ContactMessages (Name, Email, Subject, Message, SentOn) " +
                             "VALUES (@name, @email, @subject, @msg, @date)";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name",    name);
                cmd.Parameters.AddWithValue("@email",   email);
                cmd.Parameters.AddWithValue("@subject", subject);
                cmd.Parameters.AddWithValue("@msg",     message);
                cmd.Parameters.AddWithValue("@date",    DateTime.Now);

                cmd.ExecuteNonQuery();
                con.Close();

                lblResult.Text = "✅ Message sent successfully! We'll get back to you soon.";
                lblResult.CssClass = "msg-success";

                txtName.Text    = "";
                txtEmail.Text   = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
                lblResult.CssClass = "msg-error";
            }
        }
    }
}