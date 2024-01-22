<%@ Page Language="C#" %>
<%=User.Identity.Name.ToLower().Replace("vst\\", "")%>