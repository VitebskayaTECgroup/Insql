using LinqToDB.Mapping;

namespace MnemonicaBase.Api.Insql.Models
{
	[Table(Name = "v_History")]
	public class History : Live
	{
		public int wwResolution { get; set; }

		public string wwRetrievalMode { get; set; } = "DELTA";

		public string wwVersion { get; set; } = "LATEST";
	}
}