using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;

namespace Insql.Models
{
	public class TagInfo
	{
		public static List<TagInfo> GetAllTags(string server)
		{
			var result = new List<TagInfo>();
			if (string.IsNullOrEmpty(server)) server = "insql2";

			using (var conn = new OdbcConnection())
			{
				conn.ConnectionString = "Driver={SQL Server}; Server=" + server.ToUpper() + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
				conn.Open();

				using (var command = new OdbcCommand())
				{
					command.CommandText = $@"
					SELECT
						Tag.TagName,
						Tag.Description,
						Tag.TagType,
						Tag.ItemName,
						IOServer.ComputerName,
						IOServer.ApplicationName,
						Topic.Name
					FROM
						Tag
						INNER JOIN Topic    ON Topic.TopicKey       = Tag.TopicKey
						INNER JOIN IOServer ON IOServer.IOServerKey = Tag.IOServerKey
					ORDER BY
						Tag.TagName";
					command.Connection = conn;
					command.CommandTimeout = 20;

					using (var reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							result.Add(new TagInfo
							{
								TagName = reader.GetString(0),
								Description = reader.GetString(1),
								TagType = reader.GetInt32(2),
								ItemName = reader.GetString(3),
								StorageHost = server.ToUpper(),
								StorageName = reader.GetString(4),
								ServerName = reader.GetString(5),
								TopicName = reader.GetString(6),
							});
						}
					}
				}

				conn.Close();
			}

			return result;
		}

		public static List<TagInfo> GetTags(string query, string type, string selected, string server)
		{
			var result = new List<TagInfo>();
			if (string.IsNullOrEmpty(query)) return result;

			string[] selectedArray = selected.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
			int typeInt = int.TryParse(type, out int i) ? i : 0;

			using (var conn = new OdbcConnection())
			{
				conn.ConnectionString = "Driver={SQL Server}; Server=" + server.ToUpper() + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
				conn.Open();

				using (var command = new OdbcCommand())
				{
					command.CommandText = $@"
					SELECT
						Tag.TagName,
						Tag.Description,
						Tag.TagType,
						Tag.ItemName,
						IOServer.ComputerName,
						IOServer.ApplicationName,
						Topic.Name
					FROM
						Tag
						INNER JOIN Topic    ON Topic.TopicKey       = Tag.TopicKey
						INNER JOIN IOServer ON IOServer.IOServerKey = Tag.IOServerKey
					WHERE
						Lower(Tag.TagName + Tag.Description) LIKE '%{query.ToLower()}%'
						AND 
						({typeInt} = 0 OR {typeInt} = Tag.TagType)
					ORDER BY
						Tag.TagName"; //  + Tag.ItemName + IOServer.ComputerName + IOServer.ApplicationName + Topic.Name
					command.Connection = conn;
					command.CommandTimeout = 20;

					using (var reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							result.Add(new TagInfo
							{
								TagName = reader.GetString(0),
								Description = reader.GetString(1),
								TagType = reader.GetInt32(2),
								ItemName = reader.GetString(3),
								StorageHost = server.ToUpper(),
								StorageName = reader.GetString(4),
								ServerName = reader.GetString(5),
								TopicName = reader.GetString(6),
								IsSelected = selectedArray.Contains(reader.GetString(0)),
							});
						}
					}
				}

				conn.Close();
			}

			return result;
		}

		public static List<TagInfo> GetSelectedTags(string tags, string server)
		{
			var result = new List<TagInfo>();

			if (string.IsNullOrEmpty(tags)) return result;

			using (var conn = new OdbcConnection())
			{
				conn.ConnectionString = "Driver={SQL Server}; Server=" + server.ToUpper() + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
				conn.Open();

				using (var command = new OdbcCommand())
				{
					command.CommandText = $@"
					SELECT
						Tag.TagName,
						Tag.Description,
						Tag.TagType,
						Tag.ItemName,
						IOServer.ComputerName,
						IOServer.ApplicationName,
						Topic.Name
					FROM
						Tag
						INNER JOIN Topic    ON Topic.TopicKey       = Tag.TopicKey
						INNER JOIN IOServer ON IOServer.IOServerKey = Tag.IOServerKey
					WHERE
						Tag.TagName IN ('{tags.Replace(",", "','")}')
					ORDER BY
						Tag.TagName";
					command.Connection = conn;
					command.CommandTimeout = 20;

					using (var reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							result.Add(new TagInfo
							{
								TagName = reader.GetString(0),
								Description = reader.GetString(1),
								TagType = reader.GetInt32(2),
								ItemName = reader.GetString(3),
								StorageHost = server.ToUpper(),
								StorageName = reader.GetString(4),
								ServerName = reader.GetString(5),
								TopicName = reader.GetString(6),
							});
						}
					}
				}

				conn.Close();
			}

			return result;
		}

		public string TagName { get; set; }

		public string Description { get; set; }

		public int TagType { get; set; }

		public string ItemName { get; set; }

		public string StorageHost { get; set; }

		public string StorageName { get; set; }

		public string ServerName { get; set; }

		public string TopicName { get; set; }

		public string Hash => (TagName + Description + StorageHost + StorageName + TopicName + ItemName)
			.Replace("\"", "")
			.Replace("\n", "")
			.Replace("\r", "")
			.Replace("\t", "")
			.ToLower();

		public bool IsSelected { get; set; }
	}
}