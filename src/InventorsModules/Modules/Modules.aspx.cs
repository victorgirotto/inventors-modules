using IdentityTest.DAO;
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
            
            ModulesDAO modulesDAO = new ModulesDAO();
            ModuleTypesDAO moduleTypesDAO = new ModuleTypesDAO();

            IEnumerable<Module> modules = null;
            string type = Request.Params["type"];
            int parsedType = 0;
            if (type != null && Int32.TryParse(type, out parsedType))
                modules = modulesDAO.SelectModulesByType(new ModuleType(parsedType));
            else
                modules = modulesDAO.SelectModulesAll();
            
            IEnumerable<ModuleType> moduleTypes = moduleTypesDAO.SelectAll();

            RecentModulesRepeater.DataSource = modules;
            ModuleTypesRepeater.DataSource = moduleTypes;

            RecentModulesRepeater.DataBind();
            ModuleTypesRepeater.DataBind();
            
        }
    }
}