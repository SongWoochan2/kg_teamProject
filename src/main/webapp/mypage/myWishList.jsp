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
(function ($) {
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
})(jQuery);
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
				<div id="wish_right_div_div">
			<%-- ${movie_map }
			<c:forEach var ="movie_map" items="${code_list }">
				
			</c:forEach> --%>
			
				<!-- <strong class="wish_right_div_strong">위시리스트가 없습니다.<br>
				무비차트 영화포스터에서 영화 찜하기를 눌러 위시영화를 추가해보세요.</strong> -->


<%-- 이어서해야함
				<div id = "findentity">
					<c:forEach var ="m_code" items="${code_list }">
					 	<c:forEach var ="movie_map" items="${movie_map }">
							<div id = "entity-poster">
								<c:forEach var ="photo_map" items="${requestScope.photo_map }" >
									<c:if test="${photo_map.key == find_list.movie_code }">
										<img src = "../image/storage/moviephoto/${photo_map.value }">
									</c:if>
								</c:forEach>
							</div>
							<div id = "entity-title">
								<a href = "movieDetailView.do?movie_code=${find_list.movie_code }&photo_pg=1&trailer_pg=1">
									<c:if test="${m_code + '_movie_name' == movie_map.key}">
				 	 					${movie_map.value}
				 					</c:if>
								</a>
							</div>
							<div id = "entity-opendate">
								<c:if test="${m_code + '_open_date' == movie_map.key}">
				 	 				${movie_map.value}
				 				</c:if>
							</div>
							<div id = "entity-like">
<!-- 								<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a>
         						<b>
									<c:if test="${m_code +'_good_num' == movie_map.key}">
				 	 					${movie_map.value}
				 					</c:if>
								</b>
								<a href="#" id = "reserve-btn" class="btn btn-info btn-lg" href = "movieDetailView.do?movie_code=${find_list.movie_code }">
          							<span class="glyphicon glyphicon-film"> 예매</span>
        						</a>
							</div>
						</c:forEach>
					</c:forEach> 
				</div> --%>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>