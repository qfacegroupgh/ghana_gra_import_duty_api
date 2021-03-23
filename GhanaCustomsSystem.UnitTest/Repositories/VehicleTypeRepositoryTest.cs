using System;
using System.Linq;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.Models;
using GhanaCustomsSystem.MockData.Repositories;
using JetBrains.dotMemoryUnit;
using Xunit;

namespace GhanaCustomsSystem.UnitTest.Repositories
{
    public class VehicleTypeRepositoryTest
    {
        private readonly VehicleTypeRepository _repo;

        public VehicleTypeRepositoryTest()
        {
            _repo = new VehicleTypeRepository();
        }
        [DotMemoryUnit(FailIfRunWithoutSupport = false)]
        [Fact]
        public async Task VehicleTypeGetOneAsync()
        {
            // Arrange
            var id = 1;

            // Act
            var vehicleType = await _repo.GetAsync(id);

            // Assert
            Assert.Equal(id, vehicleType.VehicleTypeId);
        }



        [DotMemoryUnit(FailIfRunWithoutSupport = false)]
        [Fact]
        public async Task VehicleTypeGetAllAsync()
        {
            // Arrange

            // Act
            var vehicleTypes = await _repo.GetAllAsync();

            // Assert
            Assert.True(vehicleTypes.Any());
        }

    


       

    }
}
