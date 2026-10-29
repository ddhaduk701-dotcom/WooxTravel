<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add package.aspx.cs" Inherits="woox_travel_app_.travel_packages" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Travel Packages – WoOx Travel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f4f6f9; }
        a { text-decoration: none; color: inherit; }

        .navbar {
            background: rgba(20,20,40,0.97);
            display: flex; align-items: center; justify-content: space-between;
            padding: 18px 60px; position: fixed; top: 0; width: 100%; z-index: 1000;
        }
        .navbar .logo { font-size: 26px; font-weight: 700; color: #fff; }
        .navbar .logo span { color: #22b3c1; }
        .navbar ul { list-style: none; display: flex; gap: 32px; }
        .navbar ul li a { color: rgba(255,255,255,0.85); font-size: 14px; font-weight: 500; }
        .navbar ul li a:hover, .navbar ul li a.active { color: #22b3c1; }

        .page-title { text-align: center; padding: 100px 0 10px; font-size: 36px; color: #222; }
        .page-subtitle { text-align: center; color: #777; margin-bottom: 40px; }

        .packages-container {
            width: 90%; max-width: 1200px; margin: auto;
            display: grid; grid-template-columns: repeat(3,1fr);
            gap: 25px; padding-bottom: 50px;
        }
        .package-card {
            background: white; border-radius: 12px; overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.12); transition: 0.3s;
        }
        .package-card:hover { transform: translateY(-7px); }
        .package-card img { width: 100%; height: 210px; object-fit: cover; }
        .package-content { padding: 20px; }
        .package-content h2 { font-size: 23px; color: #222; margin-bottom: 8px; }
        .location { color: #22b3c1; font-size: 15px; margin-bottom: 12px; }
        .description { color: #777; font-size: 14px; line-height: 1.6; margin-bottom: 18px; }
        .package-details { display: flex; justify-content: space-between; align-items: center; border-top: 1px solid #eee; padding-top: 15px; }
        .duration { color: #555; font-size: 14px; }
        .price { color: #22b3c1; font-size: 20px; font-weight: bold; }
        .book-btn { width: 100%; margin-top: 18px; padding: 12px; background: #22b3c1; color: white; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; }
        .book-btn:hover { background: #178f9b; }
        footer { background: #1a1a2e; color: rgba(255,255,255,0.6); text-align: center; padding: 24px; font-size: 13px; }
        @media(max-width:900px) { .packages-container { grid-template-columns: repeat(2,1fr); } }
        @media(max-width:600px) { .packages-container { grid-template-columns: 1fr; } .navbar { padding: 16px 20px; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- NAVBAR -->
        <nav class="navbar">
            <a href="index.aspx" class="logo">Wo<span>Ox</span> Travel</a>
            <ul>
                <li><a href="index.aspx">Home</a></li>
                <li><a href="add package.aspx" class="active">Packages</a></li>
                <li><a href="reservation booking.aspx">Reservation</a></li>
                <li><a href="Contact.aspx">Contact Us</a></li>
                <li><a href="login.aspx">Login</a></li>
            </ul>
        </nav>

        <h1 class="page-title">Our Travel Packages</h1>
        <p class="page-subtitle">Explore the world with our best travel packages</p>

        <div class="packages-container">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="package-card">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("PackageName") %>' />

                        <div class="package-content">
                            <h2><%# Eval("PackageName") %></h2>

                            <div class="location">
                                <%# Eval("Location") %>
                            </div>

                            <p class="description">
                                <%# Eval("Description") %>
                            </p>

                            <div class="package-details">
                                <span class="duration">
                                    <%# Eval("Duration") %>
                                </span>

                                <span class="price">
                                    <%# Eval("Price") %>
                                </span>
                            </div>

                            <a href='PackageDetail.aspx?id=<%# Eval("PackageId") %>' class="book-btn" style="display:block;text-align:center;text-decoration:none;padding:12px;">
                                View Detail
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <footer>
            <p>Copyright &copy; 2026 <a href="index.aspx" style="color:#22b3c1;">WoOx Travel</a>. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>