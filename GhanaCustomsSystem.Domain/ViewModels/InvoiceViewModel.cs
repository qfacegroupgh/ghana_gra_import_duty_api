using System.Collections.Generic;

namespace GhanaCustomsSystem.Domain.ViewModels
{
    public class InvoiceViewModel
    {
        public long VehicleTypeId { get; set; }
        public string Name { get; set; }
        public List<InvoiceFooter> InvoiceFooters { get; set; }
        public decimal AssetValue { get; set; }
        public decimal TotalDutyDue { get; set; }
    }
}