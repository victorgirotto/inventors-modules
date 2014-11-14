<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Modules.aspx.cs" Inherits="WebApplication1.Pages.Modules.Modules" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
        <div class="col-md-2">
            <div class="menu">

                <asp:TextBox runat="server" TextMode="Search" placeholder="Search in modules"></asp:TextBox>
                    
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
                
                <h5>
                    <asp:HyperLink runat="server" NavigateUrl="~/Modules/ModuleCreation.aspx" CssClass="btn btn-primary">
                        New Module
                    </asp:HyperLink>
                </h5>

            </div>
        </div>
        <div class="col-md-10 main-container">
            <div class="spaced">
                <h3>Recently Added Modules</h3>

                <div class="row not-spaced">
                    <asp:Repeater ID="RecentModulesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="grid-item">
                                    <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='<%# String.Format("~/Modules/{0}", Eval("Id")) %>'>
                                        <asp:Image runat="server" ImageUrl='<%# IdentityTest.Helpers.ImageHelper.GetImageThumbUrl(Eval("ImageUrl").ToString()) %>' />
                                    </asp:HyperLink>
                                    <h4>
                                        <asp:HyperLink runat="server" NavigateUrl="#">
                                            <%#Eval("title")%>
                                        </asp:HyperLink>
                                    </h4>
                                    <h5>By <asp:HyperLink runat="server" NavigateUrl="#"><%#Eval("Owner.Username")%></asp:HyperLink></h5>
                                </div>
                            </div>        
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
