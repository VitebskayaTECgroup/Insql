using LinqToDB.Mapping;
using System;

namespace MnemonicaBase.Api.Local.Models
{
	[Table(Name = "Debug")]
	public class Debug
	{
		[Identity]
		public long Id { get; set; }

		[Column, NotNull]
		public DateTime Date { get; set; }

		[Column, NotNull]
		public string Who { get; set; }

		[Column, NotNull]
		public int Server { get; set; }

		[Column, NotNull]
		public string Text { get; set; }
	}
}