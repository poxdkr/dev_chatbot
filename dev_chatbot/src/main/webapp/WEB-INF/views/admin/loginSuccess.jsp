<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 성공</title>
</head>
<body>
    로그인 성공했습니다.
    <br/>
    접속 id는 ${userId} 입니다.
    <br/>
    접속된 유저의 roles는 ${userRoles} 입니다.
    <br/>
    <!-- <form method="post" action="/logout"> -->
    	<button type="button" onclick="location.href='../tester'">게시글 작성 테스트</button>
        <button type="submit" onclick="location.href='/logout'">로그아웃</button>
    <!-- </form> -->
</body>
</html>
