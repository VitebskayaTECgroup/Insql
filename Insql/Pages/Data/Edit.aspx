<%@ Page Language="C#" %>
<%
	string _start = Request.Form.Get("start");
	string _finish = Request.Form.Get("finish");
	string _tags = Request.Form.Get("tags");

	var start = DateTime.Parse(_start);
	var finish = DateTime.Parse(_finish);
	var tags = _tags.Split(new[] { "---" }, StringSplitOptions.RemoveEmptyEntries);

	using (var conn = new System.Data.Odbc.OdbcConnection("Driver={SQL Server}; Server=localhost; Database=RUNTIME; Uid=wwAdmin; Pwd=wwAdmin;"))
	{
		conn.ConnectionTimeout = 240;
		conn.Open();

		foreach (var tag in tags)
		{
			var elements = tag.Split('|');

			using (var command = new System.Data.Odbc.OdbcCommand())
			{
				command.CommandTimeout = 60;
				command.CommandText = "EXEC [dbo].[vst_InsertManualRealConstant4] '" + start + "}', '" + finish + "', '" + elements[0] + "', '" + elements[1].Replace(',', '.') + "', 1";
				command.ExecuteNonQuery();
				//Response.Write("<pre>" + command.CommandText + "</pre>");
			}
		}

		conn.Close();
	}
%>