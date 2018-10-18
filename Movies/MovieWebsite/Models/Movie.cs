using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MovieWebsite.Models
{
    [Table("Movies")]
    public class Movie
    {
        [Key, Display(Name = "#")]
        public int MovieId { get; set; }

        [Display(Name = "Name"), Required(ErrorMessage = "Movie Name Required")]
        public string MovieName { get; set; }

        [Display(Name = "Description")]
        [Required(ErrorMessage = "Description Required")]
        [MinLength(20, ErrorMessage = "You must have at least 20 Characters")]
        [StringLength(300, ErrorMessage = "You cannot have more than 300 characters.")]
        public string MovieDescription { get; set; }

        [Display(Name = "Year"), Required(ErrorMessage = "Release Year Required")]
        public int ReleasedYear { get; set; }

        [Display(Name = "Ticket Sales"), Required(ErrorMessage = "Ticket Sales Required")]
        [DisplayFormat(DataFormatString = "{0:0,,,.0} B")]
        public decimal TicketSales { get; set; }

        [Display(Name = "Genre"), Required(ErrorMessage = "At least one genre required")]
        public byte GenreId { get; set; }
        public virtual Genre Genre { get; set; }
        
        public string Image { get; set; }
    }
}