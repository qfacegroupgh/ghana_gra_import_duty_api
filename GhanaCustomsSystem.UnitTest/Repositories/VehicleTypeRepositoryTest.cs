using System;
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
        public async Task VehicleTypeGetAllAsync()
        {
            // Act
            var albums = await _repo.GetAllAsync();

            // Assert
            Assert.Single(albums);
        }

        [DotMemoryUnit(FailIfRunWithoutSupport = false)]
        [Fact]
        public async Task VehicleTypeGetOneAsync()
        {
            // Arrange
            var id = 1;

            // Act
            var album = await _repo.GetAsync(id);

            // Assert
            Assert.Equal(id, album.VehicleTypeId);
        }

        [AssertTraffic(AllocatedSizeInBytes = 1000, Types = new[] { typeof(VehicleType) })]
        [Fact]
        public async Task DotMemoryUnitTest()
        {
            var repo = new VehicleTypeRepository();

            await repo.GetAllAsync();

            dotMemory.Check(memory =>
                Assert.Equal(1, memory
                    .GetObjects(where => where.Type.Is<VehicleType>()).ObjectsCount));

            GC.KeepAlive(repo); // prevent objects from GC if this is implied by test logic
        }
    }
}
