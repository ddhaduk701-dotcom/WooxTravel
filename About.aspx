<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="woox_travel_app_.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us – WoOx Travel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f4f6f9; color: #333; }
        a { text-decoration: none; color: inherit; }
        img { display: block; max-width: 100%; }

        /* ===== NAVBAR ===== */
        .navbar {
            position: fixed; top: 0; width: 100%; z-index: 1000;
            background: rgba(20, 20, 40, 0.85);
            backdrop-filter: blur(10px);
            display: flex; align-items: center; justify-content: space-between;
            padding: 18px 60px; transition: background 0.3s;
        }
        .navbar.scrolled { background: rgba(20, 20, 40, 0.98); }
        .navbar .logo { font-size: 26px; font-weight: 700; color: #fff; letter-spacing: 1px; }
        .navbar .logo span { color: #22b3c1; }
        .navbar ul { list-style: none; display: flex; gap: 32px; }
        .navbar ul li a {
            color: rgba(255,255,255,0.85); font-size: 14px; font-weight: 500;
            padding-bottom: 4px; border-bottom: 2px solid transparent; transition: 0.3s;
        }
        .navbar ul li a:hover,
        .navbar ul li a.active { color: #22b3c1; border-bottom-color: #22b3c1; }

        /* ===== HERO ===== */
        .about-hero {
            height: 55vh; min-height: 380px;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            position: relative; display: flex; align-items: center; justify-content: center;
            text-align: center; overflow: hidden;
        }
        .about-hero::before {
            content: '';
            position: absolute; inset: 0;
            background: url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=1600') center/cover no-repeat;
            opacity: 0.2;
        }
        .about-hero-content { position: relative; z-index: 1; padding: 0 20px; }
        .about-hero-content .badge {
            display: inline-block;
            background: rgba(34,179,193,0.2); border: 1px solid #22b3c1;
            color: #22b3c1; font-size: 12px; font-weight: 600;
            padding: 6px 18px; border-radius: 50px; margin-bottom: 20px;
            letter-spacing: 2px; text-transform: uppercase;
        }
        .about-hero-content h1 {
            font-size: clamp(32px, 5vw, 60px); font-weight: 700; color: #fff; margin-bottom: 14px;
        }
        .about-hero-content h1 span { color: #22b3c1; }
        .about-hero-content p { color: rgba(255,255,255,0.7); font-size: 16px; max-width: 520px; margin: 0 auto; }

        /* ===== STATS ===== */
        .stats-strip {
            background: #fff; padding: 30px 60px;
            display: flex; justify-content: space-around; flex-wrap: wrap;
            box-shadow: 0 4px 20px rgba(0,0,0,0.07);
        }
        .stat-item { text-align: center; padding: 12px 20px; }
        .stat-item .num { font-size: 34px; font-weight: 700; color: #22b3c1; }
        .stat-item .lbl { font-size: 13px; color: #777; margin-top: 4px; }

        /* ===== SECTION ===== */
        .section { padding: 70px 60px; }
        .section-header { text-align: center; margin-bottom: 48px; }
        .section-header .sub {
            display: inline-block; background: rgba(34,179,193,0.1);
            color: #22b3c1; font-size: 12px; font-weight: 600;
            padding: 5px 16px; border-radius: 50px; letter-spacing: 1.5px;
            text-transform: uppercase; margin-bottom: 12px;
        }
        .section-header h2 { font-size: clamp(26px, 4vw, 40px); font-weight: 700; color: #1a1a2e; }
        .section-header p { color: #777; font-size: 15px; margin-top: 12px; max-width: 520px; margin: 12px auto 0; }

        /* ===== MISSION STORY ===== */
        .mission-grid {
            display: grid; grid-template-columns: 1fr 1fr;
            gap: 50px; align-items: center; max-width: 1100px; margin: 0 auto;
        }
        .mission-img {
            border-radius: 20px; overflow: hidden;
            box-shadow: 0 10px 40px rgba(34,179,193,0.15);
        }
        .mission-img img { width: 100%; height: 400px; object-fit: cover; }
        .mission-text h2 { font-size: 34px; font-weight: 700; color: #1a1a2e; margin-bottom: 18px; }
        .mission-text h2 span { color: #22b3c1; }
        .mission-text p { color: #666; font-size: 15px; line-height: 1.8; margin-bottom: 16px; }
        .mission-points { list-style: none; margin-top: 20px; display: flex; flex-direction: column; gap: 12px; }
        .mission-points li {
            display: flex; align-items: center; gap: 12px;
            font-size: 14px; color: #555;
        }
        .mission-points li i { color: #22b3c1; font-size: 16px; }

        /* ===== VALUES CARDS ===== */
        .values-grid {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 28px; max-width: 1100px; margin: 0 auto;
        }
        .value-card {
            background: #fff; border-radius: 16px;
            padding: 36px 28px; text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.07);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .value-card:hover { transform: translateY(-6px); box-shadow: 0 12px 36px rgba(34,179,193,0.15); }
        .value-card .icon {
            width: 64px; height: 64px; border-radius: 50%;
            background: rgba(34,179,193,0.12);
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px; font-size: 26px; color: #22b3c1;
        }
        .value-card h3 { font-size: 18px; font-weight: 700; color: #1a1a2e; margin-bottom: 10px; }
        .value-card p { font-size: 13.5px; color: #777; line-height: 1.7; }

        /* ===== TEAM ===== */
        .team-grid {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
            gap: 28px; max-width: 1000px; margin: 0 auto;
        }
        .team-card {
            background: #fff; border-radius: 16px; overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: transform 0.3s, box-shadow 0.3s; text-align: center;
        }
        .team-card:hover { transform: translateY(-6px); box-shadow: 0 12px 36px rgba(34,179,193,0.15); }
        .team-card .team-img { height: 220px; overflow: hidden; }
        .team-card .team-img img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.4s; }
        .team-card:hover .team-img img { transform: scale(1.06); }
        .team-card .team-info { padding: 20px; }
        .team-card .team-info h4 { font-size: 17px; font-weight: 700; color: #1a1a2e; margin-bottom: 4px; }
        .team-card .team-info .role { font-size: 13px; color: #22b3c1; font-weight: 500; }
        .team-card .team-socials { display: flex; justify-content: center; gap: 10px; margin-top: 12px; }
        .team-card .team-socials a {
            width: 32px; height: 32px; border-radius: 50%;
            background: rgba(34,179,193,0.1); color: #22b3c1;
            display: flex; align-items: center; justify-content: center;
            font-size: 13px; transition: 0.3s;
        }
        .team-card .team-socials a:hover { background: #22b3c1; color: #fff; }

        /* ===== CTA ===== */
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

        /* ===== FOOTER ===== */
        footer {
            background: #1a1a2e; color: rgba(255,255,255,0.6);
            text-align: center; padding: 28px 20px; font-size: 13.5px;
        }
        footer a { color: #22b3c1; }

        /* ===== RESPONSIVE ===== */
        @media(max-width: 768px) {
            .navbar { padding: 16px 24px; }
            .navbar ul { display: none; }
            .section { padding: 50px 24px; }
            .stats-strip { padding: 20px; }
            .mission-grid { grid-template-columns: 1fr; }
            .cta-section { padding: 50px 24px; }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar" id="mainNav">
        <a href="index.aspx" class="logo">Wo<span>Ox</span> Travel</a>
        <ul>
            <li><a href="index.aspx">Home</a></li>
            <li><a href="About.aspx" class="active">About</a></li>
            <li><a href="add package.aspx">Packages</a></li>
            <li><a href="deals.aspx">Deals</a></li>
            <li><a href="reservation booking.aspx">Book Now</a></li>
            <li><a href="login.aspx">Login</a></li>
        </ul>
    </nav>

    <!-- ===== HERO ===== -->
    <section class="about-hero">
        <div class="about-hero-content">
            <div class="badge">✈ Our Story</div>
            <h1>About <span>WoOx Travel</span></h1>
            <p>Passionate travel experts dedicated to turning your dream destinations into unforgettable experiences.</p>
        </div>
    </section>

    <!-- ===== STATS ===== -->
    <div class="stats-strip">
        <div class="stat-item"><div class="num">2014</div><div class="lbl">Founded</div></div>
        <div class="stat-item"><div class="num">200+</div><div class="lbl">Destinations</div></div>
        <div class="stat-item"><div class="num">15K+</div><div class="lbl">Happy Travellers</div></div>
        <div class="stat-item"><div class="num">50+</div><div class="lbl">Tour Packages</div></div>
        <div class="stat-item"><div class="num">10+</div><div class="lbl">Years Experience</div></div>
    </div>

    <!-- ===== MISSION ===== -->
    <section class="section" style="background:#fff;">
        <div class="mission-grid">
            <div class="mission-img">
                <img src="https://images.unsplash.com/photo-1488085061387-422e29b40080?w=800" alt="Our Mission" />
            </div>
            <div class="mission-text">
                <h2>Our <span>Mission</span> &amp; Story</h2>
                <p>WoOx Travel was born out of a simple belief — everyone deserves to see the world. Founded in 2014, we started as a small team of passionate travellers with a dream to make quality travel accessible to all.</p>
                <p>Today, we curate exceptional travel experiences across 200+ destinations, ensuring every journey is seamless, memorable, and truly transformative.</p>
                <ul class="mission-points">
                    <li><i class="fas fa-check-circle"></i> Handpicked itineraries by expert travel planners</li>
                    <li><i class="fas fa-check-circle"></i> 24/7 customer support during your travels</li>
                    <li><i class="fas fa-check-circle"></i> Transparent pricing — no hidden charges</li>
                    <li><i class="fas fa-check-circle"></i> Trusted by 15,000+ satisfied travellers</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- ===== VALUES ===== -->
    <section class="section" style="background:#f4f6f9;">
        <div class="section-header">
            <div class="sub">What We Stand For</div>
            <h2>Our Core Values</h2>
            <p>Everything we do is guided by these principles that put our travellers first.</p>
        </div>
        <div class="values-grid">
            <div class="value-card">
                <div class="icon"><i class="fas fa-heart"></i></div>
                <h3>Passion for Travel</h3>
                <p>We live and breathe travel. Our team personally explores every destination to craft the perfect experience for you.</p>
            </div>
            <div class="value-card">
                <div class="icon"><i class="fas fa-shield-alt"></i></div>
                <h3>Trust &amp; Safety</h3>
                <p>Your safety is our top priority. All our packages come with travel insurance options and verified accommodation.</p>
            </div>
            <div class="value-card">
                <div class="icon"><i class="fas fa-star"></i></div>
                <h3>Excellence</h3>
                <p>We don't settle for average. From booking to returning home, we strive for a 5-star experience every step.</p>
            </div>
            <div class="value-card">
                <div class="icon"><i class="fas fa-leaf"></i></div>
                <h3>Sustainable Travel</h3>
                <p>We are committed to responsible tourism — supporting local communities and protecting natural wonders.</p>
            </div>
        </div>
    </section>

    <!-- ===== TEAM ===== -->
    <section class="section" style="background:#fff;">
        <div class="section-header">
            <div class="sub">The People Behind WoOx</div>
            <h2>Meet Our Team</h2>
            <p>A passionate group of travel enthusiasts committed to your perfect journey.</p>
        </div>
        <div class="team-grid">
            <div class="team-card">
                <div class="team-img">
                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400" alt="Arjun Mehta" />
                </div>
                <div class="team-info">
                    <h4>Arjun Mehta</h4>
                    <div class="role">Founder &amp; CEO</div>
                    <div class="team-socials">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="team-img">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400" alt="Priya Shah" />
                </div>
                <div class="team-info">
                    <h4>Priya Shah</h4>
                    <div class="role">Head of Operations</div>
                    <div class="team-socials">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="team-img">
                    <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400" alt="Ravi Kumar" />
                </div>
                <div class="team-info">
                    <h4>Ravi Kumar</h4>
                    <div class="role">Travel Experience Designer</div>
                    <div class="team-socials">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="team-img">
                    <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400" alt="Neha Patel" />
                </div>
                <div class="team-info">
                    <h4>Neha Patel</h4>
                    <div class="role">Customer Relations Lead</div>
                    <div class="team-socials">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== CTA ===== -->
    <section class="cta-section">
        <h2>Start Your Adventure Today!</h2>
        <p>Explore our handpicked packages and let us plan your perfect getaway.</p>
        <a href="add package.aspx" class="cta-btn">Explore Packages ✈</a>
    </section>

    <!-- ===== FOOTER ===== -->
    <footer>
        <p>Copyright &copy; 2036 <a href="#">WoOx Travel</a> Company. All rights reserved.</p>
    </footer>

</form>
<script>
    window.addEventListener('scroll', function () {
        var nav = document.getElementById('mainNav');
        if (window.scrollY > 50) nav.classList.add('scrolled');
        else nav.classList.remove('scrolled');
    });
</script>
</body>
</html>
