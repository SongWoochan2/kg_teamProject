<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<link rel="stylesheet" media="all" type="text/css" href="../css/memberConfirm/delete.css">

</head>
<body>
<jsp:include page="/main/main/header.jsp"/>

<form name="memberDeleteForm" method="post" action="memberDelete.do">

<div class="big_form">
	<div class="form_img">
		<img class="logo_img" src="../image/memberModify/infoConfirm.jpg"/>
	</div>
	<div class="form_text">
		<h3>그동안 MovieT을 이용해주셔서 감사합니다.</h3><br>
		<h6>${confirm_name}님 지금 탈퇴하시면 MovieT에서 제공하는 모든 서비스를 더이상 이용할 수 없습니다.</h6><br>
		<input class="member_delete_btn" type="submit" value="MovieT 회원탈퇴">
	</div>
</div>
</form>

<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>