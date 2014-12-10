using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DataProviders
{
    public class ResourcesDAO
    {
        public int InsertResource(Resource resource)
        {
            int resourceId = -1;

            string sql = @"
                INSERT INTO Resources (Title, Description, DateCreated, DateModified, OwnerId, ModifiedById, IsActive, ResourceTypeId, ModuleId, Url, IsFeatured, DifficultyLevel, ImageUrl)
                OUTPUT Inserted.ID
                VALUES (@Title, @Description, @DateCreated, @DateModified, @Owner, @ModifiedBy, @IsActive, @ResourceType, @ModuleId, @Url, @IsFeatured, @DifficultyLevel, @ImageUrl);";
            
            resourceId = DapperUtil.ExecuteInsert(sql, new
            {
                Title = resource.Title,
                Description = resource.Description,
                DateCreated = DateTime.Now,
                DateModified = DateTime.Now,
                ImageUrl = resource.ImageUrl,
                Owner = resource.Owner.Id,
                ModifiedBy = resource.ModifiedBy.Id,
                IsActive = true,
                ResourceType = resource.ResourceType.Id,
                ModuleId = resource.Module.Id,
                Url = resource.Url,
                IsFeatured = false,
                DifficultyLevel = resource.DifficultyLevel,
            });

            List<ResourceMetadata> metadata = resource.Metadata.Select(c => { c.ResourceId = resourceId; return c; }).ToList();

            string metadataSql = @"
                INSERT INTO ResourceMetadata (ResourceId, DataType, Name, Value)
                VALUES (@ResourceId, @DataType, @Name, @Value)";

            // Insert resource metadata
            DapperUtil.ExecuteQuery(metadataSql, metadata);

            return resourceId;
        }

        public Resource SelectResourceById(int id)
        {
            return DapperUtil.SelectOneJoin<Resource, User, ResourceType, Resource>(
                @"SELECT * FROM Resources r
                INNER JOIN AspNetUsers u ON r.OwnerId = u.Id
                INNER JOIN ResourceTypes rt on r.ResourceTypeId = rt.Id
                WHERE r.Id = @Id", 
                (resource, user, resourceType) => {
                    resource.Owner = user;
                    resource.ResourceType = resourceType;
                    return resource;
                },
                new { Id = id }
            );
        }

        public IEnumerable<Resource> SelectResourcesByModule(int moduleId)
        {
            return DapperUtil.SelectManyJoin<Resource, User, ResourceType, Resource>(
                @"SELECT * FROM Resources r
                INNER JOIN AspNetUsers u ON r.OwnerId = u.Id
                INNER JOIN ResourceTypes rt on r.ResourceTypeId = rt.Id
                WHERE r.ModuleId = @Id",
                (resource, user, resourceType) =>
                {
                    resource.Owner = user;
                    resource.ResourceType = resourceType;
                    return resource;
                },
                new { 
                    Id = moduleId
                }
            );
        }

        public IEnumerable<Resource> SelectResourcesByModuleAndType(int moduleId, ResourceType type)
        {
            return DapperUtil.SelectManyJoin<Resource, User, ResourceType, Resource>(
                @"SELECT * FROM Resources r
                LEFT JOIN AspNetUsers u ON r.OwnerId = u.Id
                INNER JOIN ResourceTypes rt on r.ResourceTypeId = rt.Id
                WHERE r.ModuleId = @Id AND r.ResourceTypeId = @Type",
                (resource, user, resourceType) =>
                {
                    resource.Owner = user;
                    resource.ResourceType = resourceType;
                    return resource;
                },
                new
                {
                    Id = moduleId,
                    Type = type.Id
                }
            );
        }

        public IEnumerable<ResourceMetadata> SelectResourceMetadata(int resourceId)
        {
            string sql = @"SELECT * FROM ResourceMetadata WHERE ResourceId = @Id";
            return DapperUtil.SelectMany<ResourceMetadata>(sql, new { Id = resourceId });
        }
    }
}