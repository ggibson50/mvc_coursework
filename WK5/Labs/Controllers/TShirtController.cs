using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Labs.Controllers
{
    public class TShirtController : Controller
    {
        const double SHIRT_PRICE = 13.75d;
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

            if(quantity != null)
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
            switch(code.ToUpper())
            {
                case "82XH":
                    return 0.30f;
                case "5679":
                    return 0.20f;
                case "64TH":
                    return 0.10f;
                default:
                    return 0;
            }
        }
    }
}