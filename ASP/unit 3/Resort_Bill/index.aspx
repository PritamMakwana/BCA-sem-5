<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="frombody" >
      <h2 class="heading">Resort Bill </h2>
        <asp:Label ID="lblname" runat="server" Text="Name :"  class=" lbl" />
        <asp:TextBox ID="txtname" runat="server" class=" tb" />

        <asp:Label ID="lblcusnub" runat="server" Text="Customer number :"  class="lbl" />
        <asp:TextBox ID="txtcusnub" TextMode="Number" runat="server" class=" tb" />

        <asp:Label ID="lbldob" runat="server" Text=" DOB :"  class="lbl" />
        <asp:TextBox ID="txtdob" input type ="Date" runat="server" class=" tb" />


        <asp:Label ID="lblcategory" runat="server" Text="Booking category :" class="lbl" />
       <asp:DropDownList AutoPostBack="true" ID="ddcategory" runat="server" class=" tb dd" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged"  >
           <asp:ListItem >please select</asp:ListItem>
           <asp:ListItem >please select</asp:ListItem>
           <asp:ListItem >please select</asp:ListItem>
           <asp:ListItem >please select</asp:ListItem>
       </asp:DropDownList>

         <asp:Label ID="lblprice" runat="server" Text="Price :"  class="lbl" />
        <asp:TextBox ID="txtprice" AutoPostBack="true"  ReadOnly="true" Text="0"  TextMode="Number" runat="server" class=" tb" OnTextChanged="txtprice_TextChanged" />

        <asp:Label ID="lblcusqty" runat="server" Text="Customer Quality number :"  class="lbl" />
        <asp:TextBox ID="txtcusqty" AutoPostBack="true" TextMode="Number" Text="1" runat="server" class=" tb" OnTextChanged="txtcusqty_TextChanged" />

        <asp:Label ID="lbltot" runat="server" Text="Total:"  class="lbl" />
        <asp:TextBox ID="txttot" AutoPostBack="true" ReadOnly="true" TextMode="Number" Text="0" runat="server" class=" tb" OnTextChanged="txttot_TextChanged" />

        <asp:Button class="btn" ID="btnTotal" runat="server" Text="Total" OnClick="btnTotal_Click" />
    
        <asp:GridView  ID="gdvShow" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnPageIndexChanging="gdvShow_PageIndexChanging" OnRowCancelingEdit="gdvShow_RowCancelingEdit" OnRowDeleting="gdvShow_RowDeleting" OnRowEditing="gdvShow_RowEditing" OnRowUpdating="gdvShow_RowUpdating">
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="no" DataField="Id" />
                <asp:BoundField HeaderText="Username" DataField="unname" />
                <asp:BoundField HeaderText="Phone" DataField="mobile" />
                <asp:BoundField HeaderText="DoB" DataField="dob" />
                <asp:BoundField ReadOnly="true" HeaderText="Category" DataField="category" />
                <asp:BoundField HeaderText="Persons" DataField="persons" />
                <asp:BoundField HeaderText="Amount" DataField="total" />
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
