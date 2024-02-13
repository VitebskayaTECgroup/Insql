using LinqToDB.Mapping;
using System;

namespace MnemonicaBase.Api.Insql.Models
{
	[Table(Name = "v_Live")]
	public class Live
	{
		[Column, NotNull]
		public string TagName { get; set; }

		[Column, NotNull]
		public DateTime DateTime { get; set; }

		[Column, NotNull]
		public string vValue { get; set; }

		public string ToJS()
		{
			if (float.TryParse(vValue.Replace('.', ','), out var value))
			{
				return "try{" + TagName + "=" + value.ToString().Replace(',', '.') + "}catch(e){};";
			}
			else if (vValue == null)
			{
				return "try{" + TagName + "=null}catch(e){};";
			}
			else
			{
				return "try{" + TagName + "='" + vValue.Replace("'", "~") + "'}catch(e){};";
			}
		}
	}
}