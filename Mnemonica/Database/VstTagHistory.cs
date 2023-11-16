using LinqToDB.Mapping;

namespace Mnemonica.Database
{
	[Table(Name = "vst_TagsHistory")]
	public class VstTagHistory : VstTagLive
	{
		[Column, NotNull]
		public string Server { get; set; }

		[Column, NotNull]
		public string Page { get; set; }

		[Column, NotNull]
		public string Operator { get; set; }
	}
}