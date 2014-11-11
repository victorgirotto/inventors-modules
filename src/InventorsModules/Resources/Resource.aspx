<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="IdentityTest.Resources.Resource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><asp:Label runat="server" ID="ResourceTitle"></asp:Label></h1>

    <div>
        <asp:HyperLink runat="server" ID="ResourceLink" CssClass="btn btn-primary btn-lg" Target="_blank">Visit URL</asp:HyperLink>
    </div>
</asp:Content>
