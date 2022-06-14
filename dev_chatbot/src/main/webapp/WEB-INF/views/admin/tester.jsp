<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 작성 테스터</title>
</head>
<body>
<!-- 	<h1>게시글 작성 테스터 (admin_chatting)</h1>
	<form action="/testWrite_admin_chatting" method="post">
	<table id="testBoard">
	<tr>
		<th>admin_chatting_gubun(varchar)</th><td><input type="text" id="gubun" name="gubun" placeholder="admin_chatting_gubun"/></td>
	</tr>
	<tr>
		<th>admin_mb_id(varchar)</th><td><input type="text" id="mb_id" name="mb_id" placeholder="admin_mb_id"/></td>
	</tr>
	<tr>
		<th>admin_user_id(varchar)</th><td><input type="text" id="user_id" name="user_id" placeholder="admin_user_id"/></td>
	</tr>
	<tr>
		<th>admin_state(int)</th><td><input type="number" id="state" name="state" placeholder="admin_state"/></td>
	</tr>
	<tr>
		<th>admin_reg_date(int)</th><td><input type="number" id="regdate" name="regdate" placeholder="admin_reg_date"/></td>
	</tr>
	<tr>
		<td colspan="2"><button type="submit">submit</button></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button" onclick="javascript:location.href='/'">로그인 창으로</button></td>
	</tr>
	</table>
	</form> -->

	<h1>멤버 작성 테스터 (g5_member)</h1>
	<form action="/testWrite_g5_member" method="post">
	<table id="testBoard">
	<tr>
		<th>mb_id(varchar)</th><td><input type="text" id="mb_id" name="mb_id" placeholder="admin_chatting_gubun"/></td>
	</tr>
	<tr>
		<th>mb_password(varchar)</th><td><input type="text" id="mb_password" name="mb_password" placeholder="admin_mb_id"/></td>
	</tr>
	<tr>
		<td colspan="2"><button type="submit">submit</button></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button" onclick="javascript:location.href='/'">로그인 창으로</button></td>
	</tr>
	</table>
	</form>
</body>
</html>