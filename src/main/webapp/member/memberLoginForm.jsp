<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script type="text/javascript" src="../script/memberScript.js?v=1">
</script>
</head>
<body>
<form name="memberLoginForm" method="post" action="memberLogin.do">
<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="member_id" required="required"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pwd" required="required"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="로그인" onclick="javascript:checkLogin()">
			<input type="button" value="회원가입" onclick="javascript:location.href='memberWriteForm.do'">
 		</td>
	</tr>
</table>
</form>
</body>
</html>