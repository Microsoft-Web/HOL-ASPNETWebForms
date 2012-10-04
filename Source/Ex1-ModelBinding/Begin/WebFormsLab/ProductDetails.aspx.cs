namespace WebFormsLab
{
    using System;
    using System.Web.ModelBinding;
    using WebFormsLab.Model;

    public partial class ProductDetails : System.Web.UI.Page
    {
        private ProductsContext db = new ProductsContext();

        public Product SelectProduct()
        {
            return null;
        }

        public void UpdateProduct(int productID)
        {
            var product = this.db.Products.Find(productID);

            this.TryUpdateModel(product);

            if (this.ModelState.IsValid)
            {
                this.db.SaveChanges();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}