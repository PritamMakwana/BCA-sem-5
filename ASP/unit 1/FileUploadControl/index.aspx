<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lbl" runat="server" Text="Upload File :-" />
        <asp:FileUpload ID="fuimg" runat="server"  />
        <br />
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
        <br />
        <asp:Label ID="lblshow" runat="server" />
        <br />
        <asp:Label ID="img" runat="server" Text="Image :- " />
        <asp:Image ID="imgshow" runat="server" Height="200" Width="200" />

    </div>
    </form>
</body>
</html>
