<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Category.aspx.cs" Inherits="Add_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 class="m-3">Add-Category</h1>
 <div class="mb-3 d-flex flex-row align-items-center">
  <asp:Label class="form-label w-auto me-3" runat="server" ID="lbl_cate">Category Name:</asp:Label>
  <asp:TextBox class="form-control w-auto" runat="server" ID="txt_cate_name"  placeholder="category name" required/>
</div>
  <asp:Button class="btn btn-outline-dark w-auto" runat="server" ID="btn_add_cate" Text="Add Category" required OnClick="btn_add_cate_Click"/>
  <asp:Label class="form-label me-3" runat="server" ID="lbl_mess" />
</asp:Content>

