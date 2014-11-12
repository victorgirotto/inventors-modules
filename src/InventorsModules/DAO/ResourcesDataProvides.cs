using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WebApplication1
{
    public class ResourcesDataProvider
    {
        public IEnumerable<Resource> SelectResourcesByModule(int ModuleFK)
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Resources.Where(r => r.ModulesFK == ModuleFK).ToArray<Resource>();
            }
        }
        
        public int InsertResource(string title, string description, string imageURL, int ownerFK, int modifiedBy, int difficultyLevel, int ResourceTypeFK, int ModulesFK)
        {
            int prKey = -1;
            Resource newResource = new Resource();
            newResource.Title = title;
            newResource.Description = description;
            newResource.ImageURL = imageURL;
            newResource.OwnerFK = ownerFK;
            newResource.DateCreated = DateTime.Now;
            newResource.DateModified = null;
            newResource.ModifiedBy = modifiedBy;
            newResource.DifficultyLevel = difficultyLevel;
            newResource.IsActive = true;
            newResource.ResourceTypeFK = ResourceTypeFK;
            newResource.ModulesFK = ModulesFK;
            using (DBEntities db = new DBEntities())
            {
                db.Resources.Add(newResource);
                db.SaveChanges();
            }
            prKey = newResource.PrKey;

            return prKey;
        }
    }
}