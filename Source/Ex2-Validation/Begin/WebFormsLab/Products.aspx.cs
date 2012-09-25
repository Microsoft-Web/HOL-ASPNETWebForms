namespace WebFormsLab
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Linq;
    using System.Web.ModelBinding;
    using WebFormsLab.Model;

    public partial class Products : System.Web.UI.Page
    {
        private ProductsContext db = new ProductsContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IQueryable<Category> GetCategories([Control]int? minProductsCount)
        {
            var query = this.db.Categories
              .Include(c => c.Products);

            if (minProductsCount.HasValue)
            {
                query = query.Where(c => c.Products.Count >= minProductsCount);
            }

            return query;
        }

        public IEnumerable<WebFormsLab.Model.Product> GetProducts([Control("categoriesGrid")]int? categoryId)
        {
            return this.db.Products.Where(p => p.CategoryId == categoryId);
        }

        public void UpdateCategory(int categoryId)
        {
            var category = this.db.Categories.Find(categoryId);

            TryUpdateModel(category);

            if (ModelState.IsValid)
            {
                this.db.SaveChanges();
            }
        }
    }
}