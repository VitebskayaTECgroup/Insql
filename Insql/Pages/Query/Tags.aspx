<%@ Page Language="C#"  %>
<%
	var r = new Random().Next();
	string query = Request.Form.Get("q");
	string type = Request.Form.Get("v");
	string selected = Request.Form.Get("t");
	string server = Request.Form.Get("server");

	var model = Insql.Models.TagInfo.GetTags(query, type, selected, server);

	if (model.Count == 0)
	{
		%><div class="tags-empty">ничего не найдено</div><%
	}
	else
	{
		foreach (var tag in model)
		{
			%>
			<div class="tag <%=(tag.IsSelected ? "tag-selected" : "")%>" id="<%=tag.TagName%>" title="Нажмите, чтобы <%=(tag.IsSelected ? "отменить выбор тега" : "выбрать тег")%>">
				<div>
					<%
					if (tag.TagType == 1)
					{
						%><span class="tag-type tag-type-analog" title="Аналоговый">A</span><%
					}
					else if (tag.TagType == 2)
					{
						%><span class="tag-type tag-type-discrete" title="Дискретный">D</span><%
					}
					else if (tag.TagType == 3)
					{
						%><span class="tag-type tag-type-string" title="Строковый">S</span><%
					}
					else if (tag.TagType == 5)
					{
						%><span class="tag-type tag-type-event" title="Событие">E</span><%
					}
					%>
					<span class="tag-name"><%=tag.TagName%></span>
				</div>
				<span class="tag-desc"><%=tag.Description%></span>
				<span class="tag-io">
					<i title="Сервер получения данных"><%=tag.StorageHost%></i> | <i title="Приложение"><%=tag.StorageName%></i> | <i title="Топик"><%=tag.TopicName%></i> | <i title="Адресация"><%=tag.ItemName%></i>
				</span>
			</div>
			<%
		}
	}
%>