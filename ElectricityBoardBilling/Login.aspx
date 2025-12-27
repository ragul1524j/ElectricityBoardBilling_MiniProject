<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="ElectricityBoardBilling.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            background-color: #f5f7fb;
            font-family: Arial, Helvetica, sans-serif;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            width: 300px;              
            padding: 24px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .login-card h2 {
            text-align: center;
            color: #0d6efd;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 20px;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .form-label {
            display: block;
            margin-bottom: 4px;
            margin-left:15px;
            font-size:20px;
            font-family:Arial, Helvetica, sans-serif;
            font-weight: 500;
            color: #333;
        }

      
        .login-input {
            width: 85%;               
            height: 28px;            
            padding: 3px 6px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 12px;
            display: block;
            margin: 0 auto;
        }

        .login-input:focus {
            outline: none;
            border-color: #0d6efd;
            box-shadow: 0 0 0 2px rgba(13,110,253,0.15);
        }

        .login-btn {
            width: 120px;
            height: 50px;
            margin: 16px auto 0;
            display: block;
            background-color: #0d6efd;
            color: white;
            border:2px solid #0d6efd;
           border-radius:20px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
        }

        .login-btn:hover {
            background-color: #0b5ed7;
        }
    </style>
</head>

<body>
<form runat="server">

    <div class="login-card">

        <h2>Admin Login</h2>

        <div class="form-group">
            <label class="form-label">Username</label>
            <asp:TextBox ID="txtUsername"
                runat="server"
                CssClass="login-input" />
        </div>

        <div class="form-group">
            <label class="form-label">Password</label>
            <asp:TextBox ID="txtPassword"
                runat="server"
                CssClass="login-input"
                TextMode="Password" />
        </div>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="btnLogin_Click" />

    </div>

</form>
</body>
</html>
