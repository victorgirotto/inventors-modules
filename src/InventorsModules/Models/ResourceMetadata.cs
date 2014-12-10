using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class ResourceMetadata : DBModel
    {
        public int ResourceId { get; set; }
        public string DataType { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
    }
}