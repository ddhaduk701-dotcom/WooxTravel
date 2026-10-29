<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="woox_travel_app_.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sign In</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            background: #fafafa;
            font-family: 'Poppins', Arial, sans-serif;
            color: #555;
        }
        table { border-collapse: collapse; }

        .login-card { width: 100%; max-width: 615px; margin: 0 auto; padding: 56px 59px 60px; }

        .title { margin: 0; text-align: center; font-size: 32px; font-weight: 700; color: #222; }
        .title span { color: #20b2c3; }
        .subtitle { margin: 14px 0 40px; text-align: center; font-size: 16px; color: #aaa; }

        .field { margin-bottom: 24px; }
        .field label { display: block; margin-bottom: 8px; font-size: 16px; color: #aaa; }
        .input {
            display: block; width: 100%; height: 52px; padding: 0 24px;
            border: 1px solid #e0e0e0; border-radius: 30px; background: #fafafa;
            font-family: 'Poppins', Arial, sans-serif; font-size: 15px; color: #555; outline: none;
        }
        .input:focus { border-color: #20b2c3; }

        .error { display: block; margin: 6px 0 0 20px; font-size: 13px; color: #d93025; }
        .message { display: block; margin-bottom: 16px; text-align: center; font-size: 14px; }

        /* Remember me (left) + Forgot password (right) */
        .row-table { width: 100%; margin: 4px 0 34px; }
        .row-table td { vertical-align: middle; }
        .row-table .right { text-align: right; }
        .remember { font-size: 16px; color: #555; }
        .remember input {
            -webkit-appearance: none; appearance: none; position: relative;
            width: 46px; height: 20px; margin: 0 8px 0 0; vertical-align: middle;
            border: 1px solid #e0e0e0; border-radius: 20px; background: #f5f5f5; cursor: pointer;
        }
        .remember input::after {
            content: ""; position: absolute; top: 1px; left: 1px; width: 16px; height: 16px;
            border-radius: 50%; background: #fff; box-shadow: 0 1px 2px rgba(0,0,0,.25);
            transition: left .2s;
        }
        .remember input:checked { background: #20b2c3; border-color: #20b2c3; }
        .remember input:checked::after { left: 27px; }
        .remember label { vertical-align: middle; cursor: pointer; }

        .link { font-size: 16px; color: #20b2c3; text-decoration: none; }
        .link:hover { text-decoration: underline; }

        .btn-login {
            display: block; width: 100%; height: 52px; border: none; border-radius: 30px;
            background: #20b2c3; font-family: 'Poppins', Arial, sans-serif;
            font-size: 16px; font-weight: 600; color: #fff; cursor: pointer;
        }
        .btn-login:hover { background: #1ca3b3; }

        /* Divider (table based) */
        .divider { width: 100%; margin: 30px 0; }
        .divider td { vertical-align: middle; }
        .divider .line { width: 40%; }
        .divider hr { border: 0; border-top: 1px solid #ddd; margin: 0; }
        .divider .or { text-align: center; font-size: 14px; color: #aaa; white-space: nowrap; padding: 0 12px; }

        /* Social buttons (table based) */
        .social { width: 100%; }
        .social td { width: 48%; }
        .social td.gap { width: 4%; }
        .social-btn {
            display: block; height: 52px; line-height: 50px; text-align: center;
            border: 1px solid #e0e0e0; border-radius: 30px; background: #fafafa;
            font-size: 16px; color: #555; text-decoration: none; cursor: pointer;
        }
        .social-btn:hover { background: #f0f0f0; }
        .social-btn svg { width: 18px; height: 18px; vertical-align: middle; margin-right: 8px; }

        .signup { margin: 34px 0 0; text-align: center; font-size: 16px; color: #666; }
        .signup .link { font-weight: 500; }

        @media (max-width: 640px) { .login-card { padding: 40px 24px; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">

            <h1 class="title">Sign <span>In</span></h1>
            <p class="subtitle">Enter your details below to continue your journey</p>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <!-- Email -->
            <div class="field">
                <label for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input"
                    TextMode="Email" placeholder="you@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" CssClass="error" Display="Dynamic"
                    ErrorMessage="Email is required" ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>

            <!-- Password -->
            <div class="field">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input"
                    TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword" CssClass="error" Display="Dynamic"
                    ErrorMessage="Password is required" ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>

            <!-- Remember me (left) + Forgot Password (right) -->
            <table class="row-table">
                <tr>
                    <td>
                        <asp:CheckBox ID="chkRemember" runat="server" Text="Remember me" CssClass="remember" />
                    </td>
                    <td class="right">
                        <asp:HyperLink ID="lnkForgot" runat="server" CssClass="link"
                            NavigateUrl="~/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
                    </td>
                </tr>
            </table>

            <!-- Login button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login"
                ValidationGroup="Login" OnClick="btnLogin_Click" />

            <!-- Divider -->
            <table class="divider">
                <tr>
                    <td class="line"><hr /></td>
                    <td class="or">or continue with</td>
                    <td class="line"><hr /></td>
                </tr>
            </table>

            <!-- Google / Facebook -->
            <table class="social">
                <tr>
                    <td>
                        <asp:LinkButton ID="btnGoogle" runat="server" CssClass="social-btn"
                            CausesValidation="false">
                            <svg viewBox="0 0 48 48"><path fill="#EA4335" d="M24 9.5c3.5 0 6.6 1.2 9.1 3.6l6.8-6.8C35.8 2.4 30.3 0 24 0 14.6 0 6.5 5.4 2.6 13.2l7.9 6.1C12.4 13.5 17.7 9.5 24 9.5z"/><path fill="#4285F4" d="M46.5 24.5c0-1.6-.1-3.1-.4-4.5H24v9h12.7c-.6 3-2.3 5.5-4.8 7.2l7.5 5.8c4.4-4.1 7.1-10.1 7.1-17.5z"/><path fill="#FBBC05" d="M10.5 28.7c-.5-1.5-.8-3-.8-4.7s.3-3.2.8-4.7l-7.9-6.1C.9 16.4 0 20.1 0 24s.9 7.6 2.6 10.8l7.9-6.1z"/><path fill="#34A853" d="M24 48c6.5 0 11.9-2.1 15.9-5.8l-7.5-5.8c-2.1 1.4-4.9 2.3-8.4 2.3-6.3 0-11.6-4-13.5-9.8l-7.9 6.1C6.5 42.6 14.6 48 24 48z"/></svg>Google
                        </asp:LinkButton>
                    </td>
                    <td class="gap"></td>
                    <td>
                        <asp:LinkButton ID="btnFacebook" runat="server" CssClass="social-btn"
                         CausesValidation="false">
                            <svg viewBox="0 0 24 24"><path fill="#1877F2" d="M24 12a12 12 0 1 0-13.9 11.9v-8.4H7.1V12h3V9.4c0-3 1.8-4.7 4.5-4.7 1.3 0 2.7.2 2.7.2v3h-1.5c-1.5 0-2 .9-2 1.9V12h3.4l-.5 3.5h-2.9v8.4A12 12 0 0 0 24 12z"/></svg>Facebook
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>

            <p class="signup">
                Don't have an account?
                <asp:HyperLink ID="lnkRegister" runat="server" CssClass="link"
                    NavigateUrl="~/register.aspx">Create one</asp:HyperLink>
            </p>

        </div>
    </form>
</body>
</html>
