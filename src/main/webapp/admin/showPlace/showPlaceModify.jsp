<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:if test="${su > 0 }">
		<script type="text/javascript">
			window.onload = function(){
				alert("수정 성공");
				location.href="/MyCGV/showPlaceList.do?theater_code=${param.theater_code}";
			}
		</script>
	</c:if>
	<c:if test="${su <= 0 }">
		<script type="text/javascript">
			window.onload = function(){
				alert("수정 실패");
				history.back();
			}
		</script>
	</c:if>
</head>
<body>

</body>
</html>