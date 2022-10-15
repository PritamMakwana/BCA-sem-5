<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="display:flax; text-align:center; ">
    <div>
     <asp:TextBox runat="server" ID="name" placeholder="name" />
        <br />
     <asp:TextBox runat="server" ID="phone" placeholder="phone" />
        <br />
     <asp:TextBox runat="server" ID="pwd" placeholder="password" />
        <br />
     <asp:FileUpload  runat="server" ID="fuimg"  />
        <br />
        <asp:Button runat="server" ID="btn" Text="Submit" OnClick="btn_Click" />
         <br />
    </div>
        <asp:GridView ID="gdvShow" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" DataKeyNames="Id"  BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnPageIndexChanging="gdvShow_PageIndexChanging" OnRowDeleting="gdvShow_RowDeleting" OnRowEditing="gdvShow_RowEditing" OnRowCancelingEdit="gdvShow_RowCancelingEdit" OnRowUpdating="gdvShow_RowUpdating">
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="no" DataField="Id" />
                <asp:BoundField HeaderText="Name" DataField="name" />
                <asp:BoundField HeaderText="Phone no." DataField="phone" />
                <asp:BoundField HeaderText="Password" DataField="pwd" />
                <asp:ImageField  ReadOnly="true" HeaderText="Image" DataImageUrlField="img" ControlStyle-Width="50" ControlStyle-Height="50" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" /> 
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />            
            </Columns>
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        
    </form>
</body>
</html>
