using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieWebsite.Models;
using PagedList;
using MovieWebsite.ViewModels;

namespace MovieWebsite.Controllers
{
    public class ScaffoldMovieController : Controller
    {
        private MovieDatabase db = new MovieDatabase();

        // GET: ScaffoldMovie
        public ActionResult Index(
            string search,
            int? genreId,
            int? minYear,
            int? maxYear,
            string sortBy,
            int? page,
            int? ItemsPerPage)
        {
            IQueryable<Movie> movies = db.Movies.Include("Genre");

            //Filter Results
            if (genreId != null)
            {
                movies = movies.Where(m => m.GenreId == genreId);
            }
            if (minYear != null)
            {
                movies = movies.Where(m => m.ReleasedYear >= minYear);
            }
            if (maxYear != null)
            {
                movies = movies.Where(m => m.ReleasedYear <= maxYear);
            }

            // Search by keyword
            if (!String.IsNullOrWhiteSpace(search))
            {
                movies = movies.Where(
                    m => m.MovieName.Contains(search) ||
                         m.MovieDescription.Contains(search) ||
                         m.ReleasedYear.ToString().Contains(search) ||
                         m.Genre.GenreName.Contains(search)
                    );
            }

            // Sort Results
            switch (sortBy)
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
                Genres = db.Genres.OrderBy(g => g.GenreName).ToList(),
                Results = movies.ToPagedList(page ?? 1, ItemsPerPage ?? 5),
            };

            ViewBag.Search = search;
            ViewBag.GenreId = genreId;
            ViewBag.MinYear = minYear;
            ViewBag.MaxYear = maxYear;
            ViewBag.SortBy = sortBy;
            ViewBag.Genres = db.Genres.OrderBy(g => g.GenreName).ToList();
            return View("Index", model);
        }

        // GET: ScaffoldMovie/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // GET: ScaffoldMovie/Create
        public ActionResult Create()
        {
            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "GenreName");
            return View();
        }

        // POST: ScaffoldMovie/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MovieId,MovieName,MovieDescription,ReleasedYear,TicketSales,GenreId")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                db.Movies.Add(movie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "GenreName", movie.GenreId);
            return View(movie);
        }

        // GET: ScaffoldMovie/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "GenreName", movie.GenreId);
            return View(movie);
        }

        // POST: ScaffoldMovie/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MovieId,MovieName,MovieDescription,ReleasedYear,TicketSales,GenreId")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "GenreName", movie.GenreId);
            return View(movie);
        }

        // GET: ScaffoldMovie/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: ScaffoldMovie/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Movie movie = db.Movies.Find(id);
            db.Movies.Remove(movie);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
                db = null;
            }
            base.Dispose(disposing);
        }
    }
}
