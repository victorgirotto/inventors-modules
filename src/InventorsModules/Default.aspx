<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IdentityTest._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-container">
        <div class="jumbotron">
            <h1>Welcome to IW</h1>
            <p class="lead">
                Inventors' Workshops is a transformative initiative to engage and train the STEAM (Science Technology Engineering Arts 
            and Math) leaders and enthusiasts of 2020 and 2100 today, through open-access to research, technology, opportunity, 
            and learning.
            </p>
            <p>
                <asp:HyperLink runat="server" NavigateUrl="~/About.aspx" CssClass="btn btn-primary btn-lg">Learn More &raquo;</asp:HyperLink>
            </p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h2>Browse our Modules</h2>
                <p>
                    From oboe playing to supercomputing, from Lego engineering to chemistry, we've got you covered.
                </p>
                <p>
                    <asp:HyperLink runat="server" CssClass="btn btn-default" NavigateUrl="~/Modules/Modules.aspx">Browse Modules &raquo;</asp:HyperLink>
                </p>
            </div>
            <div class="col-md-4">
                <h2>Be a Part of It</h2>
                <p>
                    Register now to help on the development of existing and new exciting modules.
                </p>
                <p>
                    <asp:HyperLink runat="server" CssClass="btn btn-default" NavigateUrl="~/Account/Login">Register &raquo;</asp:HyperLink>
                </p>
            </div>
            <div class="col-md-4">
                <h2>Get in Touch</h2>
                <p>
                    If you have any comments, ideas, or just wanna get in touch with IW
                </p>
                <p>
                    <asp:HyperLink runat="server" CssClass="btn btn-default" NavigateUrl="~/Contact">Contact Us &raquo;</asp:HyperLink>
                </p>
            </div>
        </div>
    </div>

</asp:Content>
