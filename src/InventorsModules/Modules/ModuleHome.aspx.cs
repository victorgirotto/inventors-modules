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
                    ModulesDataProvider dp = new ModulesDataProvider();
                    Module module = dp.SelectModuleById(moduleId);

                    ModuleTitleLabel.Text = module.Title;
                    ModuleDescriptionLabel.Text = module.Description;

                    // Add module ID to add resources link
                    AddResourceLink.NavigateUrl = String.Format(AddResourceLink.NavigateUrl, moduleId);

                    // Loading resources
                    //FeaturedResourcesRepeater
                }
                else
                {
                    // Module not found
                }
            }
        }
    }
}