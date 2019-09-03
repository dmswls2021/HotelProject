<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("password");
 
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	ResultSet rs = null;
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hotel";
		String password="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "select * from member where id=? and pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
    	rs = pstmt.executeQuery();
    	
    	if(rs.next()){           		
       		session.setAttribute("id", id);
       		response.sendRedirect("index.jsp");
    	}
 	}catch(Exception e){
    	e.printStackTrace();    
 		
    	out.println("<script>");
   		out.println("alert('로그인에 실패했습니다.')");
   		out.println("location.href='login.jsp'");
   		out.println("</script>");
 	}finally{
 		try{rs.close();}catch(Exception e){}
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>