namespace MovieWebsite.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdatingDB : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Movies", "MovieName", c => c.String(nullable: false));
            AlterColumn("dbo.Movies", "MovieDescription", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Movies", "MovieDescription", c => c.String());
            AlterColumn("dbo.Movies", "MovieName", c => c.String());
        }
    }
}
