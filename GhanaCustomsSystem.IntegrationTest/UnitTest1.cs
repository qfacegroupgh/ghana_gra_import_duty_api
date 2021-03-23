using System.Net;
using System.Threading.Tasks;
using Alba;
using GhanaCustomsApi;
using Xunit;

namespace GhanaCustomsSystem.IntegrationTest
{
    public class UnitTest1: IntegrationTestBase
    {
        
        [Fact]
        public async Task should_get_list_of_albums()
        {
            var response = await Client.GetAsync("/customs/gets");

            //response.StatusCode.Should().Be(HttpStatusCode.OK);
            //var response = await Client.GetAsync(ApiRoutes)
            //using (var system = SystemUnderTest.ForStartup<Startup>())
            //{
            //    // This runs an HTTP request and makes an assertion
            //    // about the expected content of the response
            //    await system.Scenario(_ =>
            //    {
            //        _.Get.Url("/api/Album");
            //        _.StatusCodeShouldBeOk();
            //    });
            //}
        }
    }
}
