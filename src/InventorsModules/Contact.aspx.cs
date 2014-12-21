using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;    
using System.Text.RegularExpressions;
using System.Web.Services.Description;
using IdentityTest.Helpers;
using System.Configuration;
using System.Net;
using System.Collections.Specialized; 

namespace WebApplication1.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                uc_FormControls.Visible = false;
                uc_SuccessMessage.Visible = true;
            }
        }

        protected void ContactSubmission(object sender, EventArgs e)
        {
            string captcha = Request.Params["g-recaptcha-response"];
            bool isUserVerified = CaptchaHelper.VerifyUser(ConfigurationManager.AppSettings["RECAPTCHA_SECRET"], captcha);

            uc_CaptchaError.Visible = !isUserVerified;
            
            if (Page.IsValid && isUserVerified)
            {
                //instantiate a new email message
                MailMessage email = new MailMessage();

                /*Basic Email Formalities*/
                //represent the sender's email address
                email.From = new MailAddress(ContactInfo.Text.Trim());

                //add the designated email of the recipient
                email.To.Add("contact@inventorsworkshops.net");

                email.Subject = "IW - Contact Email";
                email.Body = "<strong>From: </strong>" + Cont_FirstName.Text.Trim() + 
                             "<br/><br/><strong>Message: <br/></strong>" + Comments.Text.Trim();
                email.IsBodyHtml = true;
                /**/

                NameValueCollection settings = ConfigurationManager.AppSettings;
                //instantiate new transfer protocol 
                SmtpClient client = new SmtpClient();
                client.Port = Int32.Parse(settings["EMAIL_PORT"]);
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Host = settings["EMAIL_HOST"];
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential(settings["EMAIL_USER"], settings["EMAIL_PASSWORD"]);

                //Send Email
                client.Send(email);
            }
        }
    }
}