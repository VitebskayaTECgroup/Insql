<%@ Page Language="C#" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Mnemonica.Database" %>
<%
	string scheme = Request.Form.Get("scheme");
	string tag = Request.Form.Get("tag");
	string desc = Request.Form.Get("desc");
	string value = Request.Form.Get("value");

	using (var db = new DatabaseContext())
	{
		try
		{
			if (db.VstCreateTag(scheme, tag, desc, value))
			{
				Response.Write(JsonConvert.SerializeObject(new
				{
					Done = "Создан тег [" + tag + "]: [" + desc + "], его значение записано как [" + value + "]",
					Tag = tag,
				}));
			}
		}
		catch (Exception ex)
		{
			Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(new
			{
				Error = ex.Message,
			}));
		}
	}
%>