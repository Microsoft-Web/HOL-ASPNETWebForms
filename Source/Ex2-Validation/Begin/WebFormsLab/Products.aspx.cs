using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using WebFormsLab.Model;
using System.Web.ModelBinding;

namespace WebFormsLab
{
    public partial class Products : System.Web.UI.Page
    {
        private ProductsContext db = new ProductsContext();

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

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}