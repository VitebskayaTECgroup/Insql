using LinqToDB;
using LinqToDB.Data;
using System.Collections.Generic;
using System.Linq;
using System;

namespace Mnemonica.Database
{
	public class DatabaseContext : DataConnection
	{
		public DatabaseContext() : base("Runtime") { }


		// Таблицы для мнемосхем

		public ITable<VstTag> VstTags => GetTable<VstTag>();

		public ITable<VstTagLive> VstTagsLive => GetTable<VstTagLive>();

		public ITable<VstTagHistory> VstTagsHistory => GetTable<VstTagHistory>();


		// API для работы с тегами мнемосхем

		public bool VstCreateTag(string scheme = "", string tag = null, string desc = null, string value = null, string page = "unknown", string user = "unknown")
		{
			if (string.IsNullOrEmpty(tag))
			{
				var id = VstTags
					.Where(x => x.TagName.StartsWith(scheme))
					.Select(x => x.Id)
					.DefaultIfEmpty(0)
					.Max();

				tag = scheme + "_" + (++id);
			}

			if (VstTags.Any(x => x.TagName == tag))
			{
				throw new Exception("Такой тег уже определён в данной базе");
			}

			int i = VstTags
				.Value(x => x.TagName, tag)
				.Value(x => x.Description, desc)
				.Insert();

			i += VstUpdateTag(tag, DateTime.Now, value, page, user) ? 1 : 0;

			return i > 1;
		}

		public List<VstTagLive> VstReadTagLive(string[] tagnames)
		{
			var values = VstTagsLive
				.Where(x => tagnames.Contains(x.TagName))
				.ToList();

			return values;
		}

		public Dictionary<string, List<VstTagHistory>> VstReadTagHistory(string[] tagnames, DateTime date1, DateTime date2)
		{
			var values = VstTagsHistory
				.Where(x => tagnames.Contains(x.TagName))
				.Where(x => x.Date >= date1 && x.Date <= date2)
				.ToList();

			var history = values
				.GroupBy(x => x.TagName)
				.Select(g => new
				{
					g.Key,
					Value = g.OrderBy(x => x.Date).ToList(),
				})
				.ToDictionary(x => x.Key, x => x.Value);

			return history;
		}

		public bool VstUpdateTag(string tag, DateTime date, string value = null, string page = "unknown", string user = "unknown")
		{
			if (VstTagsLive.Any(x => x.TagName == tag))
			{
				VstTagsLive
					.Where(x => x.TagName == tag)
					.Set(x => x.Value, value)
					.Set(x => x.Date, date)
					.Update();
			}
			else
			{
				VstTagsLive
					.Value(x => x.TagName, tag)
					.Value(x => x.Value, value)
					.Value(x => x.Date, date)
					.Insert();
			}

			var place = System.Net.Dns.GetHostName();

			int i = VstTagsHistory
				.Value(x => x.TagName, tag)
				.Value(x => x.Value, value)
				.Value(x => x.Date, DateTime.Now)
				.Value(x => x.Server, place)
				.Value(x => x.Page, page)
				.Value(x => x.Operator, user)
				.Insert();

			return i > 0;
		}

		public bool VstDeleteTag(string tag)
		{
			int i = VstTags
				.Where(x => x.TagName == tag)
				.Delete();

			i += VstTagsLive
				.Where(x => x.TagName == tag)
				.Delete();

			i += VstTagsHistory
				.Where(x => x.TagName == tag)
				.Delete();

			return i >= 3;
		}
	}
}