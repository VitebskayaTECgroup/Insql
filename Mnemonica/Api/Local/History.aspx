<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Local.Models" %>
<%
	var tagString = Request.Form.Get("tags");
	var tags = tagString.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);

	var who = User.Identity.Name.ToLower().Replace("vst\\", "");
	
	var start = Request.Form.Get("Start");
	var end = Request.Form.Get("End");

	DateTime d;
	var dateStart = DateTime.TryParse(start, out d) ? d : DateTime.Now;
	var dateEnd = DateTime.TryParse(end, out d) ? d : dateStart.AddHours(-1);

	List<History> values;

	using (var db = new DatabaseContext())
	{
		values = db.History
			.Where(x => tags.Contains(x.TagName))
			.Where(x => x.Date >= dateStart && x.Date < dateEnd)
			.OrderByDescending(x => x.Date)
			.ThenBy(x => x.TagName)
			.ToList();
	}
%>
<table>
	<thead>
		<tr>
			<th>Время</th>
			<th>Тег</th>
			<th>Значение</th>
		</tr>
	</thead>
	<tbody>
		<%
			foreach (var x in values)
			{
				%>
				<tr>
					<td><%=x.Date.ToString("dd.MM.yyyy HH:mm:ss.fff")%></td>
					<td><%=x.TagName%></td>
					<td><%=x.Value%></td>
				</tr>
				<%
			}
		%>
	</tbody>
</table>