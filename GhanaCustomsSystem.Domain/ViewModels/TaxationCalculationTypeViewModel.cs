using GhanaCustomsSystem.Domain.Models;

namespace GhanaCustomsSystem.Domain.ViewModels
{
    public class TaxationCalculationTypeViewModel : ModelBase
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int TaxationCalculationTypeId { get; set; }
        public int TaxationIndex { get; set; }
    }
}