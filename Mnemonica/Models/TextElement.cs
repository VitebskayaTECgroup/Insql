using System.Collections.Generic;

namespace Mnemonica.Models
{
	public class TextElement
	{
		public int Id { get; set; }

		public string Name { get; set; }

		public Dictionary<EvalProps, string> Evals { get; set; } = new Dictionary<EvalProps, string>();
	}
}