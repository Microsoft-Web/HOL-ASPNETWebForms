namespace WebFormsLab.Model
{
    public class Product
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public string ImagePath { get; set; }

        public decimal? UnitPrice { get; set; }

        public int? CategoryId { get; set; }

        public virtual Category Category { get; set; }
    }
}