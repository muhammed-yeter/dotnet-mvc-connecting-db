using System;
using System.Collections.Generic;

namespace blog_site.Models.Entities
{
    public partial class Turler
    {
        public Turler()
        {
            Posts = new HashSet<Post>();
        }

        public uint Id { get; set; }
        public string Ad { get; set; } = null!;
        public uint Sira { get; set; }
        public string? Stil { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
