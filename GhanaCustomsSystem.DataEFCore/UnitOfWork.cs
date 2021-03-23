using System;
using System.Threading.Tasks;
using GhanaCustomsSystem.DataEFCore.Repositories;
using GhanaCustomsSystem.Domain;
using GhanaCustomsSystem.Domain.Repositories;

namespace GhanaCustomsSystem.DataEFCore
{
    public partial class UnitOfWork : IUnitOfWork
    {
        private readonly GhanaCustomsSystemContext _context;


        public UnitOfWork(GhanaCustomsSystemContext context)
        {
            _context = context;
            VehicleTypes = new VehicleTypeRepository(context);
            

        }

        public DateTime GetServerDateTime()
        {
            return DateTime.Now;
        }
        public int Commit()
        {
            return _context.SaveChanges();
        }

        public async Task<int> CommitAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public IVehicleTypeRepository VehicleTypes { get; }


        public void Dispose()
        {
            _context?.Dispose();
        }






    }
}