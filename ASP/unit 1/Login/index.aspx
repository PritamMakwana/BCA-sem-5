<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="
     position: absolute;
     top: 50%;
     left: 40%;
     text-align:center;">
        <h1>Login</h1>
    <div>
    <div>
    <asp:TextBox ID="email" runat="server"></asp:TextBox>
    </div>
        <div>
        <asp:TextBox ID="password" TextMode="Password" runat="server" ></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"  />
        </div>
    </div>
    </form>
</body>
</html>
