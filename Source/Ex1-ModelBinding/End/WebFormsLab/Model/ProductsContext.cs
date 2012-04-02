namespace WebFormsLab.Model
{
    using System.Data.Entity;

    public class ProductsContext : DbContext
    {
        public ProductsContext() : base("WebFormsLab-Products")
        {
        }

        public DbSet<Category> Categories { get; set; }
        
        public DbSet<Product> Products { get; set; }
        
        public DbSet<Customer> Customers { get; set; }
    }
}