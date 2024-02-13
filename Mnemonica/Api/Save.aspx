<%@ Page Language="C#" ValidateRequest="false" %>
<%
	var text = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
	var dir = Request.ServerVariables.Get("HTTP_REFERER");
	var id = Request.QueryString.Get("id");

	try
	{
		//Response.Write("DIR = " + dir + "\n");
		//Response.Write("ID = " + id + "\n");
		//Response.Write("PATH_TRANSLATED = " + Request.ServerVariables.Get("PATH_TRANSLATED") + "\n");

		var folder = dir.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
		//Response.Write("FOLDER = " + folder.Last() + "\n");

		var path = Request.ServerVariables.Get("PATH_TRANSLATED")
			.Replace(@"_base\api\save.aspx", folder.Last() + "\\" + id + ".html");
		//Response.Write("PATH = " + path + "\n");

		System.IO.File.WriteAllText(path, text);
	}
	catch(Exception e)
	{
		Response.Write(e.Message + "\n" + e.StackTrace);
	}
%>