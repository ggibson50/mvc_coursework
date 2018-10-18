using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DistanceConverter.Controllers
{
    public class ShirtFactoryController : Controller
    {
        const double SHIRT_PRICE = 15.00d;
        const double TAX = 0.08d;

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(int? quantity, string code)
        {
            float discount = ValidateDiscount(code);

            ViewBag.Quantity = quantity;
            ViewBag.Code = code;
            ViewBag.ShirtPrice = SHIRT_PRICE;
            ViewBag.Discount = discount;

            if (quantity != null)
            {
                ViewBag.ShirtPrice = SHIRT_PRICE - (SHIRT_PRICE * discount);
                ViewBag.Subtotal = (quantity * ViewBag.ShirtPrice);
                ViewBag.Tax = (ViewBag.subTotal * TAX);
                ViewBag.GrandTotal = (ViewBag.SubTotal + ViewBag.Tax);
            }

            return View();
        }

        public float ValidateDiscount(string code)
        {
            switch (code.ToUpper())
            {
                default:
                    return 0;
                case "6175":
                    return 0.30f;
                case "1390":
                    return 0.20f;
                case "BB88":
                    return 0.10f;
            }
        }
    }
}