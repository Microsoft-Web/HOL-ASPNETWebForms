namespace WebFormsLab
{
    using System;
    using System.Data.Entity;
    using System.Web;
    using System.Web.Optimization;
    using WebFormsLab.Model;

    public class Global : HttpApplication
    {
        private void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            Database.SetInitializer<ProductsContext>(new ProductsDatabaseInitializer());
        }

        private void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }

        private void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }
    }
}