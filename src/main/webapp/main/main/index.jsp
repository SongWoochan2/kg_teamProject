<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	$(function(){
		$("a#movie_like").click(function() {
			if(${sessionScope.memId == null} == true){
				alert("먼저 로그인 해주세요.");				
				return false;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "mainpage">
		<div id = "mainback">
			<div id="main">
				<iframe src="https://www.youtube.com/embed/fFIEddn_sow?ecver=1&autoplay=1&loop=1"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
		</div>
		
		<div id = "mainbottomback">
			현재 상영중인 영화 TOP3<hr>
			<div id = "mainbottom">
			<c:forEach var="movie_list" items="${requestScope.movie_list }">
				<div id="entity">
					<div id="entity-poster">
						<c:forEach var ="poster_map" items="${requestScope.poster_map }" >
								<c:if test="${poster_map.key == movie_list.movie_code }">
									<img src = "../../image/storage/moviephoto/${poster_map.value }">
								</c:if>
						</c:forEach>
					</div>
					<div id="entity-name">
						<a href="../movie/movieDetailView.do?movie_code=${movie_list.movie_code }">${movie_list.movie_name }</a>
							<c:forEach var ="average_map" items="${requestScope.average_map }" >
								<c:if test="${average_map.key == movie_list.movie_code }">
									<a id ="movie-score">( 
									<c:if test="${average_map.value == 'NaN'}">
										평점 없음
									</c:if>
									<c:if test="${average_map.value != 'NaN'}">
										평점 : ${average_map.value } 점
									</c:if>)</a>
								</c:if>
							</c:forEach>
					</div>
					<div id="entity-opendate">
						${movie_list.movie_open_date } 개봉&emsp;
							<font>예매율</font> 
							<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
								<c:if test="${movie_list.movie_code == reserve_rate_map.key }">
										${reserve_rate_map.value} %
								</c:if>
							</c:forEach>
					</div>
					<div id="entity-like">
							<c:forEach var ="average_map" items="${requestScope.average_map }" >
								<c:if test="${average_map.key == movie_list.movie_code }">
									<a id ="movie-score">( 
									<c:if test="${average_map.value == 'NaN'}">
										평점 없음
									</c:if>
									<c:if test="${average_map.value != 'NaN'}">
										평점 : ${average_map.value } 점
									</c:if>)</a>
								</c:if>
							</c:forEach>
							<c:forEach var ="like_map" items="${requestScope.like_map }" >
								<c:if test="${like_map.key == movie_list.movie_code }">
									<c:if test="${like_map.value == 1}">
										<a href = "../movie/selectLike.do?movie_code=${movie_list.movie_code }&good=-1&pagetype=mainindex" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
									</c:if>
									<c:if test="${like_map.value == 0}">
										<a href = "../movie/selectLike.do?movie_code=${movie_list.movie_code }&good=1&pagetype=mainindex" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
									</c:if>
								</c:if>
							</c:forEach>
						<b>${movie_list.good_num }명 </b>
							<a href="../../reserve.do?movie_code=${movie_list.movie_code }" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
			</c:forEach>
				
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>