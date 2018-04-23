<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
	</head> 
	<body>
<%-- 		<c:url value="/showMessage.html" var="messageUrl" />
		<a href="${messageUrl}">Click to enter</a> --%>
					*** 메인 화면 ***<br><br>
<c:if test="${ sessionScope.memId == null }">
		<a href="./member/memberWriteForm.do">회원가입</a><br>
		<a href="./member/memberLoginForm.do">로그인</a><br>
</c:if>
<c:if test="${ sessionScope.memId != null }">
		<a href="./mypage/mypageHome.do">My MoveIt</a><br>
		<a href="./member/memberLogout.do">로그아웃</a><br>
		<a href="./member/memberView.do">회원정보수정</a><br>
		<a href="./member/confirmMemberPwd.do">회원탈퇴</a><br>
</c:if>
	</body>
</html>
