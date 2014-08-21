<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
 
    <div class="spaced">
        <h1>Title Element 1</h1>
        <h2>Title Element 2</h2>
        <h3>Title Element 3</h3>
        <h4>Title Element 4</h4>
        <h5>Title Element 5</h5>

        <div>
            <a href="#">Link to page</a>
        </div>

        <div>
            <asp:Button runat="server" Text="Special button" CssClass="special"/>
            <asp:Button runat="server" Text="Regular button"/>
        </div>

        <p>
            This is a text paragraph. Beard selvage hella, keffiyeh shabby chic wolf Odd Future Wes Anderson banjo. 
            Trust fund sriracha Truffaut, Odd Future church-key chillwave PBR semiotics. Austin bitters Bushwick vinyl 
            shabby chic vegan, Cosby sweater stumptown try-hard VHS occupy iPhone trust fund umami Pinterest. Occupy pour-over 
            farm-to-table butcher Etsy. Deep v chambray yr art party, 90's bitters aesthetic umami chillwave artisan occupy. 
            Flannel craft beer bespoke Intelligentsia cred DIY. Seitan mumblecore small batch, asymmetrical twee fap Truffaut 
            try-hard swag. Blue Bottle Austin narwhal, leggings blog chia tote bag pug mustache lomo keytar Shoreditch craft 
            beer irony. Yr scenester you probably haven't heard of them forage Williamsburg. Mustache tofu tattooed fashion 
            axe, XOXO 8-bit Echo Park shabby chic before they sold out. Etsy direct trade banh mi, Kickstarter bicycle rights 
            drinking vinegar pickled blog paleo. Farm-to-table selfies beard Cosby sweater. Austin Neutra VHS fashion axe. 
            Narwhal ennui you probably haven't heard of them DIY, meh slow-carb blog seitan sartorial mumblecore Blue Bottle
            dreamcatcher.
        </p>

        <div>
            <asp:Image runat="server" src="Images/asu1.jpg" />
            <asp:Image runat="server" src="Images/az1.jpg" />
        </div>

        <div class="inner-container">
            <h3>Inner Container</h3>

            <p>
                This is a text paragraph. Beard selvage hella, keffiyeh shabby chic wolf Odd Future Wes Anderson banjo. 
                Trust fund sriracha Truffaut, Odd Future church-key chillwave PBR semiotics. Austin bitters Bushwick vinyl 
                shabby chic vegan, Cosby sweater stumptown try-hard VHS occupy iPhone trust fund umami Pinterest. Occupy pour-over 
                farm-to-table butcher Etsy. Deep v chambray yr art party, 90's bitters aesthetic umami chillwave artisan occupy. 
                Flannel craft beer bespoke Intelligentsia cred DIY.
            </p>
        </div>

        <div class="message warning">
            <asp:Image runat="server" src="Images/warning.png" />
            <p>
                A warning occurred.
            </p>
        </div>

        <div class="message error">
            <asp:Image runat="server" src="Images/error.png" />
            <p>
                An error occurred.
            </p>
        </div>

        <div class="message success">
            <asp:Image runat="server" src="Images/success.png" />
            <p>
                You just won the lottery.
            </p>
        </div>
    </div>
</asp:Content>

