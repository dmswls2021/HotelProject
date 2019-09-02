<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='css/nav.css'/>
</head>
<body>
<nav>
	<div>
		<div class="btn-group">
			  <button class="button" onclick="location.href='index.jsp'"><strong>SeoulHotel</strong></button>
			  <button class="button">Hotels</button>
		</div>
		<div class="btn-group">
		<% 
			if(session.getAttribute("id") == null){
		%>
				<button class="user" onclick="location.href='join.jsp'">Join</button>
				<button class="user" onclick="location.href='login.jsp'">Login</button>
		<% 
			} else{
		%>
				<button class="user" onclick="location.href='logout.jsp'">Logout</button>
		<%
			}
		%>
		</div>
	</div>
</nav>
</body>
</html>