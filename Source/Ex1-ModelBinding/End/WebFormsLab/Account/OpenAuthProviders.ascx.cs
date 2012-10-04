namespace WebFormsLab.Account
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using Microsoft.AspNet.Membership.OpenAuth;

    public partial class OpenAuthProviders : System.Web.UI.UserControl
    {
        public string ReturnUrl { get; set; }

        public IEnumerable<ProviderDetails> GetProviderNames()
        {
            return OpenAuth.AuthenticationClients.GetAll();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                var provider = Request.Form["provider"];
                if (provider == null)
                {
                    return;
                }

                var redirectUrl = "~/Account/RegisterExternalLogin.aspx";
                if (!string.IsNullOrEmpty(this.ReturnUrl))
                {
                    var resolvedReturnUrl = ResolveUrl(this.ReturnUrl);
                    redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(resolvedReturnUrl);
                }

                OpenAuth.RequestAuthentication(provider, redirectUrl);
            }
        }
    }
}