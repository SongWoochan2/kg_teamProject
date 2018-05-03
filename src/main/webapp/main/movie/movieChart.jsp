<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieChart.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	$(function(){
		$("#chart").hover(function(){
			$("#off").attr("display","none");
			$("#on").attr("display","block");			
		},function(){
			$("#off").attr("display","block");
			$("#on").attr("display","none");			
		});
		$("#show").hover(function(){
			$("#show #off").attr("display","none");
			$("#show #on").attr("display","block");			
		},function(){
			$("#show #off").attr("display","block");
			$("#show #on").attr("display","none");			
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "moviechart">
		<div id="chart-title">
			<div id="title-name">
				무비차트
			</div>
			<div id="chart-type">
				<ul>
					<li id="chart"><a id = "off">무비차트</a><a id = "on">▶무비차트</a></li>				
					<li id="show"><a href ="movieChart.do?chartType=movieNonOpenRank" id = "off">상영예정작</a><a id = "on">▶상영예정작</a></li>
				</ul>
			</div>
		</div>
		<div id="chart-select">
			<div id = "select1">
				<input type = "checkbox" value=""> 현재 상영작만 보기
			</div>
			<div id = "select2">
				<select name = "chart_type">
					<option value="">예매율순</option>
					<option value="">평점순</option>
					<option value="">관람객순</option>					
				</select>
				<input type="button" value = "go" >
			</div>
		</div>
		<div id = "movierank">
			<div class="chart-hr">
				<hr>
			</div>
			<c:forEach var="top_movie_list" items="${requestScope.top_movie_list }" varStatus="status">
				<div id = "movie_top_entity">
					<div id = "movie-rank">NO.${status.count }</div>
					<div id = "movie-poster">
						<c:forEach var="poster_map" items="${requestScope.poster_map }">
							<c:if test="${top_movie_list.movie_code == poster_map.key }">
								<img src = "../../image/storage/moviephoto/${poster_map.value }">
							</c:if>
						</c:forEach>
					</div>
					<div id = "entity-name">${top_movie_list.movie_name }</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">${top_movie_list.movie_open_date } 개봉
					(평점 : 
						<c:forEach var="average_map" items="${requestScope.average_map }">
							<c:if test="${top_movie_list.movie_code == average_map.key }">
								<c:if test="${average_map.value == 'NaN' }">
									평점 없음
								</c:if>
								<c:if test="${average_map.value != 'NaN' }">
									${average_map.value } 점
								</c:if>
							</c:if>
						</c:forEach>)
					</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a>
						<b>${top_movie_list.good_num } 명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
			</c:forEach>
				<div id = "promotion">
					<img src = "../../image/storage/promotion.jpg">
				</div>
				<div class="chart-hr">
					<hr>
				</div>
			<c:forEach var="bottom_movie_list" items="${requestScope.bottom_movie_list }" varStatus="status">
				<div id = "movie_bottom_entity">
					<div id = "movie-rank">
							NO.${status.count+3} 
					</div>
					<div id = "movie-poster">
						<c:forEach var="poster_map" items="${requestScope.poster_map }">
							<c:if test="${bottom_movie_list.movie_code == poster_map.key }">
								<img src = "../../image/storage/moviephoto/${poster_map.value }">
							</c:if>
						</c:forEach>
					</div>
					<div id = "entity-name">${bottom_movie_list.movie_name }</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">${bottom_movie_list.movie_open_date } 개봉 
					(평점 : 
						<c:forEach var="average_map" items="${requestScope.average_map }">
							<c:if test="${bottom_movie_list.movie_code == average_map.key }">
								<c:if test="${average_map.value == 'NaN' }">
									평점 없음
								</c:if>
								<c:if test="${average_map.value != 'NaN' }">
									${average_map.value } 점
								</c:if>
							</c:if>
						</c:forEach>)
					</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a>
						<b>${bottom_movie_list.good_num } 명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>