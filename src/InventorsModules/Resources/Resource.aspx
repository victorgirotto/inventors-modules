<%@ Page Title="Resource" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="IdentityTest.Resources.Resource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-3 inner-container centralized">
            <div style="background: white; padding: 0; display: inline-block">
                <asp:Image runat="server" ID="ResourceImage" />
            </div>
        </div>
        <div class="col-md-9 main-container">
            <h1><asp:Label runat="server" ID="ResourceTitle"></asp:Label> </h1>
            
            <h3 class="subtitle">
                <span class="label label-default"><asp:Label runat="server" ID="uc_ResourceType"></asp:Label></span> 
                Created on <asp:Label runat="server" ID="DateCreated"></asp:Label> by <asp:Label runat="server" ID="CreatedBy"></asp:Label>

            </h3>

            <div class="spaced">
                <asp:HyperLink runat="server" ID="ResourceLink" CssClass="btn btn-primary btn-lg" Target="_blank">Visit URL</asp:HyperLink>
            </div>

            <div>
                <p><asp:Label runat="server" ID="ResourceDescription"></asp:Label></p>

                <p><strong>Difficulty level: </strong> <asp:Label runat="server" ID="uc_DifficultyLevel">-</asp:Label> / 5</p> 
            </div>

            <h3>Metadata</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Value</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="uc_MetadataRepeater">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Value") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            
        </div>
    </div>
    
</asp:Content>
