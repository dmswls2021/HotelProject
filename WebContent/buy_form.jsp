<%@page import="jdk.nashorn.internal.ir.SetSplitState"%>
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

	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	ResultSet rs = null;
 	
 	String name = (String)application.getAttribute("name");
 	
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hotel";
		String password="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "select * from hotel where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
    	rs = pstmt.executeQuery();
    	
    	if(rs.next()) {
%>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray"><%= rs.getString("name") %></font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="buy_proc.jsp" name="userInfo" onsubmit="return check()">
            <table>        
                <tr>
                    <td id="title">날짜</td>
                    <td class="text">
               			<%
               				Calendar cal = Calendar.getInstance();
               		 
               				//현재 년도, 월, 일
               				int year = cal.get ( cal.YEAR );
               			%>
                        <select name="year">
                        	<option value="<%= year %>"> <%= year %> </option>
                        	<option value="<%= year + 1 %>"> <%= year + 1 %> </option>
                        </select>
                        
                        <select name="month">
                        	<% 
                        		int i = 1;
                        	%>
                    			<option value="<%= i %>"> <%= i %> </option>
                    		<%
                        		while(i < 12){
                        	%>
                        		<option value="<%= i + 1 %>"> <%= i + 1 %> </option>
                        	<%	
                        			i++;
                        		}	%>
                        </select>
                        
                        <select name="day">
                        	<% 
                        		int j = 1;
                        	%>
                    			<option value="<%= j %>"> <%= j %> </option>
                    		<%
                        		while(j < 31){
                        	%>
                        		<option value="<%= j + 1 %>"> <%= j + 1 %> </option>
                        	<%
                        			j++;
                        		}	%>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">예약인원</td>
                    <td class="text">
                        <input type="number" name="su" value="1" min="1">  
                        <input type="hidden" name="price" value="<%= rs.getInt("price") %>">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="예약하기" class="btn"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소" onclick="location.href='index.jsp'" class="btn">
        </form>
    </div>
<% 
    	}
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