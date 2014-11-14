using IdentityTest.DataProviders;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.DAO
{
    public class UserDAO
    {
        public User SelectUserById(int id)
        {
            return DapperUtil.SelectOne<User>("select * from AspNetUsers where Id = @Id", new { Id = id });
        }
    }
}