<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${requestScope.insert_Result == 0 }">
	<script type="text/javascript">
		alert("리뷰 삭제 실패!");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.update_Score == 0 }">
	<script type="text/javascript">
		alert("점수 업데이트 실패");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.update_Num == 0 }">
	<script type="text/javascript">
		alert("평가자 업데이트 실패");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.insert_Result > 0 && requestScope.update_Num > 0 && requestScope.update_Score > 0}">
	<c:if test="${requestScope.pagetype == 'moviereview' }">
		<script type="text/javascript">
			alert("리뷰가 작성되었습니다.");
			location.href = "movieReview.do?movie_pg=${requestScope.movie_pg}&movie_code=${requestScope.movie_code}";
		</script>
	</c:if>
	<c:if test="${requestScope.pagetype == 'movieinfo' }">
		<script type="text/javascript">
			alert("리뷰가 작성되었습니다.");
			location.href = "movieDetailView.do?trailer_pg=${requestScope.trailer_pg}&photo_pg=${requestScope.photo_pg}&movie_code=${requestScope.movie_code}";
		</script>
	</c:if>
</c:if>
<body>
	insert_Result : ${requsetScope.insert_Result}
	movie_pg : ${requestScope.movie_pg}
	movie_code : ${requestScope.movie_code}
</body>
</html>