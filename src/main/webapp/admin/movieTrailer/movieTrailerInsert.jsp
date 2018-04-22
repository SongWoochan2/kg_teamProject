<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<c:if test="${requestScope.result == 0 }">
		<script>
			alert("입력 실패!");
			history.back();
		</script>
	</c:if>
	<c:if test="${requestScope.result == 1 }">
		<script>
			alert("입력되었습니다.");
			location.href = "movieTrailer.do?pg=${requestScope.pg}&movie_code=${requestScope.movie_code}";
		</script>
	</c:if>
</html>