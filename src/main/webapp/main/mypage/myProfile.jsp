<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<c:if test="${result == 0}">
<script type="text/javascript">
$(function(){
	alert("프로필 정보 등록을 실패했습니다.");
	history.back();
});	
</script>
</c:if>
<c:if test="${result > 0}">
<script type="text/javascript">
$(function(){
	alert("정상적으로 정보가 등록 되었습니다.");
	location.href="/MyCGV/main/mypage/myProfileForm.do"
});	
</script>
</c:if>
<%-- <c:if test="${resultDel == -1 || resultDel == 0}">
<script type="text/javascript">
$(function(){
	alert("삭제할 파일이 존재하지 않거나 삭제를 실패했습니다.");
	history.back();
});
</script>
</c:if> --%>
</head>
<body>
</body>
</html>