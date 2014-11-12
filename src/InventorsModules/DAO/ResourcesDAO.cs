using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DataProviders
{
    public class ResourcesDAO
    {
        public int InsertResource(Resource module)
        {
            int prKey = -1;

            string sql = @"
                INSERT INTO Resources (Title, Description, DateCreated, DateModified, Owner, ModifiedBy, IsActive, ResourceType, Module, Url, IsFeatured, DifficultyLevel)
                OUTPUT Inserted.ID
                VALUES (@Title, @Description, @DateCreated, @DateModified, @Owner, @ModifiedBy, @IsActive, @ResourceType, @Module, @Url, @IsFeatured, @DifficultyLevel);";

            prKey = DapperUtil.ExecuteInsert(sql, new
            {
                Title = module.Title,
                Description = module.Description,
                DateCreated = DateTime.Now,
                DateModified = DateTime.Now,
                Owner = -1,
                ModifiedBy = -1,
                IsActive = true,
                ResourceType = 1,
                Module = module.ModuleFk,
                Url = module.Url,
                IsFeatured = false,
                DifficultyLevel = 1
            });


            return prKey;
        }

        public Resource SelectResourceById(int id)
        {
            return DapperUtil.SelectOne<Resource>("select * from Resources where Id = @Id", new { Id = id });
        }

        public IEnumerable<Resource> SelectResourcesByModule(int moduleId)
        {
            return DapperUtil.SelectMany<Resource>("select * from Resources where Module = @ModuleId", new { ModuleId = moduleId });
        }
    }
}