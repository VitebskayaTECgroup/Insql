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

	var path = Insql.Models.Exporter.Export(Model);

	Response.Write(path);
%>