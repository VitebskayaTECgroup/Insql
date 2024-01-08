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
		onchange="load({ mode: 'graph', current: true })"
		ondblclick="load({ mode: 'graph', current: true })"
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
		onclick="load({ mode: 'graph', current: true, query: '<%=Model.DownQuery%>' })"
		style="position: absolute; top: 1em; left: 17.4em; height: 2.4em;"
		<%=(string.IsNullOrEmpty(Model.DownQuery) ? "disabled" : "")%>
	>
		<span class="img img-up">Предыдущий отчёт</span>
	</button>

	<button 
		title="Перейти к следующему отчёту"
		onclick="load({ mode: 'graph', current: true, query: '<%=Model.UpQuery%>' })"
		style="position: absolute; top: 4.1em; left: 17.4em; height: 2.4em;"
		<%=(string.IsNullOrEmpty(Model.UpQuery) ? "disabled" : "")%>
	>
		<span class="img img-down">Следующий отчёт</span>
	</button>

	<div style="position: absolute; top: 1.1em; left: 35em; height: 5.5em;">
		<button title="Перейти к предыдущему интервалу времени" onclick="load({ mode: 'graph', step: 'back' })" style="height: 2.4em;">
			<span class="img img-previous">Назад</span>
		</button>
		<input id="date" value="<%=Model.Start.ToString("dd.MM.yyyy")%>" style="width: 6em;" onchange="load({ mode: 'graph' })" />
		<input id="time" value="<%=Model.Start.ToString("HH:mm:ss")%>" style="width: 5em;" onchange="load({ mode: 'graph' })" />
		<button title="Перейти к следующему интервалу времени" onclick="load({ mode: 'graph', step: 'forward' })" style="height: 2.4em;" <%=(Model.IsLive ? "disabled" : "")%>>
			<span class="img img-next">Вперед</span>
		</button>
		<button title="Перейти к текущему времени" onclick="load({ mode: 'graph', current: true })" style="height: 2.4em;" <%=(Model.IsLive ? "disabled" : "")%>>
			<span class="img img-play">К текущим данным</span>
		</button>
	</div>

	<div style="position: absolute; top: 4.5em; left: 35em; height: 5.4em;">
		<button onclick="toTable()" style="height: 2.4em;">
			<span class="img img-save">К таблице</span>
		</button>
		<button onclick="info(true)" style="height: 2.4em;">
			<span class="img img-info">Инфо</span>
		</button>
		<button onclick="toggleLegend()" style="height: 2.4em;">
			<span class="img img-info">Подписи</span>
		</button>
	</div>
</div>

<div id="timer"></div>

<div id="data">
	<h3 class="title" id="title"><%=Model.Name%></h3>
	<div id="graph" style="height: 90%"></div>
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

<div id="coords" style="display: none"><%=Newtonsoft.Json.JsonConvert.SerializeObject(Model.Coords)%></div>
<div id="traces" style="display: none"><%=Newtonsoft.Json.JsonConvert.SerializeObject(Model.Traces)%></div>