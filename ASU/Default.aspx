<%@ Page Language="C#" %>
<% 
	var r = new Random().Next();
%>
<!DOCTYPE html>
<html lang="ru">

<head>
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>АСУ</title>
	<link rel="shortcut icon" href="<%=(ResolveClientUrl("~/content/images/favicon.png") + "?" + r)%>" type="image/png" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/widgets/datepicker/datepicker.dark.css") + "?" + r)%>" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/widgets/timepicker/timepicker.dark.css") + "?" + r)%>" />
	<link rel="stylesheet" href="<%=(ResolveClientUrl("~/content/css/index.css") + "?" + r)%>" />
</head>

<body>
	<div class="about">
		<a class="title" href="./">АСУ</a>
		<b id="clock"></b>
		<a server="insql1" onclick="toServer(this)">INSQL 1</a>
		<a server="insql2" onclick="toServer(this)">INSQL 2</a>
	</div>

	<div class="search">
		<input type="text" id="search" placeholder="поиск по меню" />
	</div>
	<div class="tree" id="tree"></div>
	<div class="view" id="view"></div>

	<script src="<%=(ResolveClientUrl("~/content/widgets/datepicker/datepicker.js") + "?" + r)%>"></script>
	<script src="<%=(ResolveClientUrl("~/content/widgets/timepicker/timepicker.js") + "?" + r)%>"></script>
	<script>var host = '<%=ResolveClientUrl("~/")%>'</script>
	<script src="<%=(ResolveClientUrl("~/content/js/tree-items.js") + "?" + r)%>"></script>
	<script src="<%=(ResolveClientUrl("~/content/js/index.js") + "?" + r)%>"></script>
	<script src="<%=(ResolveClientUrl("~/content/lib/plotly/plotly-2.28.0.min.js"))%>"></script>
</body>

</html>
