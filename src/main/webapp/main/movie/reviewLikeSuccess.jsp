<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		location.href = "movieReview.do?movie_pg=${requestScope.movie_pg}&review_pg=${requestScope.review_pg}&movie_code=${requestScope.movie_code}";
	</script>
</html>