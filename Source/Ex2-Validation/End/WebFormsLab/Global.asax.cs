using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using WebFormsLab.Model;

namespace WebFormsLab
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

			Database.SetInitializer<ProductsContext>(new ProductsDatabaseInitializer());

			// set up the jquery script resource definition
			ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
			myScriptResDef.Path = "~/Assets/Scripts/jquery-1.7.1.min.js";
			myScriptResDef.DebugPath = "~/Assets/Scripts/jquery-1.7.1.js";
			myScriptResDef.CdnPath = "http://code.jquery.com/jquery-1.7.1.min.js";
			myScriptResDef.CdnDebugPath = "http://code.jquery.com/jquery-1.7.1.js";
			ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, myScriptResDef);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
