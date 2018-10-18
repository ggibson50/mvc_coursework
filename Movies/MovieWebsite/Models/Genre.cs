using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MovieWebsite.Models
{
    [Table("Genres")]
    public class Genre
    {
        [Key, Display(Name = "#")]
        public byte GenreId { get; set; }
        [Display(Name = "Name")]
        public string GenreName { get; set; }
    }
}