using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DealershipWebsite.Models
{
    [Table("Vehicle")]
    public class Vehicle
    {
        [Display (Name = "Vin Number"), Key]
        public string VehicleVin { get; set; }
        [Display(Name = "Vehicle Make")]
        public string VehicleMake { get; set; }
        [Display(Name = "Vehicle Model")]
        public string VehicleModel { get; set; }
        [Display(Name = "Vehicle Year")]
        public int VehicleYear { get; set; }
        [Display(Name = "Color")]
        public string VehicleColor { get; set; }
        [Display(Name = "Vehicle Price")]
        public decimal VehiclePrice { get; set; }
    }
}