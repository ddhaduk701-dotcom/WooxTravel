<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="woox_travel_app_.login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login</title>

    <link href="register.css" rel="stylesheet" />
</head>
    

    <form id="form1" runat="server">

        <div class="login-container">

            <h1 class="title">
                Sign <span>In</span>
            </h1>

            <p class="subtitle">
                Enter your details below to continue your journey
            </p>


            <!-- Email -->
            <div class="form-group">

                <label>Email Address</label>

                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="input-box"
                    TextMode="Email"
                    placeholder="you@example.com">
                </asp:TextBox>

            </div>


            <!-- Password -->
            <div class="form-group">

                <label>Password</label>

                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="input-box"
                    TextMode="Password"
                    placeholder="Enter your password">
                </asp:TextBox>

            </div>


            <!-- Remember / Forgot -->
            <div class="options">

                <div class="remember">

                    <asp:CheckBox
                        ID="chkRemember"
                        runat="server" />

                    <span>Remember me</span>

                </div>

                <a href="#">Forgot Password?</a>

            </div>

<!--button-->
            <asp:Button
    ID="btnLogin"
    runat="server"
    Text="Login"
    CssClass="login-btn"
    OnClick="btnLogin_Click" />

            <!-- Divider -->
            <div class="divider">

                <span>or continue with</span>

            </div>


            <!-- Social -->
            <div class="social-buttons">

                <asp:Button
                    ID="btnGoogle"
                    runat="server"
                    Text="▣  Google"
                    CssClass="social-btn" />

                <asp:Button
                    ID="btnFacebook"
                    runat="server"
                    Text="▣  Facebook"
                    CssClass="social-btn" />

            </div>


            <!-- Register -->
            <div class="register-text">

                Don't have an account?

                <a href="WebForm1.aspx">
                    Create one
                </a>

            </div>

        </div>

    </form>

</body>
</html>