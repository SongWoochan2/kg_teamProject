<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${requestScope.like_delete_result == 0 }">
	<script type="text/javascript">
		alert("좋아요 삭제 실패!");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.delete_Result == 0 }">
	<script type="text/javascript">
		alert("리뷰 삭제 실패!");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.update_Result == 0 }">
	<script type="text/javascript">
		alert("업데이트 실패");
		history.back();
	</script>
</c:if>
<c:if test="${requestScope.like_delete_result > 0 }">
	<c:if test="${requestScope.delete_Result > 0 }">
		<c:if test="${requestScope.delete_Result > 0 }">
			<script type="text/javascript">
				alert("리뷰가 삭제되었습니다.");
				location.href = "movieReview.do?movie_pg=${requestScope.movie_pg}&review_pg=${requestScope.review_pg}&movie_code=${requestScope.movie_code}";
			</script>
		</c:if>
	</c:if>
</c:if>
</html>