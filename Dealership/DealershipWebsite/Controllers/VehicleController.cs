using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DealershipWebsite.Models;
using DealershipWebsite.ViewModels;
using PagedList;

namespace DealershipWebsite.Controllers
{
    public class VehicleController : Controller
    {
        private DealershipDatabase db = new DealershipDatabase();

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
                db = null;
            }
            base.Dispose(disposing);
        }
        
        public ActionResult Index(
            string search,
            int? minYear,
            int? maxYear,
            string sortBy,
            int? page,
            int? itemsPerPage)
        {
            var vehicles =
                from v in db.Vehicles
                orderby v.VehicleMake, v.VehicleModel, v.VehicleYear
                select new VehicleInfo
                {
                    VehicleMake = v.VehicleMake,
                    VehicleModel = v.VehicleModel,
                    VehicleYear = v.VehicleYear,
                    VehicleColor = v.VehicleColor,
                    VehiclePrice = v.VehiclePrice
                };

            // Search
            if(!string.IsNullOrWhiteSpace(search))
            {
                vehicles = vehicles.Where(v => v.VehicleMake == search || v.VehicleModel == search || Convert.ToString(v.VehicleYear) == search);
            }
            if(minYear != null)
            {
                vehicles = vehicles.Where(v => v.VehicleYear >= minYear);
            }
            if(maxYear != null)
            {
                vehicles = vehicles.Where(v => v.VehicleYear == maxYear);
            }

            // Sorting
            switch(sortBy)
            {
                default:
                    vehicles.OrderBy(v => v.VehicleMake);
                    break;
                case "Make":
                    vehicles.OrderBy(v => v.VehicleMake);
                    break;
                case "Model":
                    vehicles.OrderBy(v => v.VehicleModel);
                    break;
                case "Year":
                    vehicles.OrderBy(v => v.VehicleYear);
                    break;
                case "Price":
                    vehicles.OrderBy(v => v.VehiclePrice);
                    break;
            }

            var model = new VehicleSearchResults
            {
                Search = search,
                MinYear = minYear,
                MaxYear = maxYear,
                SortBy = sortBy,
                Results = vehicles.ToPagedList(page ?? 1, itemsPerPage ?? 5)
            };
            
            return View("Index", model);
        }
    }
}