<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<c:if test="${requestScope.pagetype == 'moviereview' }">
		<script type="text/javascript">
			location.href = "movieReview.do?movie_pg=${requestScope.movie_pg}&review_pg=${requestScope.review_pg}&movie_code=${requestScope.movie_code}";
		</script>
	</c:if>
	<c:if test="${requestScope.pagetype == 'movieinfo' }">
		<script type="text/javascript">
			location.href = "movieDetailView.do?trailer_pg=${requestScope.trailer_pg}&photo_pg=${requestScope.photo_pg}&review_pg=${requestScope.review_pg}&movie_code=${requestScope.movie_code}";
		</script>
	</c:if>
</html>