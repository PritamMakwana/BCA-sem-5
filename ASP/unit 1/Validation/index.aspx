<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="IndexSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody" >
    <h2 class="heading" >Validation From</h2>
        <!--name-->
     <asp:TextBox ID="txtname" class="filed" runat="server" placeholder=" Name "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="RFtxtname" runat="server" ControlToValidate="txtname" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="revUser" class="rev" runat="server" ControlToValidate="txtname" ErrorMessage="enter 5 letters (only alphabet)" ValidationExpression="^[A-Z a-z]{5,100}" />
        <br />
           <!--password-->
     <asp:TextBox ID="txtpass" class="filed" runat="server" placeholder=" password "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="RFtxtpass" runat="server" ControlToValidate="txtpass" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
        <br />
          <!--email-->
     <asp:TextBox ID="txtemail" class="filed" runat="server" placeholder=" Email "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="RFtxtemail" runat="server" ControlToValidate="txtemail" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <br />

        <!--number-->
     <asp:TextBox ID="txtphone" class="filed" runat="server" placeholder=" phone no. "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="rfvPhone" runat="server" ControlToValidate="txtphone" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="revPhone" class="rev" runat="server" ControlToValidate="txtphone" ErrorMessage="enter 10 digits" ValidationExpression="^[0-9]{10}" />
        <br />

         <!--zipcode-->
     <asp:TextBox ID="txtzip" class="filed" runat="server" placeholder=" zip code "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="rfvZip" runat="server" ControlToValidate="txtzip" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="revZip" class="rev" runat="server" ControlToValidate="txtzip" ErrorMessage="enter zip code (capital letters & digits) " ValidationExpression="^[A-Z0-9]{6,8}" />
        <br />


             <!--class-->
     <asp:TextBox ID="txtclass" class="filed" runat="server" placeholder=" Class  "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="rfvClass" runat="server" ControlToValidate="txtclass" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <asp:RangeValidator ID="revClass" class="rev" runat="server" ControlToValidate="txtclass" ErrorMessage="avaliable only 6th to 12th class" 
         MinimumValue="6" MaximumValue="12" Type="Integer"/>
        <br />
          <!--Total number-->
     <asp:TextBox ID="txttotal" class="filed" runat="server" placeholder=" total "></asp:TextBox>
      <asp:RequiredFieldValidator class="rf" ID="rfvtotal" runat="server" ControlToValidate="txttotal" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
      <br />
        <asp:TextBox ID="txtobatin" class="filed" runat="server" placeholder="obain "></asp:TextBox>
     <asp:RequiredFieldValidator class="rf" ID="rfvobtain" runat="server" ControlToValidate="txtobatin" ErrorMessage="flied can't be blank" ></asp:RequiredFieldValidator>
     <asp:CompareValidator ID ="com" class="rev" runat="server" ErrorMessage="total compare otbain number is greater "
         ControlToValidate="txttotal"
         ControlToCompare="txtobatin"
         Type="Integer"
         Operator="GreaterThanEqual" />
        <br />

       <!--submitbtn-->
     <asp:Button class="btnsubmit" ID="btnsubmit" runat="server" Text="submit" />

    </div>
    </form>
</body>
</html>
