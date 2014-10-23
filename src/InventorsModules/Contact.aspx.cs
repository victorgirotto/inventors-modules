using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;    
using System.Text.RegularExpressions; 

namespace WebApplication1.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContactSubmission(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Cont_FirstName.Text.Trim()) || !String.IsNullOrEmpty(Cont_LastName.Text.Trim())
                || !String.IsNullOrEmpty(ContactInfo.Text.Trim()) || !String.IsNullOrEmpty(Comments.Text.Trim()))
            {
                //basic check if there is an @ in the email's textbox
                //maybe later for multiple @ that causes error
                try
                {
                    //Checks if input email is regular expression
                    if (Regex.IsMatch(ContactInfo.Text.Trim(), @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
                    {
                        //instantiate a new email message
                        MailMessage email = new MailMessage();

                        /*Basic Email Formalities*/
                        //represent the sender's email address
                        email.From = new MailAddress(ContactInfo.Text.Trim());

                        //add the designated email of the recipient
                        email.To.Add("vaugusto@asu.edu");

                        email.Subject = "Contact Email";
                        email.Body = Cont_FirstName.Text.Trim() + "/n" + Cont_LastName.Text.Trim() +
                                    "/n/n" + Comments.Text.Trim();
                        /**/

                        //instantiate new transfer protocol 
                        SmtpClient emailProtocol = new SmtpClient();

                        //Send Email
                        emailProtocol.Send(email);
                    }
                    else
                    {
                        Message.Text = "Please enter a different email address.";
                    }
                }

                catch (FormatException)
                {
                    Message.Text = "Please enter your information.";
                }
            }
            else
            {
                Message.Text = "Please enter in all the required information.";

            }
        }
    }
}