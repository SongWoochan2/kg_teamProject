<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		alert("리뷰가 작성되었습니다.");
		location.href = "movieReview.do?movie_pg=${requestScope.movie_pg}&movie_code=${requestScope.movie_code}";
	</script>
<body>
	insert_Result : ${requsetScope.insert_Result}
	movie_pg : ${requestScope.movie_pg}
	movie_code : ${requestScope.movie_code}
</body>
</html>