using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdentityTest.Modules
{
    public partial class ResourceAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateResource_Click(object sender, EventArgs e)
        {
            Resource resource = new Resource()
            {
                Title = ResourceTitle.Text,
                Url = ResourceUrl.Text,
                Description = ResourceDescription.Text
            };

            ResourcesDataProvider provider = new ResourcesDataProvider();
            int prKey = provider.InsertResource(resource);
        }
    }
}