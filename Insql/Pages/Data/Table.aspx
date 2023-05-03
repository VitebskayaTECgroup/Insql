<%@ Page Language="C#" %>
<%
	string _file = Request.QueryString.Get("file");
	string _query = Request.QueryString.Get("query");
	string _server = Request.QueryString.Get("server");
	string _date = Request.QueryString.Get("date");
	string _step = Request.QueryString.Get("step");
	string _down = Request.QueryString.Get("down");
	string _live = Request.QueryString.Get("live");

	var Model = new Insql.Models.Report().ToTable(_file, _query, _server, _date, _step, _down, _live);

	if (Model.Error != null)
	{
		Response.Write("<pre>" + Model.Error.Message + "</pre>");
		Response.Write("<pre>" + Model.Error.StackTrace + "</pre>");
		return;
	}
%>

<div id="filter">

	<select 
		multiple
		id="query"
		onchange="load({ current: true })"
		ondblclick="load({ current: true })"
		style="position: absolute; top: 1em; left: 1em; width: 16em; height: 5.5em;"
	>
		<%
			foreach (var query in Model.Queries) 
			{
				Response.Write("<option value=\"" + query + "\"" + (query == Model.CurrentQuery ? " selected" : "") + ">" + query + "</option>");
			}
		%>
	</select>

	<button 
		title="Перейти к предыдущему отчёту"
		onclick="load({ current: true, query: '<%=Model.DownQuery%>' })"
		style="position: absolute; top: 1em; left: 17.4em; height: 2.4em;"
		<%=(string.IsNullOrEmpty(Model.DownQuery) ? "disabled" : "")%>
	>
		<span class="img img-up">Предыдущий отчёт</span>
	</button>

	<button 
		title="Перейти к следующему отчёту"
		onclick="load({ current: true, query: '<%=Model.UpQuery%>' })"
		style="position: absolute; top: 4.1em; left: 17.4em; height: 2.4em;"
		<%=(string.IsNullOrEmpty(Model.UpQuery) ? "disabled" : "")%>
	>
		<span class="img img-down">Следующий отчёт</span>
	</button>

	<div style="position: absolute; top: 1.1em; left: 35em; height: 5.5em;">
		<button title="Перейти к предыдущему интервалу времени" onclick="load({ step: 'back' })" style="height: 2.4em;">
			<span class="img img-previous">Назад</span>
		</button>
		<input id="date" value="<%=Model.Start.ToString("dd.MM.yyyy")%>" style="width: 6em;" onchange="load({ })" />
		<input id="time" value="<%=Model.Start.ToString("HH:mm:ss")%>" style="width: 5em;" onchange="load({ })" />
		<button title="Перейти к следующему интервалу времени" onclick="load({ step: 'forward' })" style="height: 2.4em;" <%=(Model.IsLive ? "disabled" : "")%>>
			<span class="img img-next">Вперед</span>
		</button>
		<button title="Перейти к текущему времени" onclick="load({ current: true })" style="height: 2.4em;" <%=(Model.IsLive ? "disabled" : "")%>>
			<span class="img img-play">К текущим данным</span>
		</button>
	</div>

	<div style="position: absolute; top: 4.5em; left: 35em; height: 5.4em;">
		<button onclick="exportQuery(this)" style="height: 2.4em;">
			<span class="img img-save">Экспорт</span>
		</button>
		<button onclick="info(true)" style="height: 2.4em;">
			<span class="img img-info">Инфо</span>
		</button>
	</div>
</div>

<div id="timer"></div>

<div id="data">
	<h3 class="title" id="title"><%=Model.Name%></h3>

	<table class="datatable">
		<thead>
			<tr>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th>Edit</th>");
					}
					foreach (var header in Model.Headers)
					{
						if (header == null || header.Name == "DateMarker")
						{
							Response.Write("<th class=\"null\"></th>");
							
						}
						else if (header.IsVertical)
						{
							Response.Write("<th nowrap onmouseenter=\"toolTip('" + header.Hint + "')\" onmouseleave=\"toolTip()\"><div class=\"verticaltext\">" + header.SeparatedName("<br>") + "</div></th>");
						}
						else
						{
							Response.Write("<th nowrap onmouseenter=\"toolTip('" + header.Hint + "')\" onmouseleave=\"toolTip()\">" + header.SeparatedName("<br>") + "</th>");
						}
					}
				%>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th></th>");
					}
					int index = 1;
					foreach (var header in Model.Headers)
					{
						if (header == null || header.Name == "DateMarker")
						{
							Response.Write("<th class=\"null\"></th>");
						}
						else
						{
							Response.Write("<th>" + (index++) + "</th>");
						}
					}
				%>
			</tr>
			<%
				bool isEven = true;

				foreach (var row in Model.Rows)
				{
					string downFunction = string.IsNullOrEmpty(Model.DownQuery)
						? "return false"
						: "load({ query: '" + Model.DownQuery + "', date: '" + row.Date + "', down: true })";

					Response.Write("<tr class=\"" + (isEven ? "even" : "odd") + "\" ondblclick=\"" + downFunction + "\">");
						
					if (Model.IsEditEnabled)
					{
						Response.Write("<th><button onclick=\"edit(this, '" + row.Date + "', '" + _server + "')\">изм.</button></th>");
					}

					Response.Write("<th class=\"date\">" + row.Date.ToString(Model.DateFormat) + "</th>");

					foreach (var cell in row.Cells)
					{
						string cellEdit = Model.IsEditEnabled ? "edit=\"" + cell.Edit + "\"" : "";

						if (cell == null || cell.IsEmpty)
						{
							Response.Write("<td nowrap class=\"null\"></td>");
						}
						else if (cell.IsFloat)
						{
							Response.Write("<td nowrap " + cellEdit + " class=\"" + cell.Check + "\">" + cell.Value + "</td>");
						}
						else
						{
							Response.Write("<td nowrap " + cellEdit + " class=\"" + cell.Check + "\">" + cell.Text + "</td>");
						}
					}

					Response.Write("</tr>");

					isEven = !isEven;
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="<%=(Model.Headers.Length + (Model.IsEditEnabled ? 1 : 0))%>" onclick="toggleSummary()">Агрегирование</th>
			</tr>
			<tr style="display: none">
				<th>Сумма</th>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th></th>");
					}
					for (int i = 1; i < Model.Summaries.Length; i++)
					{
						if (Model.Summaries[i] != null)
						{
							Response.Write("<td>" + Model.Summaries[i].Sum + "</td>");
						}
						else
						{
							Response.Write("<td class=\"null\"></td>");
						}
					}
				%>
			</tr>
			<tr style="display: none">
				<th>Среднее</th>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th></th>");
					}
					for (int i = 1; i < Model.Summaries.Length; i++)
					{
						if (Model.Summaries[i] != null)
						{
							Response.Write("<td>" + Model.Summaries[i].Avg(Model.Rows.Count) + "</td>");
						}
						else
						{
							Response.Write("<td class=\"null\"></td>");
						}
					}
				%>
			</tr>
			<tr style="display: none">
				<th>Минимум</th>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th></th>");
					}
					for (int i = 1; i < Model.Summaries.Length; i++)
					{
						if (Model.Summaries[i] != null)
						{
							Response.Write("<td>" + Model.Summaries[i].Min + "</td>");
						}
						else
						{
							Response.Write("<td class=\"null\"></td>");
						}
					}
				%>
			</tr>
			<tr style="display: none">
				<th>Максимум</th>
				<%
					if (Model.IsEditEnabled)
					{
						Response.Write("<th></th>");
					}
					for (int i = 1; i < Model.Summaries.Length; i++)
					{
						if (Model.Summaries[i] != null)
						{
							Response.Write("<td>" + Model.Summaries[i].Max + "</td>");
						}
						else
						{
							Response.Write("<td class=\"null\"></td>");
						}
					}
				%>
			</tr>
		</tfoot>
	</table>

	<div id="floatTip"></div>
	<div id="info">
		<table>
			<tr>
				<td>
					<b>Информация о запросе</b>
				</td>
				<td>
					<button onclick="info()">Закрыть</button>
				</td>
			</tr>
			<tr>
				<td colspan='2'>
					<br />
				</td>
			</tr>
			<tr>
				<td>Сервер</td>
				<td>
					<span><%=Request.ServerVariables["HTTP_HOST"]%> <%=Request.ServerVariables["LOCAL_ADDR"]%></span>
				</td>
			</tr>
			<tr>
				<td>Время выполнения скрипта</td>
				<td>
					<span><%=((DateTime.Now - Model.TimeCreated).TotalMilliseconds.ToString())%> мс</span>
				</td>
			</tr>
			<tr>
				<td>Клиентский компьютер</td>
				<td>
					<span><%=Request.ServerVariables["REMOTE_ADDR"]%></span>
				</td>
			</tr>
			<tr>
				<td>Пользователь</td>
				<td>
					<span><%=Request.ServerVariables["LOGON_USER"]%></span>
				</td>
			</tr>
		</table>
		<br />
		<div>
			<span>Файл: </span>
			<b><%=Model.FilePath%></b>
			<br /><br />
			<pre><%=Model.Sql%></pre>
		</div>
	</div>

	<%
		if (Model.IsLive)
		{
			Response.Write("<script>startTimer(" + Model.Resolution + ")</script>");
		}
	%>
</div>