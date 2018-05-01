<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<c:if test="${result < 0}">
<script type="text/javascript">
$(function(){
	alert("이미 취소되었거나 존재하지 않는 예매번호입니다.\n확인 후 다시 진행해주세요.");
	history.back();
});	
</script>
</c:if>
<c:if test="${result == 0}">
<script type="text/javascript">
$(function(){
	alert("예매 취소를 실패했습니다.");
	history.back();
});	
</script>
</c:if>
<c:if test="${result > 0}">
<script type="text/javascript">
$(function(){
	alert("선택한 예매번호를 취소했습니다.");
	location.href="/MyCGV/mypage/myReserveList.do?p=1"
});	
</script>
</c:if>
</head>
<body>

</body>
</html>