namespace GhanaCustomsSystem.Domain.ViewModels
{
    public class InvoiceFooter
    {
        public decimal? Rate { get; set; }
        public decimal Amount { get; set; }
        public string Descriptions { get; set; }
        public int TaxationId { get; set; }
    }
}