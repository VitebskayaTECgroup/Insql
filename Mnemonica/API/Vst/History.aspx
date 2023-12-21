<%@ Page Language="C#" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Mnemonica.Database" %>
<%
	string tag = Request.Form.Get("tag");

	using (var db = new DatabaseContext())
	{
		try
		{
			var tags = tag.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

			var live = db.VstReadTagLive(tags);
			double d;

			Response.Write(
				"try{Time='" + DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss") + "'}catch(e){};"
				+ string.Join("\n", live
					.Select(x => double.TryParse(x.Value, out d)
						? "try{" + x.TagName + "=" + d + "}catch(e){};"
						: "try{" + x.TagName + "='" + x.Value + "'}catch(e){};")
					.ToArray()
			));
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