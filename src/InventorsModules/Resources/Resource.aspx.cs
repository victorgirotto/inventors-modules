using IdentityTest.DataProviders;
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
                    ResourceLink.NavigateUrl = resource.Url;
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