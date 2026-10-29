<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackageDetail.aspx.cs" Inherits="woox_travel_app_.PackageDetail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Package Details - Woox Travel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <style>
        :root {
            --brand-navy:      #0f172a;
            --brand-blue:      #22b3c1;
            --brand-blue-dark: #178f9b;
            --brand-light:     #f0fbfc;
            --text-dark:       #1e293b;
            --text-muted:      #64748b;
            --border:          #e2e8f0;
            --white:           #ffffff;
        }

        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', Arial, sans-serif;
            background: #f1f5f9;
            color: var(--text-dark);
        }

        /* ── TOP NAV ─────────────────────────────── */
        .top-nav {
            background: var(--brand-navy);
            padding: 0 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 62px;
            position: sticky;
            top: 0;
            z-index: 999;
            box-shadow: 0 2px 12px rgba(0,0,0,.3);
        }
        .nav-logo {
            font-size: 22px;
            font-weight: 800;
            color: var(--brand-blue);
            text-decoration: none;
            letter-spacing: -0.5px;
        }
        .nav-logo span { color: #fff; }
        .nav-links { display: flex; gap: 28px; list-style: none; }
        .nav-links a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color .2s;
        }
        .nav-links a:hover { color: var(--brand-blue); }

        /* ── PAGE WRAPPER ────────────────────────── */
        .pkg-wrapper {
            max-width: 1200px;
            margin: 32px auto 60px;
            padding: 0 20px;
        }

        /* ── HERO BANNER ─────────────────────────── */
        .hero-banner {
            position: relative;
            background: linear-gradient(135deg, #0f172a 0%, #1e3a5f 50%, #178f9b 100%);
            border-radius: 22px;
            padding: 36px 40px 90px;
            color: #fff;
            overflow: hidden;
            box-shadow: 0 14px 40px rgba(15,23,42,.25);
            margin-bottom: 28px;
        }
        .hero-skyline {
            position: absolute;
            bottom: 0; left: 0;
            width: 100%; height: 85px;
            pointer-events: none;
            opacity: .8;
        }
        .btn-back-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255,255,255,.14);
            border: 1px solid rgba(255,255,255,.25);
            color: #fff;
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 600;
            backdrop-filter: blur(6px);
            transition: all .2s;
            margin-bottom: 18px;
        }
        .btn-back-pill:hover {
            background: rgba(255,255,255,.25);
            transform: translateX(-3px);
            color: #fff;
        }
        .hero-badge {
            display: inline-block;
            background: #f59e0b;
            color: #fff;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: .8px;
            text-transform: uppercase;
            padding: 5px 14px;
            border-radius: 20px;
            margin-bottom: 14px;
            box-shadow: 0 4px 10px rgba(245,158,11,.35);
        }
        .hero-title {
            font-size: 36px;
            font-weight: 800;
            color: #fff;
            margin: 0 0 18px;
            letter-spacing: -.5px;
            text-shadow: 0 2px 10px rgba(0,0,0,.25);
        }
        .hero-meta-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            position: relative;
            z-index: 2;
        }
        .meta-pill {
            background: rgba(255,255,255,.16);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,.25);
            color: #fff;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        /* ── 2-COL LAYOUT ────────────────────────── */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 370px;
            gap: 28px;
            align-items: start;
        }
        @media (max-width: 960px) {
            .details-grid { grid-template-columns: 1fr; }
        }

        /* ── GALLERY CARD ────────────────────────── */
        .gallery-card {
            background: var(--white);
            border-radius: 18px;
            border: 1px solid var(--border);
            padding: 14px;
            margin-bottom: 22px;
            box-shadow: 0 4px 14px rgba(0,0,0,.04);
        }
        .main-img-viewport {
            position: relative;
            width: 100%;
            height: 400px;
            border-radius: 14px;
            overflow: hidden;
            background: #1e293b;
        }
        .main-pkg-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform .4s ease;
        }
        .gallery-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px; height: 40px;
            border-radius: 50%;
            background: #fff;
            color: var(--text-dark);
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0,0,0,.2);
            transition: all .2s;
            z-index: 5;
        }
        .gallery-nav:hover { background: #f1f5f9; transform: translateY(-50%) scale(1.08); }
        .gallery-nav.prev { left: 14px; }
        .gallery-nav.next { right: 14px; }
        .img-caption {
            position: absolute;
            bottom: 14px; left: 14px;
            background: rgba(15,23,42,.75);
            backdrop-filter: blur(6px);
            color: #fff;
            padding: 5px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .img-counter {
            position: absolute;
            bottom: 14px; right: 14px;
            background: rgba(255,255,255,.9);
            color: var(--brand-navy);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        /* Thumbnails */
        .thumbs-row {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            margin-top: 12px;
        }
        .thumb-item {
            height: 70px;
            border-radius: 10px;
            overflow: hidden;
            cursor: pointer;
            border: 2.5px solid transparent;
            transition: all .22s;
        }
        .thumb-item img { width: 100%; height: 100%; object-fit: cover; display: block; }
        .thumb-item.active {
            border-color: var(--brand-blue);
            box-shadow: 0 0 0 3px rgba(34,179,193,.22);
            transform: translateY(-2px);
        }
        .thumb-item:hover { transform: translateY(-2px); }

        /* ── DESCRIPTION CARD ───────────────────── */
        .desc-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 24px 26px;
            margin-bottom: 22px;
            box-shadow: 0 4px 14px rgba(0,0,0,.04);
        }
        .desc-card h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
            color: var(--text-dark);
        }
        .desc-text {
            font-size: 14px;
            color: var(--text-muted);
            line-height: 1.75;
        }

        /* ── SPEC CARDS (3 per row) ──────────────── */
        .spec-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 22px;
        }
        @media (max-width: 600px) { .spec-grid { grid-template-columns: repeat(2,1fr); } }
        .spec-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all .22s;
        }
        .spec-card:hover {
            border-color: var(--brand-blue);
            background: var(--brand-light);
            transform: translateY(-2px);
            box-shadow: 0 6px 14px rgba(34,179,193,.1);
        }
        .spec-icon {
            width: 40px; height: 40px;
            border-radius: 10px;
            background: var(--brand-light);
            color: var(--brand-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
            flex-shrink: 0;
            transition: .2s;
        }
        .spec-card:hover .spec-icon { background: var(--brand-blue); color: #fff; }
        .spec-label { font-size: 11px; color: var(--text-muted); font-weight: 700; text-transform: uppercase; letter-spacing: .5px; margin-bottom: 2px; }
        .spec-val   { font-size: 13px; font-weight: 700; color: var(--text-dark); }

        /* ── TAB SECTION ─────────────────────────── */
        .tabs-nav {
            display: flex;
            gap: 8px;
            margin-bottom: 20px;
            border-bottom: 1px solid var(--border);
            padding-bottom: 12px;
        }
        .tab-btn {
            background: #f1f5f9;
            color: var(--text-muted);
            border: none;
            padding: 8px 22px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s;
            font-family: inherit;
        }
        .tab-btn.active { background: var(--brand-navy); color: #fff; box-shadow: 0 4px 12px rgba(15,23,42,.2); }
        .tab-panel { display: none; }
        .tab-panel.active { display: block; }

        /* Itinerary */
        .itin-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 18px 20px;
            margin-bottom: 12px;
            transition: all .22s;
        }
        .itin-card:hover { border-color: var(--brand-blue); box-shadow: 0 6px 16px rgba(0,0,0,.05); }
        .itin-header { display: flex; align-items: center; gap: 14px; }
        .day-circle {
            width: 36px; height: 36px;
            border-radius: 50%;
            background: var(--brand-blue);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
            flex-shrink: 0;
            box-shadow: 0 3px 8px rgba(34,179,193,.3);
        }
        .day-label { font-size: 11px; font-weight: 700; text-transform: uppercase; color: var(--text-muted); letter-spacing: .5px; margin-bottom: 2px; }
        .day-title { font-size: 15px; font-weight: 700; color: var(--text-dark); }
        .itin-desc { margin: 10px 0 0 50px; font-size: 13px; color: var(--text-muted); line-height: 1.65; }

        /* Includes */
        .content-box {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 22px;
        }
        .content-box h4 { font-size: 16px; font-weight: 700; margin-bottom: 16px; }
        .inc-list { list-style: none; display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
        .inc-list li { font-size: 14px; display: flex; align-items: center; gap: 10px; }
        .inc-list .fa-check { color: #16a34a; }
        .inc-list .fa-times  { color: #dc2626; }

        /* ── RIGHT STICKY BOOKING CARD ───────────── */
        .booking-sticky { position: sticky; top: 80px; }

        .pricing-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 24px;
            box-shadow: 0 10px 28px rgba(0,0,0,.07);
            margin-bottom: 18px;
        }
        .price-label { font-size: 12px; font-weight: 700; text-transform: uppercase; color: var(--text-muted); letter-spacing: .6px; }
        .price-big {
            font-size: 34px;
            font-weight: 800;
            color: var(--brand-blue);
            margin: 6px 0 2px;
            display: flex;
            align-items: baseline;
            gap: 4px;
        }
        .price-per { font-size: 14px; font-weight: 500; color: var(--text-muted); }
        .price-taxes { font-size: 12px; color: var(--text-muted); margin-bottom: 18px; }

        .form-group { margin-bottom: 14px; }
        .form-label { display: block; font-size: 13px; font-weight: 600; color: var(--text-dark); margin-bottom: 6px; }
        .form-input {
            width: 100%;
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            color: var(--text-dark);
            outline: none;
            transition: .2s;
            box-sizing: border-box;
            font-family: inherit;
        }
        .form-input:focus { border-color: var(--brand-blue); box-shadow: 0 0 0 3px rgba(34,179,193,.15); }

        .counter-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 6px 10px;
        }
        .counter-btn {
            width: 32px; height: 32px;
            border-radius: 8px;
            border: 1px solid var(--border);
            background: #f8fafc;
            color: var(--text-dark);
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            transition: .2s;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1;
        }
        .counter-btn:hover { background: var(--brand-light); color: var(--brand-blue); border-color: var(--brand-blue); }
        .counter-txt { font-size: 14px; font-weight: 600; }

        .calc-box {
            background: #f8fafc;
            border-radius: 12px;
            padding: 14px;
            margin: 18px 0;
            border: 1px dashed var(--border);
        }
        .calc-row { display: flex; justify-content: space-between; font-size: 13px; color: var(--text-muted); margin-bottom: 6px; }
        .calc-row.total { margin-top: 10px; padding-top: 8px; border-top: 1px solid var(--border); font-size: 15px; font-weight: 800; color: var(--text-dark); }

        .btn-book {
            width: 100%;
            background: var(--brand-blue);
            color: #fff;
            border: none;
            padding: 14px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all .25s;
            box-shadow: 0 4px 14px rgba(34,179,193,.35);
            font-family: inherit;
            margin-bottom: 10px;
        }
        .btn-book:hover { background: var(--brand-blue-dark); transform: translateY(-2px); box-shadow: 0 6px 18px rgba(34,179,193,.45); }

        .btn-wishlist {
            width: 100%;
            background: #fff;
            color: var(--text-dark);
            border: 1px solid var(--border);
            padding: 12px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-family: inherit;
        }
        .btn-wishlist:hover { background: #f8fafc; border-color: #cbd5e1; }

        /* Help Card */
        .help-card {
            background: var(--brand-navy);
            color: #fff;
            border-radius: 20px;
            padding: 22px;
            box-shadow: 0 8px 24px rgba(15,23,42,.15);
        }
        .help-card h5 { margin: 0 0 8px; font-size: 17px; font-weight: 700; }
        .help-card p  { margin: 0 0 14px; font-size: 13px; color: #94a3b8; line-height: 1.55; }
        .help-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            transition: .2s;
        }
        .help-link:hover { color: var(--brand-blue); }
        .help-link i { width: 32px; height: 32px; background: rgba(255,255,255,.1); border-radius: 8px; display: flex; align-items: center; justify-content: center; }

        /* Not Found Panel */
        .not-found-box {
            text-align: center;
            padding: 80px 40px;
            background: #fff;
            border-radius: 18px;
            border: 1px solid var(--border);
        }
        .not-found-box i { font-size: 60px; color: #cbd5e1; margin-bottom: 20px; }
        .not-found-box h2 { font-size: 24px; color: var(--text-dark); margin-bottom: 10px; }
        .not-found-box p  { color: var(--text-muted); margin-bottom: 24px; }
        .not-found-box a  { background: var(--brand-blue); color: #fff; padding: 12px 28px; border-radius: 10px; text-decoration: none; font-weight: 700; }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <!-- Top Navigation -->
        <nav class="top-nav">
            <a href="index.aspx" class="nav-logo">Woox<span>Travel</span></a>
            <ul class="nav-links">
                <li><a href="index.aspx">Home</a></li>
                <li><a href="add package.aspx">Packages</a></li>
                <li><a href="deals.aspx">Deals</a></li>
                <li><a href="reservation.aspx">Reservation</a></li>
                <li><a href="login.aspx">Login</a></li>
            </ul>
        </nav>

        <!-- Page Content -->
        <div class="pkg-wrapper">

            <!-- NOT FOUND panel (hidden unless package missing) -->
            <asp:Panel ID="panelNotFound" runat="server" Visible="false">
                <div class="not-found-box">
                    <i class="fas fa-map-marked-alt"></i>
                    <h2>Package Not Found</h2>
                    <p>The package you are looking for does not exist or has been removed.</p>
                    <a href="add package.aspx">← Back to Packages</a>
                </div>
            </asp:Panel>

            <!-- MAIN CONTENT panel -->
            <asp:Panel ID="panelContent" runat="server" Visible="true">

                <!-- ═══ HERO BANNER ═══ -->
                <div class="hero-banner">
                    <a href="add package.aspx" class="btn-back-pill">
                        <i class="fas fa-arrow-left"></i> Back to Packages
                    </a>
                    <br />
                    <div class="hero-badge">⭐ POPULAR PACKAGE</div>
                    <h1 class="hero-title">
                        <asp:Label ID="lblPackageName" runat="server" Text="Package Details"></asp:Label>
                    </h1>
                    <div class="hero-meta-row">
                        <div class="meta-pill">
                            <i class="fas fa-map-marker-alt" style="color:#60a5fa;"></i>
                            <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        </div>
                        <div class="meta-pill">
                            <i class="fas fa-clock" style="color:#60a5fa;"></i>
                            <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label>
                        </div>
                        <div class="meta-pill">
                            <i class="fas fa-star" style="color:#fbbf24;"></i> Highly Rated Package
                        </div>
                    </div>

                    <!-- Skyline decoration -->
                    <svg class="hero-skyline" viewBox="0 0 1200 120" preserveAspectRatio="none">
                        <path d="M0,120 L0,95 L30,95 L30,60 L55,60 L55,95 L90,95 L90,40 L125,40 L125,95 L170,95 L170,70 L200,70 L200,95 L260,95 L260,25 L280,5 L300,25 L300,95 L360,95 L360,50 L410,50 L410,95 L470,95 L470,75 L530,75 L530,95 L600,95 L600,35 L645,35 L645,95 L720,95 L720,60 L770,60 L770,95 L840,95 L840,20 L860,0 L880,20 L880,95 L950,95 L950,55 L1000,55 L1000,95 L1080,95 L1080,70 L1140,70 L1140,95 L1200,95 L1200,120 Z" fill="#0f172a"></path>
                    </svg>
                </div>

                <!-- ═══ 2-COLUMN GRID ═══ -->
                <div class="details-grid">

                    <!-- ─── LEFT COLUMN ─── -->
                    <div>

                        <!-- Gallery Card -->
                        <div class="gallery-card">
                            <div class="main-img-viewport">
                                <asp:Image ID="imgMain" runat="server" CssClass="main-pkg-img" ImageUrl="~/images/bali.jpg" AlternateText="Package Image" />
                                <button type="button" class="gallery-nav prev" onclick="prevSlide()"><i class="fas fa-chevron-left"></i></button>
                                <button type="button" class="gallery-nav next" onclick="nextSlide()"><i class="fas fa-chevron-right"></i></button>
                                <div class="img-caption" id="imgCaptionText">Package Photo</div>
                                <div class="img-counter" id="slideCounter">1 / 5</div>
                            </div>

                            <!-- Thumbnail Row: all 5 thumbs set dynamically from code-behind -->
                            <div class="thumbs-row">
                                <div class="thumb-item active" onclick="switchThumb(0)">
                                    <asp:Image ID="thumb0" runat="server" ImageUrl="~/images/bali.jpg" AlternateText="Photo 1" />
                                </div>
                                <div class="thumb-item" onclick="switchThumb(1)">
                                    <asp:Image ID="thumb1" runat="server" ImageUrl="~/images/bali.jpg" AlternateText="Photo 2" />
                                </div>
                                <div class="thumb-item" onclick="switchThumb(2)">
                                    <asp:Image ID="thumb2" runat="server" ImageUrl="~/images/bali.jpg" AlternateText="Photo 3" />
                                </div>
                                <div class="thumb-item" onclick="switchThumb(3)">
                                    <asp:Image ID="thumb3" runat="server" ImageUrl="~/images/bali.jpg" AlternateText="Photo 4" />
                                </div>
                                <div class="thumb-item" onclick="switchThumb(4)">
                                    <asp:Image ID="thumb4" runat="server" ImageUrl="~/images/bali.jpg" AlternateText="Photo 5" />
                                </div>
                            </div>
                        </div>

                        <!-- Description Card -->
                        <div class="desc-card">
                            <h3><i class="fas fa-info-circle" style="color:var(--brand-blue);margin-right:8px;"></i>About This Package</h3>
                            <p class="desc-text">
                                <asp:Label ID="lblDescription" runat="server" Text="Package description will appear here."></asp:Label>
                            </p>
                        </div>

                        <!-- Spec Cards -->
                        <div class="spec-grid">
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-clock"></i></div>
                                <div>
                                    <div class="spec-label">Duration</div>
                                    <div class="spec-val"><asp:Label ID="lblDurationSpec" runat="server" Text="N/A"></asp:Label></div>
                                </div>
                            </div>
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-users"></i></div>
                                <div>
                                    <div class="spec-label">Group Size</div>
                                    <div class="spec-val">2 to 10 People</div>
                                </div>
                            </div>
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-hotel"></i></div>
                                <div>
                                    <div class="spec-label">Hotel</div>
                                    <div class="spec-val">4 Star Luxury</div>
                                </div>
                            </div>
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-car"></i></div>
                                <div>
                                    <div class="spec-label">Transport</div>
                                    <div class="spec-val">Included (AC)</div>
                                </div>
                            </div>
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-utensils"></i></div>
                                <div>
                                    <div class="spec-label">Meals</div>
                                    <div class="spec-val">Breakfast & Dinner</div>
                                </div>
                            </div>
                            <div class="spec-card">
                                <div class="spec-icon"><i class="fas fa-sun"></i></div>
                                <div>
                                    <div class="spec-label">Best Time</div>
                                    <div class="spec-val">All Year Round</div>
                                </div>
                            </div>
                        </div>

                        <!-- Tabs -->
                        <div class="tabs-nav">
                            <button type="button" class="tab-btn" onclick="openTab('tab-overview',this)">Overview</button>
                            <button type="button" class="tab-btn active" onclick="openTab('tab-itinerary',this)">Itinerary</button>
                            <button type="button" class="tab-btn" onclick="openTab('tab-includes',this)">Includes</button>
                        </div>

                        <!-- Overview Tab -->
                        <div id="tab-overview" class="tab-panel">
                            <div class="content-box">
                                <h4>About this Tour</h4>
                                <p style="font-size:14px;color:#475569;line-height:1.75;">
                                    Embark on an unforgettable journey with our premium, fully-curated holiday package.
                                    Designed for discerning travellers, families, and couples looking for the perfect blend of
                                    relaxation, sightseeing, cultural heritage, and modern thrills.
                                </p>
                                <br />
                                <p style="font-size:14px;color:#475569;line-height:1.75;">
                                    Enjoy handpicked 4-star luxury stays, hassle-free private airport and local transfers,
                                    daily complimentary buffet meals, and professional English-speaking tour guides.
                                </p>
                            </div>
                        </div>

                        <!-- Itinerary Tab (active) -->
                        <div id="tab-itinerary" class="tab-panel active">

                            <div class="itin-card">
                                <div class="itin-header">
                                    <div class="day-circle">1</div>
                                    <div>
                                        <div class="day-label">Day 1</div>
                                        <div class="day-title">Arrival & Hotel Check-In</div>
                                    </div>
                                </div>
                                <div class="itin-desc">Airport pickup and transfer to your 4-star luxury hotel. Evening free to explore the local promenade and rest.</div>
                            </div>

                            <div class="itin-card">
                                <div class="itin-header">
                                    <div class="day-circle">2</div>
                                    <div>
                                        <div class="day-label">Day 2</div>
                                        <div class="day-title">City Sightseeing Tour</div>
                                    </div>
                                </div>
                                <div class="itin-desc">Full-day guided excursion covering iconic architecture, panoramic viewpoints, and historical heritage landmarks.</div>
                            </div>

                            <div class="itin-card">
                                <div class="itin-header">
                                    <div class="day-circle">3</div>
                                    <div>
                                        <div class="day-label">Day 3</div>
                                        <div class="day-title">Local Cuisine & Experiences</div>
                                    </div>
                                </div>
                                <div class="itin-desc">Indulge in authentic food tasting tours, local market exploration, and culturally rich artisan workshops.</div>
                            </div>

                            <div class="itin-card">
                                <div class="itin-header">
                                    <div class="day-circle">4</div>
                                    <div>
                                        <div class="day-label">Day 4</div>
                                        <div class="day-title">Free Exploration & Leisure</div>
                                    </div>
                                </div>
                                <div class="itin-desc">Spend the day at leisure for personal shopping, photography, or optional adventure sports.</div>
                            </div>

                            <div class="itin-card">
                                <div class="itin-header">
                                    <div class="day-circle">5</div>
                                    <div>
                                        <div class="day-label">Day 5</div>
                                        <div class="day-title">Departure</div>
                                    </div>
                                </div>
                                <div class="itin-desc">Enjoy your breakfast at the hotel, complete checkout formalities, and proceed to the airport.</div>
                            </div>

                        </div>

                        <!-- Includes Tab -->
                        <div id="tab-includes" class="tab-panel">
                            <div class="content-box">
                                <h4>Inclusions &amp; Exclusions</h4>
                                <ul class="inc-list">
                                    <li><i class="fas fa-check"></i> 4-Star Luxury Hotel Stay</li>
                                    <li><i class="fas fa-times"></i> International Flights</li>
                                    <li><i class="fas fa-check"></i> Daily Breakfast &amp; Dinner</li>
                                    <li><i class="fas fa-times"></i> Personal Laundry &amp; Mini Bar</li>
                                    <li><i class="fas fa-check"></i> Private AC Vehicle Transfers</li>
                                    <li><i class="fas fa-times"></i> Visa Processing Fees</li>
                                    <li><i class="fas fa-check"></i> Sightseeing Entry Passes</li>
                                    <li><i class="fas fa-times"></i> Travel Insurance</li>
                                    <li><i class="fas fa-check"></i> Professional English Guide</li>
                                    <li><i class="fas fa-times"></i> Extra Tips &amp; Gratuities</li>
                                </ul>
                            </div>
                        </div>

                    </div><!-- end left column -->

                    <!-- ─── RIGHT COLUMN ─── -->
                    <div>
                        <div class="booking-sticky">

                            <!-- Pricing & Booking Card -->
                            <div class="pricing-card">
                                <div class="price-label">Price Per Person</div>
                                <div class="price-big">
                                    &#8377;<asp:Label ID="lblPrice" runat="server" Text="0"></asp:Label>
                                    <span class="price-per">/ person</span>
                                </div>
                                <div class="price-taxes">All taxes included</div>

                                <!-- Travel Date -->
                                <div class="form-group">
                                    <label class="form-label">Travel Date</label>
                                    <asp:TextBox ID="txtTravelDate" runat="server" TextMode="Date" CssClass="form-input"></asp:TextBox>
                                </div>

                                <!-- Traveler Counter -->
                                <div class="form-group">
                                    <label class="form-label">Travelers (1 to 10)</label>
                                    <div class="counter-box">
                                        <button type="button" class="counter-btn" onclick="changeTravelers(-1)">-</button>
                                        <span class="counter-txt" id="travelerTxt">1 person</span>
                                        <button type="button" class="counter-btn" onclick="changeTravelers(1)">+</button>
                                    </div>
                                    <asp:HiddenField ID="hfTravelers" runat="server" Value="1" />
                                </div>

                                <!-- Price Breakdown -->
                                <div class="calc-box">
                                    <div class="calc-row">
                                        <span>&#8377; <span id="rateSpan">0</span> x <span id="numSpan">1</span> traveler(s)</span>
                                        <span>&#8377; <span id="subTotal">0</span></span>
                                    </div>
                                    <div class="calc-row total">
                                        <span>Total</span>
                                        <span style="color:var(--brand-blue);">&#8377; <span id="grandTotal">0</span></span>
                                    </div>
                                </div>

                                <!-- Book Now Button (PostBack) -->
                                <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn-book" OnClick="btnBookNow_Click" />

                                <!-- Wishlist Button -->
                                <button type="button" class="btn-wishlist">
                                    <i class="fas fa-heart" style="color:#ef4444;"></i> Add to Wishlist
                                </button>
                            </div>

                            <!-- Need Help Card -->
                            <div class="help-card">
                                <h5>Need Help?</h5>
                                <p>Our travel experts are here to help you plan your perfect trip.</p>
                                <a href="tel:+01234567890" class="help-link">
                                    <i class="fas fa-phone-alt"></i> +012 345 67890
                                </a>
                                <a href="mailto:info@wooxtravel.com" class="help-link">
                                    <i class="fas fa-envelope"></i> info@wooxtravel.com
                                </a>
                            </div>

                        </div>
                    </div><!-- end right column -->

                </div><!-- end details-grid -->

            </asp:Panel><!-- end panelContent -->

        </div><!-- end pkg-wrapper -->

    </form>

    <script type="text/javascript">
        // ─── Price Calculation ─────────────────────────────
        var perPersonRate = 0;
        var travelers = 1;

        window.onload = function () {
            var priceElem = document.getElementById('<%= lblPrice.ClientID %>');
            if (priceElem) {
                perPersonRate = parseInt(priceElem.innerText.replace(/[^0-9]/g, '')) || 0;
                document.getElementById('rateSpan').innerText = perPersonRate.toLocaleString('en-IN');
                recalc();
            }
        };

        function changeTravelers(delta) {
            travelers += delta;
            if (travelers < 1)  travelers = 1;
            if (travelers > 10) travelers = 10;
            document.getElementById('travelerTxt').innerText = travelers + (travelers === 1 ? ' person' : ' people');
            document.getElementById('numSpan').innerText = travelers;
            document.getElementById('<%= hfTravelers.ClientID %>').value = travelers;
            recalc();
        }

        function recalc() {
            var total = perPersonRate * travelers;
            document.getElementById('subTotal').innerText   = total.toLocaleString('en-IN');
            document.getElementById('grandTotal').innerText = total.toLocaleString('en-IN');
        }

        // ─── Thumbnail Gallery ─────────────────────────────
        var currentSlide = 0;

        function getThumbUrls() {
            var thumbImgs = document.querySelectorAll('.thumb-item img');
            var urls = [];
            thumbImgs.forEach(function (img) { urls.push(img.src); });
            return urls;
        }

        function switchThumb(index) {
            var thumbs = document.querySelectorAll('.thumb-item');
            var urls   = getThumbUrls();
            if (index >= 0 && index < thumbs.length) {
                currentSlide = index;
                var mainImg = document.getElementById('<%= imgMain.ClientID %>');
                if (mainImg && urls[index]) { mainImg.src = urls[index]; }
                thumbs.forEach(function (t) { t.classList.remove('active'); });
                thumbs[index].classList.add('active');
                document.getElementById('slideCounter').innerText = (index + 1) + ' / ' + thumbs.length;
            }
        }

        function nextSlide() {
            var count = document.querySelectorAll('.thumb-item').length;
            switchThumb((currentSlide + 1) % count);
        }

        function prevSlide() {
            var count = document.querySelectorAll('.thumb-item').length;
            switchThumb((currentSlide - 1 + count) % count);
        }

        // ─── Tab Switching ─────────────────────────────────
        function openTab(tabId, btn) {
            document.querySelectorAll('.tab-panel').forEach(function (p) { p.classList.remove('active'); });
            document.querySelectorAll('.tab-btn').forEach(function (b) { b.classList.remove('active'); });
            document.getElementById(tabId).classList.add('active');
            btn.classList.add('active');
        }
    </script>

</body>
</html>
