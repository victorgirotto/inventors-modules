<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Pages.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-3 inner-container">
            <p>Use this form to <strong>contact us</strong> with thoughts you have for us, including any interest in contributing to our enterprise more directly.</p>

            <p>If you want to suggest <strong>new ideas</strong> or <strong>report a problem</strong>, please use our <a href="https://iworkshops.userecho.com/" target="_blank">UserEcho page</a>.</p>
        </div>
        <div class="col-md-9 main-container">
            <h3>Contact</h3>

            <asp:Label runat="server" ID="uc_SuccessMessage" Visible="false">Thank you for contacting us! We'll get in touch with you shortly! :)</asp:Label>
            <asp:Panel runat="server" ID="uc_FormControls">
                <ul class="no-bullets form-list">
                    <li>
                        <asp:Label runat="server" AssociatedControlID="Cont_FirstName">Name</asp:Label><br />
                        <asp:TextBox ID ="Cont_FirstName" runat ="server" Columns="58" /><br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="Cont_FirstName"
                            ErrorMessage="Please, tell us your name"
                            CssClass="error" 
                            Display="Dynamic"/>
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="Cont_FirstName" 
                            ValidationExpression="^[\s\S]{0,254}$"
                            ErrorMessage="The max length of the name is 254 characters."
                            CssClass="error"
                            Display="Dynamic"/>
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="ContactInfo">E-mail</asp:Label><br />
                        <asp:TextBox ID ="ContactInfo" runat ="server" Columns="58" /><br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ContactInfo"
                            ErrorMessage="Please, tell us your e-mail"
                            CssClass="error" 
                            Display="Dynamic"/>
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="ContactInfo" 
                            ValidationExpression="^[\s\S]{0,254}$"
                            ErrorMessage="The max length of the e-mail is 254 characters."
                            CssClass="error"
                            Display="Dynamic"/>
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="Comments">Message</asp:Label><br />
                        <asp:TextBox ID ="Comments" runat ="server" TextMode="MultiLine" Columns="60" Rows="10"/>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="Comments"
                            ErrorMessage="What do you want to tell us?" 
                            CssClass="error"
                            Display="Dynamic"/>
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="Comments" 
                            ValidationExpression="^[\s\S]{0,2000}$"
                            ErrorMessage="The max length of the message is 2000 characters."
                            CssClass="error"
                            Display="Dynamic"/>
                    </li>
                    <li>
                        <div class="g-recaptcha" data-sitekey="6LcjiP8SAAAAAAXhDGYVaRb8_gYQC-9PiBF3fgft"></div>
                        <asp:Label runat="server" CssClass="error" ID="uc_CaptchaError" Visible="false">
                            01110100 01110010 01111001 00100000 01100001 01100111 01100001 01101001 01101110 
                        </asp:Label>
                    </li>
                    <li>
                        <asp:Button ID="Button1" Text="Submit" Onclick="ContactSubmission" runat="server" CssClass="btn btn-default" />
                    </li>
                </ul>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
