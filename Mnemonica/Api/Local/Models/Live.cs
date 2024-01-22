using LinqToDB.Mapping;
using System;

namespace MnemonicaBase.Api.Local.Models
{
	[Table(Name = "Live")]
	public class Live
	{
		[Column, NotNull]
		public string TagName { get; set; }

		[Column, NotNull]
		public DateTime Date { get; set; }

		[Column, NotNull]
		public string Value { get; set; }

		[Column, NotNull]
		public string Who { get; set; }

		[Column, NotNull]
		public int Server { get; set; }

		public string ToJS()
		{
			if (float.TryParse(Value, out var value))
			{
				return "try{" + TagName + "=" + value.ToString().Replace(",", ".") + "}catch(e){};";
			}
			else if (Value == null)
			{
				return "try{" + TagName + "=null}catch(e){};";
			}
			else
			{
				return "try{" + TagName + "='" + Value.Replace("'", "~") + "'}catch(e){};";
			}
		}
	}
}