using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using IdentityTest.Models;
using IdentityTest.Helpers;
using Microsoft.AspNet.Identity;

namespace WebApplication1
{
    public partial class _ModuleCreation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string path = Server.MapPath("~");
                string title = txtTitle.Text.Trim();
                string description = txtDescription.Text.Trim();
                bool isPrivate = chkboxPrivateModule.Checked;
                string imageUrl = ImageHelper.HandleUpload(ModuleImage.PostedFile, path);
                int userId = User.Identity.GetUserId<int>();

                Module module = new Module()
                {
                    Title = title,
                    Description = description,
                    IsPrivate = isPrivate,
                    ImageUrl = imageUrl,
                    DateCreated = DateTime.Now,
                    DateModified = DateTime.Now,
                    Owner = new User(userId),
                    ModifiedBy = new User(userId)
                };

                ModulesDAO DP = new ModulesDAO();
                int prKey = DP.InsertModule(module);

                Response.Redirect(String.Format("~/Modules/{0}", prKey));
            }

            
        }

    }
}