namespace blog_site.Models.ViewModels;

public class PostVM
{
    public uint id { get; set; }
    public uint? turId { get; set; }
    public string baslik { get; set; }
    public string onsoz { get; set; }
    public string turAdi { get; set; }
}
