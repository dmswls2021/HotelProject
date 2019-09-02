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
</head>
<body>
<table height="98%" width="98%" border="0">
	<tr>
		<td height="50px">
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