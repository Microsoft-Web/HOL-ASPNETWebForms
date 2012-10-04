﻿namespace WebFormsLab
{
    using System;
    using System.Linq;
    using System.Web.UI;

    public partial class Customers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new WebFormsLab.Model.ProductsContext())
            {
                this.customersRepeater.DataSource = db.Customers.ToList();
                this.customersRepeater.DataBind();
            }
        }
    }
}