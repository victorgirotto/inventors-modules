using IdentityTest.DataProviders;
using IdentityTest.Helpers;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using IdentityTest.DAO;

namespace IdentityTest.Modules
{
    public partial class ResourceAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ResourceTypesDAO resourceTypeDAO = new ResourceTypesDAO();
                IEnumerable<ResourceType> resourceTypes = resourceTypeDAO.SelectAll();

                ddlTypes.DataSource = resourceTypes;
                ddlTypes.DataBind();
                // Insert default option
                ddlTypes.Items.Insert(0, new ListItem("-", String.Empty));
            }
        }

        protected void CreateResource_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string path = Server.MapPath("~");
                int moduleId = -1;
                string idValue = Page.RouteData.Values["id"] != null ? Page.RouteData.Values["id"].ToString() : null;

                if (idValue != null)
                {
                    bool converted = Int32.TryParse(idValue, out moduleId);
                    if (converted)
                    {
                        string imageUrl = ImageHelper.HandleUpload(ResourceImage.PostedFile, path);
                        int userId = User.Identity.GetUserId<int>();

                        Resource resource = new Resource()
                        {
                            Title = ResourceTitle.Text,
                            Url = ResourceUrl.Text,
                            ImageUrl = imageUrl,
                            Description = ResourceDescription.Text,
                            Module = new Module(moduleId),
                            Owner = new User(userId),
                            ModifiedBy = new User(userId),
                            ResourceType = new ResourceType(Int32.Parse(ddlTypes.SelectedValue)),
                            DifficultyLevel = Int32.Parse(rblDifficulty.SelectedValue)
                        };

                        ResourcesDAO provider = new ResourcesDAO();
                        int prKey = provider.InsertResource(resource);

                        // Redirect to resource page
                        Response.Redirect("~/Resources/" + prKey);
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
}