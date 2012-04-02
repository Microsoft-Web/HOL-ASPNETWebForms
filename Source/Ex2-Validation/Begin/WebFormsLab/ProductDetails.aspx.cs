using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

using WebFormsLab.Model;
using System.Web.ModelBinding;

namespace WebFormsLab
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        private ProductsContext db = new ProductsContext();

        public Product SelectProduct([QueryString]int? productId)
        {
            return this.db.Products.Find(productId);
        }

        public void UpdateProduct(int productId)
        {
            var product = this.db.Products.Find(productId);

            TryUpdateModel(product);

            if (ModelState.IsValid)
            {
                this.db.SaveChanges();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}