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
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");

	String name = (String)application.getAttribute("name");
	String id = (String)session.getAttribute("id");
	String su = request.getParameter("su");
	String one = request.getParameter("price");
	int price = Integer.parseInt(request.getParameter("price")) * Integer.parseInt(request.getParameter("su"));
	String date = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
	Date day = Date.valueOf(date);
	
	Calendar day2 = Calendar.getInstance();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	day2.setTime(format.parse(date));
	Calendar today = Calendar.getInstance();
	
    int ch = today.compareTo(day2);
    
    if (ch < 0){
   		out.print("<script>");
   		out.print("alert('오늘 이후의 날짜로 예약해주세요')");
   		out.print("location.href='buy.jsp'");
   		out.print("</script>");
    }
    
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hotel";
		String password="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "insert into buy values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setInt(3, price);
		pstmt.setDate(4, day);
    	pstmt.executeUpdate();  
%>
    	<div id="wrap">
            <br><br>
            <b><font size="6" color="gray"><%= application.getAttribute("name") %></font></b>
            <br><br><br>
            <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
            <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
            <form method="post" action="buy_proc.jsp" name="userInfo" onsubmit="return check()">
                <table>        
                    <tr>
                        <td id="title">호텔</td>
                        <td class="text"><%= name %></td>
                    </tr>
                    <tr>
                        <td id="title">신청인</td>
                        <td class="text"><%= id %></td>
                    </tr>
                    <tr>
                        <td id="title">날짜</td>
                        <td class="text">
                        </td>
                    </tr>
                    <tr>
                        <td id="title">인원</td>
                        <td class="text"><%= su %></td>
                    </tr>
                    <tr>
                        <td id="title">1인 가격</td>
                        <td class="text"><%= one %></td>
                    </tr>
                    <tr>
                        <td id="title">합계</td>
                        <td class="text"><%= price %></td>
                    </tr>
                </table>
                <br>
                <input type="submit" value="예약하기" class="btn"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소" onclick="location.href='index.jsp'" class="btn">
            </form>
        </div>
<%
 	}catch(Exception e){
    	e.printStackTrace();
 	}finally{
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>