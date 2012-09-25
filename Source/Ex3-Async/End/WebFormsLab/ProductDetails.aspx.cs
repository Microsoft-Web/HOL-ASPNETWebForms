﻿namespace WebFormsLab
{
    using System;
    using System.IO;
    using System.Net;
    using System.Web;
    using System.Web.ModelBinding;
    using WebFormsLab.Model;
    using System.Web.UI;
    using System.Threading;

    public partial class ProductDetails : System.Web.UI.Page
    {
        private ProductsContext db = new ProductsContext();

        public Product SelectProduct([QueryString]int? productId)
        {
            return this.db.Products.Find(productId);
        }

        public void UpdateProduct(int productID)
        {
            var product = this.db.Products.Find(productID);

            TryUpdateModel(product);

            this.UpdateProductImage(product);

            if (ModelState.IsValid)
            {
                this.db.SaveChanges();
            }
        }

        private void UpdateProductImage(Product product)
        {
            string imageUrl = product.ImagePath;

            if (!string.IsNullOrEmpty(imageUrl) && !VirtualPathUtility.IsAbsolute(imageUrl))
            {
                product.ImagePath = string.Format("/Images/{0}{1}",
                                         product.ProductId,
                                         Path.GetExtension(imageUrl));

                RegisterAsyncTask(new PageAsyncTask(async (t) =>
                {
                    var startThread = Thread.CurrentThread.ManagedThreadId;
	
                    using (var wc = new WebClient())
                    {
                        await wc.DownloadFileTaskAsync(imageUrl, Server.MapPath(product.ImagePath));
                    }

                    var endThread = Thread.CurrentThread.ManagedThreadId;

                    threadsMessageLabel.Text =
                         string.Format("Started on thread: {0}<br /> Finished on thread: {1}",
                                        startThread, endThread);
                }));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}