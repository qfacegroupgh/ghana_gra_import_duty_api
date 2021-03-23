using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GhanaCustomsSystem.Shared
{
    public interface IRepository<TEntity> where TEntity : class
    {
        Task<TEntity> GetAsync(int id);
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate);
        Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> predicate);
        TEntity Add(TEntity entity);
        Task<TEntity> AddWithCommitAsync(TEntity entity);
        Task<TEntity> AddOrUpdateCommitAsync(TEntity entity);
        void Remove(TEntity entity);
        Task RemoveWithCommitAsync(TEntity entity);
    }

}
