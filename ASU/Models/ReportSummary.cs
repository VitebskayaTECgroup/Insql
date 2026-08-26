namespace Insql.Models
{
    //old = float
	//public class ReportSummary
	//{
	//	public float Max { get; set; }

	//	public float Min { get; set; }

	//	public float Sum { get; set; }

	//	public float Avg(int count) => Sum / count;
	//}

    public class ReportSummary
    {
        public double Max { get; set; }

        public double Min { get; set; }

        public double Sum { get; set; }

        public double Avg(int count) => Sum / count;
    }
}