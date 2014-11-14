using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Dapper;
using System.Configuration;
using IdentityTest.Models;

namespace IdentityTest.DataProviders
{
    public class DapperUtil
    {
        public static IEnumerable<RT> SelectManyJoin<T1, T2, RT>(string query, Func<T1,T2,RT> mapping, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                var rows = connection.Query<T1, T2, RT>(query, mapping, param);
                return rows;
            }
        }

        public static IEnumerable<T> SelectMany<T>(string query, object param = null)
        {
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                var rows = connection.Query<T>(query, param);
                return rows;
            }
        }

        public static RT SelectOneJoin<T1, T2, RT>(string query, Func<T1, T2, RT> mapping, object param = null)
        {
            IEnumerable<RT> results = SelectManyJoin<T1, T2, RT>(query, mapping, param);
            if (results != null)
                return results.First();
            return default(RT);
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