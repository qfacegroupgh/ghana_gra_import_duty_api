

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.Models;
using GhanaCustomsSystem.Domain.Repositories;
using GhanaCustomsSystem.Shared.Extensions;

namespace GhanaCustomsSystem.MockData.Repositories
{
    public class VehicleTypeRepository :  IVehicleTypeRepository
    {
        public Task<VehicleType> GetAsync(int id)
        {
            return GetMockData()
                .First(a=>a.VehicleTypeId==id)
                .AsTask();
        }

        private static IEnumerable<VehicleType> GetMockData()
        {
            var vehicleTypes = new List<VehicleType>();
            for (var i = 0; i < 20; i++)
            {
                var vehicleType = new VehicleType
                {
                    VehicleTypeId = i,
                    Name = $"Vehicle type {i}"
                };
                vehicleType.SetDefaultValue();

                vehicleTypes.Add(vehicleType);
            }

            return vehicleTypes;
        }

        public Task<IEnumerable<VehicleType>> GetAllAsync()
        {
            var allAsync = GetMockData().AsTask();
            return allAsync;
        }

        public Task<List<VehicleType>> FindAsync(Expression<Func<VehicleType, bool>> predicate)
        {
            return GetMockData().ToList().AsTask();
        }

        public Task<VehicleType> FirstOrDefaultAsync(Expression<Func<VehicleType, bool>> predicate)
        {
            return GetMockData()
                .FirstOrDefault()
                .AsTask();
        }

        public VehicleType Add(VehicleType entity)
        {
            entity.VehicleTypeId = 1;
            return entity;
        }

        public Task<VehicleType> AddWithCommitAsync(VehicleType entity)
        {
            entity.VehicleTypeId = 1;
            return entity.AsTask();
        }

        public Task<VehicleType> AddOrUpdateCommitAsync(VehicleType entity)
        {
            entity.VehicleTypeId = 1;
            return entity.AsTask();
        }

        public void Remove(VehicleType entity)
        {
            Task.FromResult(true);
        }

        public Task RemoveWithCommitAsync(VehicleType entity)
        {
            return Task.FromResult(true);
        }

        public void InitData()
        {
            throw new NotImplementedException();
        }

        public Task<VehicleType> GetVehicleType(int vehicleTypeId)
        {
            throw new NotImplementedException();
        }

        public Task<List<VehicleType>> GetVehicleTypes()
        {
            throw new NotImplementedException();
        }
    }
}