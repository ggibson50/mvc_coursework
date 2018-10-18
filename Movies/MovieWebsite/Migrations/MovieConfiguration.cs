namespace MovieWebsite.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class MovieConfiguration : DbMigrationsConfiguration<MovieWebsite.Models.MovieDatabase>
    {
        public MovieConfiguration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "MovieWebsite.Models.MovieDatabase";
        }

        protected override void Seed(MovieWebsite.Models.MovieDatabase context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
        }
    }
}
