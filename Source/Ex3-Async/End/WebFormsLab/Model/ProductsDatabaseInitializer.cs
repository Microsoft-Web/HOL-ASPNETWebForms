namespace WebFormsLab.Model
{
    using System.Collections.Generic;
    using System.Data.Entity;
    using System;

    public class ProductsDatabaseInitializer : DropCreateDatabaseAlways<ProductsContext>
    {
        protected override void Seed(ProductsContext context)
        {
            if(context == null)
                throw new ArgumentNullException("context");

            context.Database.ExecuteSqlCommand("ALTER TABLE Categories ADD CONSTRAINT uc_categoryName UNIQUE NONCLUSTERED (CategoryName)");

            GetCustomers().ForEach(c => context.Customers.Add(c));
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
        }

        private static List<Customer> GetCustomers()
        {
            var customers = new List<Customer> 
            {
                new Customer
                {
                    FirstName = "Maria",
                    LastName = "Anders",
                    Age = 23,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Antonio",
                    LastName = "Moreno",
                    Age = 42,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Patricio",
                    LastName = "Simpson",
                    Age = 34,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Janine",
                    LastName = "Labrune",
                    Age = 48,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Helen",
                    LastName = "Bennett",
                    Age = 63,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Daniel",
                    LastName = "Tonini",
                    Age = 57,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "John",
                    LastName = "Steel",
                    Age = 29,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Lino",
                    LastName = "Rodriguez",
                    Age = 44,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Alexander",
                    LastName = "Feuer",
                    Age = 46,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Jose",
                    LastName = "Pabarotti",
                    Age = 38,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
                new Customer
                {
                    FirstName = "Karl",
                    LastName = "Jablonski",
                    Age = 62,
                    Address = new Address
                    {
                        Street = "123 Sesame Street",
                        City = "Redmond",
                        State = "WA",
                        Zip = "98052",
                        Country = "USA"
                    },
                },
            };
            return customers;
        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category> 
            {
                new Category
                {
                    CategoryId = 1,
                    CategoryName = "Bikes"
                },
                new Category
                {
                    CategoryId = 2,
                    CategoryName = "Cars"
                },
                new Category
                {
                    CategoryId = 3,
                    CategoryName = "Trucks"
                },
            };

            return categories;
        }

        private static List<Product> GetProducts()
        {
            var products = new List<Product> 
            {
                new Product
                {
                    ProductId = 1,
                    CategoryId = 1,
                    ProductName = "Wooden Bike",
                    UnitPrice = 350
                },
                new Product
                {
                    ProductId = 2,
                    CategoryId = 1,
                    ProductName = "Quad",
                    UnitPrice = 10210
                },
                new Product
                {
                    ProductId = 3,
                    CategoryId = 1,
                    ProductName = "Monocycle",
                    UnitPrice = 210
                },
                new Product
                {
                    ProductId = 4,
                    CategoryId = 2,
                    ProductName = "Electric Car",
                    UnitPrice = 25300
                },
                new Product
                {
                    ProductId = 5,
                    CategoryId = 2,
                    ProductName = "Hybrid Car",
                    UnitPrice = 31000
                },
                new Product
                {
                    ProductId = 6,
                    CategoryId = 2,
                    ProductName = "Three Wheels Car",
                    UnitPrice = 12000
                },
                new Product
                {
                    ProductId = 7,
                    CategoryId = 2,
                    ProductName = "Flying Car",
                    UnitPrice = 120500
                },
                new Product
                {
                    ProductId = 8,
                    CategoryId = 3,
                    ProductName = "Big Truck",
                    UnitPrice = 51000
                },
                new Product
                {
                    ProductId = 9,
                    CategoryId = 3,
                    ProductName = "Toy Truck",
                    UnitPrice = 25
                },
            };

            return products;
        }
    }
}