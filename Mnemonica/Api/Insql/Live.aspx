<%@ Page Language="C#" %>
<%@ Import Namespace="MnemonicaBase.Api.Insql.Models" %>
<%
	var tagString = Request.Form.Get("tags");
	var tags = tagString.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);

	using (var db = new DatabaseContext())
	{
		var values = db.Live
			.Where(x => tags.Contains(x.TagName))
			.ToList();

		var result = string.Join("\n", values
			.Select(x => x.ToJS())
			.ToArray());

		Response.Write("try{Time='" + DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss") + "';}catch(e){};\n" + result);
	}
%>