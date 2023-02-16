using Dapper;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;

namespace Insql.Models
{
	public class Alarm
	{
		public static List<Alarm> GetAlarms(DateTime start, DateTime end, string source, string turbine, string type)
		{
			var alarms = new List<Alarm>();

			string startString = start.AddSeconds(0 - start.Second).AddHours(-3).ToString("yyyy-MM-dd HH:mm:ss");
			string endString = end.AddSeconds(0 - end.Second).AddHours(-3).ToString("yyyy-MM-dd HH:mm:ss");

			string sql1 = $@"
			SELECT
				AlarmMaster.TagName                 AS AlarmMaster_TagName,
				AlarmMaster.bActive                 AS AlarmMaster_bActive,
				AlarmMaster.AlarmType               AS AlarmMaster_AlarmType,
				AlarmMaster.LimitString             AS AlarmMaster_LimitString,
				AlarmMaster.ValueString             AS AlarmMaster_ValueString,
				AlarmMaster.OriginationTime         AS AlarmMaster_OriginationTime,
				AlarmConsolidated.AlarmType         AS AlarmConsolidated_AlarmType,
				AlarmConsolidated.LimitString       AS AlarmConsolidated_LimitString,
				AlarmConsolidated.ValueString       AS AlarmConsolidated_ValueString,
				AlarmConsolidated.ReturnValueString AS AlarmConsolidated_ReturnValueString,
				AlarmConsolidated.AlarmTime         AS AlarmConsolidated_AlarmTime,
				AlarmConsolidated.AckTime           AS AlarmConsolidated_AckTime,
				AlarmConsolidated.ReturnTime        AS AlarmConsolidated_ReturnTime,
				ProviderSession.NodeName            AS ProviderSession_NodeName,
				Comment.Comment                     AS Comment_Comment
			FROM
				AlarmMaster
				INNER JOIN AlarmConsolidated ON AlarmConsolidated.AlarmId   = AlarmMaster.AlarmId
				INNER JOIN ProviderSession   ON AlarmMaster.ProviderId      = ProviderSession.ProviderId
				LEFT OUTER JOIN Comment      ON AlarmConsolidated.CommentId = Comment.CommentId
			WHERE
				AlarmMaster.OriginationTime  >= '{startString}' AND AlarmMaster.OriginationTime  <= '{endString}'";

			string sql2 = $@"
			SELECT
				EventState   AS [Class],
				EventTime    AS [Date],
				TagName	     AS [TagName],
				Comment	     AS [Comment],
				EventType    AS [Type],
				OperatorNode AS [Node],
				ValueString	 AS [Value],
				LimitString  AS [ControlValue]
			FROM
				[Events]
			WHERE
				EventTime >= '{startString}' AND EventTime <= '{endString}'";

			for (byte k = 1; k < 3; k++)
			{
				using (var conn = new OdbcConnection())
				{
					conn.ConnectionString = "Driver={SQL Server}; Server=INSQL" + k + "; Database=WWALMDB; Uid=wwadmin; Pwd=wwadmin;";
					conn.ConnectionTimeout = 2400;
					conn.Open();

					var data1 = conn.Query<AlarmBase>(sql1).ToList();
					var data2 = conn.Query<Alarm>(sql2).ToList();

					data2.ForEach(x => x.Date = x.Date.AddHours(3));

					alarms.AddRange(data1.Select(x => x.ToAlarm()).Where(x => x != null).ToList());
					alarms.AddRange(data2);

					conn.Close();
				}
			}

			var whereSource = new[] { "ES1", "OS21", "OS22" }.Contains(source);
			var whereTurbine = turbine == "2" || turbine == "3";

			alarms = alarms
				.Where(x => x.Node == source || !whereSource)
				.Where(x => (turbine == "2" && x.TagName.Contains("S2_")) || (turbine == "3" && x.TagName.Contains("S3_")) || !whereTurbine)
				.Where(x => string.IsNullOrEmpty(type) || type == "all" || type == x.Type.Trim())
				.ToList();

			alarms.Sort((a, b) => a.Date > b.Date ? 1 : a.Date == b.Date ? 0 : -1);

			return alarms;
		}

		public DateTime Date { get; set; }

		public string TagName { get; set; }

		public string Node { get; set; }

		public string Type { get; set; }

		public string Value { get; set; }

		public string ControlValue { get; set; }

		public string Comment { get; set; }

		public string Class { get; set; }
	}
}