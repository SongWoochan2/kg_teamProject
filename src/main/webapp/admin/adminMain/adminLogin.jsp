<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel = "stylesheet">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
		<div id = "content" align="center">
			<div id = "adminlogin" >
				<div id = "logintop">관리자 로그인</div>
					<form action="../adminMain/adminLogin.do" method="post" name = "adminLoginForm">
						<div id="dvadminid">
							<input type="text" id = "admin_id" name="admin_id" placeholder="아이디">
						</div>
						<div id="dvadminpwd">
							<input type="password" id="admin_pwd" name="admin_pwd" placeholder="비밀번호">
						</div>
						<div id="dvloginbtn">
							<input type="submit" id="loginbtn" name = "loginbtn" value="로그인" >
						</div>
					</form>
					<div id = "loginbottom">
						<a href = "adminEnrollForm.do">관리자등록</a>
					</div>
			</div>
		</div>
</body>
</html>