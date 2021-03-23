using System;
using GhanaCustomsSystem.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;


namespace GhanaCustomsSystem.DataEFCore
{

    public partial class GhanaCustomsSystemContext : DbContext
    {
        public GhanaCustomsSystemContext()
        {
        }

        public GhanaCustomsSystemContext(DbContextOptions<GhanaCustomsSystemContext> options)
            : base(options)
        {
           
        }

        public virtual DbSet<Taxation> Taxations { get; set; }
        public virtual DbSet<TaxationCalculationType> TaxationCalculationTypes { get; set; }
        public virtual DbSet<VehicleType> VehicleTypes { get; set; }
        public virtual DbSet<VehicleTypeTaxation> VehicleTypeTaxations { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.;Database=GRA;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Taxation>(entity =>
            {
                entity.ToTable("Taxation");

                entity.Property(e => e.CreateBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                //entity.Property(e => e.DefaultValue).HasColumnType("money");

                entity.Property(e => e.LastModifiedBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.LastModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.HasOne(d => d.TaxationCalculationType)
                    .WithMany(p => p.Taxations)
                    .HasForeignKey(d => d.TaxationCalculationTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Taxation_TaxationCalculationType");
            });

            modelBuilder.Entity<TaxationCalculationType>(entity =>
            {
                entity.ToTable("TaxationCalculationType");

                entity.Property(e => e.TaxationCalculationTypeId).ValueGeneratedNever();

                entity.Property(e => e.CreateBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.LastModifiedBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.LastModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<VehicleType>(entity =>
            {
                entity.ToTable("VehicleType");

                entity.Property(e => e.CreateBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.LastModifiedBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.LastModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<VehicleTypeTaxation>(entity =>
            {
                entity.HasKey(e => new { e.TaxationId, e.VehicleTypeId });

                entity.ToTable("VehicleTypeTaxation");

                entity.Property(e => e.CreateBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.LastModifiedBy)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('sysadmin')");

                entity.Property(e => e.LastModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Value).HasColumnType("money");

                entity.HasOne(d => d.Taxation)
                    .WithMany(p => p.VehicleTypeTaxations)
                    .HasForeignKey(d => d.TaxationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VehicleTypeTaxation_Taxation");

                entity.HasOne(d => d.VehicleType)
                    .WithMany(p => p.VehicleTypeTaxations)
                    .HasForeignKey(d => d.VehicleTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VehicleTypeTaxation_VehicleType");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }


}
