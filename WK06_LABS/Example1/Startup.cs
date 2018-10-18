using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Example1.Startup))]
namespace Example1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
