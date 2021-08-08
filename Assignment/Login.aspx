<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 32px;
        }
        .auto-style3 {
        height: 32px;
        width: 245px;
    }
        .auto-style4 {
            height: 29px;
            width: 245px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
    <div style=" text-align: center; margin-right: 25%; margin-left: 25%;">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2" colspan="2" style="text-align: center">Login</td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right">Account Type</td>
                <td class="auto-style3" style="text-align: left">
                    : <asp:DropDownList ID="ddlAccType" runat="server">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Artist</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right">Email</td>
                <td class="auto-style3" style="text-align: left">
                    : <asp:TextBox ID="txtLoginEmail" runat="server" Required="true"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtLoginEmail" Display="Dynamic" ErrorMessage="Invalid email address" Font-Size="Smaller" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right">Password</td>
                <td class="auto-style3" style="text-align: left">
                    : <asp:TextBox ID="txtLoginPass" runat="server" TextMode="Password" Required="true"></asp:TextBox>
                </td>
            </tr>
        </table>

        <p>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    </p>
        </div>
    <p>
        &nbsp;</p>
    
</asp:Content>
