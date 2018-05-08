<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<c:if test="${exist == 1}">
<script type="text/javascript">
$(function(){
	alert("이미 사용중인 아이디입니다.");
	window.close();
});
</script>
</c:if>
<c:if test="${exist == 0}">
<script type="text/javascript">
$(function(){
	alert("사용가능한 아이디 입니다.");
	window.close();
});
</script>
</c:if>
</head>
<body>
</body>
</html>