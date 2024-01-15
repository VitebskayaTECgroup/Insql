<%@ Page Language="C#" %>
<% 
	string server = Request.Form.Get("server");
	string tags = Request.Form.Get("t");
	string res = Request.Form.Get("c");
	string start = Request.Form.Get("s");
	string finish = Request.Form.Get("e");

	var json = Insql.Models.Tag.ToGraph(server, tags, res, start, finish);

	Response.Write(json);
%>