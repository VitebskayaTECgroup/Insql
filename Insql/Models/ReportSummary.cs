namespace Insql.Models
{
	public class ReportSummary
	{
		public float Max { get; set; }

		public float Min { get; set; }

		public float Sum { get; set; }

		public float Avg(int count) => Sum / count;
	}
}