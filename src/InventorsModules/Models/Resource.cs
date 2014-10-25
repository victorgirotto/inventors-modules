using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class Resource
    {
        public int PrKey { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string ImageUrl { get; set; }
        public int OwnerFk { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public int ModifiedBy { get; set; }
        public int DifficultyLevel { get; set; }
        public bool IsActive { get; set; }
        public int ResourceTypeFk { get; set; }
        public int ModuleFk { get; set; }
    }
}