<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 0}">
회원 가입에 실패했습니다.
</c:if>
<c:if test="${result > 0 }">
~~~ 회원이 되신 걸 축하합니다~
~초뒤 메인화면 이동하게 만들기
</c:if>
<br>
<input type="button" value="MoveIt 첫화면으로" onclick="location.href='index.do'">
</body>
</html>