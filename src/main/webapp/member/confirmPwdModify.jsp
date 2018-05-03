<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 - 회원정보 수정</title>

<link rel="stylesheet" media="all" type="text/css" href="../css/memberConfirm/confirm.css">

<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<jsp:include page="/main/main/header.jsp"/>

<form name="confirmMemberPwd" method="post" action="memberView.do">

<div class="info_box">
	<div class="info">
		<div class="info_table">
		<font size="7"> 비밀번호 확인  </font>
		<br>
		<br>
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
				<td><br></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input class="confirm_btn" type="button" value="      확인      " onclick="javascript:checkMemberPwd()">
					<input class="main_btn" type="button" value="MovieT Main" onclick="javascript:location.href='index.do'">
		 		</td>
			</tr>
		</table>
		</div>
		<div class="info_img">
			<img class="modify_img" src="../image/memberModify/infoConfirm.jpg"/>
		</div>
	</div>
</div>

</form>

<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>