<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
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
<style type="text/css">
/** 목록의 기본 속성 초기화 */
#header_main ul {
	margin: 0;
	padding: 0;
	list-style: none;
}
/** 목록 아이템의 가로 배치 및 크기와 배경이미지 지정 */

ul{
	margin: 0;
	padding: 0;
}
#header_main ul.menu li {
		
		float: left;
		width: 178px;
		height: 50px;
		
	}
#header_main ul.menu{
	margin-left:440px;
}

#header_main ul.menu li.te{
	margin-top: 49px;
}

/** 메뉴의 링크에 대한 크기 지정 및 글자 꾸미기 */
#header_main ul.menu li a {
	display: block;
	width: 100%;
	height: 100%;
	line-height: 48px;
	text-align: center;
	font-weight: bold;
	color: #363636;
	font-size:18px;
	text-decoration: none;

}
/** 마우스가 올라간 링크에 대한 배경이미지 변경 */
#header_main ul.menu li a:hover {
color: white;
	background: url("../image/btn_over.png");
}
/** 가로 배치에 사용된 float 속성 해제 */
#header_main ul.menu:after {
content: '';
	display: block;
	clear: both;
	float: none;
}

#left_div1 {
	margin-left: 20px;
	text-align: center;
	width: 30%;
	float: left;
	line-height: 5px;
	font-size: 10px;
}

#mid_div1 {
	text-align: right;
	width: 90%;
	line-height: 30px;
}

#right_div2 {
	width: 5%
}

a {
	text-decoration: none;
	font-size: 10px;
	color: #BDBDBD;
}

a:visited {
	color: blue;
}

a:active {
	color: red;
}

a:hover {
	color: #8C8C8C;
}

#test {
	margin-top: -30px;
}

#header_main {
	height: 125px;
	background-image: url('../image/header_main1.png');
	width: 100%;
	background-repeat: none;
	margin: 0 auto auto auto;
}

#header_main #header_main2 {
	float: left;
}


ul{
	padding: 0;
	margin: 0;
}



</style>
</head>
<body>
	<div>
		<div id="left_div1">
			<a href="#"><img id="test" alt="" src="../image/header_cgv.png"
				width="30px" height="30px">CGV APP </a>| <a href="#"><img
				alt="" src="../image/header_face.png" width="20px" height="20px">
				Face</a> | <a href="#"><img alt="" src="../image/header_insta.png"
				width="20px" height="20px"> Insta</a>
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
						<li><a href="#">영화순위</a></li>
						<li><a href="#">영화검색</a></li>
						<li><a href="#">평점메인</a></li>
					</ul>
				</li>
				<li class="te">
					<a href="#">예매</a>
				</li>
				<li class="te">
					<a href="#">극장</a>
					<ul class="sub">
						<li>
							<a href="#">상영시간표</a>
						</li>
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