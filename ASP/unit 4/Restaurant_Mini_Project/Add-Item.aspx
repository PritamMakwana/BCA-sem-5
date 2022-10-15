<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Item.aspx.cs" Inherits="Add_Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="m-3">Add Food Item</h1>

 <div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_name">Food Item Name:</asp:Label>
  <asp:TextBox class="form-control w-auto" runat="server" ID="txtItem_name"  placeholder="Food Item Name" required/>
</div>

<div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_price">Food Item Price:</asp:Label>
  <asp:TextBox  TextMode="Number" class="form-control w-auto" runat="server" ID="txtItem_price"  placeholder="Food Item Price" required/>
</div>

<div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_desc">Food Item Description:</asp:Label>
  <asp:TextBox TextMode="MultiLine" Height="100" class="form-control w-100" runat="server" ID="txtItem_desc"  placeholder="Food Item Information" required/>
</div>

 <div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_category">Food Category:</asp:Label>
      <asp:DropDownList ID="dd_category" runat="server" AutoPostBack="true" >
      </asp:DropDownList>
</div>

    <div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_img">Food Item Image:</asp:Label>
  <asp:FileUpload class="form-control w-auto" runat="server" ID="txtItem_img" required/>
</div>





  <asp:Button class="btn btn-outline-dark w-auto" runat="server" ID="btn_add_item" Text="Add Item" required OnClick="btn_add_item_Click"/>
  <asp:Label class="form-label me-3" runat="server" ID="lbl_mess" />
       
     <script type="text/javascript">
    window.onload = function () {
        var textarea = document.getElementById('<%=txtItem_desc.ClientID %>');
        textarea.scrollTop = textarea.scrollHeight;
    }
</script>
</asp:Content>

