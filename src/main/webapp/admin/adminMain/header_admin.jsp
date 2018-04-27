<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyCGV/css/header/header.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js?v=1"></script>
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
	.sub li a {
		font-size: 15px;
	}
</style>
</head>
<body>
	<div>
		<c:if test="${sessionScope.admin_id == null }">
			<a href = "../adminMain/adminLoginForm.do">로그인</a>
		</c:if>
		<c:if test="${sessionScope.admin_id != null }">
			<a>${sessionScope.admin_id} 관리자님 </a><a> | </a>
			<a href = "../adminMain/adminLogout.do">로그아웃</a><a> | </a><a href = "#">관리자정보수정</a><a> | </a><a href = "#">관리자등록관리</a>
		</c:if>

		<div id="right_div2"></div>
		<div id="header_main">
			<ul class="menu">
				<li class="te">
					<a href="#">회원관리</a>
					<ul class="sub">
						<li><a href="#">문의내역 | </a></li>
						<li><a href="#">공지사항 | </a></li>
						<li><a href="#">기타 </a></li>
					</ul>
				</li>
				<li class="te">
					<a href="#">등록 리스트</a>
					<ul class="sub">
						<li>
							<a href="/MyCGV/admin/movie/movieAdmin.do?pg=1">영화관리</a>
							<a href="#">상영관리</a>
							<a href="/MyCGV/admin/theater/theaterList.do?pg=1">극장관리</a>
							<a href="/MyCGV/admin/productboard/productboardList.do?pg=1">스토어관리</a>
						</li>
					</ul>
			</ul>
		</div>
	</div>
</body>
</html>