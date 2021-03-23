using System;

namespace GhanaCustomsSystem.Domain.Models
{
    public class ModelBase
    {
        public DateTime CreateDate { get; set; }
        public string CreateBy { get; set; }
        public DateTime LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
    }
}