<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/MyCGV/css/header/header.css" />
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 모든 서브 메뉴 숨기기
		$("ul.menu > li > .sub").hide();

		$("ul.menu > li").hover(function() {
			// 마우스가 올라간 현재 요소의 하위요소 중에서 ".sub"클래스를 갖는 요소를 찾는다.
			// 찾아낸 요소에게 slideDown 애니메이션을 적용한다.
			$(this).find(".sub").slideDown(0);
		}, function() {
			// 모든 서브 메뉴에 대하여 숨김처리
			$("ul.menu > li > .sub").slideUp(0);
		});
	});
</script>
</head>
<body>
<div id="full_content_wrap">
	<div class="header_main_div">
		<div id="top_menu_box">
			<div id="top_left_div">
				<a href="#"> 
					<img alt="" src="/MyCGV/image/logo/moviet_logo.png" width="60px" height="30px">
					MovieT APP
				</a> | 
				<a href="#">
					<img alt=""src="/MyCGV/image/header/header_face.png" width="20px" height="20px">
					Face 
				</a> | 
				<a href="#"> 
					<img alt="" src="/MyCGV/image/header/header_insta.png" width="20px" height="20px">
					Insta
				</a>
			</div>
			<div id="top_right_div">
				<p>
					<c:if test="${ sessionScope.memId == null }">
						<a href="/MyCGV/member/memberLoginForm.do"><strong>로그인 | </strong></a> 
						<a href="/MyCGV/member/memberWriteForm.do"><strong>회원가입 | </strong></a>
						<a href="/MyCGV/member/memberLoginForm.do"><strong>My MoveIt | </strong></a>  
					</c:if>
					<c:if test="${ sessionScope.memId != null }">
						<a href="/MyCGV/member/memberLogout.do"><strong>로그아웃 | </strong></a>
						<a href="/MyCGV/mypage/mypageHome.do"><strong>My MoveIt | </strong></a> 
					</c:if>
					<a href="/MyCGV/main/inquiry/inquiryWriteForm.do"><strong>고객센터</strong></a> 
					<a href="#"><strong>ENGLISH TICKETING</strong></a>
				</p>
			</div>
		</div>
		
		<div id="header_main">
			<div id="main_inner">
				<div id="inner_left">
					<a href="/MyCGV/main/main/index.jsp"><img id="header_logo_img" alt="로고이미지" src="/MyCGV/image/logo/moviet_logo.png"></a>
				</div>
				<div id="inner_center">
					<ul class="menu">
						<li class="te"><a href="/MyCGV/main/movie/movieChart.do">영화</a></li>
						<li class="te"><a href="/MyCGV/main/movie/movieFinder.do">검색</a></li>
						<li class="te"><a href="/MyCGV/main/movie/movieReview.do">리뷰 </a></li>
						<li class="te"><a href="/MyCGV/main/reserve.do?pg=1">예매</a></li>
						<li class="te"><a href="#">극장</a>
						<li class="te"><a href="/MyCGV/main/movie/movieFinder.do">검색</a></li>
						<li class="te"><a href="/MyCGV/main/movie/movieReview.do">리뷰 </a></li>
						<li class="te"><a href="/MyCGV/reserve.do">예매</a></li>
						<li class="te"><a href="/MyCGV/main/theater/theater.jsp">극장</a>
						<li class="te"><a href="/MyCGV/main/store/store.do?type=set">스토어</a></li>
					</ul>
				</div>
				<div id="inner_right">
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>