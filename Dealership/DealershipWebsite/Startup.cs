using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DealershipWebsite.Startup))]
namespace DealershipWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
