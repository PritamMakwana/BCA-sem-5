<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addData.aspx.cs" Inherits="addData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="style1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="frombody" >
      <h2 class="heading">Resort Add Category</h2>
        <asp:Label ID="lbl1" runat="server" Text="Add Category :"  class=" lbl" />
        <asp:TextBox ID="txtcategory" runat="server" class=" tb" />

        <asp:Label ID="lbl2" runat="server" Text="Add price :"  class="lbl" />
        <asp:TextBox ID="txtprice" TextMode="Number" runat="server" class=" tb" />
     
        <asp:Button class="btn" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"  />
         <asp:GridView ID="gdvShow" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnPageIndexChanging="gdvShow_PageIndexChanging" OnRowCancelingEdit="gdvShow_RowCancelingEdit" OnRowDeleting="gdvShow_RowDeleting" OnRowEditing="gdvShow_RowEditing" OnRowUpdating="gdvShow_RowUpdating">
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="no" DataField="Id" />
                <asp:BoundField HeaderText="Category" DataField="category" />
                <asp:BoundField HeaderText="price" DataField="price" />
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
