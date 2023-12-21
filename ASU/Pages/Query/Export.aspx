<%@ Page Language="C#" %>
<% 
	string tags = Request.Form.Get("t");
	string resolution = Request.Form.Get("c");
	string start = Request.Form.Get("s");
	string end = Request.Form.Get("e");
	string server = Request.Form.Get("server");

	var model = new Insql.Models.Report().ToQuery(server, tags, resolution, start, end);
	var path = Insql.Models.Exporter.Export(model);

	Response.Write(path);
%>