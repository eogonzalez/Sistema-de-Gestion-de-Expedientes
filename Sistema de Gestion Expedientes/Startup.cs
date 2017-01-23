using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Sistema_de_Gestion_Expedientes.Startup))]
namespace Sistema_de_Gestion_Expedientes
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
