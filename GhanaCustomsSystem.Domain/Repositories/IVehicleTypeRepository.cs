using System.Collections.Generic;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.Models;
using GhanaCustomsSystem.Shared;

namespace GhanaCustomsSystem.Domain.Repositories
{
    public interface IVehicleTypeRepository : IRepository<VehicleType>
    {
        void InitData();
        Task<VehicleType> GetVehicleType(int vehicleTypeId);
        Task<List<VehicleType>> GetVehicleTypes();

    }
}
