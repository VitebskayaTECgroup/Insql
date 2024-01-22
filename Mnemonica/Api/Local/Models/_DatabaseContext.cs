using LinqToDB;
using LinqToDB.Data;
using System;

namespace MnemonicaBase.Api.Local.Models
{
	public class DatabaseContext : DataConnection
	{
		static int Server = Environment.MachineName.ToUpper().Contains("INSQL1") ? 1 : 2;

		public DatabaseContext() : base("Mnemonica" + Server) { }

		public ITable<Debug> Debug => GetTable<Debug>();

		public ITable<History> History => GetTable<History>();

		public ITable<Live> Live => GetTable<Live>();

		public ITable<Tag> Tags => GetTable<Tag>();

		public void CreateTag(string tagName, string description, string who)
		{
			this.ExecuteProc("CreateTag", 
				new DataParameter("TagName", tagName),
				new DataParameter("Description", description),
				new DataParameter("Who", who),
				new DataParameter("Replication", 1)
			);
		}

		public void DeleteTag(string tagName, string who)
		{
			this.ExecuteProc("DeleteTag",
				new DataParameter("TagName", tagName),
				new DataParameter("Who", who),
				new DataParameter("Replication", 1)
			);
		}

		public void UpdateTag(string tagName, string description, string who)
		{
			this.ExecuteProc("UpdateTag",
				new DataParameter("TagName", tagName),
				new DataParameter("Description", description),
				new DataParameter("Who", who),
				new DataParameter("Replication", 1)
			);
		}

		public void WriteTag(string tagName, string value, string who)
		{
			this.ExecuteProc("WriteTag",
				new DataParameter("TagName", tagName),
				new DataParameter("Value", value),
				new DataParameter("Who", who),
				new DataParameter("Replication", 1)
			);
		}
	}
}