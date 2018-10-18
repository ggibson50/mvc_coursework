using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labs.Models
{
    public class Course
    {
        public string CourseName { get; set; }
        public string Instructor { get; set; }
        public string Time { get; set; }

        public Course(string name, string instructor, string time)
        {
            CourseName = name;
            Instructor = instructor;
            Time = time;
        }
    }
}