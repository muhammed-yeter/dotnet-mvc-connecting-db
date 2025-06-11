using Microsoft.AspNetCore.Mvc;
using blog_site.Models.Entities;

namespace books.controllers;

public class typeListViewComponent : ViewComponent
{
    private readonly blogsite_dbContext db = new blogsite_dbContext();

    public typeListViewComponent(blogsite_dbContext _db)
    {
        db = _db;
    }
    public async Task<IViewComponentResult> InvokeAsync()
    {
        var tur = (from x in db.Turlers
                   orderby x.Sira
                   select x).ToList();
        return View(tur);
    }
}