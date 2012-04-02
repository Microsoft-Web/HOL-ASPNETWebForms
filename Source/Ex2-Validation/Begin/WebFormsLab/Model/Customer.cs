namespace WebFormsLab.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Customer
    {
        [Key]
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }
        
        public int Age { get; set; }

        public Address Address { get; set; }
        
        public string DaytimePhone { get; set; }
    
        public string EmailAddress { get; set; }
    }
}