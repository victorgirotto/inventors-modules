using IdentityTest.Helpers;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdentityTest.Resources
{
    public partial class FindResources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FindResources_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string topic = uc_Topic.Text;
                List<string> keywords = uc_Keywords.Text.Split(',').ToList<string>();
                List<SearchResult> results = ContextualSearchHelper.ContextAwareSearch(topic, keywords);

                // Databinding
                uc_ResultsRepeater.DataSource = results;
                uc_ResultsRepeater.DataBind();
            }
        }
    }
}