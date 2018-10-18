using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Labs.Controllers
{
    public class TempController : Controller
    {
        public ActionResult Index(float? fahrenheit, float? celsius)
        {
            ViewBag.fahrenheit = fahrenheit;

            ViewBag.celsius = (fahrenheit - 32) / 1.8;
            ViewBag.kelTemp = (ViewBag.celsius + 273.15);

            return View();
        }
    }
}