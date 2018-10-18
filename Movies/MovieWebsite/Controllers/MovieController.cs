using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieWebsite.Models;
using MovieWebsite.ViewModels;
using PagedList;

namespace MovieWebsite.Controllers
{
    public class MovieController : Controller
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
        
        public ActionResult Index(
            string search, 
            int? genreId,
            int? minYear,
            int? maxYear,
            string sortBy,
            int? page,
            int? ItemsPerPage)
        {
            IQueryable<Movie> movies = _db.Movies.Include("Genre");

            //Filter Results
            if(genreId != null)
            {
                movies = movies.Where(m => m.GenreId == genreId);
            }
            if (minYear != null)
            {
                movies = movies.Where(m => m.ReleasedYear >= minYear);
            }
            if(maxYear != null)
            {
                movies = movies.Where(m => m.ReleasedYear <= maxYear);
            }

            // Search by keyword
            if(!String.IsNullOrWhiteSpace(search))
            {
                movies = movies.Where(
                    m => m.MovieName.Contains(search) ||
                         m.MovieDescription.Contains(search) ||
                         m.ReleasedYear.ToString().Contains(search) ||
                         m.Genre.GenreName.Contains(search)
                    );
            }

            // Sort Results
            switch(sortBy)
            {
                default:
                case "name":
                    movies = movies.OrderBy(m => m.MovieName);
                    break;
                case "year":
                    movies = movies.OrderBy(m => m.ReleasedYear).ThenBy(m => m.MovieName);
                    break;
                case "genre":
                    movies = movies.OrderBy(m => m.Genre.GenreName).ThenBy(m => m.MovieName);
                    break;
				case "ticket sales":
                    movies = movies.OrderBy(m => m.TicketSales).ThenBy(m => m.MovieName);
                    break;
            }

            // Display Results
            var model = new MovieSearchResults
            {
                Search = search,
                GenreId = genreId,
                MinYear = minYear,
                MaxYear = maxYear,
                SortBy = sortBy,
                Genres = _db.Genres.OrderBy(g => g.GenreName).ToList(),
                Results = movies.ToPagedList(page ?? 1, ItemsPerPage ?? 5),
            };

            ViewBag.Search = search;
            ViewBag.GenreId = genreId;
            ViewBag.MinYear = minYear;
            ViewBag.MaxYear = maxYear;
            ViewBag.SortBy = sortBy;
            ViewBag.Genres = _db.Genres.OrderBy(g => g.GenreName).ToList();
            return View("Index", model);
        }
    }
}