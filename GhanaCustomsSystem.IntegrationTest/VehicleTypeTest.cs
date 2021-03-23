using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Xunit;

namespace GhanaCustomsSystem.IntegrationTest
{
    public class VehicleTypeTest: IntegrationTestBase
    {

        [Theory]
        [InlineData("GET")]
        public async Task should_get_list_of_vehicle_types(string method)
        {

            // Arrange
            var request = new HttpRequestMessage(new HttpMethod(method), "/customs/gets");

            // Act
            var response = await Client.SendAsync(request);

            // Assert
            response.EnsureSuccessStatusCode();
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }

        [Theory]
        [InlineData("GET", 1,1000)]
        public async Task should_get_import_duties(string method,int id,decimal assetValue)
        {
            // Arrange
            var request = new HttpRequestMessage(new HttpMethod(method), $"/customs/import-duty?id={id}&assetValue={assetValue}");

            // Act
            var response = await Client.SendAsync(request);

            // Assert
            response.EnsureSuccessStatusCode();
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }
    }
}
