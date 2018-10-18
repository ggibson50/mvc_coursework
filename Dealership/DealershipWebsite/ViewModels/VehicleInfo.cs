using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DealershipWebsite.ViewModels
{
    public class VehicleInfo
    {
        [Display(Name = "Make")]
        public string VehicleMake { get; set; }
        [Display(Name = "Model")]
        public string VehicleModel { get; set; }
        [Display(Name = "Year")]
        public int VehicleYear { get; set; }
        [Display(Name = "Color")]
        public string VehicleColor { get; set; }
        [Display(Name = "Price")]
        public decimal VehiclePrice { get; set; }
    }
}