using System.Collections.Generic;
using AutoMapper;
using GhanaCustomsSystem.Domain.Converters;
using GhanaCustomsSystem.Domain.ViewModels;

namespace GhanaCustomsSystem.Domain.Models
{
    public class Taxation: ModelBase, IConvertModelToViewModel<TaxationViewModel>
    {
        public Taxation()
        {
            VehicleTypeTaxations = new HashSet<VehicleTypeTaxation>();
        }
        public TaxationViewModel Convert()
        {
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<Taxation, TaxationViewModel>();
            });
            var mapper = config.CreateMapper();

            var vehicleTypeViewModel = mapper.Map<TaxationViewModel>(this);
            return vehicleTypeViewModel;
        }

        public int TaxationId { get; set; }
        public int TaxationCalculationTypeId { get; set; }

        public string Name { get; set; }
        public decimal DefaultValue { get; set; }

        public virtual TaxationCalculationType TaxationCalculationType { get; set; }
        public virtual ICollection<VehicleTypeTaxation> VehicleTypeTaxations { get; set; }


    }
}