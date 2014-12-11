using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IdentityTest.Modules;
using IdentityTest.DAO;

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
                    ModulesDAO modulesDAO = new ModulesDAO();
                    ResourceTypesDAO resourceTypesDAO = new ResourceTypesDAO();
                    ResourcesDAO resourcesDAO = new ResourcesDAO();

                    Module module = modulesDAO.SelectModuleById(moduleId);

                    Page.Title = module.Title;

                    ModuleTitleLabel.Text = module.Title;
                    ModuleDescriptionLabel.Text = module.Description;

                    // Formatting links that need the module ID
                    HyperLink addResourceLink = (HyperLink)AddResourceLV.FindControl("AddResourceLink");
                    if(addResourceLink != null)
                        addResourceLink.NavigateUrl = String.Format(addResourceLink.NavigateUrl, moduleId);
                    uc_FindResourcesLink.NavigateUrl = String.Format(uc_FindResourcesLink.NavigateUrl, moduleId);

                    // Loading resources
                    string type = Request.Params["type"];
                    int parsedType = 0;
                    IEnumerable<Resource> resources;

                    if(Int32.TryParse(type, out parsedType))
                        resources = resourcesDAO.SelectResourcesByModuleAndType(moduleId, new ResourceType(parsedType));
                    else
                        resources = resourcesDAO.SelectResourcesByModule(moduleId);
                    IEnumerable<ResourceType> resourceTypes = resourceTypesDAO.SelectAll();

                    MostRecentRepeater.DataSource = resources;
                    ResourceTypesRepeater.DataSource = resourceTypes;

                    MostRecentRepeater.DataBind();
                    ResourceTypesRepeater.DataBind();
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