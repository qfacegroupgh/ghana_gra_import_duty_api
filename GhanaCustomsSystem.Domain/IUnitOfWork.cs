using System;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.Repositories;

namespace GhanaCustomsSystem.Domain
{
    public partial interface IUnitOfWork : IDisposable
    {
        int Commit();
        Task<int> CommitAsync();

        IVehicleTypeRepository VehicleTypes { get; }
    }
}