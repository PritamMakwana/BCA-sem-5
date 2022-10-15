<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
    <div style="background-color:aqua;
                width:500px;
                height:500px;
                border: 2px solid black;
                border-radius: 8px;
                margin-left:210px;
                margin-top:110px;">
        <div style="text-align:center;
                    margin-top:50px;">

        <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lfname" runat="server"  Text="Frist Name :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 60px;" ID="fname" runat="server"></asp:TextBox>
        </div>

        <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Llastname" runat="server"  Text="Last Name :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 60px" ID="lastname" runat="server"></asp:TextBox>
        </div>

          <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lsname" runat="server"  Text="Sure Name :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 65px" ID="sname" runat="server"></asp:TextBox>
        </div>

             <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lage" runat="server"  Text="Age :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 100px" input type="number" ID="age" runat="server"></asp:TextBox>
        </div>


            <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto; margin-right:60px"  ID="Lbod" runat="server"  Text="Death of Brith :"></asp:Label>
                <asp:TextBox style="margin: 0px 0px 0px 10px" input type="date" ID="dob" runat="server"></asp:TextBox>    
        </div>

            <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Ladd" runat="server"  Text="Address :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 60px;" ID="add" runat="server"></asp:TextBox>     
        </div>

                <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lemail" runat="server"  Text="Email :"></asp:Label>
            <asp:TextBox style="margin: 0px 0px 0px 60px;" ID="email" TextMode="Email" input type="e" runat="server"></asp:TextBox>     
        </div>
            
            <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lgen" runat="server"  Text="Gender :"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="gender" />  
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="gender" />     
        </div>

              <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lhobby" runat="server"  Text="Hobby :"></asp:Label>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="reading" />  
            <asp:CheckBox ID="CheckBox2" runat="server" Text="eating" />  
            <asp:CheckBox ID="CheckBox3" runat="server" Text="dansing" />      
        </div>

             <div style="margin: 10px 0px" >
            <asp:Label style="margin-bottom:auto"  ID="Lcity" runat="server"  Text="City :"></asp:Label>
             <asp:DropDownList ID="ddcity" runat="server" >  
            <asp:ListItem Value="">Please Select</asp:ListItem>  
            <asp:ListItem>Delhi </asp:ListItem>  
            <asp:ListItem>amreli</asp:ListItem>  
            <asp:ListItem>surat</asp:ListItem>  
            <asp:ListItem>gir</asp:ListItem>  
            <asp:ListItem>diu</asp:ListItem>  
        </asp:DropDownList>     
        </div>

        <div style="margin:5px;">
            <asp:Button style="margin:5px;" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
        </div>
            </div>    
    </div>
    </form>
</body>
</html>
