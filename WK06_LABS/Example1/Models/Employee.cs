using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Example1.Models
{
    [Table("employees")]
    public class Employee
    {
        [Key]
        [Display(Name ="Employee #")]
        public int emp_no { get; set; }

        [Display(Name ="Birth Date")]
        public DateTime birth_date { get; set; }

        [Display(Name ="First Name")]
        public string first_name { get; set; }

        [Display(Name ="Last Name")]
        public string last_name { get; set; }

        [Display(Name ="Gender")]
        public char gender { get; set; }

        [Display(Name ="Hire Date")]
        public DateTime hire_date { get; set; }

        [NotMapped]
        [Display(Name ="Full Name")]
        public string full_name
        {
            get { return first_name + " " + last_name; }
        }
    }
}