<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieReview.css" />
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#review-insert").fadeOut(0);
		$("#reviewInsert").click(function(){
			// 배경 레이어를 화면에 표시한다.
			$("#review-insert").toggle(300);
		});
		
		$("a#like_check").click(function() {
			if(${sessionScope.memId == null} == true){
				alert("먼저 로그인 해주세요.");				
				return false;
			}
		});
		
		$("a#movie_like").click(function() {
			if(${sessionScope.memId == null} == true){
				alert("먼저 로그인 해주세요.");				
				return false;
			}
		});
		
		$("#insert-score").text(10);
		
		$("#1").click(function(){
			var n = 1; score(n);
		});

		$("#2").click(function(){
			var n = 2; score(n);
		});

		$("#3").click(function(){
			var n = 3; score(n);
		});

		$("#4").click(function(){
			var n = 4; score(n);
		});

		$("#5").click(function(){
			var n = 5; score(n);
		});
		
		var score = function(n){
			if($("#"+n).val() == '★'){
				for(var i = n; i<=5; i++){$("#"+i).val('☆');}
			}else if($("#"+n).val() == '☆'){
				for(var i = 1; i<=n; i++){$("#"+i).val('★');}}
			for(var i = 1; i<=5; i++){
				if($("#"+i).val() == '★'){$("#insert-score").text(i*2);$("#evaluat_score").val(i*2);}
				else if($("#1").val() == '☆'){$("#insert-score").text(1);$("#evaluat_score").val(1);
				}
			}
		};
		
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "movieReview">
		<div id = "review-title">
			평점
		</div>
		<div id="review-all">
			<div id="review-movie">
			<c:if test="${m_moviePage.pg>1 }">
				<a href = "movieReview.do?movie_pg=${m_moviePage.pg-1 }" class="btn btn-default btn-sm"  id = "leftbtn">
         				<span class="glyphicon glyphicon-triangle-left"></span>
       			</a>
       		</c:if>
       			<c:forEach var ="movie_list" items="${requestScope.movie_list }">
				<div id = "entity">
					<c:if test="${movie_list.movie_code == requestScope.movie_code }">
						<div id = "select-poster">
						<c:forEach var ="poster_map" items="${requestScope.poster_map }" >
								<c:if test="${poster_map.key == movie_list.movie_code }">
									<img src = "../../image/storage/moviephoto/${poster_map.value }">
								</c:if>
						</c:forEach>
						</div>
						<div id = "select-name">
							<a href = "#">${movie_list.movie_name }
							</a>
						</div>
						<div id = "select-reserve">
							<font>예매율</font> 
							<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
								<c:if test="${movie_list.movie_code == reserve_rate_map.key }">
										${reserve_rate_map.value} %
								</c:if>
							</c:forEach>
						</div>
						<div id = "select-opendate">
							${movie_list.movie_open_date }
								<c:forEach var ="average_map" items="${requestScope.average_map }" >
									<c:if test="${average_map.key == movie_list.movie_code }">
										( 
										<c:if test="${average_map.value == 'NaN'}">
											평점 없음
										</c:if>
										<c:if test="${average_map.value != 'NaN'}">
											평점 : ${average_map.value } 점
										</c:if>)&emsp;
									</c:if>
								</c:forEach>
								<c:forEach var ="like_map" items="${requestScope.like_map }" >
									<c:if test="${like_map.key == movie_list.movie_code }">
										<c:if test="${like_map.value == 1}">
											<a href = "selectLike.do?movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg}&movie_code=${movie_list.movie_code }&good=-1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
										</c:if>
										<c:if test="${like_map.value == 0}">
											<a href = "selectLike.do?movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg}&movie_code=${movie_list.movie_code }&good=1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
										</c:if>
									</c:if>
								</c:forEach>
						</div>
						<div id = "select-request">
							<a href="../../reserve.do?movie_code?${movie_list.movie_code }">예매</a>
						</div>
					</c:if>
					<c:if test="${movie_list.movie_code != requestScope.movie_code }">
						<div id = "entity-poster">
						<c:forEach var ="poster_map" items="${requestScope.poster_map }" >
								<c:if test="${poster_map.key == movie_list.movie_code }">
									<img src = "../../image/storage/moviephoto/${poster_map.value }">
								</c:if>
						</c:forEach>
						</div>
						<div id = "entity-name">
							<a href = "movieReview.do?movie_pg=${m_moviePage.pg }&movie_code=${movie_list.movie_code}">${movie_list.movie_name }</a>
						</div>
						<div id = "entity-reserve">
							<font>예매율</font> 
							<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
								<c:if test="${movie_list.movie_code == reserve_rate_map.key }">
										${reserve_rate_map.value} %
								</c:if>
							</c:forEach>
						</div>
						<div id = "entity-opendate">
							${movie_list.movie_open_date }
							<c:forEach var ="average_map" items="${requestScope.average_map }" >
								<c:if test="${average_map.key == movie_list.movie_code }">
									( 
									<c:if test="${average_map.value == 'NaN'}">
										평점 없음
									</c:if>
									<c:if test="${average_map.value != 'NaN'}">
										평점 : ${average_map.value } 점
									</c:if>)&emsp;
								</c:if>
							</c:forEach>
							<c:forEach var ="like_map" items="${requestScope.like_map }" >
								<c:if test="${like_map.key == movie_list.movie_code }">
									<c:if test="${like_map.value == 1}">
										<a href = "selectLike.do?movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg}&movie_code=${movie_list.movie_code }&good=-1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart"></span></a> 
									</c:if>
									<c:if test="${like_map.value == 0}">
										<a href = "selectLike.do?movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg}&movie_code=${movie_list.movie_code }&good=1" class="btn btn-info btn-lg" id="movie_like"> <span class="glyphicon glyphicon-heart-empty"></span></a> 
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<div id = "entity-request">
							<a href="../../reserve.do?movie_code=${movie_list.movie_code }">예매</a>
						</div>
					</c:if>
				</div>
       			</c:forEach>
			<c:if test="${m_moviePage.pg<m_moviePage.totalPage}">
				<a href = "movieReview.do?movie_pg=${m_moviePage.pg+1 }" class="btn btn-default btn-sm"  id = "rightbtn">
          			<span class="glyphicon glyphicon-triangle-right"></span>
        		</a>
       		</c:if>
			</div>
			<div id="review">
				<div id = "left">실관람객평점 ▶</div><div id="right">영화를 보시고 평점을 남겨주세요. <a class="btn btn-info btn-lg" id="reviewInsert">평점 작성</a></div>
				<div id="review-insert">
				<form action="reviewInsert.do" method="post" name = "ReviewInsertForm">
					<div id="review-score">
						<input type = "button" class="btn btn-info btn-lg" id = "1" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "2" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "3" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "4" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "5" value = "★">
						&emsp;<font><label id = "insert-score"></label>점</font>
						&emsp;&nbsp;<button type = "submit" class="btn btn-info btn-lg">리뷰 등록</button>
						<input type="hidden" name = "evaluat_score" id ="evaluat_score" value="10">
						<input type="hidden" name = "movie_code" id ="movie_code" value="${requestScope.movie_code }">
						<input type="hidden" name = "movie_pg" id ="movie_pg" value="${m_moviePage.pg }">
					</div>
					<div id="review_content">
						<label for="comment">Comment:</label>
  						<textarea class="form-control" rows="5" id="comment" name="evaluat_content" style="resize: none;" maxlength="500" required="required"></textarea>
					</div>
				</form>
				</div>
				<c:forEach var ="evaluat_list" items="${requestScope.evaluat_list }">
				<div id="review-content">
					<div id = "score">
						<c:if test="${evaluat_list.evaluat_score == '10' }">★★★★★</c:if>
						<c:if test="${evaluat_list.evaluat_score == '8' }">★★★★☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '6' }">★★★☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '4' }">★★☆☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '2' }">★☆☆☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '1' }">☆☆☆☆☆</c:if>
					</div>
					<div id = "id">
						${evaluat_list.evaluat_id }
						<c:if test="${evaluat_list.evaluat_id == sessionScope.memId}">
							<a href = "reviewDelete.do?movie_code=${evaluat_list.movie_code }&evaluat_code=${evaluat_list.evaluat_code }&movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg }">[삭제]</a>
						</c:if>
					</div>
					<div id = "content">
						${evaluat_list.evaluat_content }
					</div>
					<div id = "date">
						${evaluat_list.evaluat_date }
					</div>
					<div id = "like">
						<a href="reviewLike.do?movie_code=${evaluat_list.movie_code }&evaluat_code=${evaluat_list.evaluat_code }&movie_pg=${m_moviePage.pg }&review_pg=${e_moviePage.pg }" id = "like_check">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> ${evaluat_list.evaluat_like_num }
					</div>
				</div>
				</c:forEach>
				
			</div>
			<div id="review-paging">
				<c:if test="${e_moviePage.startPage>1 }">
				[<a id="paging" href="movieReview.do?review_pg=${e_moviePage.startPage-1}&movie_code=${requestScope.movie_code}&movie_pg=${m_moviePage.pg }">이전</a>]
				</c:if> 
				<c:forEach var="i" begin="${e_moviePage.startPage}" end="${e_moviePage.endPage}" step="1">
					<c:if test="${e_moviePage.pg==i }">
						[<a id="currentPaging" href="movieReview.do?review_pg=${i }&movie_code=${requestScope.movie_code}&movie_pg=${m_moviePage.pg }">${i }</a>]
					</c:if>
					<c:if test="${e_moviePage.pg!=i }">
						[<a id="paging" href="movieReview.do?review_pg=${i }&movie_code=${requestScope.movie_code}&movie_pg=${m_moviePage.pg }">${i }</a>]
					</c:if>	<!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:forEach> 
				<c:if test="${e_moviePage.endPage<e_moviePage.totalPage}">
					[<a id="paging" href="movieReview.do?review_pg=${e_moviePage.endPage+1}&movie_code=${requestScope.movie_code}&movie_pg=${m_moviePage.pg }">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 -->
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>