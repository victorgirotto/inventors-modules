using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Models
{
    public class User : DBModel
    {
        public User() { }

        public User(int id)
        {
            this.Id = id;
        }

        public string UserName { get; set; }
        public string Email { get; set; }
    }
}