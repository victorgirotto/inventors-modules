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
            using (db539594002Entities db = new db539594002Entities())
            {
                return db.modules;
            }
        }

        public DbSet selectModuleByPrKey(int modulePK)
        {
            using (db539594002Entities db = new db539594002Entities())
            {
                return (DbSet)db.modules.Select(m => m.PrKey == modulePK);
            }
        }

        public DbSet selectResourcesForModule(int moduleFK)
        {
            using (db539594002Entities db = new db539594002Entities())
            {
                return (DbSet)db.resources.Select(r => r.ModulesFK == moduleFK);
            }
        }

        public int insertModule(string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
        {
            int prKey = -1;
            module newModule = new module();
            newModule.Title = title;
            newModule.Description = description;
            newModule.ImageURL = imageURL;
            newModule.OwnerFK = ownerFK;
            newModule.DateCreated = DateTime.Now;
            newModule.DateModified = null;
            newModule.ModifiedBy = modifiedBy;
            newModule.IsActive = true;
            newModule.IsPrivate = isPrivate;
            using (db539594002Entities db = new db539594002Entities())
            {
                db.modules.Add(newModule);
                db.SaveChanges();
            }
            prKey = newModule.PrKey;
            
            return prKey;
        }

        public int insertResource(string title, string description, string imageURL, int ownerFK, int modifiedBy, int difficultyLevel, int resourceTypeFK, int modulesFK)
        {
            int prKey = -1;
            resource newResource = new resource();
            newResource.Title = title;
            newResource.Description = description;
            newResource.ImageURL = imageURL;
            newResource.OwnerFK = ownerFK;
            newResource.DateCreated = DateTime.Now;
            newResource.DateModified = null;
            newResource.ModifiedBy = modifiedBy;
            newResource.DifficultyLevel = difficultyLevel;
            newResource.IsActive = true;
            newResource.ResourceTypeFK = resourceTypeFK;
            newResource.ModulesFK = modulesFK;
            using (db539594002Entities db = new db539594002Entities())
            {
                db.resources.Add(newResource);
                db.SaveChanges();
            }
            prKey = newResource.PrKey;

            return prKey;
        }

        public void updateModule(int prKey, string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
        {
            using (db539594002Entities db = new db539594002Entities())
            {
                module updateModule = db.modules.Where(m => m.PrKey == prKey).First<module>();
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
            using (db539594002Entities db = new db539594002Entities())
            {
                module deleteModule = db.modules.Where(m => m.PrKey == prKey).FirstOrDefault<module>();
                deleteModule.IsActive = false;
                db.SaveChanges();
            }
        }
    }
}