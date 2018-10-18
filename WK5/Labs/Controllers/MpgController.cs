using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Labs.Controllers
{
    public class MpgController : Controller
    {
        // GET: Mpg
        public ActionResult Index(float? milesDriven, float? gallonsUsed, float? pricePerGallon)
        {
            ViewBag.milesDriven = milesDriven;
            ViewBag.gallonsUsed = gallonsUsed;
            ViewBag.pricePerGallon = pricePerGallon;

            ViewBag.Mpg = milesDriven / gallonsUsed;
            ViewBag.tripCost = (gallonsUsed * pricePerGallon);
            ViewBag.costPerMile = (ViewBag.tripCost / milesDriven);

            return View();
        }
    }
}