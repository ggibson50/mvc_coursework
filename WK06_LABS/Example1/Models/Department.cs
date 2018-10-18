using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Example1.Models
{
    [Table("departments")]
    public class Department
    {
        [Key]
        [Display(Name = "Department #")]
        public string dept_no { get; set; }

        [Display(Name = "Department")]
        public string dept_name { get; set; }
    }
}