<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceAdd.aspx.cs" Inherits="IdentityTest.Modules.ResourceAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-container">
        <h2>Add Resource</h2>

        <ul class="no-bullets">
            <li>
                <asp:Label runat="server" AssociatedControlID="ResourceTitle">Title</asp:Label>
                <asp:TextBox runat="server" ID="ResourceTitle"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ResourceTitle"
                    ErrorMessage="The title field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="ResourceTitle" 
                    ValidationExpression="^[\s\S]{0,50}$"
                    ErrorMessage="The max length of the title is 50 characters."
                    CssClass="error"/>
            </li>
            <li>
                <asp:Label runat="server" AssociatedControlID="ResourceUrl">URL</asp:Label>
                <asp:TextBox runat="server" ID="ResourceUrl"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ResourceUrl"
                    ErrorMessage="The URL field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="ResourceUrl" 
                    ValidationExpression="^[\s\S]{0,2000}$"
                    ErrorMessage="The max length of the URL is 2000 characters."
                    CssClass="error"/>
            </li>
            <li>
                <asp:Label ID="lblResourceType" runat="server" Text="Resource type"></asp:Label><br />
                <asp:DropDownList runat="server" 
                    ID="ddlTypes"
                    DataTextField="Name"
                    DataValueField="Id">
                </asp:DropDownList><br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ddlTypes" 
                    ErrorMessage="Please select a type for the resource"
                    CssClass="error">
                </asp:RequiredFieldValidator>
            </li>
            <li>
                <asp:Label runat="server" AssociatedControlID="ResourceImage">Upload resource image:</asp:Label>
                <asp:FileUpload ID="ResourceImage" runat="server" />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ResourceImage"
                    ErrorMessage="The image upload is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
            </li>
            <li>
                <asp:Label runat="server" AssociatedControlID="ResourceDescription">Description</asp:Label>
                <asp:TextBox runat="server" ID="ResourceDescription" TextMode="MultiLine" Columns="60" Rows="10"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ResourceDescription"
                    ErrorMessage="The description field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="ResourceDescription" 
                    ValidationExpression="^[\s\S]{0,2000}$"
                    ErrorMessage="The max length of the description is 2000 characters."
                    CssClass="error"/>
            </li>
            <li>
                <asp:Button ID="CreateResource" runat="server" Text="Create" OnClick="CreateResource_Click" CssClass="btn btn-default" />
            </li>
        </ul>
    </div>
    

</asp:Content>
