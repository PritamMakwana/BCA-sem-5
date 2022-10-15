<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label CssClass="heading" runat="server">Choose your Location :- </asp:Label>

    <div class="formdata" >

   <div class="ddback dditem1">
       <asp:DropDownList ID="ddCountry" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged">
           <asp:ListItem>...select country</asp:ListItem>
            <asp:ListItem value ="inadia">Inadia</asp:ListItem>
       </asp:DropDownList>
   </div>

        <div class="ddback">
       <asp:DropDownList ID="ddState" runat="server"  CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddState_SelectedIndexChanged">
           <asp:ListItem>...select State</asp:ListItem>
            <asp:ListItem value ="gujarat">gujarate</asp:ListItem>
       </asp:DropDownList>
   </div>


        <div class="ddback">
       <asp:DropDownList ID="ddCity" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddCity_SelectedIndexChanged">
           <asp:ListItem>...select City</asp:ListItem>
            <asp:ListItem value ="amreli">Amreli</asp:ListItem>
       </asp:DropDownList>
   </div>
        </div>

    </div>
    </form>
    
</body>
</html>
