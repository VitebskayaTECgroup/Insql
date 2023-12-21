<%@ Page Language="C#" %>
<% 
	string tags = Request.Form.Get("t");
	string resolution = Request.Form.Get("c");
	string start = Request.Form.Get("s");
	string end = Request.Form.Get("e");
	string server = Request.Form.Get("server");

	int res = 60000;
	if (resolution == "1") { res = 1000; }
	else if (resolution == "3") { res = 1000 * 60 * 60; }
	else if (resolution == "4") { res = 0; }

	var model = new Insql.Models.Report().ToQuery(server, tags, res.ToString(), start, end);
%>

<div class="right view-table">
	<% 
		if (model.Rows.Count == 0) 
		{
			Response.Write("<div>Нет данных для отображения</div>");
			return;
		}
	%>
	<table>
		<thead>
			<tr>
				<th class="vDateTime" rowspan="2">Время</th>
				<% 
					for (int i = 1; i < model.Headers.Length; i++)
					{
						Response.Write("<th>" + model.Headers[i].Name + "</th>");
					} 
				%>
			</tr>
			<tr>
				<% 
					for (int i = 1; i < model.Headers.Length; i++)
					{
						Response.Write("<th>" + model.Headers[i].Hint + "</th>");
					} 
				%>
			</tr>
		</thead>
		<tbody>
		<%
			foreach (var row in model.Rows)
			{
				Response.Write("<tr><td class=\"vDateTime\">" + row.Date + "</td>");
				foreach (var cell in row.Cells)
				{
					if (cell.IsFloat)
					{
						Response.Write("<td>" + cell.Value + "</td>");
					}
					else if (cell.IsBoolean)
					{
						Response.Write("<td>" + cell.Bool + "</td>");
					}
					else
					{
						Response.Write("<td>" + cell.Text + "</td>");
					}
				}
				Response.Write("</tr>");
			}
		%>
		</tbody>
	</table>
</div>