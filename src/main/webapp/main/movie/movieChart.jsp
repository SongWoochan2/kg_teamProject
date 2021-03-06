<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		if(${requestScope.chartType == 'movieReserveRank'} == true){
			$('#chartType option').eq(0).prop('selected', true); 
		}else if(${requestScope.chartType == 'movieScoreRank'} == true){
			$('#chartType option').eq(1).prop('selected', true); 
		}else if(${requestScope.chartType == 'movieAudienceRank'} == true){
			$('#chartType option').eq(2).prop('selected', true); 
		}
	});
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
	<div id = "moviechart">
		<div id="chart-title">
			<div id="title-name">
				무비차트
			</div>
			<div id="chart-type">
				<ul>
					<li id="chart">
						<c:if test="${requestScope.chartType == 'movieNonOpenRank' }">
							<a href ="movieChart.do?chartType=movieReserveRank" id = "off">무비차트</a>
						</c:if>
						<c:if test="${requestScope.chartType != 'movieNonOpenRank' }">
							<a id = "on">▶무비차트</a>
						</c:if>
					</li>				
					<li id="show">
						<c:if test="${requestScope.chartType != 'movieNonOpenRank' }">
							<a href ="movieChart.do?chartType=movieNonOpenRank&pg=1" id = "off">상영예정작</a>
						</c:if>
						<c:if test="${requestScope.chartType == 'movieNonOpenRank' }">
							<a id = "on">▶상영예정작</a>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
		<div id="chart-select">
			<div id = "select1">
				
			</div>
			<div id = "select2">
				<form method="post" action="movieChart.do" name = "selectType">
					<select id = "chartType" name = "chartType">
						<option value="movieReserveRank">예매율순</option>
						<option value="movieScoreRank">평점순</option>
						<option value="movieAudienceRank">누적관객순</option>					
					</select>
					<input type="submit" value = "go" >
				</form>
			</div>
		</div>
		<div id = "movierank">
			<div id = "movie_list">
			
				<div class="chart-hr">
					<hr>
				</div>
				<c:if test="${requestScope.chartType != 'movieNonOpenRank' }">
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
							<div id = "entity-name"><a href = "movieDetailView.do?movie_code=${top_movie_list.movie_code }">${top_movie_list.movie_name }</a></div>
							<div id = "entity-reserve"><font>예매율</font>
								<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
									<c:if test="${top_movie_list.movie_code == reserve_rate_map.key }">
											${fn:substring( ''+(reserve_rate_map.value),0,4) } %
									</c:if>
								</c:forEach>
							 </div>
							<div id = "entity-opendate">${top_movie_list.movie_open_date } 개봉
							( 
							<c:if test="${top_movie_list.movie_evaluat_num == 0}">
								평점 없음
							</c:if>
							<c:if test="${top_movie_list.movie_evaluat_num != 0}">
								평점 : ${fn:substring( ''+(top_movie_list.acc_evaluat_score / top_movie_list.movie_evaluat_num),0,4) } 점
							</c:if>)
							</div>
							<div id = "entity-like">
								<c:forEach var ="like_map" items="${requestScope.like_map }" >
									<c:if test="${like_map.key == top_movie_list.movie_code }">
										<c:if test="${like_map.value == 1}">
											<a href = "selectLike.do?movie_code=${top_movie_list.movie_code }&pagetype=${requestScope.chartType}&good=-1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
										</c:if>
										<c:if test="${like_map.value == 0}">
											<a href = "selectLike.do?movie_code=${top_movie_list.movie_code }&pagetype=${requestScope.chartType}&good=1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
										</c:if>
									</c:if>
								</c:forEach>
								<b>${top_movie_list.good_num } 명 </b>
									<a href="../../reserve.do?movie_code=${top_movie_list.movie_code }" id = "reserve-btn" class="btn btn-info btn-lg">
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
							<div id = "entity-name"><a href = "movieDetailView.do?movie_code=${bottom_movie_list.movie_code }">${bottom_movie_list.movie_name }</a></div>
							<div id = "entity-reserve"><font>예매율</font> 
								<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
									<c:if test="${bottom_movie_list.movie_code == reserve_rate_map.key }">
											${fn:substring( ''+(reserve_rate_map.value),0,4) } %
									</c:if>
								</c:forEach>
							</div>
							<div id = "entity-opendate">${bottom_movie_list.movie_open_date } 개봉 
							( 
							<c:if test="${bottom_movie_list.movie_evaluat_num == 0}">
								평점 없음
							</c:if>
							<c:if test="${bottom_movie_list.movie_evaluat_num != 0}">
								평점 : ${fn:substring( ''+(bottom_movie_list.acc_evaluat_score / bottom_movie_list.movie_evaluat_num),0,4) } 점
							</c:if>)
							</div>
							<div id = "entity-like">
								<c:forEach var ="like_map" items="${requestScope.like_map }" >
									<c:if test="${like_map.key == bottom_movie_list.movie_code }">
										<c:if test="${like_map.value == 1}">
											<a href = "selectLike.do?movie_code=${bottom_movie_list.movie_code }&pagetype=${requestScope.chartType}&good=-1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
										</c:if>
										<c:if test="${like_map.value == 0}">
											<a href = "selectLike.do?movie_code=${bottom_movie_list.movie_code }&pagetype=${requestScope.chartType}&good=1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
										</c:if>
									</c:if>
								</c:forEach>
								<b>${bottom_movie_list.good_num } 명 </b>
									<a href="../../reserve.do?movie_code=${bottom_movie_list.movie_code }" id = "reserve-btn" class="btn btn-info btn-lg">
		          						<span class="glyphicon glyphicon-film"> 예매</span>
		        					</a>
							</div>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${requestScope.chartType == 'movieNonOpenRank' }">
				<c:forEach var="top_movie_list" items="${requestScope.top_movie_list }">
					<div id = "movie_entity">
						<div id = "movie-poster">
							<c:forEach var="poster_map" items="${requestScope.poster_map }">
								<c:if test="${top_movie_list.movie_code == poster_map.key }">
									<img src = "../../image/storage/moviephoto/${poster_map.value }">
								</c:if>
							</c:forEach>
						</div>
						<div id = "movie-name">
							<a href = "movieDetailView.do?movie_code=${top_movie_list.movie_code }">${top_movie_list.movie_name }</a>
						</div>
						<div id = "movie-info">
							${top_movie_list.movie_open_date } 개봉 
						</div>
						<div id = "movie-reserve">
							<c:forEach var ="like_map" items="${requestScope.like_map }" >
								<c:if test="${like_map.key == top_movie_list.movie_code }">
									<c:if test="${like_map.value == 1}">
										<a href = "selectLike.do?movie_code=${top_movie_list.movie_code }&pagetype=${requestScope.chartType}&chart_pg=${moviePage.pg}&good=-1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
									</c:if>
									<c:if test="${like_map.value == 0}">
										<a href = "selectLike.do?movie_code=${top_movie_list.movie_code }&pagetype=${requestScope.chartType}&chart_pg=${moviePage.pg}&good=1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
									</c:if>
								</c:if>
							</c:forEach>
							&emsp;<b>${top_movie_list.good_num } 명 </b>
						</div>
					</div>
				</c:forEach>
				</c:if>
			</div>
			<div id="movie_page">
				<c:if test="${requestScope.chartType == 'movieNonOpenRank' }">
					<c:if test="${moviePage.startPage>1 }">
						[<a id="paging" href="#">이전</a>]
					</c:if> 
					<c:forEach var="i" begin="${moviePage.startPage}" end="${moviePage.endPage}" step="1">
					<c:if test="${moviePage.startPage==i }">
						[<a id="currentPaging" href="#">${i }</a>]
					</c:if>
					<c:if test="${moviePage.startPage!=i }">
						[<a id="paging" href="#">${i }</a>]
					</c:if>
					<!-- el표현식에는 자바코드가 들어갈수없음 -->
					</c:forEach>
					<c:if test="${moviePage.endPage<moviePage.totalPage}">
						[<a id="paging" href="#">다음</a>]
					</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>