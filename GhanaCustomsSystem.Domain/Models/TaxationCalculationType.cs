using System.Collections.Generic;
using AutoMapper;
using GhanaCustomsSystem.Domain.Converters;
using GhanaCustomsSystem.Domain.ViewModels;

namespace GhanaCustomsSystem.Domain.Models
{
    public class TaxationCalculationType : ModelBase, IConvertModelToViewModel<TaxationCalculationTypeViewModel>
    {
        public TaxationCalculationType()
        {
            Taxations = new HashSet<Taxation>();
        }
        public TaxationCalculationTypeViewModel Convert()
        {
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<TaxationCalculationType, TaxationCalculationTypeViewModel>();
            });
            var mapper = config.CreateMapper();

            var vehicleTypeViewModel = mapper.Map<TaxationCalculationTypeViewModel>(this);
            return vehicleTypeViewModel;
        }
        public string Name { get; set; }
        public string Description { get; set; }
        public int TaxationCalculationTypeId { get; set; }
        public int TaxationIndex { get; set; }
        public virtual ICollection<Taxation> Taxations { get; set; }

    }
}