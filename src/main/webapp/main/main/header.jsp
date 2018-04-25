<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/header/header.css" />
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
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
	<div>
		<div id="left_div1" >
			<a href="#">
			<img alt="" src="../../image/header/header_cgv.png"
				width="30px" height="30px">CGV APP </a>| <a href="#"><img
				alt="" src="../../image/header/header_face.png" width="20px" height="20px">
				Face
				</a>
				 | 
				 <a href="#">
				 <img alt="" src="../../image/header/header_insta.png"
				width="20px" height="20px">
				 Insta
				 </a>
		</div>
		<div id="mid_div1">
			<p>
				<a href="http:www.naver.com"><strong>로그인 | </strong></a> <a href="#"><strong>회원가입
						| </strong></a> <a href="http:dau"><strong>My CGV | </strong></a> <a href="#">고객센터
					| </a> <a href="#"><strong>ENGLISH TICKETING</strong></a>
			</p>
		</div>

		<div id="right_div2"></div>
		<div id="header_main">
			<ul class="menu">
				<li class="te">
					<a href="#">영화</a>
					<ul class="sub">
						<li><a href="../movie/movieChart.do">영화순위 | </a></li>
						<li><a href="../movie/movieFinder.do">영화검색 | </a></li>
						<li><a href="../movie/movieReview.do">평점메인 </a></li>
					</ul>
				</li>
				<li class="te">
					<a href="#">예매</a>
				</li>
				<li class="te">
					<a href="#">극장</a>
					<ul class="sub">
						<li>
							<a href="#">교통안내</a>
						</li>
					</ul>
				</li>
				<li class="te">
					<a href="#">스토어</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>