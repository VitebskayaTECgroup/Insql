namespace Insql.Models
{
	public class ReportCell
	{
		public bool IsEmpty { get; set; }

		public bool IsFloat { get; set; }

		public bool IsBoolean { get; set; }

		public string Text { get; set; }

		public float Value { get; set; }

		public bool Bool { get; set; }

		public string Check { get; set; }
	}
}