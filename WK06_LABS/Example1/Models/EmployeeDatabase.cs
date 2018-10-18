using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Example1.Models
{
    public class EmployeeDatabase : DbContext
    {
        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<DepartmentEmployee> DepartmentEmployees { get; set; }
    }
}