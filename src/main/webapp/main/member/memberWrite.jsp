<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<c:if test="${result == 0}">
<script type="text/javascript">
$(function(){
	alert("회원가입에 실패했습니다.");
	history.back();
});
</script>
</c:if>
<c:if test="${result > 0 }">
<script type="text/javascript">
$(function(){
	alert("회원가입에 성공했습니다.");
	location.href = "index.do";
});
</script>
</c:if>
</head>
<body>
</body>
</html>