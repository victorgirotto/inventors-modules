<%@ Page Title="Find Resources" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleResourceFinder.aspx.cs" Inherits="IdentityTest.Resources.FindResources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-12 main-container">
            <h2>Contextual Resource Search</h2>
            <p>This tool allows you to find resources that are relevant to your interests, and easily add them to a module. Contributing to a module couldn't get any easier. :)</p>
            
            <div class="row spaced full-width-input">
                <div class="col-md-5">
                    <h3><asp:Label runat="server">1. Enter your topic</asp:Label></h3>
                    <p>
                        The topic is the overall subject you want to find resources for. 
                        E.g. Data Analysis, Classical Music, Programming.
                    </p>
                    <asp:TextBox runat="server" ID="uc_Topic" ng-model="topic"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" 
                        ControlToValidate="uc_topic" 
                        ErrorMessage="You must enter a topic"
                        CssClass="error"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-5">
                    <h3><asp:Label runat="server">2. Refine with keywords</asp:Label></h3>
                    <p>
                        Keywords are a specialization of your topic. E.g. Hypothesis testing, Baroque, Python.
                        This is a comma-separated list.
                    </p>
                    <asp:TextBox runat="server" ID="uc_Keywords"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <h3>3. Search!</h3>
                    <p>Hit the search button, and select the best results.</p>
                    <asp:Button runat="server" class="btn btn-primary btn-lg" Text="Search" OnClick="FindResources_Click" />
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th class="small">#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>URL</th>
                        <th class="small"></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="uc_ResultsRepeater">
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("Title") %></td>
                                <td><%# Eval("Description") %></td>
                                <td><a href='<%# Eval("Url") %>' target="_blank" class="btn btn-default">Visit Url</a></td>
                                <td>
                                    <asp:HyperLink runat="server"
                                        class="btn btn-default"
                                        NavigateUrl='<%# 
                                            "~/Resources/ResourceAdd.aspx?title=" + Eval("Title") +
                                            "&description=" + Eval("Description") + 
                                            "&url=" + Eval("Url")
                                        %>' 
                                        target="_blank">
                                        +
                                    </asp:HyperLink>

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>