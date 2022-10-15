<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
     <form id="form1" runat="server">
    <div class="frombody" >
      <h2 class="heading">Create Account </h2>
        <div class="filed">
        <asp:Label ID="lblFname" runat="server" Text="first Name :"  class=" lbl" />
        <asp:TextBox ID="txtFname" runat="server" class="tb" />
        </div>
        <div class="filed">
        <asp:Label ID="lblLname" runat="server" Text="Last Name :"  class=" lbl" />
        <asp:TextBox ID="txtLname" runat="server" class=" tb" />
            </div>
        <div class="filed">
        <asp:Label ID="lblUname" runat="server" Text="Username :"  class="lbl" />
        <asp:TextBox ID="txtUname" runat="server" class=" tb" />
            </div>
        <div class="filed">
        <asp:Label ID="lblpwd" runat="server" Text="Password :"  class="lbl" />
        <asp:TextBox ID="txtpwd" runat="server" class="tb" /> 
            </div>
        <div class="filed">
        <asp:Label ID="lblmoblie" runat="server" Text="Moblie No :"  class=" lbl" />
        <asp:TextBox ID="txtmoblie" runat="server" class=" tb" />
            </div>
        <div class="filed">
         <asp:Label ID="lbldob" runat="server" Text="DOB :"  class="lbl" />
        <asp:TextBox ID="txtdob" runat="server" TextMode="Date" class=" tb" />
            </div>

        <div class="filed">
         <asp:FileUpload  runat="server" ID="fuimg" class=" lbl" />
            </div>
           

             <div class="filed">
        <asp:Button ID="btn_submit" runat="server" Text="Submit"  class=" btn " OnClick="btn_submit_Click1" />
          </div>
         <div class="filed">
         <asp:Button ID="link_page" runat="server" Text="already have account ?"  class="btnlink" OnClick="link_page_Click" />
          </div>
       </div>
    </form>
</body>
</html>
