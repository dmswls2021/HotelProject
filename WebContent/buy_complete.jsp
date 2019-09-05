<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='css/buy.css'/>
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	int price = Integer.parseInt(request.getParameter("price"));
	String date = request.getParameter("date");
	Date day = Date.valueOf(date);
    
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	PreparedStatement pstmt2=null;
 	PreparedStatement pstmt3=null;
 	ResultSet rs = null;
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hotel";
		String password="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		
		String select = "select * from hotel where name=?";
		String sql = "insert into buy values(?,?,?,?)";
		String update = "update hotel set best=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setInt(3, price);
		pstmt.setDate(4, day);
    	pstmt.executeUpdate();
    	
    	pstmt2 = conn.prepareStatement(select);
    	pstmt2.setString(1, name);
    	rs = pstmt2.executeQuery();
    	
    	pstmt3 = conn.prepareStatement(update);
    	while(rs.next()){
    		pstmt3.setInt(1, rs.getInt("best") + 1);
    	}
    	pstmt3.executeUpdate();
    	
    	out.println("<script>");
       	out.println("alert('예약이 완료되었습니다')");
       	out.println("location.href='index.jsp'");
       	out.println("</script>");
    	
 	}catch(Exception e){
    	e.printStackTrace();
 	}finally{
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>