using System;
using System.Collections.Generic;

namespace blog_site.Models.Entities
{
    public partial class Post
    {
        public uint Id { get; set; }
        public uint? Turid { get; set; }
        public string Baslik { get; set; } = null!;
        public string Onsoz { get; set; } = null!;
        public string Yazi { get; set; } = null!;

        public virtual Turler? Tur { get; set; }
    }
}
