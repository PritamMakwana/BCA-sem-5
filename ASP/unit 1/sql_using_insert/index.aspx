<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtname" runat="server" />
        <br />
        <asp:TextBox ID="txtmobile" runat="server" />
        <br />
        <asp:TextBox ID="txtpwd" runat="server" />
        <br />
        <asp:Button ID="btnsubmit" runat="server" Text="submit" OnClick="btnsubmit_Click" />
            <br />
    </div>
    </form>
</body>
</html>
