using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Dapper;
using System.Configuration;

namespace IdentityTest.DataProviders
{
    public class DapperUtil
    {

        public static IEnumerable<T> SelectMany<T>(string query, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                var rows = connection.Query<T>(query, param);
                return rows;
            }
        }

        public static T SelectOne<T>(string query, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                var rows = connection.Query<T>(query, param);
                return rows.First();
            }
        }

        public static void ExecuteQuery(string query, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Execute(query, param);
            }
        }

        public static int ExecuteInsert(string query, object param = null)
        {
            return ExecuteScalar(query, param);
        }

        public static int ExecuteScalar(string query, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                return connection.Query<int>(query, param).Single();
            }
        }

    }
}