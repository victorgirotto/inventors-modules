using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;

namespace IdentityTest.Helpers
{
    public class CaptchaHelper
    {
        public static bool VerifyUser(string secret, string captchaResponse)
        {
            string ipAddress = GetIPAddress();

            using (WebClient client = new WebClient())
            {
                byte[] response =
                client.UploadValues("https://www.google.com/recaptcha/api/siteverify", new NameValueCollection()
                {
                    { "secret", secret },
                    { "response", captchaResponse },
                    { "remoteip", ipAddress }
                });
                string result = System.Text.Encoding.UTF8.GetString(response);

                CaptchaResult verificationResult = JsonHelper.DeserializeJson<CaptchaResult>(result);
                return verificationResult.Success;
            }
        }

        private static string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        private class CaptchaResult
        {
            public bool Success;
        }
    }
}