<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myWishList.css" />
<link rel="stylesheet" href="../../css/movie/movieFinder.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   $(function() {
/*         $('#go_edit_profile').on('click', function () {
            var win = window.open("./editProfileForm.do", "profile", "left=0,top=o,width=445,height=440,toolbar=no,scrollbars=no");
            win.focus();
        }); */
        
        var originImgAddr = $("#origin_img_addr").val();
        if(originImgAddr == null || originImgAddr == "none.png" || originImgAddr.includes("none.")) {
        	$(".wish_profileImg > img").attr("src", "../image/profile/none.png");
        } else {
        	$(".wish_profileImg > img").attr("src", "../image/profile/"+originImgAddr);
        }
    });
   
   $(function(){
	   $("#wishlist_bt").click(function(){
		   alert("hello!");
	   });
	   
   });
</script>
</head>
<body>
<jsp:include page="../main/main/header.jsp"></jsp:include>
<div class="myWishList_top_div">
	<div class="left_right_tong">
		<div class="wish_left_div">
			<div class="wish_profileImg">
				<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
				<img id="profile_img" src="" alt="${memberDTO.member_name}님 프로필 사진" 
				onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				<br><br>
				<strong id="wish_strong_tag1">${memberDTO.member_name}</strong><strong>님</strong>
			</div>
			<a href="myWishList.do">
			<div id="wish_wishlist">
				<strong>0</strong><br>
				<strong>위시 리스트</strong>
			</div>
			</a>
			<a href="myWatchedMovie.do">
			<div id="wish_mytheater">
				<strong>0</strong><br>
				<strong>내가 본 영화</strong>
			</div>
			</a>
			<a href="#">
			<div id="wish_moviediry">
				<strong>0</strong><br>
				<strong>무비 다이어리</strong>
			</div>
			</a>
		</div>
			<div class="wish_right_div">
				<div id="wish_right_div_lefttop">
					<strong class="wish_right_div_strong">위시리스트</strong> 0건	
				</div>
			
				<div id="wish_right_div_righttop">
					<select>
	      		 		<option value="서버로 넘길 값"> 등록일순 </option>
	       			 	<option value="서버로 넘길 값"> 개봉일순 </option>
   			 		</select>
   				 <input type="button" value="GO">
				</div>
			<%-- ${movie_map }
			<c:forEach var ="movie_map" items="${code_list }">
				
			</c:forEach> --%>
				<!-- <strong class="wish_right_div_strong">위시리스트가 없습니다.<br>
				무비차트 영화포스터에서 영화 찜하기를 눌러 위시영화를 추가해보세요.</strong> -->
				<div id = "wish_right_div_div">
					<c:forEach var ="movie" items="${movie_list }">
						<div id = "each_movie_view">
					 		<c:forEach var ="photo" items="${photo_map }">	
								<c:if test="${ photo.key == movie.movie_code }">
									<div id = "entity-poster">
											<img src = "../image/storage/moviephoto/${photo.value }">
						 			</div>
				 				</c:if>
							</c:forEach>
							<div id = "entity-title">
								<a href = "movieDetailView.do?movie_code=${find_list.movie_code }&photo_pg=1&trailer_pg=1">
				 	 				영화이름 : ${movie.movie_name }
								</a>
							</div>
							<div id = "entity-opendate">
				 	 			개봉날짜 : ${movie.movie_open_date}
							</div>
							<div class = "entity-like">
								좋아요 : ${movie.good_num}
							</div>
							<div id= "entity-love_reserve">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         						<a href="#" id="wishlist_bt" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a>
         						<b></b>
								<a href="#" id = "reserve-btn" class="btn btn-info btn-lg" href = "movieDetailView.do?movie_code=${movie.movie_code }">
          							<span class="glyphicon glyphicon-film"> 예매</span>
        						</a>
							</div> 
				 		</div>
					</c:forEach>			
				</div> 
			</div>
		</div>
	</div>
<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>