using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MovieWebsite.Startup))]
namespace MovieWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
