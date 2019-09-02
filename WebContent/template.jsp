<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String contentPage = request.getParameter("CONTENTPAGE");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='css/template.css'/>
</head>
<body>
<table class="temp">
	<tr>
		<td class="nav">
			<jsp:include page="nav.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="<%= contentPage %>" flush="false"/>
		</td>
	</tr>
</table>
</body>
</html>