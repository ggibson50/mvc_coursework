using MovieWebsite.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MovieWebsite.ViewModels
{
    public class MovieSearchResults
    {
        [Display(Name = "Search")]
        public string Search { get; set; }
        [Display(Name = "Genre")]
        public int? GenreId { get; set; }
        [Display(Name = "Release Year")]
        public int? MinYear { get; set; }
        [Display(Name = "Release Year")]
        public int? MaxYear { get; set; }
        [Display(Name = "Sort By")]
        public string SortBy { get; set; }

        public IEnumerable<Genre> Genres { get; set; }
        public IPagedList<Movie> Results { get; set; }
    }
}