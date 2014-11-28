using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DAO
{
    public class ResourceTypesDAO
    {
        public IEnumerable<ResourceType> SelectAll()
        {
            return DapperUtil.SelectMany<ResourceType>("select * from ResourceTypes");
        }
    }
}