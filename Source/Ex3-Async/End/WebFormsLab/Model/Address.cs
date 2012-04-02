namespace WebFormsLab.Model
{
    using System.ComponentModel.DataAnnotations;

    public class Address
    {
        [Key]
        public int Id { get; set; }

        [StringLength(100)]
        public string Street { get; set; }

        [Required, StringLength(100)]
        public string City { get; set; }

        [StringLength(100)]
        public string State { get; set; }

        [StringLength(32)]
        public string Zip { get; set; }

        [StringLength(100)]
        public string Country { get; set; }
    }
}