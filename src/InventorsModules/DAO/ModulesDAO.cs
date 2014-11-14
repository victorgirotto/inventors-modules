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
            var lookup = new Dictionary<int, Module>();
            return DapperUtil.SelectManyJoin<Module, User, Module>(
                @"SELECT * FROM Modules m
                LEFT JOIN AspNetUsers u ON m.OwnerId = u.Id",
                (module, user) =>
                {
                    module.Owner = user;
                    return module;
                }
            );
        }

        public int InsertModule(Module module)
        {
            int id = -1;

            string sql = @"
                INSERT INTO Modules (Title, Description, DateCreated, DateModified, OwnerId, IsActive, IsPrivate, IsFeatured, ModifiedById, ImageUrl)
                OUTPUT Inserted.ID
                VALUES (@Title, @Description, @DateCreated, @DateModified, @Owner, @IsActive, @IsPrivate, @IsFeatured, @ModifiedBy, @ImageUrl);";

            id = DapperUtil.ExecuteInsert(sql, new {
                Title = module.Title,
                Description = module.Description,
                DateCreated = module.DateCreated,
                DateModified = module.DateModified,
                Owner = module.Owner.Id,
                ImageUrl = module.ImageUrl,
                IsActive = true,
                IsPrivate = false,
                IsFeatured = false,
                ModifiedBy = module.ModifiedBy.Id
            });
            
            return id;
        }

        public Module SelectModuleById(int id)
        {
            string query = 
                @"SELECT * FROM Modules m
                    INNER JOIN AspNetUsers u ON m.OwnerId = u.Id 
                    WHERE m.Id = @id";
            return DapperUtil.SelectOneJoin<Module, User, Module>(
                query, 
                (module, user) =>
                {
                    module.Owner = user;
                    return module;
                },
                new { id = id }
            );
        }
    }
}