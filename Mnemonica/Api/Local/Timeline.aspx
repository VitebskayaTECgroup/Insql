<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Local.Models" %>
<%
	var tagString = Request.Form.Get("Tag");
	var tags = tagString.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);

	var who = User.Identity.Name.ToLower().Replace("vst\\", "");
	
	var start = Request.Form.Get("Start");
	var end = Request.Form.Get("End");

	DateTime d;
	var dateStart = DateTime.TryParse(start, out d) ? d : DateTime.Now;
	var dateEnd = DateTime.TryParse(end, out d) ? d : dateStart.AddHours(-1);

	List<History> values;
	List<Debug> debug;
	Dictionary<string, string> descriptions;

	using (var db = new DatabaseContext())
	{
		values = db.History
			.Where(x => tags.Contains(x.TagName))
			.Where(x => x.Date >= dateStart && x.Date < dateEnd)
			.OrderByDescending(x => x.Date)
			.ThenBy(x => x.TagName)
			.ToList();

		debug = db.Debug
			.Where(x => x.Date >= dateStart && x.Date < dateEnd)
			.ToList();

		descriptions = db.Tags
			.Where(x => tags.Contains(x.TagName))
			.ToDictionary(x => x.TagName, x => x.Description);
	}

	var logs = new List<Log>();

	logs.AddRange(values.Select(x => new Log
	{
		Date = x.Date,
		Who = x.Who,
		Server = x.Server,
		Text = "Тег \"" + descriptions[x.TagName] + "\" получил значение \"" + x.Value + "\""
	}));

	logs.AddRange(debug.Select(x => new Log
	{
		Date = x.Date,
		Who = x.Who,
		Server = x.Server,
		Text = x.Text,
	}));
%>
<table>
	<thead>
		<tr>
			<th>Время</th>
			<th>Оператор</th>
			<th>INSQL</th>
			<th>Сообщение</th>
		</tr>
	</thead>
	<tbody>
		<%
			foreach (var x in logs.OrderByDescending(x => x.Date))
			{
				%>
				<tr>
					<td><%=x.Date.ToString("dd.MM.yyyy HH:mm:ss.fff")%></td>
					<td><%=x.Who%></td>
					<td><%=x.Server%></td>
					<td><%=x.Text%></td>
				</tr>
				<%
			}
		%>
	</tbody>
</table>