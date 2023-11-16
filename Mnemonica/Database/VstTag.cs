using LinqToDB.Mapping;

namespace Mnemonica.Database
{
	[Table(Name = "vst_Tags")]
	public class VstTag
	{
		[Column, Identity]
		public int Id { get; set; }

		[Column, NotNull]
		public string TagName { get; set; }

		[Column]
		public string Description { get; set; }
	}
}