<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
     <form id="form1" runat="server">
    <div class="frombody" >
      <h2 class="heading">Log in</h2>
      
        <div class="filed">
        <asp:Label ID="lblUname" runat="server" Text="Username :"  class="lbl" />
        <asp:TextBox ID="txtUname" runat="server" class=" tb" />
            </div>
        <div class="filed">
        <asp:Label ID="lblpwd" runat="server" Text="Password :"  class="lbl" />
        <asp:TextBox ID="txtpwd" runat="server" class="tb" /> 
            </div>
       
             <div class="filed">
        <asp:Button ID="btn_submit" runat="server" Text="Log in"  class=" btn " OnClick="btn_submit_Click" />
          </div>
         <div class="filed">
         <asp:Button ID="link_page" runat="server" Text="Create account ?"  class="btnlink" OnClick="link_page_Click" />
          </div>
         <asp:GridView  ID="gdvstu" AutoGenerateColumns="false" AllowPaging ="True" PageSize="5" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnPageIndexChanging="gdvstu_PageIndexChanging" OnRowCancelingEdit="gdvstu_RowCancelingEdit" OnRowDeleting="gdvstu_RowDeleting" OnRowEditing="gdvstu_RowEditing" OnRowUpdating="gdvstu_RowUpdating" DataKeyNames="id">
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="no" DataField="Id" />
                <asp:BoundField HeaderText="FristName" DataField="fname" />
                <asp:BoundField HeaderText="LastName" DataField="lname" />
                <asp:BoundField HeaderText="UserName" DataField="uname" />
                <asp:BoundField HeaderText="Password" DataField="pwd" />
                <asp:BoundField HeaderText="Phone no." DataField="mobile" />
                <asp:BoundField  ReadOnly="true" HeaderText="DOB" DataField="dob" />
                <asp:ImageField  ReadOnly="true" HeaderText="Image" DataImageUrlField="img" ControlStyle-Width="50" ControlStyle-Height="50" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" /> 
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />            
            </Columns>
              <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />

         </asp:GridView>
       </div>
        
    </form>
</body>
</html>
