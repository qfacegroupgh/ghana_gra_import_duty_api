using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.ViewModels;
using GhanaCustomsSystem.IntegrationTest.Fixtures;
using Newtonsoft.Json;
using Xunit;

namespace GhanaCustomsSystem.IntegrationTest
{
    public class VehicleTypeControllerTest: Fixtures.IntegrationTestBase
    {
        public VehicleTypeControllerTest(ApiWebApplicationFactory fixture)
            : base(fixture)
        {
        }

        [Theory]
        [InlineData("GET")]
        public async Task should_get_list_of_vehicle_types(string method)
        {

            // Arrange
            var request = new HttpRequestMessage(new HttpMethod(method), "/customs/gets");

            // Act
            HttpResponseMessage response = await Client.SendAsync(request);



            // Assert
            response.EnsureSuccessStatusCode();
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }

        [Theory]
        [InlineData("GET", 2,1000)]
        public async Task should_get_import_duties(string method,int id,decimal assetValue)
        {
            // Arrange
            var request = new HttpRequestMessage(new HttpMethod(method),
                $"/customs/import-duty?id={id}&assetValue={assetValue}");

            // Act
            var response = await Client.SendAsync(request);


           var responseData = JsonConvert.DeserializeObject<InvoiceViewModel>(await response.Content.ReadAsStringAsync());


            // Assert
            response.EnsureSuccessStatusCode();
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }
        
        [Theory]
        [InlineData("GET", 1000)]
        public async Task should_get_zero_import_duty_on_Ambulance_and_hearse(string method,decimal assetValue)
        {
            // Arrange
            var request = new HttpRequestMessage(new HttpMethod(method),
                $"/customs/import-duty?id=1&assetValue={assetValue}");

            // Act
            var response = await Client.SendAsync(request);


           var responseData = JsonConvert.DeserializeObject<InvoiceViewModel>(await response.Content.ReadAsStringAsync());

           var importDutyIsZero = responseData.InvoiceFooters.First(a => a.TaxationId == 1000).Amount == 0;

           // Assert
           response.EnsureSuccessStatusCode();
           Assert.Equal(HttpStatusCode.OK, response.StatusCode);

           Assert.True(importDutyIsZero);
        }
    }
}
