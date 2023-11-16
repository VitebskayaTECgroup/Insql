using LinqToDB.Mapping;
using System;

namespace Mnemonica.Database
{
	[Table(Name = "vst_TagsLive")]
	public class VstTagLive
	{
		[Column, NotNull]
		public string TagName { get; set; }

		[Column, NotNull]
		public DateTime Date { get; set; }

		[Column]
		public string Value { get; set; }
	}
}