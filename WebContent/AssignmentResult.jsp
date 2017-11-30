<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="objects.*" %>
<%@ page import="managers.*" %>
<%
	if(request.getAttribute("nameToNew") == null)
		return;
	Map<String,List<Task> > nameToNew = (Map<String,List<Task> >)request.getAttribute("nameToNew");
%>
<table>
	<tr>
		<th>Task</th>
		<th>Assignee</th>
	</tr>
	<%for(String name: nameToNew.keySet()) {
		for(Task task: nameToNew.get(name)) { %>
			<tr>
			<td><%=name %></td>
			<td><%=task.getName() %></td>
			</tr>
		<%}
	} %>
	
</table>