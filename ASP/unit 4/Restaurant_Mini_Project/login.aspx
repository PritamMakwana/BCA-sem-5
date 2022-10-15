<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in | Admin </title>
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <form id="form1" runat="server" class="formbody">
        <h2 class="heading">Log in</h2>
    <div class="field">
     <asp:Label ID="unm" runat="server" Text="Username :" class="lbl" />
     <asp:TextBox ID="txtnm" runat="server" class="tb" required />
    </div>
     <div class="field">
     <asp:Label ID="pwd" runat="server" Text="Password :" class="lbl" />
     <asp:TextBox ID="txtpwd" runat="server" class="tb" required />
    </div>
     <asp:Button ID="btn_login"  runat="server" Text="Log in" class="btn" OnClick="btn_login_Click" />
     <asp:Label ID="lbl_err_msg" runat="server" Text="" class="lbl" />
    </form>
</body>
</html>
