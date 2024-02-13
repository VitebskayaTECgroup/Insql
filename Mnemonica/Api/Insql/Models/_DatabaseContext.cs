using LinqToDB;
using LinqToDB.Data;
using System;

namespace MnemonicaBase.Api.Insql.Models
{
	public class DatabaseContext : DataConnection
	{
		static int Server = Environment.MachineName.ToUpper().Contains("INSQL1") ? 1 : 2;

		public DatabaseContext() : base("Runtime" + Server) { }

		public ITable<History> History => GetTable<History>();

		public ITable<Live> Live => GetTable<Live>();

		public ITable<Tag> Tags => GetTable<Tag>();
	}
}