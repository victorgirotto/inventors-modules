using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityTest.Helpers
{
    public class JsonHelper
    {
        public static T DeserializeJson<T>(string json)
        {
            T objs = JsonConvert.DeserializeObject<T>(json);
            return objs;
        }
    }
}