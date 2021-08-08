<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Artist.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Assignment.Pages.Artist_UploadNewArtwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gvArtwork" >
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="img1" runat="server" ImageUrl='<%# "Handler1.ashx?id_Image="+ Eval("id") %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
<%--    <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="dataSource1" ConnectionString="<%$ ConnectionStrings:artWorkDB %>" SelectCommand="SELECT * FROM [Image]" />--%>
</asp:Content>
