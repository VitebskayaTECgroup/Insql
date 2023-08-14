<%@ Page Language="C#" %>
<%@ Import Namespace="Dapper" %>
<%
	try
	{
		DateTime d;
		var start = DateTime.TryParse(Request.Form.Get("start"), out d) ? d : DateTime.Now.AddHours(-1);
		var finish = DateTime.TryParse(Request.Form.Get("finish"), out d) ? d : DateTime.Now;
		var tag = Request.Form.Get("tag");
		var value = Request.Form.Get("value");
		var server = Request.Form.Get("server");

		var tags = new List<string>();
		var values = new List<Insql.Models.Tag>();

		using (var conn = new System.Data.Odbc.OdbcConnection())
		{
			conn.ConnectionString = "Driver={SQL Server}; Server=" + server + "; Database=Runtime; Uid=wwAdmin; Pwd=wwAdmin;";
			conn.Open();

			tags = conn.Query<string>("SELECT TagName FROM Tag ORDER BY TagName").AsList();

			if (!string.IsNullOrEmpty(tag))
			{
				//values = conn.Query<Insql.Models.Tag>(@"SELECT
				//	TagName,
				//	DateTime,
				//	vValue as Value,
				//	Quality
				//FROM
				//	v_History
				//WHERE
				//	TagName = @TagName
				//	AND DateTime >= @Start
				//	AND DateTime <= @Finish
				//	AND wwRetrievalMode = 'DELTA'
				//ORDER BY
				//	DateTime", new { TagName = tag, Start = start, Finish = finish }).AsList();

				conn.Execute("EXEC [dbo].[vst_InsertManual_Range] '@Start', '@Finish', '@TagName', @Value, 1"
					.Replace("@TagName", tag)
					.Replace("@Value", value)
					.Replace("@Start", start.ToString("yyyyMMdd HH:mm:00.000"))
					.Replace("@Finish", finish.ToString("yyyyMMdd HH:mm:00.000")));
			}
		}
	}
	catch(Exception ex)
	{
		Response.Write(ex.Message + "\r\n" + ex.StackTrace);
	}
%>