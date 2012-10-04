namespace WebFormsLab.Account
{
    using System;
    using System.Web;
    using System.Web.UI;

    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.RegisterHyperLink.NavigateUrl = "Register.aspx";
            this.OpenAuthLogin.ReturnUrl = this.Request.QueryString["ReturnUrl"];

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!string.IsNullOrEmpty(returnUrl))
            {
                this.RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
    }
}