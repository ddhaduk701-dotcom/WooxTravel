<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="woox_travel_app_.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>

    <!-- External CSS -->
    <link href="Content/Register.css" rel="stylesheet" />

</head>
<body>
    <div class="top-line"></div>

    <form id="form1" runat="server">

        <div class="signup-container">

            <h1 class="title">
                Sign <span>Up</span>
            </h1>

            <p class="subtitle">
                Fill in your details below to create a new account
            </p>


            <!-- Full Name -->
            <div class="form-group">

                <label>Full Name</label>

                <asp:TextBox
                    ID="txtFullName"
                    runat="server"
                    CssClass="input-box"
                    placeholder="Ex. John Smithee">
                </asp:TextBox>

            </div>


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


            <!-- Phone -->
            <div class="form-group">

                <label>Phone Number</label>

                <asp:TextBox
                    ID="txtPhone"
                    runat="server"
                    CssClass="input-box"
                    TextMode="Phone"
                    placeholder="Ex. +XXX XXX XXX">
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
                    placeholder="Create a password">
                </asp:TextBox>

            </div>


            <!-- Confirm Password -->
            <div class="form-group">

                <label>Confirm Password</label>

                <asp:TextBox
                    ID="txtConfirmPassword"
                    runat="server"
                    CssClass="input-box"
                    TextMode="Password"
                    placeholder="Re-enter your password">
                </asp:TextBox>

            </div>


            <!-- Terms -->
            <div class="terms">

                <asp:CheckBox
                    ID="chkTerms"
                    runat="server" />

                <span>
                    I agree to the
                    <a href="#">Terms of Service</a>
                    and
                    <a href="#">Privacy Policy</a>
                </span>

            </div>


            <!-- Create Account -->
            <asp:Button
                ID="btnCreateAccount"
                runat="server"
                Text="Create Account"
                CssClass="create-btn" OnClick="btnCreateAccount_Click" />


            <!-- Divider -->
            <div class="divider">
                <span>or continue with</span>
            </div>


            <!-- Social Buttons -->
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


            <!-- Login -->
            <div class="login-text">

                Already have an account?

                <a href="Login.aspx">
                    Login here
                </a>

            </div>

        </div>

          <!-- GridView -->
    <asp:GridView
        ID="GridView1"
        runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="FullName"></asp:TemplateField>
            <asp:TemplateField HeaderText="Email"></asp:TemplateField>
            <asp:TemplateField HeaderText="Phone"></asp:TemplateField>
            <asp:TemplateField HeaderText="Password"></asp:TemplateField>
            <asp:TemplateField HeaderText="CreatedDate"></asp:TemplateField>
        </Columns>
    </asp:GridView>

    </form>

</body>
</html> 
