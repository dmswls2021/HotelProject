<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	application.setAttribute("name", name);
	
%>
<jsp:forward page="template.jsp">
	<jsp:param name="CONTENTPAGE" value="buy_form.jsp"/>
</jsp:forward>