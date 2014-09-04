<%@ Page Title="Module Creation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleCreation.aspx.cs" Inherits="WebApplication1._ModuleCreation" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <h1>Module Creation</h1>
    </div>
    <asp:Panel ID="PanelModuleHeader" runat="server">
        <asp:Label ID="lblTitle" runat="server" Text="Title: "></asp:Label>
        <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
        <br />
        <asp:Label ID="lblDescription" runat="server" Text="Description: "></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" Width="300px"></asp:TextBox>
        &nbsp;<asp:CheckBox ID="chkboxPrivateModule" runat="server" Text="Private Module" />
        <br />
        <asp:Label ID="lblTags" runat="server" Text="Tags: "></asp:Label>
        <asp:TextBox ID="txtTags" runat="server" Width="300px"></asp:TextBox>
    </asp:Panel>
    <asp:Panel ID="PanelModuleDetails" runat="server">
        <h4>Add Resources:</h4>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <br />
        <asp:Panel ID="PanelSearchResults" runat="server" Height="400px" Width="800px" Visible="false" ScrollBars="Auto">
            <asp:CheckBoxList ID="cblSearchResults" runat="server"></asp:CheckBoxList>
        </asp:Panel>
    </asp:Panel>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>

