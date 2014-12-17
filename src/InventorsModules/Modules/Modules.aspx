<%@ Page Title="Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Modules.aspx.cs" Inherits="WebApplication1.Pages.Modules.Modules" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
        <div class="col-md-2">
            <div class="menu">

                <asp:TextBox runat="server" TextMode="Search" placeholder="Search in modules"></asp:TextBox>
                    
                <ul>
                    <asp:Repeater runat="server" ID="ModuleTypesRepeater">
                        <HeaderTemplate>
                            <li>
                                <a href="?">All</a>
                            </li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="?type=<%#Eval("Id")%>">
                                    <%#Eval("Name")%>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                
                <asp:LoginView runat="server">
                    <LoggedInTemplate>
                        <h5>
                            <asp:HyperLink runat="server" NavigateUrl="~/Modules/ModuleCreation.aspx" CssClass="btn btn-primary">
                                New Module
                            </asp:HyperLink>
                        </h5>
                    </LoggedInTemplate>
                </asp:LoginView>

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
                                        <asp:Image runat="server" Width="190" Height="150" ImageUrl='<%# IdentityTest.Helpers.ImageHelper.GetImageThumbUrl(Eval("ImageUrl").ToString()) %>' />
                                    </asp:HyperLink>
                                    <h4>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/Modules/{0}", Eval("Id")) %>'>
                                            <%#Eval("title")%>
                                        </asp:HyperLink>
                                    </h4>
                                    <span class="label" style="background-color: #428bca"><%#Eval("ModuleType.Name")%></span>
                                    <br />
                                    <div>
                                        Added on <%# ((DateTime)Eval("DateCreated")).ToShortDateString() %><br />
                                        By <asp:HyperLink runat="server" NavigateUrl="#"><%#Eval("Owner.Username")%></asp:HyperLink>
                                    </div>
                                </div>
                            </div>        
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
