namespace GhanaCustomsSystem.Domain.Converters
{
    public interface IConvertModelToViewModel<TTarget>
    {
        TTarget Convert();
    }
}
