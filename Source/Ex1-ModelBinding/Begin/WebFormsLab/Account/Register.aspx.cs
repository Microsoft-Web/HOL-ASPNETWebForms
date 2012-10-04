namespace WebFormsLab.Account
{
    using Microsoft.AspNet.Membership.OpenAuth;
    using System;
    using System.Web.Security;
    using System.Web.UI;

    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.RegisterUser.ContinueDestinationPageUrl = this.Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(this.RegisterUser.UserName, createPersistentCookie: false);

            string continueUrl = this.RegisterUser.ContinueDestinationPageUrl;
            if (!OpenAuth.IsLocalUrl(continueUrl))
            {
                continueUrl = "~/";
            }

            this.Response.Redirect(continueUrl);
        }
    }
}