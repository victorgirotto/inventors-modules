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
using System.Globalization;

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

            ResourceTitle.Text = Request.QueryString["title"];
            ResourceUrl.Text = Request.QueryString["url"];
            ResourceDescription.Text = Request.QueryString["description"];
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

                        IEnumerable<ResourceMetadata> metadata = JsonHelper.DeserializeJson<IEnumerable<ResourceMetadata>>(uc_Metadata.Text);

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
                            DifficultyLevel = Int32.Parse(rblDifficulty.SelectedValue),
                            Metadata = metadata
                        };

                        ResourcesDAO resourceDAO = new ResourcesDAO();
                        int resourceId = resourceDAO.InsertResource(resource);

                        // Redirect to resource page
                        Response.Redirect("~/Resources/" + resourceId);
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

        protected void uc_MetadataValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string json = args.Value;
            IEnumerable<ResourceMetadata> metadata = JsonHelper.DeserializeJson<IEnumerable<ResourceMetadata>>(json);

            foreach (ResourceMetadata rm in metadata)
            {
                if (String.IsNullOrEmpty(rm.Name) || 
                    String.IsNullOrEmpty(rm.Value) || 
                    rm.Name.Length > 50 || 
                    rm.Value.Length > 50)
                {
                    args.IsValid = false;
                }
                else
                {
                    switch (rm.DataType)
                    {
                        case "text":
                            // No validation for text, since we already know that it's not empty and its length is < 50
                            break;
                        case "date":
                            DateTime dt = new DateTime();
                            args.IsValid = DateTime.TryParseExact(rm.Value, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out dt);
                            break;
                        case "integer":
                            int i = 0;
                            args.IsValid = Int32.TryParse(rm.Value, out i);
                            break;
                        case "real":
                            double f = 0;
                            args.IsValid = Double.TryParse(rm.Value, out f);
                            break;
                        default:
                            args.IsValid = false;
                            break;
                    }
                }
                if (!args.IsValid)
                    break;
            }
        }
    }
}