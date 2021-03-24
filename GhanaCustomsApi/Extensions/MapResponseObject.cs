using AutoWrapper;

namespace GhanaCustomsApi.Extensions
{
    public class MapResponseObject
    {
        [AutoWrapperPropertyMap(Prop.Result)]
        public object Data { get; set; }
    }
}