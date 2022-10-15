<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="top:35%; left:40%; position:absolute;" >
    
       <div style="margin:10px;">
           <asp:TextBox ID ="txtcity" runat="server" />
       </div>
         <div style="margin:10px;">
           <asp:Button ID ="btn" Text="submit" runat="server" OnClick="btn_Click" />
       </div>
        <div style="margin:10px;">
           <asp:DropDownList ID="ddcity" runat="server" AutoPostBack="true" >
               <asp:ListItem>...select city...</asp:ListItem>
           </asp:DropDownList>
       </div>
    
    </form>
</body>
</html>
