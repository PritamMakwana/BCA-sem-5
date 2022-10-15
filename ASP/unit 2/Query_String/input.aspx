<%@ Page Language="C#" AutoEventWireup="true" CodeFile="input.aspx.cs" Inherits="input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Id :
       <asp:TextBox runat="server" ID="txtid" required/>
        <br />
       <asp:Button runat="server" ID="btn" Text="Submit" OnClick="btn_Click" />
    </div>
    </form>
</body>
</html>
