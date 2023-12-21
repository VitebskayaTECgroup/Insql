using System;

namespace Insql.Models
{
	public class ReportRow
	{
		public DateTime Date { get; set; }

		public ReportCell[] Cells { get; set; }
	}
}