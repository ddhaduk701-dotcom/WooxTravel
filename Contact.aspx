<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="woox_travel_app_.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us – WoOx Travel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f4f6f9; color: #333; }
        a { text-decoration: none; color: inherit; }

        /* NAVBAR */
        .navbar {
            background: rgba(20,20,40,0.95);
            display: flex; align-items: center; justify-content: space-between;
            padding: 18px 60px; position: fixed; top: 0; width: 100%; z-index: 1000;
        }
        .navbar .logo { font-size: 26px; font-weight: 700; color: #fff; }
        .navbar .logo span { color: #22b3c1; }
        .navbar ul { list-style: none; display: flex; gap: 32px; }
        .navbar ul li a { color: rgba(255,255,255,0.85); font-size: 14px; font-weight: 500; }
        .navbar ul li a:hover, .navbar ul li a.active { color: #22b3c1; }

        /* PAGE HEADER */
        .page-header {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            padding: 120px 60px 60px;
            text-align: center;
        }
        .page-header h1 { font-size: 42px; color: #fff; font-weight: 700; }
        .page-header p { color: rgba(255,255,255,0.7); margin-top: 10px; }

        /* CONTACT SECTION */
        .contact-section {
            max-width: 700px; margin: 50px auto; padding: 0 20px 60px;
        }
        .contact-card {
            background: #fff; border-radius: 16px;
            padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        .contact-card h2 { font-size: 24px; color: #1a1a2e; margin-bottom: 6px; }
        .contact-card p { color: #777; font-size: 14px; margin-bottom: 28px; }

        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 14px; font-weight: 500; color: #333; margin-bottom: 6px; }
        .form-group input, .form-group textarea {
            width: 100%; padding: 12px 16px; border: 1.5px solid #e0e0e0;
            border-radius: 8px; font-family: 'Poppins', sans-serif;
            font-size: 14px; outline: none; transition: border 0.3s;
        }
        .form-group input:focus, .form-group textarea:focus { border-color: #22b3c1; }
        .form-group textarea { height: 120px; resize: vertical; }

        .btn-submit {
            width: 100%; background: #22b3c1; color: #fff;
            border: none; padding: 14px; border-radius: 8px;
            font-family: 'Poppins', sans-serif; font-size: 15px;
            font-weight: 600; cursor: pointer; transition: 0.3s;
        }
        .btn-submit:hover { background: #178f9b; }

        .msg-success { color: green; font-weight: 600; margin-top: 16px; text-align: center; font-size: 15px; }
        .msg-error   { color: red;   font-weight: 600; margin-top: 16px; text-align: center; font-size: 15px; }

        /* INFO BOXES */
        .info-boxes {
            display: flex; gap: 20px; flex-wrap: wrap;
            max-width: 700px; margin: 0 auto 10px; padding: 0 20px;
        }
        .info-box {
            flex: 1; min-width: 180px; background: #fff;
            border-radius: 12px; padding: 24px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
            text-align: center;
        }
        .info-box i { font-size: 26px; color: #22b3c1; margin-bottom: 12px; }
        .info-box h4 { font-size: 15px; color: #1a1a2e; margin-bottom: 4px; }
        .info-box p  { font-size: 13px; color: #777; }

        footer {
            background: #1a1a2e; color: rgba(255,255,255,0.6);
            text-align: center; padding: 24px; font-size: 13px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="index.aspx" class="logo">Wo<span>Ox</span> Travel</a>
        <ul>
            <li><a href="index.aspx">Home</a></li>
            <li><a href="add package.aspx">Packages</a></li>
            <li><a href="reservation booking.aspx">Reservation</a></li>
            <li><a href="Contact.aspx" class="active">Contact Us</a></li>
            <li><a href="login.aspx">Login</a></li>
        </ul>
    </nav>

    <!-- PAGE HEADER -->
    <div class="page-header">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you. Send us a message!</p>
    </div>

    <!-- INFO BOXES -->
    <div class="info-boxes">
        <div class="info-box">
            <i class="fas fa-phone"></i>
            <h4>Phone</h4>
            <p>+91 98765 43210</p>
        </div>
        <div class="info-box">
            <i class="fas fa-envelope"></i>
            <h4>Email</h4>
            <p>info@wooxtravel.com</p>
        </div>
        <div class="info-box">
            <i class="fas fa-map-marker-alt"></i>
            <h4>Address</h4>
            <p>Ahmedabad, Gujarat</p>
        </div>
    </div>

    <!-- CONTACT FORM -->
    <div class="contact-section">
        <div class="contact-card">
            <h2>Send a Message</h2>
            <p>Fill the form below and we'll get back to you soon.</p>

            <div class="form-group">
                <label>Your Name</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name" />
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email" />
            </div>
            <div class="form-group">
                <label>Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" placeholder="Enter subject" />
            </div>
            <div class="form-group">
                <label>Message</label>
                <asp:TextBox ID="txtMessage" runat="server" placeholder="Write your message..." TextMode="MultiLine" />
            </div>

            <asp:Button ID="btnSend" runat="server" Text="Send Message"
                CssClass="btn-submit" OnClick="btnSend_Click" />

            <asp:Label ID="lblResult" runat="server" Text="" CssClass="msg-success" />
        </div>
    </div>

    <footer>
        <p>Copyright &copy; 2026 <a href="#">WoOx Travel</a>. All rights reserved.</p>
    </footer>

</form>
</body>
</html>
