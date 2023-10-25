using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class HospitalContext : DbContext
{
    public DbSet<Hospital> Hospitals { get; set; }
    public DbSet<Department> Departments { get; set; }
    public DbSet<Doctor> Doctors { get; set; }
    public DbSet<Patient> Patients { get; set; }
    public DbSet<PatientStay> PatientStays { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        // Määrake andmebaasiühenduse konfiguratsioon (nt SQL Server või SQLite).
        optionsBuilder.UseSqlServer("Server=(LocalDB)\\MSSQLLocalDB;Database=RobinAas;Trusted_Connection=True;");
    }
}
public class Hospital
{
    [Key]
    public int HospitalID { get; set; }
    public string HospitalName { get; set; }
    public string Address { get; set; }
    public string Phone { get; set; }
}

public class Department
{
    [Key]
    public int DepartmentID { get; set; }
    public string DepartmentName { get; set; }
    public int HospitalID { get; set; }
    public Hospital Hospital { get; set; }
}

public class Doctor
{
    [Key]
    public int DoctorID { get; set; }
    public string Name { get; set; }
    public string Specialization { get; set; }
    
    public int DepartmentID { get; set; }
    public Department Department { get; set; }
}

public class Patient
{
    [Key]
    public int PatientID { get; set; }
    public string Name { get; set; }
    public string PhoneNumber { get; set; }
    public string Address { get; set; }
    public DateTime DateOfBirth { get; set; }
}

public class PatientStay
{
    [Key]
    public int StayID { get; set; }
    public int PatientID { get; set; }
    public Patient Patient { get; set; }
    public DateTime StartDateTime { get; set; }
    public DateTime? EndDateTime { get; set; }
}
