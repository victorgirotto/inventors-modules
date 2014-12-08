<%@ Page Title="Add Resource" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceAdd.aspx.cs" Inherits="IdentityTest.Modules.ResourceAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-container">
        <h2>Add Resource</h2>

        <ul class="no-bullets form-list">
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
                <asp:Label AssociatedControlID="ddlTypes" runat="server">Resource Type</asp:Label><br />
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
                <asp:Label AssociatedControlID="rblDifficulty" runat="server">Difficulty</asp:Label><br />
                <p>Rate the difficulty or applicability of this resource on a scale from 1 (Novice) to 5 (Expert)</p>

                Novice
                <asp:RadioButtonList runat="server" ID="rblDifficulty" CssClass="horizontal" RepeatLayout="OrderedList">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                </asp:RadioButtonList>
                Expert
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
                <p>
                    Make sure to include information on why is this resource here, such as: why is this resource useful? 
                    What users would benefit from this? What should users expect to learn? etc.
                </p>
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
