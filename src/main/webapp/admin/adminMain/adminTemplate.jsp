<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/MyCGV/css/bootstrap.css" rel = "stylesheet">
<link rel="stylesheet" href="/MyCGV/css/admin/adminTemplate.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		function adminlogin(){
			alert("ㅎㅇ");
		}
		
	});
</script>
	<div id = "container">
		<div id = "topnevi">
		<c:if test="${sessionScope.admin_id == null }">
			<a href = "/MyCGV/admin/adminMain/adminLoginForm.do">로그인</a>
		</c:if>
		<c:if test="${sessionScope.admin_id != null }">
			<a>${sessionScope.admin_id} 관리자님 </a><a> | </a>
			<a href = "/MyCGV/admin/adminMain/adminLogout.do">로그아웃</a><a> | </a><a href = "/MyCGV/admin/adminMain/adminPwdChangeForm.do">비밀번호수정</a><a> | </a><a href = "../adminMain/adminRequestList.do?pg=1">관리자등록관리</a>
		</c:if>
		</div>
		<div id = "logo">
			<a href = "/MyCGV/admin/adminMain/adminMain.do"><img src = "/MyCGV/image/logo/moviet_logo3.png"></a>
		</div>
		<div id = "nevi">
			<ul class = "menu">
				<li><a>회원관리</a>
					<ul class = "sub">
						<li><a href = "#">문의내역 보기</a></li>
						<li><a href = "#">공지사항 등록</a></li>
						<li><a href = "#">기타</a></li>
					</ul>
				</li>
				<li><a>등록 리스트</a>
					<ul class = "sub">
						<li><a href = "/MyCGV/admin/movie/movieAdmin.do?pg=1">영화관리</a></li>
						<li><a href = "/MyCGV/theaterListForShow.do?pg=1">상영관리</a></li>
						<li><a href = "/MyCGV/admin/theater/theaterList.do?pg=1">극장관리</a></li>
						<li><a href = "/MyCGV/admin/productboard/productboardList.do?pg=1">스토어관리</a></li>
					</ul>
				</li>
				<li id = "a">
						
			</ul>
		</div>
	</div>