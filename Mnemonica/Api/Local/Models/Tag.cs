using LinqToDB.Mapping;
using System;

namespace MnemonicaBase.Api.Local.Models
{
	[Table(Name = "Tags")]
	public class Tag
	{
		[Column, NotNull]
		public string TagName { get; set; }

		[Column, Nullable]
		public string Description { get; set; }
	}
}