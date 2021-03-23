using GhanaCustomsSystem.Domain.Models;

namespace GhanaCustomsSystem.Domain.ViewModels
{
    public class TaxationViewModel : ModelBase
    {
        public long TaxationId { get; set; }
        public string Name { get; set; }
        public decimal Value { get; set; }
        public decimal Amount { get; set; }
        public string FullName => $"{Name} {Value}%";

    }
}