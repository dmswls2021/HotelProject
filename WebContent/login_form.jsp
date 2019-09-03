<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='css/join.css'/>
<script type="text/javascript">
    // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue()
    {
        if(!document.userInfo.id.value){
            alert("아이디를 입력하세요.");
            return false;
      	}
            
     	if(!document.userInfo.password.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
    }
</script>
</head>
<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">로그인</font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="login_proc.jsp" name="userInfo" onsubmit="return checkValue()">
            <table >
                <tr>
                    <td id="title">아이디</td>
                    <td class="text">
                        <input type="text" name="id" maxlength="50">  
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td class="text">
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="로그인" class="btn"/>
        </form>
    </div>
</body>
</html>