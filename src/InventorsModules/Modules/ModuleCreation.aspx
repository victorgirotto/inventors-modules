<%@ Page Title="Module Creation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ModuleCreation.aspx.cs" Inherits="WebApplication1._ModuleCreation" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="main-container">
        <h2>Module Creation</h2>
        
        <ul class="no-bullets">
            <li>
                <asp:Label ID="lblTitle" runat="server" Text="Title" AssociatedControlID="txtTitle"></asp:Label><br />
                <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="txtTitle"
                    ErrorMessage="The title field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="txtTitle" 
                    ValidationExpression="^[\s\S]{0,50}$"
                    ErrorMessage="The max length of the title is 50 characters."
                    CssClass="error"/>
            </li>
            <li>
                <asp:Label ID="lblModuleType" runat="server" Text="Module type" AssociatedControlID="ddlTypes"></asp:Label><br />
                <asp:DropDownList runat="server" 
                    ID="ddlTypes"
                    DataTextField="Name"
                    DataValueField="Id">
                </asp:DropDownList><br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ddlTypes"
                    ErrorMessage="Please select a type for the module"
                    InitialValue="-"
                    CssClass="error"/>
            </li>
            <li>
                <%--
                <asp:Label ID="lblImgUrl" runat="server" Text="Upload module image: "></asp:Label>
                <asp:FileUpload runat="server" ID="ModuleImage" />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ModuleImage"
                    ErrorMessage="The image upload is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                --%>
                <asp:Label runat="server" AssociatedControlID="ResourceImageUrl">Image URL</asp:Label><br />
                <asp:TextBox runat="server" ID="ResourceImageUrl" Columns="60"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="ResourceImageUrl"
                    ErrorMessage="The URL field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="ResourceImageUrl" 
                    ValidationExpression="^[\s\S]{0,2000}$"
                    ErrorMessage="The max length of the URL is 2000 characters."
                    CssClass="error"/>
            </li>
            <li>
                <asp:Label ID="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Width="300px" TextMode="MultiLine" Columns="60" Rows="10"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="txtDescription"
                    ErrorMessage="The description field is mandatory."
                    Display="Dynamic"
                    CssClass="error" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="txtDescription" 
                    ValidationExpression="^[\s\S]{0,2000}$"
                    ErrorMessage="The max length of the description is 2000 characters."
                    CssClass="error"/>

            </li>
            <li>
                <asp:CheckBox ID="chkboxPrivateModule" runat="server" Text="Private Module" />
            </li>
        </ul>
    
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>

