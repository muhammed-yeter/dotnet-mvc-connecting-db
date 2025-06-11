using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace blog_site.Models.Entities
{
    public partial class blogsite_dbContext : DbContext
    {
        public blogsite_dbContext()
        {
        }

        public blogsite_dbContext(DbContextOptions<blogsite_dbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<Turler> Turlers { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;user=root;database=blogsite_db;default command timeout=120;sslmode=none", Microsoft.EntityFrameworkCore.ServerVersion.Parse("9.1.0-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_general_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("posts");

                entity.HasIndex(e => e.Turid, "turConnection");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Baslik)
                    .HasMaxLength(100)
                    .HasColumnName("baslik");

                entity.Property(e => e.Onsoz)
                    .HasMaxLength(1000)
                    .HasColumnName("onsoz");

                entity.Property(e => e.Turid).HasColumnName("turid");

                entity.Property(e => e.Yazi)
                    .HasColumnType("mediumtext")
                    .HasColumnName("yazi");

                entity.HasOne(d => d.Tur)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.Turid)
                    .HasConstraintName("turConnection");
            });

            modelBuilder.Entity<Turler>(entity =>
            {
                entity.ToTable("turler");

                entity.HasIndex(e => e.Ad, "ad");

                entity.HasIndex(e => e.Sira, "sira");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Ad)
                    .HasMaxLength(50)
                    .HasColumnName("ad")
                    .IsFixedLength();

                entity.Property(e => e.Sira).HasColumnName("sira");

                entity.Property(e => e.Stil)
                    .HasColumnType("tinytext")
                    .HasColumnName("stil");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
