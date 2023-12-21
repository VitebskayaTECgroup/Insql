<%@ Page Language="C#" %>
<% 
	var r = new Random().Next();
%>
<!DOCTYPE html>
<html lang="ru">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta charset="utf-8" />
	<title>Алармы</title>
	<style>
		body {
			font-family: Consolas, 'Lucida Console', monospace;
			font-size: 14px;
			background: #111;
			color: #fff;
		}

		.form {
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			background: #333;
			height: 52px;
			border-bottom: 1px solid #000;
			z-index: 1;
			padding: 2px;
		}

			.form form {
				padding-right: 30px;
			}

			.form b {
				font-size: 1.4em;
				color: #ffd747;
				padding: 0 10px;
			}

			.form select,
			.form input {
				box-sizing: border-box;
				border: 0;
			}

			.form select {
				padding: 2px;
			}

			.form input[type="submit"] {
				padding: 3px 6px;
			}

			.form button {
				border: 0;
				border-collapse: collapse;
				padding: 3px 6px;
			}

			.form table {
				border-collapse: collapse;
				width: 100%;
				table-layout: fixed;
				border-top: 1px solid #444;
				margin-top: 6px;
			}

			.form th {
				padding: 2px 5px;
				font-size: 1.1em;
				font-weight: bold;
				background: #ffd747;
				color: black;
				border-left: 1px solid #444;
				border-right: 1px solid #444;
			}

		.data {
			cursor: default;
			position: absolute;
			top: 55px;
			left: 0;
			right: 0;
			padding: 2px;
		}

			.data table {
				border-collapse: collapse;
				width: 100%;
				table-layout: fixed;
			}

			.data tbody tr:hover {
				background: #ccc;
				color: #000;
			}

				.data tbody tr:hover .date {
					color: #652f00;
				}

			.data td,
			.data th {
				padding: 2px 5px;
			}

			.data th,
			.data td {
				border-left: 1px solid #444;
				border-right: 1px solid #444;
			}

			.data .date {
				color: #e2d48e;
			}

		.ACK_RTN {
			background: #080;
		}

		.ACK_ALM {
			background: #400;
		}

		.UNACK_ALM {
			background: #404;
		}

		.UNACK_RTN {
			background: #004;
		}


		/* Кастомизация скроллбаров */

		html, body {
			scrollbar-width: 8px;
			scrollbar-base-color: #444;
			scrollbar-arrow-color: #000;
			scrollbar-shadow-color: #000;
			scrollbar-highlight-color: #333;
		}

		::-webkit-scrollbar {
			width: 8px;
			height: 8px;
		}

		::-webkit-scrollbar-thumb {
			border: 0;
			background-color: #333;
		}

			::-webkit-scrollbar-thumb:hover {
				background-color: #ffe44e;
			}

		::-webkit-scrollbar-track {
			border: 0;
		}
	</style>
</head>
<body>
	<%
		var start = Request.QueryString.Get("startD") + " " + Request.QueryString.Get("startT");
		var end = Request.QueryString.Get("endD") + " " + Request.QueryString.Get("endT");
		var source = Request.QueryString.Get("source");
		var turbine = Request.QueryString.Get("turbine");
		var type = Request.QueryString.Get("type");

		DateTime d;
		var End = DateTime.TryParse(end, out d) ? d : DateTime.Now;
		var Start = DateTime.TryParse(start, out d) ? d : End.AddHours(-1);

		var alarms = Insql.Models.Alarm.GetAlarms(Start, End, source, turbine, type);
	%>
	<div class="form">
		<b>Алармы</b>
		<form method="get" action="<%=ResolveClientUrl("~/pages/alarms")%>" style="display: inline-block;" id="form">
			С:
			<input name="startD" type="date" value="<%=Start.ToString("yyyy-MM-dd")%>" />
			<input name="startT" type="time" value="<%=Start.ToString("HH:mm")%>" />
			По:
			<input name="endD" type="date" value="<%=End.ToString("yyyy-MM-dd")%>" />
			<input name="endT" type="time" value="<%=End.ToString("HH:mm")%>" />
			Источник:
			<select name="source">
				<option value="all">Все</option>
				<option value="ES1" <%=(source == "ES1" ? "selected" : "")%>>ES 1</option>
				<option value="OS21" <%=(source == "OS21" ? "selected" : "")%>>OS 21</option>
				<option value="OS22" <%=(source == "OS22" ? "selected" : "")%>>OS 22</option>
			</select>
			Турбина:
			<select name="turbine">
				<option value="all">Все</option>
				<option value="2" <%=(turbine == "2" ? "selected" : "")%>>TA 2</option>
				<option value="3" <%=(turbine == "3" ? "selected" : "")%>>TA 3</option>
			</select>
			Тип:
			<select name="type">
				<option value="all">Все</option>
				<option value="DSC" <%=(type == "DSC" ? "selected" : "")%>>DSC</option>
				<option value="OPR" <%=(type == "OPR" ? "selected" : "")%>>OPR</option>
				<option value="DDE" <%=(type == "DDE" ? "selected" : "")%>>DDE</option>
				<option value="HI" <%=(type == "HI" ? "selected" : "")%>>HI</option>
				<option value="HIHI" <%=(type == "HIHI" ? "selected" : "")%>>HIHI</option>
				<option value="LO" <%=(type == "LO" ? "selected" : "")%>>LO</option>
				<option value="LOLO" <%=(type == "LOLO" ? "selected" : "")%>>LOLO</option>
			</select>
			<input type="submit" value="Запрос" />
		</form>
		<button onclick="exportQuery()">Excel</button>
		<button onclick="location='./alarms'">Сброс</button>

		<table>
			<thead>
				<tr>
					<th width="200px">Дата/время</th>
					<th width="200px">Тег</th>
					<th>Описание</th>
					<th width="50px">Сервер</th>
					<th width="80px">Класс</th>
					<th width="40px">Тип</th>
					<th width="280px">Значение</th>
					<th width="280px">Контрольное значение</th>
				</tr>
			</thead>
		</table>
	</div>

	<div class="data">
		<table>
			<thead>
				<tr>
					<th width="200px"></th>
					<th width="200px"></th>
					<th></th>
					<th width="50px"></th>
					<th width="80px"></th>
					<th width="40px"></th>
					<th width="280px"></th>
					<th width="280px"></th>
				</tr>
			</thead>
			<tbody>
				<%
					foreach (var alarm in alarms)
					{
						Response.Write("<tr class=\"" + alarm.Class + "\">" +
							"<td class=\"date\">" + alarm.Date.ToString("dd.MM.yyyy HH:mm:ss.fff") + "</td>" +
							"<td>" + alarm.TagName + "</td>" +
							"<td>" + alarm.Comment + "</td>" +
							"<td>" + alarm.Node + "</td>" +
							"<td>" + alarm.Class + "</td>" +
							"<td>" + alarm.Type + "</td>" +
							"<td>" + alarm.Value + "</td>" +
							"<td>" + alarm.ControlValue + "</td>" +
							"</tr>");
					}
				%>
			</tbody>
		</table>
	</div>

	<script>
		var host = '<%=ResolveClientUrl("~/")%>'

		function exportQuery() {
			var url = location.href
				.toLowerCase()
				.replace('default.aspx', '')
				.replace('alarms/', 'alarms/export.aspx')

			var xhr = new XMLHttpRequest()
			xhr.open('GET', url, true)
			xhr.setRequestHeader('Content-Type', 'text/html; charset=Windows-1251')
			xhr.onreadystatechange = function () {
				if (xhr.readyState != 4) return
				if (xhr.responseText.indexOf('|') < 0) {
					var el = document.createElement('a')
					document.body.appendChild(el)
					el.href = host + 'content/export/' + xhr.responseText
					el.setAttribute('download', '')
					el.click()
				} else {
					alert(xhr.responseText.replace('error|', 'Ошибка при создании Excel файла: '))
				}
			}
			xhr.send(null)
		}
	</script>
</body>
</html>