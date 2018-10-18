using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DealershipWebsite.Models
{
    [Table("Supplier")]
    public class Supplier
    {
        [Display(Name = "Supplier #")]
        public int SupplierId { get; set; }
        [Display(Name = "Supplier Name")]
        public int SupplierName { get; set; }
    }
}