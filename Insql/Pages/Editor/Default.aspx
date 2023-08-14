<%@ Page Language="C#" %>
<%@ Import Namespace="Dapper" %>
<%
	DateTime d;
	var start = DateTime.TryParse(Request.QueryString.Get("start"), out d) ? d : DateTime.Now.AddHours(-1);
	var finish = DateTime.TryParse(Request.QueryString.Get("finish"), out d) ? d : DateTime.Now;
	var tag = Request.QueryString.Get("tag");
	var server = Request.QueryString.Get("server") ?? "insql2";

	var tags = new List<string>();
	var values = new List<Insql.Models.Tag>();

	using (var conn = new System.Data.Odbc.OdbcConnection())
	{
		conn.ConnectionString = "Driver={SQL Server}; Server=" + server + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
		conn.Open();

		tags = conn.Query<string>("SELECT TagName FROM Tag ORDER BY TagName").AsList();

		if (!string.IsNullOrEmpty(tag))
		{
			values = conn.Query<Insql.Models.Tag>(@"SELECT
				TagName,
				DateTime,
				Value,
				Quality
			FROM
				dbo.AnalogHistory
			WHERE
				TagName = '@TagName'
				AND DateTime >= '@Start'
				AND DateTime <= '@Finish'
				AND wwVersion = 'LATEST'
				AND wwRetrievalMode = 'DELTA'
			ORDER BY
				DateTime"
				.Replace("@TagName", tag)
				.Replace("@Start", start.ToString("yyyyMMdd HH:mm:00.000"))
				.Replace("@Finish", finish.ToString("yyyyMMdd HH:mm:00.000"))).AsList();
		}
	}

	var r = new Random().Next();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Query</title>
	<link rel="shortcut icon" href="<%=(ResolveClientUrl("~/content/images/assessment-white-18dp.svg") + "?" + r)%>" type="image/svg" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/lib/chartist/chartist.css") + "?" + r)%>" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/css/editor.css") + "?" + r)%>" />
</head>
<body>
	<form method="get" action="/pages/editor/" class="form">
		<div>
			<span>Сервер</span>
			<select id="server" name="server">
				<option value="insql1">INSQL 1</option>
				<option value="insql2" <%=(server == "insql2" ? "selected" : "")%>>INSQL 2</option>
			</select>
		</div>
		<div>
			<span>Тег</span>
			<input type="search" id="tag" name="tag" list="tags" value="<%=tag%>" />
			<datalist id="tags">
				<%
					foreach (var x in tags)
					{
						%><option value="<%=x%>" /><%
					}
				%>
			</datalist>
		</div>
		<div>
			<span>Начало</span>
			<input type="date" id="start-date" oninput="setDates()" value="<%=start.ToString("yyyy-MM-dd")%>" />
			<input type="time" id="start-time" oninput="setDates()" value="<%=start.ToString("HH:mm")%>" />
			<input type="hidden" id="start" name="start" value="<%=start.ToString("yyyy-MM-dd HH:mm")%>" />
		</div>
		<div>
			<span>Конец</span>
			<input type="date" id="finish-date" oninput="setDates()" value="<%=finish.ToString("yyyy-MM-dd")%>" />
			<input type="time" id="finish-time" oninput="setDates()" value="<%=finish.ToString("HH:mm")%>" />
			<input type="hidden" id="finish" name="finish" value="<%=finish.ToString("yyyy-MM-dd HH:mm")%>" />
		</div>
		<div>
			<input type="submit" value="Загрузить" />
		</div>
	</form>

	<%if (!string.IsNullOrEmpty(tag))
	{
		%>
		<div class="form">
			<span>Новое значение</span>
			<input id="value" type="number" placeholder="Введите новое значение" />
			<button onclick="submit()">Записать</button>
		</div>
		<table>
			<tr>
				<th>Дата</th>
				<th>Значение</th>
			</tr>
			<%
				foreach (var value in values)
				{
					%><tr>
						<td><%=value.DateTime.ToString("dd.MM.yyyy HH:mm:ss.fff")%></td>
						<td><%=value.Value%></td>
					</tr><%
				}
			%>
		</table>
	<%
	}
	%>

	<script>
		function setDates() {
			document.getElementById('start').value = document.getElementById('start-date').value + ' ' + document.getElementById('start-time').value
			document.getElementById('finish').value = document.getElementById('finish-date').value + ' ' + document.getElementById('finish-time').value
		}

		function submit() {
			var form = new FormData()
			form.append('tag', document.getElementById('tag').value)
			form.append('value', document.getElementById('value').value)
			form.append('start', document.getElementById('start').value)
			form.append('finish', document.getElementById('finish').value)
			form.append('server', document.getElementById('server').value)

			fetch('/pages/editor/EditorWorker.aspx', { method: 'POST', body: form })
				.then(res => res.text())
				.then(text => alert(text || 'Запрос выполнен'))
		}
	</script>
</body>
</html>
