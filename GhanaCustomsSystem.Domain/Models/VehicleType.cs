using System.Collections.Generic;
using AutoMapper;
using GhanaCustomsSystem.Domain.Converters;
using GhanaCustomsSystem.Domain.ViewModels;

namespace GhanaCustomsSystem.Domain.Models
{
    
    public class VehicleType: ModelBase, IConvertModelToViewModel<VehicleTypeViewModel>
    {
        public VehicleType()
        {
            VehicleTypeTaxations = new HashSet<VehicleTypeTaxation>();
        }
        public VehicleTypeViewModel Convert()
        {
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<VehicleType, VehicleTypeViewModel>();
            });
            var mapper = config.CreateMapper();

            var vehicleTypeViewModel = mapper.Map<VehicleTypeViewModel>(this);
            return vehicleTypeViewModel;
        }

        public int VehicleTypeId { get; set; }
        public string Name { get; set; }
        public virtual ICollection<VehicleTypeTaxation> VehicleTypeTaxations { get; set; }
    }
}
