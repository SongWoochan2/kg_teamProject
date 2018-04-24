<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<link href="../css/bootstrap.css" rel = "stylesheet">
	<c:if test="${su > 0 }">
		<script type="text/javascript">
			window.onload = function(){
				alert("수정 성공");
				location.href="/MyCGV/theater.main/theaterView.do?theater_code=" + ${param.theater_code} + "&pg=1";
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

	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
	</div>
</body>
</html>