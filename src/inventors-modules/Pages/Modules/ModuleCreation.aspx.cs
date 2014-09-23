using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Net.Http;
using Newtonsoft.Json.Linq;

namespace WebApplication1
{
    public partial class _ModuleCreation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            bool isPrivate = chkboxPrivateModule.Checked;

            ModulesDataProvider DP = new ModulesDataProvider();
            int prKey = DP.insertModule(title, description, null, 1234, 1234, isPrivate);

            foreach (ListItem item in cblSearchResults.Items)
            {
                if (item.Selected == true)
                {
                    DP.insertResource(item.Text, item.Value, null, 1234, 1234, 1, 1234, prKey);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string[] tags = txtTags.Text.Split(',');

            SearchResult[] searchResults = new SearchResult[0];

            cblSearchResults.Items.Clear();
            foreach (SearchResult result in searchResults)
            {
                ListItem item = new ListItem();
                item.Text = result.title + result.description;
                item.Value = result.url;
                item.Attributes["title"] = result.title;
                item.Attributes["description"] = result.description;
                cblSearchResults.Items.Add(item);
            }
            PanelSearchResults.Visible = true;
        }
    }
}