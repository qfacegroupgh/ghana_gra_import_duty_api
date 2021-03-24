using Microsoft.Extensions.Configuration;
using System.Net.Http;
using Xunit;

namespace GhanaCustomsSystem.IntegrationTest.Fixtures
{
    public abstract class IntegrationTestBase : IClassFixture<ApiWebApplicationFactory>
    {
        

        protected readonly ApiWebApplicationFactory Factory;
        protected readonly HttpClient Client;
        protected readonly IConfiguration Configuration;

        protected IntegrationTestBase(ApiWebApplicationFactory fixture)
        {
            Factory = fixture;
            Client = Factory.CreateClient();
            Configuration = new ConfigurationBuilder()
                .AddJsonFile("integrationsettings.json")
                .Build();

            // if needed, reset the DB
            //_checkpoint.Reset(_configuration.GetConnectionString("SQL")).Wait();
        }
    }
}