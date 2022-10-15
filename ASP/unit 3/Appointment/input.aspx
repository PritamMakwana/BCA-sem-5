<%@ Page Language="C#" AutoEventWireup="true" CodeFile="input.aspx.cs" Inherits="input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style>
        h1{
            text-align:center;
        }
        .div{
            margin:80px 480px;
            padding:20px;
        }
        .txt{
            width:300px;
            height:30px;
            margin-top:10px;
        }
        .btn{
            height:40px;
            width:300px;
            margin-top:10px;
        }
         .btnadd{
            height:40px;
            width:300px;
            margin-top:50px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
            <h1>Registration From </h1>
        <hr />
    <div class="div">
        Full Name:
        <asp:TextBox class="txt" ID="txtfullname" runat="server" /><br />
        Email :
        <asp:TextBox class="txt" ID="txtemail" runat="server" /><br/>
        Password: 
        <asp:TextBox class="txt" ID="txtpass" runat="server" /><br />
        Mobile : 
        <asp:TextBox class="txt" ID="txtmobile" runat="server" /><br />
         DOB : 
        <asp:TextBox class="txt" TextMode="Date" ID="txtDOB" runat="server" /><br />
        <asp:Button  class="btn" ID="create_btn" Text="Registration " runat="server" OnClick="create_btn_Click" /><br />
         <asp:Button class="btnadd" ID="log_in" Text="Log in" runat="server" OnClick="log_in_Click"  />

    </div>
    </form>
</body>
</html>
