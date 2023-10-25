using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class HospitalContext : DbContext
{
	public DbSet<HospitalContext> HospitalContexts { get; set; }
