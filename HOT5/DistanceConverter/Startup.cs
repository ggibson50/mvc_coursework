using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DistanceConverter.Startup))]
namespace DistanceConverter
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
