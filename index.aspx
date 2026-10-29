<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="woox_travel_app_.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Woox Travel – Explore The World</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* ========== RESET & BASE ========== */
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f4f6f9; color: #333; }
        a { text-decoration: none; color: inherit; }
        img { display: block; max-width: 100%; }

        /* ========== NAV ========== */
        .navbar {
            position: fixed; top: 0; width: 100%; z-index: 1000;
            background: rgba(20, 20, 40, 0.85);
            backdrop-filter: blur(10px);
            display: flex; align-items: center; justify-content: space-between;
            padding: 18px 60px;
            transition: background 0.3s;
        }
        .navbar.scrolled { background: rgba(20, 20, 40, 0.98); }
        .navbar .logo {
            font-size: 26px; font-weight: 700; color: #fff; letter-spacing: 1px;
        }
        .navbar .logo span { color: #22b3c1; }
        .navbar ul { list-style: none; display: flex; gap: 32px; }
        .navbar ul li a {
            color: rgba(255,255,255,0.85); font-size: 14px; font-weight: 500;
            padding-bottom: 4px; border-bottom: 2px solid transparent; transition: 0.3s;
        }
        .navbar ul li a:hover,
        .navbar ul li a.active { color: #22b3c1; border-bottom-color: #22b3c1; }

        /* ========== HERO ========== */
        .hero {
            height: 100vh;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            display: flex; flex-direction: column;
            align-items: center; justify-content: center;
            text-align: center; padding: 0 20px;
            position: relative; overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute; inset: 0;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600') center/cover no-repeat;
            opacity: 0.25;
        }
        .hero-content { position: relative; z-index: 1; }
        .hero-content .badge {
            display: inline-block;
            background: rgba(34,179,193,0.2);
            border: 1px solid #22b3c1;
            color: #22b3c1; font-size: 13px; font-weight: 600;
            padding: 6px 18px; border-radius: 50px; margin-bottom: 20px;
            letter-spacing: 2px; text-transform: uppercase;
        }
        .hero-content h1 {
            font-size: clamp(36px, 6vw, 72px);
            font-weight: 700; color: #fff;
            line-height: 1.15; margin-bottom: 18px;
        }
        .hero-content h1 span { color: #22b3c1; }
        .hero-content p {
            color: rgba(255,255,255,0.7); font-size: 17px; max-width: 560px;
            margin: 0 auto 36px;
        }

        /* ========== SEARCH BAR ========== */
        .search-bar {
            display: flex; background: #fff; border-radius: 50px;
            overflow: hidden; box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            max-width: 560px; width: 100%; margin: 0 auto;
        }
        .search-bar .icon {
            padding: 0 20px; display: flex; align-items: center;
            color: #22b3c1; font-size: 18px;
        }
        .search-bar input[type="text"] {
            flex: 1; border: none; outline: none;
            font-family: 'Poppins', sans-serif;
            font-size: 15px; color: #333; padding: 14px 0;
            background: transparent;
        }
        .search-bar input[type="text"]::placeholder { color: #aaa; }
        .search-bar button {
            background: #22b3c1; color: #fff; border: none;
            padding: 14px 30px; font-size: 14px; font-weight: 600;
            cursor: pointer; transition: background 0.3s; letter-spacing: 0.5px;
        }
        .search-bar button:hover { background: #178f9b; }

        /* ========== STATS STRIP ========== */
        .stats-strip {
            background: #fff; padding: 30px 60px;
            display: flex; justify-content: space-around; flex-wrap: wrap;
            box-shadow: 0 4px 20px rgba(0,0,0,0.07);
        }
        .stat-item { text-align: center; padding: 10px 20px; }
        .stat-item .num {
            font-size: 32px; font-weight: 700; color: #22b3c1;
        }
        .stat-item .lbl {
            font-size: 13px; color: #777; margin-top: 4px;
        }

        /* ========== SECTION HEADERS ========== */
        .section { padding: 70px 60px; }
        .section-header { text-align: center; margin-bottom: 48px; }
        .section-header .sub {
            display: inline-block; background: rgba(34,179,193,0.1);
            color: #22b3c1; font-size: 12px; font-weight: 600;
            padding: 5px 16px; border-radius: 50px; letter-spacing: 1.5px;
            text-transform: uppercase; margin-bottom: 12px;
        }
        .section-header h2 {
            font-size: clamp(26px, 4vw, 40px); font-weight: 700; color: #1a1a2e;
        }
        .section-header p {
            color: #777; font-size: 15px; margin-top: 12px; max-width: 500px; margin-left: auto; margin-right: auto;
        }

        /* ========== PACKAGES GRID ========== */
        .packages-grid {
            max-width: 1200px;
            margin: 0 auto;
        }
        .packages-grid table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 24px;
        }
        .packages-grid td {
            vertical-align: top;
            width: 33.33%;
        }

        /* ========== PACKAGE CARD ========== */
        .pkg-card {
            background: #fff; border-radius: 16px;
            overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.09);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex; flex-direction: column;
        }
        .pkg-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(34,179,193,0.18);
        }
        .pkg-card .img-wrap {
            position: relative; overflow: hidden; height: 220px;
        }
        .pkg-card .img-wrap img {
            width: 100%; height: 100%; object-fit: cover;
            transition: transform 0.5s;
        }
        .pkg-card:hover .img-wrap img { transform: scale(1.07); }
        .pkg-card .img-wrap .badge-price {
            position: absolute; top: 14px; right: 14px;
            background: #22b3c1; color: #fff;
            font-size: 14px; font-weight: 700;
            padding: 6px 14px; border-radius: 50px;
        }
        .pkg-card .card-body { padding: 22px; flex: 1; display: flex; flex-direction: column; }
        .pkg-card .card-body h3 {
            font-size: 19px; font-weight: 700; color: #1a1a2e; margin-bottom: 6px;
        }
        .pkg-card .card-body .loc {
            font-size: 13px; color: #22b3c1; margin-bottom: 10px;
            display: flex; align-items: center; gap: 5px;
        }
        .pkg-card .card-body .desc {
            font-size: 13.5px; color: #777; line-height: 1.65;
            flex: 1; margin-bottom: 18px;
            display: -webkit-box; -webkit-line-clamp: 3;
            -webkit-box-orient: vertical; overflow: hidden;
        }
        .pkg-card .meta {
            display: flex; align-items: center; gap: 16px;
            font-size: 13px; color: #666; margin-bottom: 18px;
        }
        .pkg-card .meta span { display: flex; align-items: center; gap: 6px; }
        .pkg-card .meta i { color: #22b3c1; }
        .pkg-card .card-actions { display: flex; gap: 10px; }
        .btn-view, .btn-book {
            flex: 1; padding: 11px; border: none; border-radius: 8px;
            font-family: 'Poppins', sans-serif; font-size: 13px;
            font-weight: 600; cursor: pointer; transition: 0.3s;
        }
        .btn-view {
            background: #f0f9fa; color: #22b3c1;
            border: 1.5px solid #22b3c1;
        }
        .btn-view:hover { background: #22b3c1; color: #fff; }
        .btn-book { background: #22b3c1; color: #fff; }
        .btn-book:hover { background: #178f9b; }

        /* ========== NO PACKAGES FALLBACK ========== */
        .no-packages {
            text-align: center; padding: 60px 20px; color: #999; font-size: 16px;
        }

        /* ========== CTA BANNER ========== */
        .cta-section {
            background: linear-gradient(135deg, #22b3c1, #178f9b);
            padding: 70px 60px; text-align: center;
        }
        .cta-section h2 { font-size: 36px; color: #fff; font-weight: 700; margin-bottom: 12px; }
        .cta-section p { color: rgba(255,255,255,0.85); font-size: 16px; margin-bottom: 30px; }
        .cta-btn {
            display: inline-block; background: #fff; color: #22b3c1;
            font-weight: 700; font-size: 15px; padding: 14px 40px;
            border-radius: 50px; transition: 0.3s;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        .cta-btn:hover { background: #1a1a2e; color: #fff; }

        /* ========== FOOTER ========== */
        footer {
            background: #1a1a2e; color: rgba(255,255,255,0.6);
            text-align: center; padding: 28px 20px; font-size: 13.5px;
        }
        footer a { color: #22b3c1; }

        /* ========== RESPONSIVE ========== */
        @media(max-width: 768px) {
            .navbar { padding: 16px 24px; }
            .navbar ul { display: none; }
            .section { padding: 50px 24px; }
            .stats-strip { padding: 20px; }
            .cta-section { padding: 50px 24px; }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar" id="mainNav">
        <a href="index.aspx" class="logo">Wo<span>Ox</span> Travel</a>
        <ul>
            <li><a href="index.aspx" class="active">Home</a></li>
            <li><a href="add package.aspx">Packages</a></li>
            <li><a href="reservation booking.aspx">Reservation</a></li>
            <li><a href="Contact.aspx">Contact Us</a></li>
            <li><a href="login.aspx">Login</a></li>
        </ul>
    </nav>

    <!-- ===== HERO SECTION ===== -->
    <section class="hero">
        <div class="hero-content">
            <div class="badge">✈ Discover The World</div>
            <h1>Travel Beyond<br/><span>Your Imagination</span></h1>
            <p>Handpicked travel packages for every dream destination. Book easily, travel worry-free.</p>

            <!-- Search Bar -->
            <div class="search-bar">
                <div class="icon"><i class="fas fa-search"></i></div>
                <asp:TextBox ID="txtSearchLocation" runat="server"
                    placeholder="Search destinations, packages..."
                    CssClass="" />
                <asp:Button ID="btnSearchHome" runat="server" Text="Search"
                    OnClick="btnSearchHome_Click" />
            </div>
        </div>
    </section>

    <!-- ===== STATS STRIP ===== -->
    <div class="stats-strip">
        <div class="stat-item">
            <div class="num">200+</div>
            <div class="lbl">Destinations</div>
        </div>
        <div class="stat-item">
            <div class="num">15K+</div>
            <div class="lbl">Happy Travellers</div>
        </div>
        <div class="stat-item">
            <div class="num">50+</div>
            <div class="lbl">Tour Packages</div>
        </div>
        <div class="stat-item">
            <div class="num">10+</div>
            <div class="lbl">Years Experience</div>
        </div>
    </div>

    <!-- ===== FEATURED PACKAGES ===== -->
    <section class="section" id="resultsSection" style="background:#f4f6f9;">
        <div class="section-header">
            <div class="sub">Hot Picks</div>
            <h2><asp:Label ID="lblSectionTitle" runat="server" Text="Featured Travel Packages" /></h2>
            <p>Explore our latest, most popular packages curated just for you.</p>
        </div>

        <div class="packages-grid">
            <asp:DataList ID="dlDestinations" runat="server"
                RepeatLayout="Table"
                RepeatColumns="3"
                RepeatDirection="Horizontal"
                OnItemCommand="dlDestinations_ItemCommand">
                <ItemTemplate>
                    <div class="pkg-card">
                        <div class="img-wrap">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("PackageName") %>' />
                            <div class="badge-price">&#8377;<%# Eval("Price") %></div>
                        </div>
                        <div class="card-body">
                            <h3><%# Eval("PackageName") %></h3>
                            <div class="loc">
                                <i class="fas fa-map-marker-alt"></i>
                                <%# Eval("Location") %>
                            </div>
                            <p class="desc"><%# Eval("Description") %></p>
                            <div class="meta">
                                <span><i class="fas fa-clock"></i> <%# Eval("Duration") %></span>
                            </div>
                            <div class="card-actions">
                                <asp:Button CssClass="btn-view"
                                    runat="server" Text="View Details"
                                    CommandName="cmd_pkgid"
                                    CommandArgument='<%# Eval("PackageId") %>' />
                                <asp:Button CssClass="btn-book"
                                    runat="server" Text="Book Now"
                                    CommandName="cmd_book"
                                    CommandArgument='<%# Eval("PackageId") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <%-- Fallback if no packages --%>
        <asp:Label ID="lblNoPackages" runat="server" Visible="false"
            Text="No packages available at the moment. Please check back later."
            CssClass="no-packages" />

        <!-- View All link -->
        <div style="text-align:center; margin-top:40px;">
            <a href="add package.aspx" style="background:#22b3c1;color:#fff;padding:13px 36px;border-radius:50px;font-weight:600;font-size:15px;transition:0.3s;">
                View All Packages &nbsp;<i class="fas fa-arrow-right"></i>
            </a>
        </div>
    </section>

    <!-- ===== CTA SECTION ===== -->
    <section class="cta-section">
        <h2>Ready For Your Next Adventure?</h2>
        <p>Don't wait — book your dream vacation today and create memories for a lifetime.</p>
        <a href="reservation booking.aspx" class="cta-btn">Book Yours Now ✈</a>
    </section>

    <!-- ===== FOOTER ===== -->
    <footer>
        <p>Copyright &copy; 2036 <a href="#">WoOx Travel</a> Company. All rights reserved.</p>
    </footer>

</form>

<script>
    // Navbar scroll effect
    window.addEventListener('scroll', function () {
        var nav = document.getElementById('mainNav');
        if (window.scrollY > 50) nav.classList.add('scrolled');
        else nav.classList.remove('scrolled');
    });
</script>
</body>
</html>
