using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Labs.Startup))]
namespace Labs
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
