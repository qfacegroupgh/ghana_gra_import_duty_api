using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GhanaCustomsSystem.Shared.Extensions
{
    public static class ObjectHelper
    {
        public static Task<List<T>> AsListTask<T>(this T value)
            => new List<T> { value }.AsTask();
        public static Task<T> AsTask<T>(this T value)
            => Task.FromResult(value);
        public static void SetDefaultValue<T>(this T model, string userName = null, bool isCreateNew = true)
        {
            if (userName == null)
            {
                var properties = typeof(T).GetProperties();

                var createdDate = properties.FirstOrDefault(p => p.Name == "CreateDate");

                createdDate?.SetValue(model, DateTime.Now);

                var createdBy = properties.FirstOrDefault(p => p.Name == "CreateBy");
                createdBy?.SetValue(model, "sysadmin");


                var lastModifiedDate = properties.FirstOrDefault(p => p.Name == "LastModifiedDate");
                lastModifiedDate?.SetValue(model, DateTime.Now);

                var lastModifiedBy = properties.FirstOrDefault(p => p.Name == "LastModifiedBy");
                lastModifiedBy?.SetValue(model, "sysadmin");

            }
            else
            {
                var properties = typeof(T).GetProperties();


                if (isCreateNew)
                {
                    var createdDate = properties.FirstOrDefault(p => p.Name == "CreateDate");
                    createdDate?.SetValue(model, DateTime.Now);

                

                    var createdBy = properties.FirstOrDefault(p => p.Name == "CreateBy");
                    createdBy?.SetValue(model, userName);

                }



                var lastModifiedDate = properties.FirstOrDefault(p => p.Name == "LastModifiedDate");
                lastModifiedDate?.SetValue(model, DateTime.Now);

                var lastModifiedBy = properties.FirstOrDefault(p => p.Name == "LastModifiedBy");
                lastModifiedBy?.SetValue(model, userName);

            }




        }

    }
}
