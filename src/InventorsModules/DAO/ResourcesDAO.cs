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
                INSERT INTO Resources (Title, Description, DateCreated, DateModified, OwnerId, ModifiedById, IsActive, ResourceType, ModuleId, Url, IsFeatured, DifficultyLevel, ImageUrl)
                OUTPUT Inserted.ID
                VALUES (@Title, @Description, @DateCreated, @DateModified, @Owner, @ModifiedBy, @IsActive, @ResourceType, @ModuleId, @Url, @IsFeatured, @DifficultyLevel, @ImageUrl);";

            prKey = DapperUtil.ExecuteInsert(sql, new
            {
                Title = module.Title,
                Description = module.Description,
                DateCreated = DateTime.Now,
                DateModified = DateTime.Now,
                ImageUrl = module.ImageUrl,
                Owner = module.Owner.Id,
                ModifiedBy = module.ModifiedBy.Id,
                IsActive = true,
                ResourceType = 1,
                ModuleId = module.ModuleFk,
                Url = module.Url,
                IsFeatured = false,
                DifficultyLevel = 1
            });


            return prKey;
        }

        public Resource SelectResourceById(int id)
        {
            return DapperUtil.SelectOneJoin<Resource, User, Resource>(
                @"SELECT * FROM Resources r
                INNER JOIN AspNetUsers u ON r.OwnerId = u.Id
                WHERE r.Id = @Id", 
                (resource, user) => {
                    resource.Owner = user;
                    return resource;
                },
                new { Id = id }
            );
        }

        public IEnumerable<Resource> SelectResourcesByModule(int moduleId)
        {
            return DapperUtil.SelectManyJoin<Resource, User, Resource>(
                @"SELECT * FROM Resources r
                INNER JOIN AspNetUsers u ON r.OwnerId = u.Id
                WHERE r.ModuleId = @Id",
                (resource, user) =>
                {
                    resource.Owner = user;
                    return resource;
                },
                new { 
                    Id = moduleId
                }
            );
        }
    }
}