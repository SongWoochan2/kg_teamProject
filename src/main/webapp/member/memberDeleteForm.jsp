<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<form name="memberDeleteForm" method="post" action="memberDelete.do">
	<h3>그동안 MoveIt을 이용해주셔서 감사합니다.</h3>
	<h6>${confirm_name}님 지금 탈퇴하시면 MoveIt에서 제공하는 모든 서비스를 더이상 이용할 수 없습니다.</h6>
	<input type="submit" value="MoveIt 회원탈퇴">
</form>
</body>
</html>