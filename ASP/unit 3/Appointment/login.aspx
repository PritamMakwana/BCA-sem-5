<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
            height:30px
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
        <h1>Log in</h1>
        <hr />
    <div class="div">Email :<br />
        <asp:TextBox class="txt" ID="txtemail" runat="server" /><br/>
        Password: <br />
        <asp:TextBox class="txt" ID="txtpass" runat="server" /><br />
        <asp:Button  class="btn" ID="login_btn" Text="LOG IN" runat="server" OnClick="login_btn_Click" />
        <br />
        <asp:Button  class="btnadd" ID="create_btn" Text="Registration " runat="server" OnClick="create_btn_Click" />
    </div>
    </form>
</body>
</html>
