using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WebApplication1
{
    public class ModulesDataProvider
    {
        public IEnumerable<Module> SelectModulesAll()
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Modules.ToArray<Module>();
            }
        }

        public IEnumerable<Module> SelectModulesActive()
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Modules.Where(m => m.IsActive == true).ToArray<Module>();
            }
        }

        public Module SelectModuleByPrKey(int ModulePK)
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Modules.Where(m => m.PrKey == ModulePK).First<Module>();
            }
        }

        public IEnumerable<Resource> SelectResourcesForModule(int ModuleFK)
        {
            using (DBEntities db = new DBEntities())
            {
                return db.Resources.Where(r => r.ModulesFK == ModuleFK).ToArray<Resource>();
            }
        }

        public int InsertModule(string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
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

        public void UpdateModule(int prKey, string title, string description, string imageURL, int ownerFK, int modifiedBy, bool isPrivate)
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

        public void DeleteModule(int prKey)
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