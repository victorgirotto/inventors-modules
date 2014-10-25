using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class Module
    {
        public Int32 PrKey { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public Int32 OwnerFK { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public Int32 ModifiedBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsPrivate { get; set; }
    }
}