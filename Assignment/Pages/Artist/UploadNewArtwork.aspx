<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Artist.Master" AutoEventWireup="true" CodeBehind="UploadNewArtwork.aspx.cs" Inherits="Assignment.Pages.Artist_Gallary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table>
        <tr>
            <td>
                <asp:Label runat="server" Text="Artwork Name" />
            </td>
            <td>:</td>
            <td>
                <asp:TextBox runat="server" ID="tbArtworkName" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="Upload  Artwork Image" />
            </td>
            <td>:</td>
            <td>
                <asp:FileUpload runat="server" ID="fuImage" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="Artwork Price" /></td>
            <td>:</td>
            <td>
                <asp:TextBox runat="server" ID="tbUnitPrice"/>
                <asp:RegularExpressionValidator runat="server" ID="revUnitPrice" ControlToValidate="tbUnitPrice" ErrorMessage="Please insert in the right format." ValidationExpression="^\d+(\.\d*)?$" style="color:red"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="Artwork Descriptions" /></td>
            <td>:</td>
            <td>
                <asp:TextBox runat="server" ID="tbDescription" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center; height: 5vw">
                <asp:Label runat="server" ID="lblNotification" Text="NotificationMsg" Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Button runat="server" ID="btnUpload" Text="Upload Image" OnClick="btnUpload_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
