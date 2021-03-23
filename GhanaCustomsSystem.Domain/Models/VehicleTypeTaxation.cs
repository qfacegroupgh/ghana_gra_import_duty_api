using System;
using AutoMapper;
using GhanaCustomsSystem.Domain.Converters;
using GhanaCustomsSystem.Domain.ViewModels;

#nullable disable

namespace GhanaCustomsSystem.Domain.Models
{
    public class VehicleTypeTaxation : ModelBase, IConvertModelToViewModel<VehicleTypeTaxationViewModel>
    {
        public int TaxationId { get; set; }
        public int VehicleTypeId { get; set; }
        public decimal Value { get; set; }

        public virtual Taxation Taxation { get; set; }
        public virtual VehicleType VehicleType { get; set; }
        public VehicleTypeTaxationViewModel Convert()
        {
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<VehicleTypeTaxation, VehicleTypeTaxationViewModel>();
            });
            var mapper = config.CreateMapper();

            var vm = mapper.Map<VehicleTypeTaxationViewModel>(this);
            return vm;
        }
    }
}
