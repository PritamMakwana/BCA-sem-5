<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <h4 class="mb-1">Menu</h4>
    <div class="d-flex flex-row mb-2">   
        <div class="ms-3">  
    <asp:Button ID="add_Items"  runat="server" Text="Add food Items" CssClass="btn btn-outline-dark w-auto" OnClick="add_Items_Click" />
            </div>
        <div class="ms-3">
    <asp:Button ID="btn_all_show"  runat="server" Text="All food Items Show" CssClass="btn btn-outline-dark w-auto" OnClick="btn_all_show_Click" />
            </div>
        <div class="ms-3">
          <asp:DropDownList CssClass="btn btn-outline-dark w-auto" ID="dd_category" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dd_category_SelectedIndexChanged"  >
              <asp:ListItem>seledscxm</asp:ListItem>
      </asp:DropDownList>
        </div>
    </div>

    <asp:GridView ID="gdv_itemshow" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataKeyNames="item_id" 
        OnPageIndexChanging="gdv_itemshow_PageIndexChanging"
        OnRowCancelingEdit="gdv_itemshow_RowCancelingEdit"
        OnRowDeleting="gdv_itemshow_RowDeleting"
        OnRowEditing="gdv_itemshow_RowEditing"
        OnRowUpdating="gdv_itemshow_RowUpdating"
      BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:TemplateField HeaderText="No" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblImgId" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

            <asp:ImageField  ReadOnly="true" HeaderText="Image" DataImageUrlField="item_img" ControlStyle-Width="100" ControlStyle-Height="100">
            </asp:ImageField>
             <asp:BoundField HeaderText="Menu" DataField="item_title" />
             <asp:BoundField HeaderText="Price" DataField="item_price" />
             <asp:BoundField HeaderText="details" DataField="item_desc" />  
             <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
             <asp:CommandField HeaderText="Update" ShowEditButton="true" />
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
</asp:Content>

