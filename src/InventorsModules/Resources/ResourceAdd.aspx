<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceAdd.aspx.cs" Inherits="IdentityTest.Modules.ResourceAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Add Resource</h2>

    <ul class="no-bullets">
        <li>
            <asp:Label runat="server" AssociatedControlID="ResourceTitle">Title</asp:Label>
            <asp:TextBox runat="server" ID="ResourceTitle"></asp:TextBox>
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="ResourceUrl">URL</asp:Label>
            <asp:TextBox runat="server" ID="ResourceUrl"></asp:TextBox>
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="ResourceImage">Upload Image</asp:Label>
            <asp:FileUpload ID="ResourceImage" runat="server" />
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="ResourceDescription">Description</asp:Label>
            <asp:TextBox runat="server" ID="ResourceDescription" TextMode="MultiLine"></asp:TextBox>
        </li>
        <li>
            <asp:Button ID="CreateResource" runat="server" Text="Create" OnClick="CreateResource_Click" CssClass="btn btn-default" />
        </li>
    </ul>
    

</asp:Content>
