<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- <link rel="stylesheet" href="/MyCGV/css/header/header.css" /> -->
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
<style type="text/css">
*{
	padding: 0;
	margin: 0;
}
div{
	box-sizing: border-box;
}
/*                               가장 바깥 틀           */
.header_main_div{
	width: 1600px;
	height: 200px;
	margin: 0 auto;
}
.header_main_div a {
	text-decoration: none;
	font-size: 10px;
	color: #BDBDBD;
}
.header_main_div a:visited {
	color: blue;
}

.header_main_div a:active {
	color: red;
}

.header_main_div a:hover {
	color: #8C8C8C;
}
/*                               상단 링크 박스           */
#top_menu_box{
	width: 1200px;
	height: 75px;
	margin: 0 auto;
}
.header_main_div #top_left_div {
	text-align: left;
	width: 30%;
	height: 100%;
	float: left;
	line-height: 100%;
	font-size: 10px;
}
.header_main_div #top_right_div {
	text-align: right;
	width: 100%;
	height: 100%;
	line-height: 100%;
}

/*                               하단 링크 박스           */
.header_main_div #header_main {
	background-image: url('../../image/header/header_main1.png');
	width: 100%;
	height: 125px;
	background-repeat: none;
	
	
}
.header_main_div #main_inner{
	width: 1200px;
	height: 100%;
	margin: 0 auto;
}
#main_inner #inner_left{
	width: 20%;
	height: 100%;
	float: left;
	display:flex;
	align-items: center;
	justify-content: center;
}
/* 로고이미지 삽입 */
#inner_left #header_logo_img{
	width: 200px;
	height: 100px;
}
#main_inner #inner_center{
	width: 60%;
	height: 100%;
	float: left;
	display:flex;
	align-items: center;
	justify-content: center;
}
#main_inner #inner_rigth{
	width: 20%;
	height: 100%;
	float: left;
}


/** 목록 아이템의 가로 배치 및 크기와 배경이미지 지정 */
.header_main_div ul{
	margin: 0;
	padding: 0;
}
.header_main_div .sub li{
	float: left;
}

/** 목록의 기본 속성 초기화 */
.header_main_div #header_main ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

/** 가로 배치에 사용된 float 속성 해제 */
.header_main_div #header_main ul.menu:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

.header_main_div #header_main ul.menu li.te {
	float: left;
/* 	border-left: 1px solid black; 
	border-right: 1px solid black;  */
	/* border-radius: 15px; */
	/* background-color: #FFFADD; */
	width: 110px;
	margin-top: 24px;
}
/** 메뉴의 링크에 대한 크기 지정 및 글자 꾸미기 */
.header_main_div #header_main ul.menu li.te a {
	display: block;
	line-height: 47px;
	text-align: center;
	font-weight: bold;
	color: #363636;
	font-size:18px;
	text-decoration: none;
}
/** 마우스가 올라간 링크에 대한 배경이미지 변경 */
.header_main_div #header_main ul.menu li.te a:hover {
	color: #949494;
}

#full_content_wrap{
	width: 1600px;
	margin: 0 auto;
	border: 1px solid black;
}

</style>	
</head>
<body>
<div id="full_content_wrap">
	<div class="header_main_div">
		<div id="top_menu_box">
			<div id="top_left_div">
				<a href="#"> <img alt="" src="/MyCGV/image/header/header_cgv.png"
					width="30px" height="30px">CGV APP
				</a>| <a href="#"><img alt=""
					src="/MyCGV/image/header/header_face.png" width="20px" height="20px">
					Face </a> | <a href="#"> <img alt=""
					src="/MyCGV/image/header/header_insta.png" width="20px" height="20px">
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
					<a href="#">고객센터</a> 
					<a href="#"><strong>ENGLISH TICKETING</strong></a>
				</p>
			</div>
		</div>
		
		<div id="header_main">
			<div id="main_inner">
				<div id="inner_left">
					<a href="/MyCGV/main/main/index.jsp"><img id="header_logo_img" alt="로고이미지" src="/MyCGV/image/logo/moviet_logo3.png"></a>
				</div>
				<div id="inner_center">
					<ul class="menu">
						<li class="te"><a href="/MyCGV/main/movie/movieChart.do">영화</a></li>
						<li class="te"><a href="/MyCGV/main/movie/movieFinder.do?pg=1">검색</a></li>
						<li class="te"><a href="/MyCGV/main/movie/movieReview.do">리뷰 </a></li>
						<li class="te"><a href="/MyCGV/main/reserve.do?pg=1">예매</a></li>
						<li class="te"><a href="#">극장</a>
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