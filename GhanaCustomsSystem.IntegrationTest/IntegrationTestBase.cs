using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using GhanaCustomsApi;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;

namespace GhanaCustomsSystem.IntegrationTest
{
    public class IntegrationTestBase
    {
        protected readonly HttpClient Client;

        public IntegrationTestBase()
        {
            var server = new TestServer(new WebHostBuilder()
                .UseEnvironment("Development")
                .UseStartup<Startup>());
            Client = server.CreateClient();
        }

        protected async Task Authenticate()
        {
            Client.DefaultRequestHeaders.Authorization =new  AuthenticationHeaderValue("bearer",await  GetJwtAsync());
        }

        private async Task<string?> GetJwtAsync()
        {
            throw new System.NotImplementedException();
        }
    }
}