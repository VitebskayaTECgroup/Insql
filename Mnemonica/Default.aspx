<%@ Page Language="C#" %>
<% var r = new Random().Next(); %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title></title>
	<link rel="stylesheet" href="./Content/jquery-ui.min.js" />
</head>
<body>
	<div id="container">

	</div>
	<script src="./Content/jquery-1.12.4.min.js"></script>
	<script src="./Content/jquery-ui.min.js"></script>
	<script src="./Content/mnemonica.js<%=r%>"></script>
</body>
</html>
