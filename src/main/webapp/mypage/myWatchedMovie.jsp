<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/myWatchedMovie.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
   $(function() {
        $("div#myWatchedMovie").attr("class", "on");	
        var originImgAddr = $("#origin_img_addr").val();
        if(originImgAddr == null || originImgAddr == "none.png" || originImgAddr.includes("none.")) {
        	$(".profile > img").attr("src", "../image/profile/none.png");
        } else {
        	$(".profile > img").attr("src", "../image/profile/"+originImgAddr);
        }
        
       // var show_date = $("#show_date").val().split('.');
		// 년도 별로 본 영화 검색



    });
})(jQuery);
</script>
</head>
<body>
<jsp:include page="../main/main/header.jsp"></jsp:include>
<div id="mypageBody">
	<div id="myWatchedMovie-wrap">
		<div class="col-aside">
			<div class="profile">
				<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
				<img src="" alt="${memberDTO.member_name}님 프로필 사진" 
				onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				<br><br>
				<strong style="font-size:25px;">${memberDTO.member_name}님</strong><br>
				<strong>${memberDTO.nick_name}</strong>
			</div>
			<div id="wishlist">
				<a href="myWishList.do">
				<strong style="font-size:40px;">0<!-- select count wishlist 찜 갯수만 꺼내면 됨--></strong><br>
				<strong>위시리스트</strong>
				</a>
			</div>
			<div id="myWatchedMovie">
				<a href="myWatchedMovie.do?p=1">
				<strong style="font-size:40px;">${totalWatch}</strong><br>
				<strong>내가 본 영화</strong>
				</a>
			</div>
<!-- 			<div id="moviediary">
				<a href="#">
				<strong>0</strong><br>
				<strong>무비 다이어리</strong>
				</a>
			</div> -->
		</div>
		<div class="movielog-detail-wrap">
	        <!-- Title & Button Combo -->
            <form id="form1" method="get" novalidate="novalidate">
	            <div class="tit-mypage">
		            <h3>내가 본 영화</h3>
		            <h4>${totalWatch}건</h4>
		            <div class="set-combo">
		            	<input type="hidden" id="show_date" value="${memberWatchedListDTO.show_date}">
		                <select id="year" name="year">
		                    <option value="" selected="selected">전체</option>
							<option value="2010">2010</option>
                      		<option value="2011">2011</option>
                      		<option value="2012">2012</option>
                      		<option value="2013">2013</option>
                      		<option value="2014">2014</option>
                      		<option value="2015">2015</option>
                      		<option value="2016">2016</option>
                      		<option value="2017">2017</option>
                      		<option value="2018">2018</option>
		                </select>
		                <button type="submit" class="round gray"><span>GO</span></button>
                        <!-- <a href="/movies/point/my-list.aspx" class="round red on"><span>내 평점 보기</span></a> -->
		            </div>
		        </div>
            </form>
            
		    <!-- 내가 본 영화 리스트 -->	    
		    <div class="sect-movielog-lst">
		    	<ul id="watched_list_container">
		    	<c:if test="${empty watchedList}">
					<li class="movie_info_nodata">
		    			<strong>MovieT에서 관람하신 영화가 없습니다. 오늘 영화 한 편 어떠세요?</strong>
		    		</li>
		    	</c:if>
		    	<!-- foreach 시작 -->
		    	<c:if test="${not empty watchedList}">
		    	<c:forEach var="memberWatchedListDTO" items="${watchedList}">
					<li class="movie_info_${memberWatchedListDTO.reserve_code}">
                    	<div class="article-movie-info">
                    		<div class="box-image">
                    			<a id="phototicket_popup_${memberWatchedListDTO.reserve_code}" title="영화 상세 정보 페이지 이동" 
                    			href="../main/movie/movieDetailView.do?photo_pg=1&movie_code=${memberWatchedListDTO.movie_code}&photo_pg=1&trailer_pg=1">
				                <span class="thumb-image"> 
				                <img alt="${memberWatchedListDTO.movie_name} 포스터" 
				                src="../image/storage/moviephoto/${memberWatchedListDTO.movie_photo_addr}" 
				                onerror="errorImage(this)" width="130px" height="180px">
                                <%-- <span class="ico-grade">${memberWatchedListDTO.movie_show_grade_name}</span> --%>
                                <!-- 상영등급 -->
                                <i></i>
				                </span> 
				                </a> 
				            </div>
				            <div class="box-contents">
				                <div class="title"> 
				                	<a href="../main/movie/movieDetailView.do?photo_pg=1&movie_code=${memberWatchedListDTO.movie_code}&photo_pg=1&trailer_pg=1">
                                    <strong id="strong_${memberWatchedListDTO.reserve_code}">
                                    ${memberWatchedListDTO.movie_name}</strong>
                                    </a>
				                </div>
 								<p class="date">
 									${memberWatchedListDTO.show_date}&nbsp; 
 									${memberWatchedListDTO.show_time}:${memberWatchedListDTO.show_minute}&nbsp;
 									(${memberWatchedListDTO.movie_recycle_time}분)</p>
				                <p class="theater">
				                	${memberWatchedListDTO.theater_name}&nbsp;
				                	${memberWatchedListDTO.show_place_name}&nbsp;
				                 	/&nbsp;${memberWatchedListDTO.count_seats}명</p>
<!--                                 <ul class="writerinfo" id="wid_320883363">                                        
	                            	<li class="writer-opinion">
                                    	<a class="link-gradewrite" id="wIdx_320883363" href="javascript:void(0);" data-movieidx="80090" data-movietitle="신과함께 죄와벌">이 영화를 평가해주세요</a>
                                    </li>
                                </ul> -->
                           	</div>
<!-- 				            <div class="set-btn">
                                <a href="/user/movielog/diary.aspx?widx=320883363" class="round inblack"><span>무비다이어리 쓰기</span></a>
                            </div> -->
				    	</div>
				    </li>
			    </c:forEach>
				</c:if>   
				<!-- foreach 끝 -->    
			    </ul>
			    	<div class="paging">
						<c:if test="${startPageWatch>5 }">
							<a id="paging" href="myWatchedMovie.do?p=${startPageWatch-1 }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${startPageWatch}" end="${endPageWatch}">
							<c:if test="${i==p }">
							<a id="currentPaging" href="myWatchedMovie.do?p=${i }">${i }</a>
							</c:if>
							<c:if test="${i!=p }">
							<a id="paging" href="myWatchedMovie.do?p=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPageWatch < totalPWatch }">
							<a id="paging" href="myWatchedMovie.do?p=${endPageWatch+1 }">다음</a>
						</c:if>	
					</div>
				</div>           
	    	</div>
		</div>
	</div>
<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>