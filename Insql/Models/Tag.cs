using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;

namespace Insql.Models
{
	public class Tag
	{
		public static string GraphJson(string server, string tags, string res, string start, string finish)
		{
			var Start = DateTime.TryParse(start, out DateTime d) ? d : DateTime.Today.AddHours(DateTime.Now.Hour);
			var Finish = DateTime.TryParse(finish, out d) ? d : DateTime.Now;
			var Resolution = int.TryParse(res, out int r) ? r : 2;
			var Mode = "Cyclic";

			switch (Resolution)
			{
				case 1:
					Resolution = 1000;
					break;
				case 2:
					Resolution = 60000;
					break;
				case 3:
					Resolution = 3600000;
					break;
				case 4:
					Resolution = 0;
					Mode = "Delta";
					break;
			}

			List<Tag> points = new List<Tag>();

			using (var conn = new OdbcConnection())
			{
				conn.ConnectionString = "Driver={SQL Server}; Server=" + server.ToUpper() + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
				conn.Open();

				using (var command = new OdbcCommand())
				{
					command.CommandText = $@"
					SELECT
						DateTime,
						TagName,
						Value
					FROM
						v_History
					WHERE
						TagName IN ('{tags.Replace(",", "','")}')
						AND DateTime >= '{Start:yyyy-MM-dd HH:mm:ss.fff}'
						AND DateTime <= '{Finish:yyyy-MM-dd HH:mm:ss.fff}'
						AND wwRetrievalMode = '{Mode}'
						AND wwResolution = {Resolution}
					ORDER BY
						DateTime,
						TagName";
					command.Connection = conn;
					command.CommandTimeout = 20;

					using (var reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							points.Add(new Tag
							{
								DateTime = DateTime.Parse(reader.GetString(0)),
								TagName = reader.GetString(1),
								Value = reader.GetFloat(2),
							});
						}
					}
				}

				conn.Close();
			}

			var labels = points
					.OrderBy(x => x.DateTime)
					.Select(x => x.DateTime.ToString("HH:mm"))
					.Distinct()
					.ToList();

			var series = points
				.GroupBy(x => x.TagName)
				.Select(g => new
				{
					name = g.Key,
					data = g.Select(x => x.Value).ToArray()
				})
				.ToList();

			return JsonConvert.SerializeObject(new { labels, series });
		}

		public DateTime DateTime { get; set; }

		public string TagName { get; set; }

		public float Value { get; set; }
	}
}