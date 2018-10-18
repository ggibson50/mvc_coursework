using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieWebsite.Models;

namespace MovieWebsite.Controllers
{
    public class HomeController : Controller
    {
        private MovieDatabase _db = new MovieDatabase();

        protected override void Dispose(bool disposing)
        {
            if(disposing)
            {
                _db.Dispose();
                _db = null;
            }
            base.Dispose(disposing);
        }

        public ActionResult Index()
        {
            var genres =
                from g in _db.Genres
                orderby g.GenreName
                select g;

            return View("Index", genres.ToList());
        }
    }
}