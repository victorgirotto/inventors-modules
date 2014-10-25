using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Dapper;
using MySql.Data.MySqlClient;

namespace IdentityTest.DataProviders
{
    public class DapperUtil
    {

        public static IEnumerable<T> SelectMany<T>(string query, object param = null)
        {
            using (MySqlConnection connection = new MySqlConnection("Server=localhost;Database=dbentities;Uid=root;Pwd=admin;Persist Security Info=True;"))
            {
                var rows = connection.Query<T>(query, param);
                return rows;
            }
        }

        public static T SelectOne<T>(string query, object param = null)
        {
            using (MySqlConnection connection = new MySqlConnection("Server=localhost;Database=dbentities;Uid=root;Pwd=admin;Persist Security Info=True;"))
            {
                var rows = connection.Query<T>(query, param);
                return rows.First();
            }
        }

        public static void ExecuteQuery(string query, object param = null)
        {
            using (MySqlConnection connection = new MySqlConnection("Server=localhost;Database=dbentities;Uid=root;Pwd=admin;Persist Security Info=True;"))
            {
                connection.Execute(query, param);
            }
        }

        public static int ExecuteInsert(string query, object param = null)
        {
            ExecuteQuery(query, param);
            return ExecuteScalar("SELECT LAST_INSERT_ID();");
        }

        public static int ExecuteScalar(string query, object param = null)
        {
            using (MySqlConnection connection = new MySqlConnection("Server=localhost;Database=dbentities;Uid=root;Pwd=admin;Persist Security Info=True;")){
                return connection.Query<int>(query, param).Single();
            }
        }

    }
}