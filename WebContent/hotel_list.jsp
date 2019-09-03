<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/hotel.css">
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");
 
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	ResultSet rs = null;
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hotel";
		String password="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "select * from hotel";
		pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();
%>
		<table class="list">
<%
    	while(rs.next()){
%>
		<tr class="box">
			<td class="imgtd">						
				<img src="img/<%= rs.getString("img") %>" class="hotel_img">
			</td>
			<td>
				<section class="textbox">
					<p class="hname"><b><%= rs.getString("name") %></b></p>
					<p><%= rs.getString("address") %></p>
					<p><%= rs.getString("tel") %></p>
				</section>
			</td>
		</tr>
<%
		}
%>
		</table>
<%
 	}catch(Exception e){
    	e.printStackTrace();
 	}finally{
 		try{rs.close();}catch(Exception e){}
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>