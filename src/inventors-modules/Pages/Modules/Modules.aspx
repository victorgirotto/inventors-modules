<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="WebApplication1.Pages.Modules.Modules" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <asp:Repeater ID="ModulesRepeater" runat="server">
            <ItemTemplate>
                <li>
                    <%#Eval("title")%>
                </li>        
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</asp:Content>
