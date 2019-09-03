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
			  <button class="button" onclick="location.href='hotel.jsp'">Hotels</button>
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
				<button class="user" onclick="location.href='mypage.jsp'">MyPage</button>
				<div class="nick"><%= session.getAttribute("id") %>님 환영합니다</div>
		<%
			}
		%>
		</div>
	</div>
</nav>
</body>
</html>