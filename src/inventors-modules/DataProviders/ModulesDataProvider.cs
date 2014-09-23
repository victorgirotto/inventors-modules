using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WebApplication1
{
    public class ModulesDataProvider
    {
        public DbSet selectModulesAll()
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Modules;
            }
        }

        public DbSet selectModuleByPrKey(int ModulePK)
        {
            using (DBEntities db = new DBEntities())
            {
                return (DbSet)db.Modules.Select(m => m.PrKey == ModulePK);
            }
        }

        public DbSet selectResourcesForModule(int ModuleFK)
        {
            using (DBEntities db = new DBEntities())
            {
                return (DbSet)db.Resources.Select(r => r.ModulesFK == ModuleFK);
            }
        }

        public int insertModule(string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
        {
            int prKey = -1;
            Module newModule = new Module();
            newModule.Title = title;
            newModule.Description = description;
            newModule.ImageURL = imageURL;
            newModule.OwnerFK = ownerFK;
            newModule.DateCreated = DateTime.Now;
            newModule.DateModified = null;
            newModule.ModifiedBy = modifiedBy;
            newModule.IsActive = true;
            newModule.IsPrivate = isPrivate;
            using (DBEntities db = new DBEntities())
            {
                db.Modules.Add(newModule);
                db.SaveChanges();
            }
            prKey = newModule.PrKey;
            
            return prKey;
        }

        public int insertResource(string title, string description, string imageURL, int ownerFK, int modifiedBy, int difficultyLevel, int ResourceTypeFK, int ModulesFK)
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

        public void updateModule(int prKey, string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
        {
            using (DBEntities db = new DBEntities())
            {
                Module updateModule = db.Modules.Where(m => m.PrKey == prKey).First<Module>();
                updateModule.Title = title;
                updateModule.Description = description;
                updateModule.ImageURL = imageURL;
                updateModule.OwnerFK = ownerFK;
                updateModule.DateModified = DateTime.Now;
                updateModule.ModifiedBy = modifiedBy;
                updateModule.IsPrivate = isPrivate;
                db.SaveChanges();
            }
        }

        public void deleteModule(int prKey)
        {
            using (DBEntities db = new DBEntities())
            {
                Module deleteModule = db.Modules.Where(m => m.PrKey == prKey).FirstOrDefault<Module>();
                deleteModule.IsActive = false;
                db.SaveChanges();
            }
        }
    }
}