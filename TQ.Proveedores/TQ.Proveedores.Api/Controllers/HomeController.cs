using Microsoft.AspNetCore.Mvc;

namespace TQ.Proveedores.Api.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return Ok();
        }

        public IActionResult Logout()
        {
            return SignOut("Cookies", "oidc");
        }
    }
}
