namespace WebFormsLab.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Microsoft.AspNet.Membership.OpenAuth;

    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected bool CanRemoveExternalLogins
        {
            get;
            private set;
        }

        public IEnumerable<OpenAuthAccountData> GetExternalLogins()
        {
            var accounts = OpenAuth.GetAccountsForUser(this.User.Identity.Name);
            this.CanRemoveExternalLogins = this.CanRemoveExternalLogins || accounts.Count() > 1;
            return accounts;
        }

        public void RemoveExternalLogin(string providerName, string providerUserId)
        {
            var m = OpenAuth.DeleteAccount(this.User.Identity.Name, providerName, providerUserId)
                ? "?m=RemoveLoginSuccess"
                : string.Empty;

            this.Response.Redirect("~/Account/Manage.aspx" + m);
        }

        protected static string ConvertToDisplayDateTime(DateTime? utcDateTime)
        {
            // You can change this method to convert the UTC date time into the desired display
            // offset and format. Here we're converting it to the server timezone and formatting
            // as a short date and a long time string, using the current thread culture.
            return utcDateTime.HasValue ? utcDateTime.Value.ToLocalTime().ToString("G") : "[never]";
        }

        protected void Page_Load()
        {
            if (!this.IsPostBack)
            {
                // Determine the sections to render
                var hasLocalPassword = OpenAuth.HasLocalPassword(User.Identity.Name);
                this.setPassword.Visible = !hasLocalPassword;
                this.changePassword.Visible = hasLocalPassword;

                this.CanRemoveExternalLogins = hasLocalPassword;

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    this.Form.Action = this.ResolveUrl("~/Account/Manage.aspx");

                    this.SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The external login was removed."
                        : string.Empty;
                    this.successMessage.Visible = !string.IsNullOrEmpty(this.SuccessMessage);
                }
            }
        }

        protected void SetPasswordClick(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                var result = OpenAuth.AddLocalPassword(this.User.Identity.Name, this.password.Text);

                if (result.IsSuccessful)
                {
                    this.Response.Redirect("~/Account/Manage.aspx?m=SetPwdSuccess");
                }
                else
                {
                    this.ModelState.AddModelError("NewPassword", result.ErrorMessage);
                }
            }
        }
    }
}