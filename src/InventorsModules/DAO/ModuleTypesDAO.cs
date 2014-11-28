using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DAO
{
    public class ModuleTypesDAO
    {
        public IEnumerable<ModuleType> SelectAll()
        {
            return DapperUtil.SelectMany<ModuleType>("select * from ModuleTypes");
        }
    }
}