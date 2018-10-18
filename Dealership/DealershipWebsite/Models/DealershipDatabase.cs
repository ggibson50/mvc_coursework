using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace DealershipWebsite.Models
{
    public class DealershipDatabase : DbContext
    {
        public DbSet<Vehicle> Vehicles { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
    }
}