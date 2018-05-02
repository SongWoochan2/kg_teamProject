<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<c:if test="${result == 0}">
<script type="text/javascript">
$(function(){
	alert("등록 실패");
	history.back();
});	
</script>
</c:if>
<c:if test="${result > 0}">
<script type="text/javascript">
$(function(){
	alert("등록 성공");
	location.href="/MyCGV/mypage/editProfileForm.do"
});	
</script>
</c:if>
</head>
<body>
</body>
</html>