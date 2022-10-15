<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
            color:red;
            font-size:20px;
        }
        .txt{
            width:300px;
            height:30px;
            margin:10px;
        }
        .btn{
            height:40px;
            width:300px;
            margin-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Appoinment </h1>
        <hr />
    <div class="div">
      <%--  Full Name:
        <asp:Label class="txt" ID="txtfullname" runat="server" /><br />
        Email :
        <asp:Label class="txt" ID="txtemail" runat="server" /><br/>
        Password: 
        <asp:Label class="txt" ID="txtpass" runat="server" /><br />
        Mobile : 
        <asp:Label class="txt" ID="txtmobile" runat="server" /><br />
         DOB : 
        <asp:Label class="txt" ID="txtDOB" runat="server" /><br />--%>
        <h1>Appointments</h1>

        <div>
            <asp:Repeater ID="rpt" runat="server">
                <HeaderTemplate>
                    <table >
                        <tr style="color:white; background-color:black;">
                            <b>
                                <th>Id</th>
                                <th>Fullname</th>
                                <th>Email</th>
                                <th>password</th>
                                <th>mobile</th>
                                <th>date</th>
                            </b>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr  style="color:white; background-color:brown;" >
                        <td>
                            <asp:Label runat="server" ID="lbl1" Text='<%# Eval("Id") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("fullname") %>'></asp:Label>
                       </td>
                        <td>
                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("email") %>'></asp:Label>
                         </td>
                        <td>
                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("pwd") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("mobile") %>'></asp:Label>
                        </td>
                         <td>
                            <asp:Label runat="server" ID="Label5" Text='<%# Eval("date") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <SeparatorTemplate>
                     <tr  style="color:white; background-color:black;">  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                         <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td> 
                </tr>  
                </SeparatorTemplate>
                <AlternatingItemTemplate>
                     <tr  style="color:white; background-color:blue;" >
                        <td>
                            <asp:Label runat="server" ID="lbl1" Text='<%# Eval("Id") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("fullname") %>'></asp:Label>
                       </td>
                        <td>
                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("email") %>'></asp:Label>
                         </td>
                        <td>
                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("pwd") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("mobile") %>'></asp:Label>
                        </td>
                         <td>
                            <asp:Label runat="server" ID="Label5" Text='<%# Eval("date") %>'></asp:Label>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                 <SeparatorTemplate>
                     <tr  style="color:white; background-color:black;">  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                         <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td> 
                </tr>  
                </SeparatorTemplate>
                 <FooterTemplate> 
                     </table> 
                       <p  style="color:black; background-color:whitesmoke; border:2px solid black; border-radius:10px;" ><b>End oF Data </b></p>               
            </FooterTemplate> 
            </asp:Repeater>
        </div>



        <asp:Button  class="btn" ID="logout_btn" Text="LOG OUT" runat="server" OnClick="logout_btn_Click"/>
    </div>
    </form>
</body>
</html>
