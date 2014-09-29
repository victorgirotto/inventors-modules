<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleHome.aspx.cs" Inherits="WebApplication1.Pages.Modules.ModuleHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-3">
            <div class="inner-container menu">

                <asp:TextBox runat="server" TextMode="Search" placeholder="Search in module"></asp:TextBox>
                
                <h5><a href="#">Module Home</a></h5>
                <h5>Browse by Type</h5>
                <ul>
                    <li><a href="#">Videos</a></li>
                    <li><a href="#">Hands-on Activities</a></li>
                    <li><a href="#">Articles</a></li>
                    <li><a href="#">Books</a></li>
                    <li><a href="#">People</a></li>
                    <li><a href="#">Events</a></li>
                    <li><a href="#">Spaces</a></li>
                    <li><a href="#">Websites</a></li>
                </ul>
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="button">
                    Add Resource
                </asp:HyperLink>
            </div>
        </div>
        <div class="col-md-9">
            <h2><asp:Label runat="server" ID="ModuleTitleLabel"></asp:Label></h2>
            <p><asp:Label runat="server" ID="ModuleDescriptionLabel"></asp:Label></p>

            <div class="row spaced">
                <div class="col-md-9">
                    <div class="news-flash inner-container">

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="events inner-container">
                        <h4>Events</h4>
                        <ul>
                            <li class="header">Tomorrow</li>
                            <li><a href="#">3:00pm - Hackathon</a></li>
                            <li><a href="#">5:00pm - Webinar</a></li>
                            <li class="header">Thursday</li>
                            <li><a href="#">3:00pm - Hackathon</a></li>
                            <li><a href="#">5:00pm - Webinar</a></li>
                            <li class="header">Oct. 5th 2014</li>
                            <li><a href="#">3:00pm - Hackathon</a></li>
                            <li><a href="#">5:00pm - Webinar</a></li>
                            <li class="header">Oct. 10th 2014</li>
                            <li><a href="#">3:00pm - Hackathon</a></li>
                            <li><a href="#">5:00pm - Webinar</a></li>
                            <li class="header">Nov. 1st 2014</li>
                            <li><a href="#">3:00pm - Hackathon</a></li>
                            <li><a href="#">5:00pm - Webinar</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row spaced">
                <div class="col-md-3">
                    <div class="contacts inner-container">
                        <h4>Connect</h4>
                        <ul class="spaced">
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <h5><asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                                <div style="clear: both" />
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row map">
                        <div class="col-md-3 inner-container  map-list">
                            <h4>Places</h4>
                            <ul>
                                <li><a href="#">Gangplank</a></li>
                                <li><a href="#">ASU Saguaro Lab</a></li>
                                <li><a href="#">Heatsink Labs</a></li>
                                <li><a href="#">Gangplank</a></li>
                                <li><a href="#">ASU Saguaro Lab</a></li>
                                <li><a href="#">Heatsink Labs</a></li>
                                <li><a href="#">Gangplank</a></li>
                                <li><a href="#">ASU Saguaro Lab</a></li>
                                <li><a href="#">Heatsink Labs</a></li>
                            </ul>
                        </div>
                        <div class="col-md-9 inner-container  map-view">
                            <iframe frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=Tempe%2C%20AZ%2C%20United%20States&key=AIzaSyBaoLpdw8yZm7SWZe61T76CNw-wY6bYWqg"></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row spaced separator">
                <div class="col-md-12 spaced">
                    <h3>Featured Resources</h3>
                
                    <div class="row">
                        <div class="col-md-3">
                            <div class="grid-item">
                                <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='#'>
                                    <div>&nbsp;</div>
                                </asp:HyperLink>
                                <h4>
                                    <asp:HyperLink runat="server" NavigateUrl='#'>
                                        Resource
                                    </asp:HyperLink>
                                </h4>
                                <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                            </div>
                        </div>        
                    </div>
                </div>

                <div class="col-md-12 spaced">
                    <h3>Best Rated Resources</h3>
                
                    <div class="row">
                        <div class="col-md-3">
                            <div class="grid-item">
                                <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='#'>
                                    <div>&nbsp;</div>
                                </asp:HyperLink>
                                <h4>
                                    <asp:HyperLink runat="server" NavigateUrl='#'>
                                        Resource
                                    </asp:HyperLink>
                                </h4>
                                <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                            </div>
                        </div>        
                    </div>
                </div>

                <div class="col-md-12 spaced">
                    <h3>Most Recent Resources</h3>
                
                    <div class="row">
                        <div class="col-md-3">
                            <div class="grid-item">
                                <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='#'>
                                    <div>&nbsp;</div>
                                </asp:HyperLink>
                                <h4>
                                    <asp:HyperLink runat="server" NavigateUrl='#'>
                                        Resource
                                    </asp:HyperLink>
                                </h4>
                                <h5>By <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink></h5>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
