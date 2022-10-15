<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="userprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server" style="display: flex; justify-content: center;">
        <div>
            <asp:Repeater ID="rpt_show" runat="server">
                <HeaderTemplate>
                    <h3>Available users</h3>
                </HeaderTemplate>
                <ItemTemplate>
                    <table style="border: 1px solid black; background-color: pink;">
                        <tr>
                            <td style="width: 200px">
                                <asp:Image runat="server" Width="200px" Height="140px" ID="UserProfile" ImageUrl='<%# Eval("profile") %>' />
                            </td>
                            <td style="width: 200px">
                                <table>
                                    <tr>
                                        <td><b>ID </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl1" Text='<%# Eval("Id") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Username</b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("uname") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Mobile </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("mobile") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Address </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("address") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Date Of Birth </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("dob") %>'></asp:Label></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <table style="border: 1px solid black; background-color: powderblue;">
                        <tr>
                            <td style="width: 200px">
                                <asp:Image runat="server" Width="200px" Height="140px" ID="UserProfile" ImageUrl='<%# Eval("profile") %>' />
                            </td>
                            <td style="width: 200px">
                                <table>
                                    <tr>
                                        <td><b>ID </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbl1" Text='<%# Eval("Id") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Username</b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("uname") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Mobile </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("mobile") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Address </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("address") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Date Of Birth </b></td>
                                        <td>
                                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("dob") %>'></asp:Label>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </AlternatingItemTemplate>
                <SeparatorTemplate>
                    <br />
                    <hr />
                </SeparatorTemplate>
                <FooterTemplate>
                    <p>footer area</p>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
