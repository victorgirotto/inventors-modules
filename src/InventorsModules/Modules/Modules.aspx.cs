using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Pages.Modules
{
    public partial class Modules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ModulesDAO dataProvider = new ModulesDAO();
            IEnumerable<Module> modules = dataProvider.SelectModulesAll();

            RecentModulesRepeater.DataSource = modules;
            RecentModulesRepeater.DataBind();
            
        }
    }
}