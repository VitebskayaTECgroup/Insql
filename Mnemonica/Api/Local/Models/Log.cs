using System;

namespace MnemonicaBase.Api.Local.Models
{
	public class Log
	{
		public DateTime Date { get; set; }

		public string Who { get; set; }

		public int Server { get; set; }

		public string Text { get; set; }
	}
}