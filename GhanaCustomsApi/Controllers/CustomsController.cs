using GhanaCustomsSystem.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.ViewModels;
using static Microsoft.AspNetCore.Http.StatusCodes;
namespace GhanaCustomsApi.Controllers
{
    
    [ApiController]
    [Route("[controller]")]
    public class CustomsController : ControllerBase
    {

        private readonly ILogger<CustomsController> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public CustomsController(ILogger<CustomsController> logger,
            IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        [Route("Gets")]
        public async Task<IActionResult> Gets()
        {
            var data =await _unitOfWork.VehicleTypes.GetVehicleTypes();
            return Ok(data);
        }


        [HttpGet]
        [Route("import-duty")]
        public async Task<IActionResult> GetById(int id,decimal assetValue)
        {
            var data =await _unitOfWork.VehicleTypes.GetVehicleType(id);



            decimal subTotal1 = 0;

            var vehicleTypeTaxations = data.VehicleTypeTaxations;

            var taxSubSection1 = vehicleTypeTaxations
                .Where(a => a.Taxation.TaxationCalculationTypeId == (int)TaxationCalculationTypeEnum.SubTotol_1).ToList();
            
            var taxSubSection2 = vehicleTypeTaxations
                .Where(a => a.Taxation.TaxationCalculationTypeId == (int)TaxationCalculationTypeEnum.SubTotol_2).ToList();

            var result = new InvoiceViewModel{AssetValue= assetValue,VehicleTypeId = data.VehicleTypeId,Name = data.Name,InvoiceFooters = new List<InvoiceFooter>()};
            result.InvoiceFooters.Add(new InvoiceFooter { Amount = assetValue, Rate = null, Descriptions = "SUB-TOTAL 1" });


            foreach(var tax in taxSubSection1)
            {
                var footer = new InvoiceFooter 
                {
                    Amount = (tax.Value / 100) * assetValue, 
                    Rate = tax.Value,
                    Descriptions = $"{tax.Taxation.Name} {tax.Value:N2}%"

                };
                    subTotal1 += footer.Amount;
                result.InvoiceFooters.Add(footer);
            }

            var runTotal = subTotal1 + assetValue;
            result.InvoiceFooters.Add(new InvoiceFooter { Amount = subTotal1, Rate = null, Descriptions = "SUB-TOTAL 2" });
            decimal subTotal3 = 0;
            foreach (var tax in taxSubSection2)
            {
                var footer = new InvoiceFooter { Amount = (tax.Value/100) * runTotal, Rate = tax.Value, Descriptions = $"{tax.Taxation.Name} {tax.Value:N2}%" };
                subTotal3 += footer.Amount;
                result.InvoiceFooters.Add(footer);
            }
            result.InvoiceFooters.Add(new InvoiceFooter { Amount = subTotal3, Rate = null, Descriptions = "SUB-TOTAL 3" });
            result.TotalDutyDue = result.InvoiceFooters.Where(a => a.Rate == null).Sum(a=>a.Amount) - assetValue;

            return Ok(result);
        }

       

    }
}
