using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DistanceConverter.Controllers
{
    public class DistanceController : Controller
    {
        const double CM_PER_IN = 2.54;

        // GET: Distance
        public ActionResult Index(int? inches)
        {
            ViewBag.Inches = inches;

            ViewBag.Conversion = inches * CM_PER_IN;

            return View();
        }
    }
}