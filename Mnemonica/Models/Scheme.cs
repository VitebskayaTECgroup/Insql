using System.Collections.Generic;

namespace Mnemonica.Models
{
	public class Scheme
	{
		public string Name { get; set; }

		public string Description { get; set; }

		public List<ImageElement> ImageElements { get; set; } = new List<ImageElement>();

		public List<TextElement> TextElements { get; set; } = new List<TextElement>();
	}
}