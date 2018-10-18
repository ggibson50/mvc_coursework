using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Example1.Models
{
    [Table("dept_emp")]
    public class DepartmentEmployee
    {
        [Key, Column(Order = 0)]
        [Display(Name ="Department #")]
        public string dept_no { get; set; }

        [Key, Column(Order = 1)]
        [Display(Name ="Employee #")]
        public int emp_no { get; set; }

        [Column(Order = 2)]
        [Display(Name = "From Date")]
        public DateTime from_date { get; set; }

        [Column(Order = 3)]
        [Display(Name = "To Date")]
        public DateTime to_date { get; set; }
    }
}