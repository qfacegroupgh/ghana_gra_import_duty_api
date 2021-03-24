using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GhanaCustomsSystem.Domain.ViewModels
{
    public class ResponseWrapper<T>
    {
        public string Message { get; set; }
        public T Data { get; set; }
    }
}
