<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="WebApplication1.Pages.Modules.Modules" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
        <div class="col-md-3">
            <div class="inner-container menu">

                <asp:TextBox runat="server" TextMode="Search" placeholder="Search in modules"></asp:TextBox>
                
                <h5><a href="#">Home</a></h5>
                <h5>Browse by Type</h5>
                <ul>
                    <li><a href="#">Art</a></li>
                    <li><a href="#">Technology</a></li>
                    <li><a href="#">Philosophy</a></li>
                    <li><a href="#">Music</a></li>
                    <li><a href="#">Mathematics</a></li>
                    <li><a href="#">Languages</a></li>
                    <li><a href="#">Sports</a></li>
                    <li><a href="#">Hacker-maker</a></li>
                </ul>
                <asp:HyperLink runat="server" NavigateUrl="~/Pages/Modules/ModuleCreation.aspx" CssClass="button">
                    Create a new module
                </asp:HyperLink>
            </div>
        </div>
        <div class="col-md-9">
            <div class="spaced">
                <h3>Featured Modules</h3>
                
                <div class="row">
                    <asp:Repeater ID="FeaturedModulesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="grid-item">
                                    <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='<%# String.Format("~/Pages/Modules/{0}", Eval("PrKey")) %>'>
                                        <div>&nbsp;</div>
                                    </asp:HyperLink>
                                    <h4>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/Pages/Modules/{0}", Eval("PrKey")) %>'>
                                            <%#Eval("title")%>
                                        </asp:HyperLink>
                                    </h4>
                                    <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                </div>
                            </div>        
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <h3>Best Rated Modules</h3>

                <div class="row">
                    <asp:Repeater ID="BestModulesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="grid-item">
                                    <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='<%# String.Format("~/Pages/Modules/{0}", Eval("PrKey")) %>'>
                                        <div>&nbsp;</div>
                                    </asp:HyperLink>
                                    <h4>
                                        <asp:HyperLink runat="server" NavigateUrl="#">
                                            <%#Eval("title")%>
                                        </asp:HyperLink>
                                    </h4>
                                    <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                </div>
                            </div>        
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <h3>Recently Added Modules</h3>

                <div class="row not-spaced">
                    <asp:Repeater ID="RecentModulesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="grid-item">
                                    <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='<%# String.Format("~/Pages/Modules/{0}", Eval("PrKey")) %>'>
                                        <div>&nbsp;</div>
                                    </asp:HyperLink>
                                    <h4>
                                        <asp:HyperLink runat="server" NavigateUrl="#">
                                            <%#Eval("title")%>
                                        </asp:HyperLink>
                                    </h4>
                                    <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                </div>
                            </div>        
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
