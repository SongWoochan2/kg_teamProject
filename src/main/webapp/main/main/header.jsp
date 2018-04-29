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
	<div class="header_main_div">
		<div id="left_div1">
			<a href="#"> <img alt="" src="/MyCGV/image/header/header_cgv.png"
				width="30px" height="30px">CGV APP
			</a>| <a href="#"><img alt=""
				src="/MyCGV/image/header/header_face.png" width="20px" height="20px">
				Face </a> | <a href="#"> <img alt=""
				src="/MyCGV/image/header/header_insta.png" width="20px" height="20px">
				Insta
			</a>
		</div>
		<div id="mid_div1" class="layer_fixed">
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
				<a href="#">고객센터</a> 
				<a href="#"><strong>ENGLISH TICKETING</strong></a>
			</p>
		</div>

		<div id="right_div2"></div>
		<div id="header_main">
			<ul class="menu">
				<li class="te"><a href="#">영화</a>
					<ul class="sub">
						<li><a href="../movie/movieChart.do">영화순위 | </a></li>
						<li><a href="../movie/movieFinder.do?pg=1">영화검색 | </a></li>
						<li><a href="../movie/movieReview.do">평점메인 </a></li>
					</ul></li>
				<li class="te"><a href="reserve.do?pg=1">예매</a></li>
				<li class="te"><a href="#">극장</a>
				<li class="te"><a href="#">스토어</a></li>
			</ul>
		</div>
	</div>
</body>
</html>