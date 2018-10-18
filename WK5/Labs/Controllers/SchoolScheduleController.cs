using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Labs.Models;

namespace Labs.Controllers
{
    public class SchoolScheduleController : Controller
    {
        private List<Course> _courses;

        public SchoolScheduleController()
        {
            _courses = new List<Course>();
            _courses.Add(new Course("AWD1111", "Paul Smith", "12:35 am - 4:30 pm"));
            _courses.Add(new Course("ENG1101", "Amber Moore", "10:35 am - 11:25 pm"));
            _courses.Add(new Course("MTH1111", "Khanina", "8:35 am - 9:55 pm"));
            _courses.Add(new Course("MNG1204", "BB Jackson", "10:05 am - 11:25 pm"));
        }

        public ActionResult Index(string search)
        {
            Course course = _courses.Find(x => x.CourseName == search);  //SearchCourses(_courses, courseName);

            ViewBag.CourseList = _courses;
            ViewBag.Search = search;
            ViewBag.Course = course;
           
            return View();
        }
    }
}