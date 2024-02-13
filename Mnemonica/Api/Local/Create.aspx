<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Local.Models" %>
<%
	var tagName = Request.Form.Get("TagName");
	var description = Request.Form.Get("Description");
	var who = User.Identity.Name.ToLower().Replace("vst\\", "");

	using (var db = new DatabaseContext())
	{
		db.CreateTag(tagName, description, who);
	}
%>