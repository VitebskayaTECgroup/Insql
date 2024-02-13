using LinqToDB.Mapping;

namespace MnemonicaBase.Api.Insql.Models
{
	[Table(Name = "Tag")]
	public class Tag
	{
		[Column, NotNull]
		public string TagName { get; set; }

		[Column, NotNull]
		public string Description { get; set; }
	}
}