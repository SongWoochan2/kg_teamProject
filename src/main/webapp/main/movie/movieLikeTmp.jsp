<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${requestScope.pagetype == 'mainindex' }">
	<script type="text/javascript">
		location.href = "../main/movieMain.do?movie_code=${requestScope.movie_code}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'movieinfo' }">
	<script type="text/javascript">
		location.href = "movieDetailView.do?photo_pg=${requestScope.photo_pg}&trailer_pg=${requestScope.trailer_pg}&movie_code=${requestScope.movie_code}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'moviereview' }">
	<script type="text/javascript">
		location.href = "movieReview.do?review_pg=${requestScope.review_pg}&movie_pg=${requestScope.movie_pg}&movie_code=${requestScope.movie_code}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'wishlist' }">
	<script type="text/javascript">
		location.href = "../../mypage/myWishList.do?movie_code=${requestScope.movie_code}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'movieNonOpenRank' }">
	<script type="text/javascript">
		location.href = "movieChart.do?movie_code=${requestScope.movie_code}&pg=${requestScope.chart_pg}&chartType=${requestScope.pagetype}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'movieScoreRank' }">
	<script type="text/javascript">
		location.href = "movieChart.do?movie_code=${requestScope.movie_code}&chartType=${requestScope.pagetype}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'movieAudienceRank' }">
	<script type="text/javascript">
		location.href = "movieChart.do?movie_code=${requestScope.movie_code}&chartType=${requestScope.pagetype}";
	</script>
</c:if>
<c:if test="${requestScope.pagetype == 'movieReserveRank' }">
	<script type="text/javascript">
		location.href = "movieChart.do?movie_code=${requestScope.movie_code}&chartType=${requestScope.pagetype}";
	</script>
</c:if>
</html>