<%@ Page Language="C#" %>
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
	var path = Insql.Models.Exporter.ExportAlarms(alarms);

	Response.Write(path);
%>