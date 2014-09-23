<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Pages.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h3>CONTACT US</h3>

        <asp:Label ID="Message" Text="" runat="server" />

        <table>
            <tr>
                <td>First Name:</td>
                <td><asp:TextBox ID ="Cont_FirstName" runat ="server" /></td>
            
                <td>&nbsp; &nbsp;</td>

                <td>Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td><asp:TextBox ID ="Cont_LastName" runat ="server" /></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><asp:TextBox ID ="ContactInfo" runat ="server" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <th>Please Enter Your Concern(s).</th>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><asp:TextBox ID ="Comments" rows="8" runat ="server" Height="83px" Width="201px" /></td>
            </tr>
        </table>
    </div>
        <p>
            <asp:Button ID="Button1" Text="Submit" Onclick="ContactSubmission" runat="server" />
        </p>
</asp:Content>
