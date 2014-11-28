using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class ResourceType : DBModel
    {
        public ResourceType() { }

        public ResourceType(int id)
        {
            this.Id = id;
        }

        public string Name { get; set; }
    }
}