using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using blog_site.Models;
using blog_site.Models.Entities;
using blog_site.Models.ViewModels;
namespace blog_site.Controllers;

public class HomeController : Controller
{
    private readonly blogsite_dbContext db = new blogsite_dbContext();

    public HomeController(blogsite_dbContext _db)
    {
        db = _db;
    }

    public IActionResult Index()
    {
        var postlar = (from x in db.Posts
                       join y in db.Turlers on x.Turid equals y.Id
                       orderby x.Id descending
                       select new PostVM
                       {
                           id = x.Id,
                           baslik = x.Baslik,
                           onsoz = x.Onsoz,
                           turId = x.Turid,
                           turAdi = y.Ad
                       }).Take(10).ToList();
        return View(postlar);
    }


    [Route("/posts/")]
    [Route("/posts/{type}")]
    public IActionResult Posts(int? type)
    {
        if (type != null)
        {
            var postlar = (from x in db.Posts
                           join y in db.Turlers on x.Turid equals y.Id
                           where x.Turid == type
                           select new PostVM
                           {
                               id = x.Id,
                               baslik = x.Baslik,
                               onsoz = x.Onsoz,
                               turId = x.Turid,
                               turAdi = y.Ad
                           }).ToList();
            return View(postlar);
        }
        else
        {
            var postlar = (from x in db.Posts
                           join y in db.Turlers on x.Turid equals y.Id
                           select new PostVM
                           {
                               id = x.Id,
                               baslik = x.Baslik,
                               onsoz = x.Onsoz,
                               turId = x.Turid,
                               turAdi = y.Ad
                           }).ToList();
            return View(postlar);
        }
    }


    [Route("/post/{postID}")]
    public IActionResult PostDetay(int postID)
    {
        var postlar = (from x in db.Posts
                       join y in db.Turlers on x.Turid equals y.Id
                       where x.Id == postID
                       select new DetayVM
                       {
                           id = x.Id,
                           baslik = x.Baslik,
                           onsoz = x.Onsoz,
                           turId = x.Turid,
                           yazi = x.Yazi,
                           turAdi = y.Ad
                       }).FirstOrDefault();
        return View(postlar);
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
