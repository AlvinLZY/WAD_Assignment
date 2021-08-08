<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
        .auto-style3 {
            width: 612px;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 612px;
            height: 31px;
        }
        .auto-style7 {
            width: 612px;
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style=" text-align: center; margin-right: 20%; margin-left: 20%;">
    <table validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="auto-style5">
        <tr>
            <td colspan="2" style="text-align: center" class="auto-style1"><strong>Register</strong></td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Account Type :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:DropDownList ID="ddlAccType" runat="server">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Artist</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Email :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:TextBox ID="txtEmail" runat="server" ControlToValidate="txtEmail" Required="true" placeholder="e.g.. apple123@gmail.com"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Display="Dynamic" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" style="text-align: right">First name :</td>
            <td class="auto-style6" style="text-align: left">
                <asp:TextBox ID="txtFirstName" runat="server" Required="true" placeholder="e.g.. Michael"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter a valid name" ValidationExpression="[a-zA-Z/'/-]+" ControlToValidate="txtFirstName" Display="Dynamic" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Last name :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:TextBox ID="txtLastName" runat="server" Required="true" placeholder="e.g.. Jackson"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid format" ValidationExpression="[a-zA-Z/'/-]+" ControlToValidate="txtLastName" Display="Dynamic" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Date of Birth :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:TextBox ID="txtDob" runat="server" TextMode="Date" Required="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Gender :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:DropDownList ID="ddlGender" runat="server" Required="true">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Contact Number :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Required="true" placeholder="e.g.. 0123456789"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid contact no. format" ValidationExpression="[0-9]{10,11}" ControlToValidate="txtPhone" Display="Dynamic" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" style="text-align: right">Password :</td>
            <td class="auto-style7" style="text-align: left">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Required="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: right">Confirm Password :</td>
            <td class="auto-style3" style="text-align: left">
                <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" Required="true"></asp:TextBox>
            </td>
        </tr>
    </table>
        <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both password are not the same! Please check again." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:CompareValidator>
            <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
    
</asp:Content>
