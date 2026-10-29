<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservation booking.aspx.cs" Inherits="woox_travel_app_.reservation_booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Package - Woox Travel</title>
    <meta charset="utf-8" />
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background: #f1f5f9; color: #1e293b; }

        .top-nav {
            background: #0f172a;
            padding: 14px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .nav-logo { color: #fff; font-size: 22px; font-weight: 800; text-decoration: none; }
        .nav-logo span { color: #22b3c1; }

        .page-wrapper { max-width: 900px; margin: 40px auto; padding: 0 20px 60px; }

        .page-title { font-size: 26px; font-weight: 800; color: #0f172a; margin-bottom: 6px; }
        .page-sub   { font-size: 14px; color: #64748b; margin-bottom: 28px; }

        .grid { display: grid; grid-template-columns: 1fr 340px; gap: 24px; align-items: start; }
        @media(max-width:760px){ .grid { grid-template-columns: 1fr; } }

        /* ── Form Card ── */
        .form-card {
            background: #fff;
            border-radius: 18px;
            border: 1px solid #e2e8f0;
            padding: 28px;
            box-shadow: 0 4px 14px rgba(0,0,0,.05);
        }
        .form-card h3 { font-size: 17px; font-weight: 700; margin-bottom: 20px; color: #0f172a; }

        .form-group { margin-bottom: 16px; }
        .form-label { display: block; font-size: 13px; font-weight: 600; color: #334155; margin-bottom: 6px; }
        .form-input, .form-textarea {
            width: 100%;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            color: #1e293b;
            outline: none;
            transition: .2s;
            font-family: inherit;
        }
        .form-input:focus, .form-textarea:focus {
            border-color: #22b3c1;
            box-shadow: 0 0 0 3px rgba(34,179,193,.15);
        }
        .form-textarea { resize: vertical; height: 90px; }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }

        .btn-confirm {
            width: 100%;
            background: #22b3c1;
            color: #fff;
            border: none;
            padding: 14px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 8px;
            transition: all .25s;
            font-family: inherit;
        }
        .btn-confirm:hover { background: #1a9aaa; transform: translateY(-2px); }

        /* ── Summary Card ── */
        .summary-card {
            background: #fff;
            border-radius: 18px;
            border: 1px solid #e2e8f0;
            padding: 24px;
            box-shadow: 0 4px 14px rgba(0,0,0,.05);
            position: sticky;
            top: 80px;
        }
        .summary-card h4 { font-size: 14px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: .5px; margin-bottom: 14px; }
        .s-row { display: flex; justify-content: space-between; font-size: 14px; margin-bottom: 10px; color: #475569; }
        .s-row span:last-child { font-weight: 600; color: #1e293b; }
        .s-divider { border: none; border-top: 1px solid #e2e8f0; margin: 14px 0; }
        .s-total { display: flex; justify-content: space-between; font-size: 16px; font-weight: 800; color: #0f172a; }
        .s-total span:last-child { color: #22b3c1; }
        .pkg-name { font-size: 17px; font-weight: 700; color: #0f172a; margin-bottom: 14px; }

        /* ── Success Box ── */
        .success-box {
            background: #f0fdf4;
            border: 1px solid #86efac;
            border-radius: 14px;
            padding: 22px;
            text-align: center;
            margin-bottom: 20px;
        }
        .success-box p { color: #166534; font-weight: 600; font-size: 15px; }
        .msg-error { color: #dc2626; font-size: 13px; margin-top: 8px; font-weight: 600; }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <nav class="top-nav">
        <a href="index.aspx" class="nav-logo">WoOx<span>Travel</span></a>
        <div style="display:flex;gap:28px;">
            <a href="index.aspx" style="color:rgba(255,255,255,0.85);font-size:14px;font-weight:500;text-decoration:none;">Home</a>
            <a href="add package.aspx" style="color:rgba(255,255,255,0.85);font-size:14px;font-weight:500;text-decoration:none;">Packages</a>
            <a href="reservation booking.aspx" style="color:#22b3c1;font-size:14px;font-weight:500;text-decoration:none;">Reservation</a>
            <a href="Contact.aspx" style="color:rgba(255,255,255,0.85);font-size:14px;font-weight:500;text-decoration:none;">Contact Us</a>
            <a href="login.aspx" style="color:rgba(255,255,255,0.85);font-size:14px;font-weight:500;text-decoration:none;">Login</a>
        </div>
    </nav>

    <div class="page-wrapper">
        <div class="page-title">Complete Your Booking</div>
        <div class="page-sub">Fill in your details to confirm the reservation.</div>

        <!-- Success Message -->
        <asp:Panel ID="panelSuccess" runat="server" Visible="false">
            <div class="success-box">
                <p>&#10003; Booking Confirmed! Your booking has been successfully submitted. Our team will contact you shortly.</p>
            </div>
        </asp:Panel>

        <!-- Booking Form -->
        <asp:Panel ID="panelForm" runat="server" Visible="true">
        <div class="grid">

            <!-- Left: Form -->
            <div class="form-card">
                <h3>Traveler Details</h3>

                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="e.g. Raj Patel" />
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="you@email.com" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="9876543210" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Travel Date</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-input" ReadOnly="true" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">No. of Travelers</label>
                        <asp:TextBox ID="txtTravelers" runat="server" CssClass="form-input" ReadOnly="true" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Special Requests (Optional)</label>
                    <asp:TextBox ID="txtNote" runat="server" CssClass="form-textarea" TextMode="MultiLine" placeholder="Any special requests or requirements..." />
                </div>

                <asp:Label ID="lblMsg" runat="server" CssClass="msg-error" Text="" />

                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" CssClass="btn-confirm" OnClick="btnConfirm_Click" />
            </div>

            <!-- Right: Summary -->
            <div class="summary-card">
                <h4>Booking Summary</h4>
                <div class="pkg-name">
                    <asp:Label ID="lblPkgName" runat="server" Text="Package" />
                </div>
                <div class="s-row"><span>Location</span><span><asp:Label ID="lblLocation" runat="server" Text="-" /></span></div>
                <div class="s-row"><span>Duration</span><span><asp:Label ID="lblDuration" runat="server" Text="-" /></span></div>
                <div class="s-row"><span>Travelers</span><span><asp:Label ID="lblTravelers" runat="server" Text="-" /></span></div>
                <div class="s-row"><span>Travel Date</span><span><asp:Label ID="lblDate" runat="server" Text="-" /></span></div>
                <hr class="s-divider" />
                <div class="s-row"><span>Price / person</span><span>&#8377; <asp:Label ID="lblPriceEach" runat="server" Text="0" /></span></div>
                <div class="s-total"><span>Total</span><span>&#8377; <asp:Label ID="lblTotal" runat="server" Text="0" /></span></div>
            </div>

        </div>
        </asp:Panel>

    </div>
</form>
</body>
</html>
