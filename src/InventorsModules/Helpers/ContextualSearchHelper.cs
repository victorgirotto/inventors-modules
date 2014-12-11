using Bing;
using IdentityTest.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Services.Client;
using System.Linq;
using System.Net;
using System.Web;

namespace IdentityTest.Helpers
{
    public class ContextualSearchHelper
    {
        public static List<SearchResult> ContextAwareSearch(string query, List<string> keywords)
        {
            query = query.Trim();
            List<string> queryModifications = new List<string>();
            queryModifications.Add("learning " + query);
            queryModifications.Add(query + " events");
            queryModifications.Add(query + " basics");
            queryModifications.Add(query + " research");
            queryModifications.Add(query + " courses");

            string[] context = { "coursera", "instructables", "edx", "udacity", "itunesu", "github", "khan academy" };

            //Set up Bing connection
            string rootUri = "https://api.datamarket.azure.com/Bing/Search";
            var bingContainer = new BingSearchContainer(new Uri(rootUri));
            var accountKey = ConfigurationManager.AppSettings["BING_KEY"];
            bingContainer.Credentials = new NetworkCredential(accountKey, accountKey);

            //Set up search results list
            List<IEnumerable<Bing.WebResult>> searchResults = new List<IEnumerable<Bing.WebResult>>();

            //Search for given topic
            DataServiceQuery<Bing.WebResult> webQuery = bingContainer.Web(query, null, null, "en-us", null, null, null, null);
            webQuery = webQuery.AddQueryOption("$top", 20);
            searchResults.Add(webQuery.Execute());

            //Search for keywords
            foreach (string keyword in keywords)
            {
                webQuery = bingContainer.Web(query + keyword.Trim(), null, null, "en-us", null, null, null, null);
                webQuery = webQuery.AddQueryOption("$top", 20);
                searchResults.Add(webQuery.Execute());
            }

            //Add using query modifications
            foreach (string queryMod in queryModifications)
            {
                webQuery = bingContainer.Web(queryMod, null, null, "en-us", null, null, null, null);
                webQuery = webQuery.AddQueryOption("$top", 20);
                searchResults.Add(webQuery.Execute());
            }

            //Parse search results
            List<SearchResult> items = new List<SearchResult>();
            int listNumber = 1;
            for (int i = 0; i < searchResults.Count; i++)
            {
                int initialRank = listNumber;
                foreach (Bing.WebResult result in searchResults[i])
                {
                    int rank = initialRank;
                    SearchResult temp = new SearchResult();
                    temp.Title = result.Title;
                    temp.Description = result.Description;
                    temp.Url = result.Url;

                    //Modify rank based on user preferences
                    foreach (string keyword in keywords)
                    {
                        if (result.Title.ToLower().Contains(keyword))
                        {
                            rank = rank / 4;
                        }
                        else if (result.Description.ToLower().Contains(keyword))
                        {
                            rank = rank / 2;
                        }
                    }

                    //Modify rank based on static context
                    foreach (string word in context)
                    {
                        if (result.Url.ToLower().Contains(word))
                        {
                            rank = rank / 10;
                        }
                        else if (result.Title.ToLower().Contains(word))
                        {
                            rank = rank / 4;
                        }
                        else if (result.Description.ToLower().Contains(word))
                        {
                            rank = rank / 2;
                        }
                    }

                    if (result.Url.ToLower().Contains("youtube"))
                    {
                        rank = rank * 100;
                    }
                    else if (result.Title.ToLower().Contains("youtube"))
                    {
                        rank = rank * 100;
                    }
                    else if (result.Description.ToLower().Contains("youtube"))
                    {
                        rank = rank * 100;
                    }

                    temp.Ranking = rank;
                    items.Add(temp);
                    initialRank += 100;
                }
                listNumber++;
            }

            //Sort results by rank
            items.Sort((s1, s2) => s1.Ranking.CompareTo(s2.Ranking));

            return items;
        }
    }
}