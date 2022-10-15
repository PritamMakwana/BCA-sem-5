<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style =
     "position: absolute;
     top: 50%;
     left: 40%;
     text-align:center;">
    <div>
     <div class="maincnt">
            
                <asp:TextBox ID="textbox1" runat="server" ></asp:TextBox>
                
           
                <asp:Button ID="btnsavecity" runat="server" Text="add city" OnClick="btnsavecity_Click"  ></asp:Button>
            
               <br />
                <asp:DropDownList ID="ddlcity" runat="server" >
                    <asp:ListItem Value="0" >--- Select City--- </asp:ListItem>
                </asp:DropDownList>
            
            <asp:Button ID="btnshowcity" runat="server" Text="show" OnClick="btnshowcity_Click"  ></asp:Button>
         <br />
         <asp:Label ID="lbl" runat="server"></asp:Label>
     </div>
    </div>
    </form>
</body>
</html>
