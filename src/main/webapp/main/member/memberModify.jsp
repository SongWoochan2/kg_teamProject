<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<c:if test="${result == 0}">
회원정보 수정에 실패했습니다.
</c:if>
<c:if test="${result > 0 }">
회원정보 수정 성공
</c:if>
<br>
<input type="button" value="MoveIt 첫화면으로" onclick="location.href='index.do'">
</body>
</html>

