using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class ModuleType : DBModel
    {
        public ModuleType() { }
        public ModuleType(int id)
        {
            this.Id = id;
        }

        public string Name { get; set; }
    }
}