<%@ Page Language="C#" %>
<% 
	var r = new Random().Next();
%>
<!DOCTYPE html>

<html lang="ru">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Query</title>
	<link rel="shortcut icon" href="<%=(ResolveClientUrl("~/content/images/assessment-white-18dp.svg") + "?" + r)%>" type="image/svg" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/lib/chartist/chartist.css") + "?" + r)%>" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/css/query.css") + "?" + r)%>" />
</head>
<body>
	<div class="layout">
		<div class="header">
			<div>
				<span class="title">Query</span>
			</div>
			<div>
				<select id="server">
					<option value="insql1">INSQL 1</option>
					<option value="insql2">INSQL 2</option>
				</select>
				<button mode="table" onclick="hashSet('mode', 'table')">Таблица</button>
				<button mode="graph" onclick="hashSet('mode', 'graph')">График</button>
				<button onclick="exportToExcel()">Excel</button>
			</div>
		</div>
		<!-- left -->
		<div class="left tags-selected-header">
			<span id="tags-selected-header"></span>
			<span class="tags-selected-toggler">
				<span class="material-icons">expand_more</span>
			</span>
		</div>
		<div class="left tags-selected hide" id="tags-selected"></div>
		<div class="left tags-search-insert">
			<input type="search" id="tags-search-input" placeholder="имя или описание тега" />
			<select id="tags-search-type">
				<option value="">Все типы тегов</option>
				<option value="1">Аналоговые</option>
				<option value="2">Дискретные</option>
				<option value="3">Строковые</option>
				<option value="5">События</option>
			</select>
		</div>
		<div class="left tags-search-results" id="tags-search-results"></div>
		<!-- right -->
		<div class="right controls">
			<select id="controls-cycle">
				<option value="1">по секундам</option>
				<option value="" selected>по минутам</option>
				<option value="3">по часам</option>
				<option value="4">по изменению</option>
			</select>
			<span>c</span>
			<input type="date" id="controls-date-start" value="<%=DateTime.Now.ToString("yyyy-MM-dd")%>" />
			<input type="time" id="controls-time-start" value="<%=DateTime.Now.ToString("HH:00:00")%>" />
			<span>до</span>
			<input type="date" id="controls-date-end" value="<%=DateTime.Now.ToString("yyyy-MM-dd")%>" />
			<input type="time" id="controls-time-end" value="<%=DateTime.Now.ToString("HH:mm:00")%>" />
			<button id="controls-reload">▶</button>
		</div>
		<div class="right view" id="view"></div>
	</div>

	<div id="resizer"></div>
	<div id="tooltip"></div>

	<script>var host = '<%=ResolveClientUrl("~/")%>'</script>
	<script src="<%=(ResolveClientUrl("~/content/lib/plotly/plotly-2.28.0.min.js"))%>"></script>
	<script src="<%=(ResolveClientUrl("~/content/js/query.js") + "?" + r)%>"></script>
</body>
</html>