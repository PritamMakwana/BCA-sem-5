<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="m-3">categorys</h1>
    <div class="d-flex flex-column m-3">     
  <asp:Button ID="add_category"  runat="server" Text="Add food Category" CssClass="btn btn-outline-dark w-auto" OnClick="add_category_Click" />
   </div>
    <div>
        <asp:GridView ID="gdv_categoryShow" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" DataKeyNames="cate_id" OnPageIndexChanging="gdv_categoryShow_PageIndexChanging"
              OnRowCancelingEdit="gdv_categoryShow_RowCancelingEdit"
            OnRowDeleting="gdv_categoryShow_RowDeleting"
            OnRowEditing="gdv_categoryShow_RowEditing"
            OnRowUpdating="gdv_categoryShow_RowUpdating" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="No" DataField="cate_id" />
                <asp:BoundField HeaderText="Category" DataField="cate_name" />
                <asp:BoundField ReadOnly="true" HeaderText="items" DataField="items" />
                <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
</asp:Content>

