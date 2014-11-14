using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Pages.Modules
{
    public partial class ModuleHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int moduleId = -1;
            string idValue = Page.RouteData.Values["id"] != null ? Page.RouteData.Values["id"].ToString() : null;

            if (idValue != null)
            {
                bool converted = Int32.TryParse(idValue, out moduleId);
                if (converted)
                {
                    ModulesDAO dp = new ModulesDAO();
                    Module module = dp.SelectModuleById(moduleId);

                    Page.Title = module.Title;

                    ModuleTitleLabel.Text = module.Title;
                    ModuleDescriptionLabel.Text = module.Description;

                    // Add module ID to add resources link if logged in
                    HyperLink addResourceLink = (HyperLink)AddResourceLV.FindControl("AddResourceLink");
                    if(addResourceLink != null)
                        addResourceLink.NavigateUrl = String.Format(addResourceLink.NavigateUrl, moduleId);

                    // Loading resources
                    ResourcesDAO resourcesDP = new ResourcesDAO();
                    IEnumerable<Resource> resources = resourcesDP.SelectResourcesByModule(moduleId);
                    MostRecentRepeater.DataSource = resources;
                    MostRecentRepeater.DataBind();
                }
                else
                {
                    // Module not found
                }
            }
            else
            {
                Response.Redirect("~/Modules/Modules.aspx");
            }
        }
    }
}