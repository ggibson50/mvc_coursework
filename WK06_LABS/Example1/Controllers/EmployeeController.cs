using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Example1.Models;

namespace Example1.Controllers
{
    public class EmployeeController : Controller
    {
        private EmployeeDatabase db = new EmployeeDatabase();

        public ActionResult Index(string last_name)
        {
            var query =
                from e in db.Employees
                where e.last_name == "Lenart"
                select e;

            return View(query.ToList());
        }

        public ActionResult Details(int? id)
        {
            var employee = db.Employees.Find(id);
            return View(employee);
        }

        protected override void Dispose(bool disposing)
        {
            if(disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}