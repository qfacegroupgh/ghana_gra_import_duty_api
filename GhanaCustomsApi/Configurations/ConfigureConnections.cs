using System;
using System.Runtime.InteropServices;
using GhanaCustomsSystem.DataEFCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace GhanaCustomsApi.Configurations
{
    public static class ConfigureConnections
    {
        public static IServiceCollection AddConnectionProvider(this IServiceCollection services,
            IConfiguration configuration)
        {
            var connection = string.Empty;



            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {



                connection = configuration.GetConnectionString("DefaultConnectionWindows") ??
                                 "Server=.;Database=QIMSchoolProStudent;persist security info=False;user id=sa;password=@P@$$w0rd@;";
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux) || RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                connection = configuration.GetConnectionString("DefaultConnectionDocker") ??
                                 "Server=localhost,1433;Database=Chinook;User=sa;Password=Pa55w0rd;Trusted_Connection=False;";


            }

            services.AddDbContext<GhanaCustomsSystemContext>(options =>
                options.UseSqlServer(connection,
                    b => b.MigrationsAssembly(typeof(GhanaCustomsSystemContext).Assembly.FullName)));


            return services;
        }
    }
}