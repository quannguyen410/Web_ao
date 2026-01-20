using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Security.Principal;
using System.Web.UI;

namespace WebBanQuanAo
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition(
                "jquery",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/jquery-3.7.1.min.js",
                    DebugPath = "~/Scripts/jquery-3.7.1.js",
                    CdnPath = "https://code.jquery.com/jquery-3.7.1.min.js",
                    CdnDebugPath = "https://code.jquery.com/jquery-3.7.1.js",
                    CdnSupportsSecureConnection = true,
                    LoadSuccessExpression = "window.jQuery"
                }
            );
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (Context == null || Context.Request == null || Context.User == null)
            {
                return;
            }

            if (Context.User.Identity == null || !Context.User.Identity.IsAuthenticated)
            {
                return;
            }

            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (authCookie == null || string.IsNullOrWhiteSpace(authCookie.Value))
            {
                return;
            }

            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            if (ticket == null)
            {
                return;
            }

            string[] roles = string.IsNullOrWhiteSpace(ticket.UserData)
                ? new string[0]
                : ticket.UserData.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            Context.User = new GenericPrincipal(new FormsIdentity(ticket), roles);
        }
    }
}