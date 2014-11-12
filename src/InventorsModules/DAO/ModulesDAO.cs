using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using IdentityTest.DataProviders;
using IdentityTest.Models;

namespace WebApplication1
{
    public class ModulesDAO
    {
        public IEnumerable<Module> SelectModulesAll()
        {
            return DapperUtil.SelectMany<Module>("select * from Modules");
        }

        public int InsertModule(Module module)
        {
            int id = -1;

            string sql = @"
                INSERT INTO Modules (Title, Description, DateCreated, DateModified, Owner, IsActive, IsPrivate, IsFeatured, ModifiedBy)
                OUTPUT Inserted.ID
                VALUES (@Title, @Description, @DateCreated, @DateModified, @Owner, @IsActive, @IsPrivate, @IsFeatured, @ModifiedBy);";

            id = DapperUtil.ExecuteInsert(sql, new {
                Title = module.Title,
                Description = module.Description,
                DateCreated = module.DateCreated,
                DateModified = module.DateModified,
                Owner = -1,
                IsActive = true,
                IsPrivate = false,
                IsFeatured = false,
                ModifiedBy = -1
            });
            
            return id;
        }

        public Module SelectModuleById(int id)
        {
            return DapperUtil.SelectOne<Module>("select * from Modules where Id = @id", new { id = id });
        }
    }
}