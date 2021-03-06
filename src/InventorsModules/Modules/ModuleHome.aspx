﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ModuleHome.aspx.cs" Inherits="WebApplication1.Pages.Modules.ModuleHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-2">
            <div class="menu">

                <asp:TextBox runat="server" TextMode="Search" placeholder="Search in module"></asp:TextBox>
                
                <ul>
                    <asp:Repeater runat="server" ID="ResourceTypesRepeater">
                        <HeaderTemplate>
                            <li>
                                <a href="?">All</a>
                            </li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="?type=<%#Eval("Id")%>">
                                    <%# Eval("Name") %>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater> 
                </ul>

                <h5>
                    <asp:HyperLink runat="server" ID="uc_FindResourcesLink" NavigateUrl="~/Resources/{0}/FindResources" CssClass="btn btn-default">
                        Find Resources
                    </asp:HyperLink>
                </h5>

                <asp:LoginView runat="server" ID="AddResourceLV">
                    <LoggedInTemplate>
                        <h5>
                            <asp:HyperLink runat="server" ID="AddResourceLink" NavigateUrl="~/Resources/{0}/ResourceAdd" CssClass="btn btn-primary">
                                New Resource
                            </asp:HyperLink>
                        </h5>
                    </LoggedInTemplate>
                </asp:LoginView>

            </div>
        </div>
        <div class="col-md-10 main-container">
            
            <h2><asp:Label runat="server" ID="ModuleTitleLabel"></asp:Label></h2>
            <p class="spaced"><asp:Label runat="server" ID="ModuleDescriptionLabel"></asp:Label></p>
            
            <!--
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
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
                                <div style="clear: both" />
                            </li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="#">
                                    <asp:Image runat="server" ImageUrl="~/Images/az1.jpg"/>
                                </asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl="#">John Doe</asp:HyperLink>
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
            -->
                <div class="">
                    <h3>Most Recent Resources</h3>
                
                    <div class="row">
                        <asp:Repeater runat="server" ID="MostRecentRepeater">
                            <ItemTemplate>
                                <div class="col-md-3">
                                    <div class="grid-item">
                                        <asp:HyperLink runat="server" CssClass="grid-image" NavigateUrl='<%# String.Format("~/Resources/{0}", Eval("Id")) %>'>
                                            <asp:Image runat="server" Width="190" Height="150"  ImageUrl='<%# IdentityTest.Helpers.ImageHelper.GetImageThumbUrl(Eval("ImageUrl").ToString()) %>' />
                                        </asp:HyperLink>
                                        <h4>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/Resources/{0}", Eval("Id")) %>'>
                                                <%#Eval("title")%>
                                            </asp:HyperLink>
                                        </h4>
                                        <span class="label" style="background-color: #428bca"><%#Eval("ResourceType.Name")%></span>
                                        <br />
                                        <h5>By <asp:HyperLink runat="server" NavigateUrl="#"><%# Eval("Owner.Username") %></asp:HyperLink></h5>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>        
                    </div>
                </div>
            <!--</div>-->
        </div>
    </div>

</asp:Content>
