using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DataProviders
{
    public class ResourcesDataProvider
    {
        public int InsertResource(Resource module)
        {
            int prKey = -1;

            string sql = @"
                INSERT INTO Resources (Title, Description, DateCreated, DateModified, OwnerFk, IsActive, ResourceTypeFk, ModuleFk)
                VALUES (@Title, @Description, @DateCreated, @DateModified, @OwnerFk, @IsActive, @ResourceTypeFk, @ModuleFk);";

            prKey = DapperUtil.ExecuteInsert(sql, new
            {
                Title = module.Title,
                Description = module.Description,
                DateCreated = module.DateCreated,
                DateModified = module.DateModified,
                OwnerFk = -1,
                IsActive = true,
                ResourceTypeFk = 1,
                ModuleFk = module.ModuleFk
            });

            return prKey;
        }

        public IEnumerable<Resource> SelectResourcesByModule(int moduleId)
        {
            return DapperUtil.SelectMany<Resource>("select * from Resources where ModuleFk = @ModuleId");
        }
    }
}