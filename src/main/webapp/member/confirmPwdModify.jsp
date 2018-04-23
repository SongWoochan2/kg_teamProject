<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 - 회원정보 수정</title>
<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<form name="confirmMemberPwd" method="post" action="memberView.do">
<table>
	<tr>
		<th>아이디</th>
		<td>${sessionScope.memId}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pwd" required="required"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="확인" onclick="javascript:checkMemberPwd()">
			<input type="button" value="MoveIt 첫화면으로" onclick="javascript:location.href='../index.jsp'">
 		</td>
	</tr>
</table>
</form>
</body>
</html>