using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GhanaCustomsSystem.DataEFCore.Repositories.Base;
using GhanaCustomsSystem.Domain.Extensions;
using GhanaCustomsSystem.Domain.Models;
using GhanaCustomsSystem.Domain.Repositories;
using GhanaCustomsSystem.Shared.Extensions;
using Microsoft.EntityFrameworkCore;

namespace GhanaCustomsSystem.DataEFCore.Repositories
{
    public class VehicleTypeRepository : Repository<VehicleType>, IVehicleTypeRepository
    {
        public VehicleTypeRepository(GhanaCustomsSystemContext context) : base(context)
        {
        }

        private IQueryable<VehicleType> VehicleTypeQueryableBase()
        {
            return Context.VehicleTypes.AsNoTracking()
                .Include(a => a.VehicleTypeTaxations)
                .Include("VehicleTypeTaxations.Taxation");
        }

        public async Task<List<VehicleType>> GetVehicleTypes()
        {
            return await VehicleTypeQueryableBase().ToListAsync();

        }

        public async Task<VehicleType> GetVehicleType(int vehicleTypeId)
        {
            return await VehicleTypeQueryableBase()
                .FirstOrDefaultAsync(a=>a.VehicleTypeId== vehicleTypeId);

        }

        public void InitData()
        {
            var vehicles = Context.VehicleTypes.ToList();

            foreach (var vehicleType in vehicles)
            {
                var tax = Context.Taxations.ToList();


                foreach (var taxation in tax)
                {
                    var vehicleTypeTaxation = new VehicleTypeTaxation
                    {
                        VehicleTypeId = vehicleType.VehicleTypeId,
                        TaxationId =taxation.TaxationId,
                        Value = taxation.DefaultValue
                    };
                    vehicleTypeTaxation.SetDefaultValue();

                    Context.VehicleTypeTaxations.Add(vehicleTypeTaxation);
                }
              
            }

            Context.SaveChangesAsync();
        }
    }
}