using LinqToDB.Mapping;

namespace MnemonicaBase.Api.Local.Models
{
	[Table(Name = "History")]
	public class History : Live
	{
		[Identity]
		public long Id { get; set; }
	}
}