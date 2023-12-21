using System;

namespace Insql.Models
{
	public class ReportHeader
	{
		public string Name { get; set; }

		public string Hint { get; set; }

		public bool IsVertical { get; set; }

		public string[] Checks { get; set; }

		public float[] CheckValues { get; set; }

		public bool IsEmpty { get; set; }

		public string Edit { get; set; }

		public string SeparatedName(string separator)
		{
			string text = Name;
			if (Name.Contains("["))
			{
				text = text.Substring(0, Name.IndexOf("["))
					.Replace("\n", "<br>")
					.Trim();
			}

			int spaceAfterHalf = text.IndexOf(" ", Math.Max(text.Length / 2 - 1, 1));
			if (spaceAfterHalf > -1)
			{
				text = text.Substring(0, spaceAfterHalf) + "<br>" + text.Substring(spaceAfterHalf + 1);
			}

			return text
				.Replace("_", " ")
				.Replace("<br>", separator);
		}
	}
}