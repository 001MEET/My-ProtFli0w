using Microsoft.AspNetCore.Mvc;

namespace MeetPortfolio.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
