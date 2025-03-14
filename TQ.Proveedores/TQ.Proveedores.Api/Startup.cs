using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NSwag;
using NSwag.Generation.Processors.Security;
using System.Linq;
using TQ.Infraestructure.EFrameworkCore.SqlServer;
using TQ.Proveedores.Api.Infraestructure;
using TQ.Util.DependencyInjection;

namespace TQ.Proveedores.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            Env = env;
        }

        private IConfiguration Configuration { get; }
        private IWebHostEnvironment Env { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            LoadAssembliesUtil.LoadAllAssemblies(names: new string[] { "TQ" });
            services.AddHttpContextAccessor();
            services.AddResponseCompression();
            services.AddDbContext<Entities>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("Entities"), b => b.MigrationsAssembly(typeof(TQ.Proveedores.Infraestructure.DependencyRegister).Assembly.GetName().Name));
            });

            services.AddHealthChecks()
                .AddDbContextCheck<Entities>();

            services.AddAuthentication(options =>
            {
                options.DefaultScheme = "Cookies";
                options.DefaultChallengeScheme = "oidc";
            })
            .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options => { })
            .AddCookie("Cookies")
            .AddOpenIdConnect("oidc", options => { });
            services.AddAuthorization();

            if (Env.IsDevelopment())
            {
                services.AddControllersWithViews(options =>
                {
                    options.Filters.Add(new AuthorizeFilter());
                }).AddRazorRuntimeCompilation();

                services.AddDatabaseDeveloperPageExceptionFilter();
            }
            else
            {
                services.AddControllersWithViews(options =>
                {
                    options.Filters.Add(new AuthorizeFilter());
                });
            }

            services.AddOpenApiDocument(configure =>
            {
                configure.Title = "TQ.Proveedores API";
                configure.Version = "v1";
                configure.Description = "<h3>Esta API requiere autenticación</h3><p>Para hacer uso de cualquier servicio primero autentiquese, luego haga uso del header Authorization: Bearer {token}</p><p><b>Si desea hacer las pruebas desde swagger, obtenga el token y uselo en el botón Authorize de swagger anteponiendo la palabra Bearer</b></p>";
                configure.AddSecurity("JWT", Enumerable.Empty<string>(), new OpenApiSecurityScheme
                {
                    Type = OpenApiSecuritySchemeType.ApiKey,
                    Name = "Authorization",
                    In = OpenApiSecurityApiKeyLocation.Header,
                    Description = "Type into the textbox: Bearer {your JWT token}."
                });

                configure.OperationProcessors.Add(new AspNetCoreOperationSecurityScopeProcessor("JWT"));
            });



            if (!Env.IsEnvironment("NSwag"))//AddCustomServices Method is incompatible with NSwag generation
                services.AddCustomServices(Configuration);

            services.UseSelfCertificate(Configuration);

            services.AddLogging();

            services.AddQuartzConfiguration(Configuration, Env);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            
            app.UseForwardedHeaders();
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                //Log all errors in the application
                app.UseHsts();
            }
            app.UseResponseCompression();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCors("default");
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseHealthChecks("/health");

            app.UseEndpoints(endpoints =>
            {

                endpoints.MapControllerRoute(
                name: "areaRoute",
                pattern: "{area:exists}/{controller}/{action}",
                defaults: new { action = "Index" });

                endpoints.MapControllerRoute(
                name: "default",
                pattern: "{controller}/{action}/{id?}");
            });

            //app.UseSwaggerAuthorized();
            app.UseOpenApi();
            app.UseSwaggerUi3(settings =>
            {
                settings.DocumentPath = "/api/specification.json";
            });

            app.UseSeedData(options =>
            {
                options.RunSqlFiles = true;
            });
        }
    }
}