using IdentityTest.DataProviders;
using IdentityTest.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdentityTest.Resources
{
    public partial class Resource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int resourceId = -1;
            string idValue = Page.RouteData.Values["id"] != null ? Page.RouteData.Values["id"].ToString() : null;

            if (idValue != null)
            {
                bool converted = Int32.TryParse(idValue, out resourceId);
                if (converted)
                {
                    ResourcesDAO resourcesDp = new ResourcesDAO();
                    IdentityTest.Models.Resource resource = resourcesDp.SelectResourceById(resourceId);

                    ResourceTitle.Text = resource.Title;
                    ResourceDescription.Text = resource.Description;
                    ResourceLink.NavigateUrl = resource.Url;
                    ResourceImage.ImageUrl = ImageHelper.GetImageThumbUrl(resource.ImageUrl);
                    CreatedBy.Text = resource.Owner.UserName;
                    DateCreated.Text = resource.DateCreated.ToShortDateString();
                    uc_DifficultyLevel.Text = resource.DifficultyLevel.ToString();
                    uc_ResourceType.Text = resource.ResourceType != null ? resource.ResourceType.Name : "Undefined type";

                    Page.Title = resource.Title;
                }
                else
                {
                    Response.Redirect("~/Modules/Modules.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Modules/Modules.aspx");
            }           
        }
    }
}