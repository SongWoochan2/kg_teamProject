<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieInfo.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../script/movieScript.js?v=1"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		
		
		
		$("a#movie_like").click(function() {
			if(${sessionScope.memId == null} == true){
				alert("먼저 로그인 해주세요.");				
				return false;
			}
		});
		
		$("a#like_check").click(function() {
			if(${sessionScope.memId == null} == true){
				alert("먼저 로그인 해주세요.");				
				return false;
			}
		});
		
		
	});
</script>
<style type="text/css">
	#currentPaging{
		color : red;
		font-weight: bold;
	}
	#paging{
		color : white;
	}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="moviepage">
		<div id = "pagenevi">
			<span class="glyphicon glyphicon-home"></span>
			<a href = "../main/movieMain.do">홈</a> > 영화 > <b>영화 상세</b>
		</div>
		<div id="head-title">
			 &nbsp;영화상세
			<hr>
		</div>
		<div id="middle">
			<div id="movieContent">
				<div id="movieposter">
					<img src="../../image/storage/moviephoto/${poster_addr.movie_photo_addr }">
				</div>
				<div id=movieinfo>
					<div id="movietitle"> <div id = "title-font">${movieDTO.movie_name }(평점 : 
					<c:if test="${movieDTO.movie_evaluat_num == 0}">
						평점 없음
					</c:if>
					<c:if test="${movieDTO.movie_evaluat_num != 0}">
						평점 : ${fn:substring( ''+(movieDTO.acc_evaluat_score / movieDTO.movie_evaluat_num),0,4) } 점
					</c:if>
					)</div></div>
					<div id="moviescore"><font color="gray"><b>예매율 : </b></font>${fn:substring( ''+(requestScope.reserve_rate),0,4) } %(실 관람객 : ${movieDTO.acc_audience_num } 명)</div>
					<div id="spec">감독 : ${movieDTO.movie_director }&nbsp;/ 배우 : ${movieDTO.appear_actor } <br>
					장르 : ${movieDTO.movie_type1 } ${movieDTO.movie_type2 } ${movieDTO.movie_type3 }&nbsp;/ 연령제한 : ${movieDTO.movie_show_grade_name } /&nbsp;상영 시간 : ${movieDTO.movie_recycle_time }분 /&nbsp;제작국가 : ${movieDTO.make_nation }<br>
					개봉 : ${movieDTO.movie_open_date }</div>
					<div id="like">
						<c:if test="${requestScope.like_able == 1 }">
						<a href="selectLike.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}&good=-1" id="movie_like" class="btn btn-info btn-lg">
          				<span class="glyphicon glyphicon-thumbs-down"></span> unLike </a> 
						</c:if>
						<c:if test="${requestScope.like_able == 0 }">
						<a href="selectLike.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}&good=1" id="movie_like" class="btn btn-info btn-lg">
          				<span class="glyphicon glyphicon-thumbs-up"></span> Like </a> 
						</c:if>
       					<b>${movieDTO.good_num }</b> 명 &nbsp;&nbsp;&nbsp;
       					 <a href="../../reserve.do?movie_code=${movieDTO.movie_code }" class="btn btn-info btn-lg"><span class = "glyphicon glyphicon-phone-alt"></span> 예매하기</a>
					</div>
				</div>
			</div>
			<div id="moviestore">
			<font>줄거리</font><p>
				<pre>${movieDTO.movie_content }</pre>
			</div>
		</div>
		<div id="movietrailer">
			<div id = "trailer-title">
			<c:if test="${t_moviePage.pg>1 }">
					<a href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg-1}&review_pg=${e_moviePage.pg}" class="btn btn-info btn-lg">
		         		 <span class="glyphicon glyphicon-menu-left"></span>
		        	</a>
			</c:if>
			&emsp;<b>트레일러</b>&emsp;
			<c:if test="${t_moviePage.pg<t_moviePage.totalPage}">
					<a href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg+1}&review_pg=${e_moviePage.pg}" class="btn btn-info btn-lg">
		         		 <span class="glyphicon glyphicon-menu-right"></span>
		        	</a>
			</c:if>
			</div>
			<div id = "trailer-content">
			<c:forEach var="trailer_list" items="${requestScope.trailer_list }">
				<div id = "trailer-entity">
					<div id = "trailer-top"></div>
					<div id = "trailer-name">
						<span class="glyphicon glyphicon-film"></span> ${trailer_list.movie_trailer_name }
					</div>
					<div id = "trailer-addr">
						<iframe src="${trailer_list.movie_trailer_addr}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
					<div id = "trailer-bottom"></div>
				</div>
			</c:forEach>
				
			</div>
		</div>
		<div id="moviesteelcut">
			<div id = "steelcut-title">
				<c:if test="${p_moviePage.pg>1 }">
					<a href="movieDetailView.do?photo_pg=${p_moviePage.pg-1}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}" class="btn btn-info btn-lg">
		         		 <span class="glyphicon glyphicon-menu-left"></span>
		        	</a>
				</c:if>
			&emsp;<b>스틸컷</b>&emsp;
				<c:if test="${p_moviePage.pg<p_moviePage.totalPage}">
					<a href="movieDetailView.do?photo_pg=${p_moviePage.pg+1}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}" class="btn btn-info btn-lg">
		         		 <span class="glyphicon glyphicon-menu-right"></span>
		        	</a>
				</c:if>
			</div>
			<div id = "steelcut-content">
				<c:forEach var="photo_list" items="${requestScope.photo_list }">
				<div id='glayLayer'></div><div id='overLayer' ></div>
					<div id = "steelcut-entity">
						<a href="../../image/storage/moviephoto/${photo_list.movie_photo_addr}" class="photoview">
							<img src = "../../image/storage/moviephoto/${photo_list.movie_photo_addr }">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="moviereview">
			<div id = "review-title">
				<div id = "left">실관람객평점 ▶</div><div id="right">영화를 보시고 평점을 남겨주세요. <a class="btn btn-info btn-lg" id="reviewInsert">평점 작성</a></div>
			</div>
			
			<div id = "review-content">
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
							<input type="hidden" name = "movie_code" id ="movie_code" value="${movieDTO.movie_code }">
							<input type="hidden" name = "photo_pg" id ="photo_pg" value="${p_moviePage.pg }">
							<input type="hidden" name = "trailer_pg" id ="trailer_pg" value="${t_moviePage.pg }">
						</div>

						<div id="review_content">
							<label for="comment">Comment:</label>
	  						<textarea class="form-control" rows="5" id="comment" name="evaluat_content" style="resize: none;" maxlength="500" required="required"></textarea>
						</div>
					</form>
				</div>
				<!-- 반복문 구간 -->
				<c:forEach var="evaluat_list" items="${requestScope.evaluat_list }">
				<div id = "review-info">
					<div id = "evaluate_score">
						<c:if test="${evaluat_list.evaluat_score == '10' }">★★★★★</c:if>
						<c:if test="${evaluat_list.evaluat_score == '8' }">★★★★☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '6' }">★★★☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '4' }">★★☆☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '2' }">★☆☆☆☆</c:if>
						<c:if test="${evaluat_list.evaluat_score == '1' }">☆☆☆☆☆</c:if>
					</div>
					<div id = "evaluate_id">
						${evaluat_list.evaluat_id }
						<c:if test="${evaluat_list.evaluat_id == sessionScope.memId}">
							<a href = "reviewDelete.do?movie_code=${evaluat_list.movie_code }&evaluat_code=${evaluat_list.evaluat_code }&photo_pg=${p_moviePage.pg}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}">[삭제]</a>
						</c:if>
					</div>
					<div id = "evaluate_content">
						${evaluat_list.evaluat_content }
					</div>
					<div id = "evaluate_date">
						${evaluat_list.evaluat_date }
					</div>
					<div id = "evaluate_like">
						<a href="reviewLike.do?movie_code=${evaluat_list.movie_code }&evaluat_code=${evaluat_list.evaluat_code }&photo_pg=${p_moviePage.pg}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg}" id = "like_check">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> ${evaluat_list.evaluat_like_num }
					</div>
				</div>
				</c:forEach>
			</div>
			<div id = "review-page">
				<c:if test="${e_moviePage.startPage>1 }">
				[<a id="paging" href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg-1}">이전</a>]
				</c:if> 
				<c:forEach var="i" begin="${e_moviePage.startPage}" end="${e_moviePage.endPage}" step="1">
					<c:if test="${e_moviePage.startPage==i }">
						[<a id="currentPaging" href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${i}">${i }</a>]
					</c:if>
					<c:if test="${e_moviePage.startPage!=i }">
						[<a id="paging" href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${i}">${i }</a>]
					</c:if>	<!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:forEach> 
				<c:if test="${e_moviePage.endPage<e_moviePage.totalPage}">
					[<a id="paging" href="movieDetailView.do?photo_pg=${p_moviePage.pg}&movie_code=${movieDTO.movie_code}&trailer_pg=${t_moviePage.pg}&review_pg=${e_moviePage.pg+1}">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 -->
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>