<%@ Page Title="Module Creation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ModuleCreation.aspx.cs" Inherits="WebApplication1._ModuleCreation" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="main-container">
        <h2>Module Creation</h2>

        <ul class="no-bullets">
            <li>
                <asp:Label ID="lblTitle" runat="server" Text="Title: "></asp:Label>
                <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="lblImgUrl" runat="server" Text="Upload module image"></asp:Label>
                <asp:FileUpload runat="server" ID="ModuleImage" />
            </li>
            <li>
                <asp:Label ID="lblDescription" runat="server" Text="Description: "></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Width="300px" TextMode="MultiLine" Columns="60" Rows="10"></asp:TextBox>
            </li>
            <li>
                <asp:CheckBox ID="chkboxPrivateModule" runat="server" Text="Private Module" />
            </li>
        </ul>
    
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>

