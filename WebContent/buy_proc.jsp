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
	String name = (String)application.getAttribute("name");
	String id = (String)session.getAttribute("id");
	String su = request.getParameter("su");
	String one = request.getParameter("price");
	int price = Integer.parseInt(request.getParameter("price")) * Integer.parseInt(request.getParameter("su"));
	String date = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
	Date day = Date.valueOf(date);
	
	int byear = Integer.parseInt(request.getParameter("year"));
	int bmon = Integer.parseInt(request.getParameter("month"));
	int bday = Integer.parseInt(request.getParameter("day"));
	
	Calendar cal = Calendar.getInstance();

	int tyear = cal.get(Calendar.YEAR);
    int tmon = cal.get(Calendar.MONTH);
    int tday = cal.get(Calendar.DAY_OF_MONTH);
    
    if (byear == tyear && bmon <= tmon){
    	if(bday < tday){
	   		out.print("<script>");
	   		out.print("alert('오늘 이후의 날짜로 예약해주세요');");
	   		out.print("location.href='buy.jsp?name=" + name + "';");
	   		out.print("</script>");
    	}
    } else{
%>
    	<div id="wrap">
            <br><br>
            <b><font size="6" color="gray"><%= name %></font></b>
            <br><br><br>
            <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
            <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
            <form method="post" action="buy_complete.jsp" name="userInfo">
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
                        <td class="text"><%= day %></td>
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
                <input type="hidden" value="<%= name %>" name="name">
                <input type="hidden" value="<%= id %>" name="id">
                <input type="hidden" value="<%= price %>" name="price">
                <input type="hidden" value="<%= date %>" name="date">
                <input type="submit" value="예약하기" class="btn"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소" onclick="location.href='index.jsp'" class="btn">
            </form>
        </div>
<% } %>
</body>
</html>