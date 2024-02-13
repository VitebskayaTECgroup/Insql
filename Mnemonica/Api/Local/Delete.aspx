<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Local.Models" %>
<%
	var tagName = Request.Form.Get("TagName");
	var who = User.Identity.Name.ToLower().Replace("vst\\", "");

	using (var db = new DatabaseContext())
	{
		db.DeleteTag(tagName, who);
	}
%>