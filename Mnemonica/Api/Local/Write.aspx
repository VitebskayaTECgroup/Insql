<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Local.Models" %>
<%
	var tagName = Request.Form.Get("TagName");
	var value = Request.Form.Get("Value");
	var who = User.Identity.Name.ToLower().Replace("vst\\", "");

	using (var db = new DatabaseContext())
	{
		db.WriteTag(tagName, value, who);
	}
%>