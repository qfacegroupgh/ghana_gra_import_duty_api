using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using GhanaCustomsSystem.Domain.Extensions;
using GhanaCustomsSystem.Shared;
using Microsoft.EntityFrameworkCore;

namespace GhanaCustomsSystem.DataEFCore.Repositories.Base
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
	{
		protected readonly GhanaCustomsSystemContext Context;

		public Repository(GhanaCustomsSystemContext context)
		{	

			Context = context;
		}


		public async Task<TEntity> GetAsync(int id)
		{
			return await Context.Set<TEntity>().FindAsync(id);
		}

		public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await Context.Set<TEntity>().ToListAsync();
        }

		public Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate)
		{
            return Context.Set<TEntity>().Where(predicate).ToListAsync();
		}

		public async Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> predicate)
		{
			return await Context.Set<TEntity>().FirstOrDefaultAsync(predicate);
		}

		public TEntity Add(TEntity entity)
		{

			Context.Set<TEntity>().Add(entity);
			return entity;
		}

		public async Task<TEntity> AddWithCommitAsync(TEntity entity)
		{

			Context.Set<TEntity>().AddOrUpdate(entity);
            await Context.SaveChangesAsync();
			return entity;
		}
		public void Remove(TEntity entity)
		{
			Context.Set<TEntity>().Remove(entity);
		}
		public async Task RemoveWithCommitAsync(TEntity entity)
		{
			Context.Set<TEntity>().Remove(entity);
            await Context.SaveChangesAsync();
		}

		
		public async Task<TEntity> AddOrUpdateCommitAsync(TEntity entity)
		{
			
				Context.Set<TEntity>().AddOrUpdate(entity);
				await Context.SaveChangesAsync();
				return entity;
        }
	}

}
