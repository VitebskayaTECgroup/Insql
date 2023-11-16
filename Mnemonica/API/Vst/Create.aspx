<%@ Page Language="C#" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Mnemonica.Database" %>
<%
	string tag = Request.Form.Get("tag");
	string value = Request.Form.Get("value");
	string page = Request.Form.Get("page");
	string user = User.Identity.Name;

	using (var db = new DatabaseContext())
	{
		try
		{
			if (db.VstUpdateTag(tag, DateTime.Now, value, page, user))
			{
				Response.Write(JsonConvert.SerializeObject(new
				{
					Done = "Значение тега [" + tag + "] записано как [" + value + "]",
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