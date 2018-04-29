<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/MyCGV/css/bootstrap.css" rel = "stylesheet">
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		function adminlogin(){
			alert("ㅎㅇ");
		}
		
	});
</script>
<style type="text/css">
	#contain{
		width : 1000px;
		margin : auto;
		border : 1px solid red;
	}
	.*{
		margin : 0;
		padding : 0;
	}

	div{
	}
	div#container{
		box-sizing : border-box;
		width : 100%;
		height : 300px;
	}
	div#container #topnevi{
		background-color : black;
		text-align : right;
		width : 100%;
		height: 9%;
		padding-right: 10px;
	}
	div#container #topnevi a{
		text-decoration: none;
		font-size: 11px;
		color : white;
		font-weight: bold;
	}
	div#container #topnevi a:hover{
		text-decoration: underline;
	}
	div#container #logo{
		text-align: center;
		width: 100%;
		height: 71%;
		padding-top: 30px;
/*  		background-repeat : no-repeat; */
		background-image: url('/MyCGV/image/admintop.png');
	}
	div#container #logo img{
		width: 280px;
		height: 180px;
	}
	div#container #nevi{
		width: 100%;
		height: 20%;
	}
	div#container #nevi ul{
		width : 100%;
		height : 100%;
		margin : 0;
		padding: 0;
		list-style: none;
	}
	div#container #nevi ul.menu li{
		position : relative;
		z-index : 1;
		float: left;
		width : 20%;
		height : 100%;
/* 		background: linear-gradient(135deg, #b3dced 0%,#18458e 40%,#bce0ee 100%);  */
		background: linear-gradient(to bottom, #f4ac5a 0%,#cc791c 50%,#7a450b 51%,#f4ac5a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	}
	div#container #nevi ul.menu li#a{
		width : 60%;
	}
	div#container #nevi ul.menu li .sub{
		display: none;
	}
	div#container #nevi ul.menu li:hover > .sub{
		display: block;
	}
	div#container #nevi ul.menu li:hover{
		border-bottom: 10px solid #8c5519;
		background: linear-gradient(to bottom, #a0611b 0%,#563108 50%,#6d400e 51%,#a86112 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */

	}
	div#container #nevi ul.menu li a{
		display: block;
		width : 100%;
		height : 100%;
		line-height :48px;
		color : #fce1c4;
		text-align: center;
		font-size : 18px;
		font-weight: bold;
		text-decoration: none;
	}
	div#container #nevi ul.menu li ul.sub li{
		width : 100%;
		height : 100%;
	}
	div#container #nevi ul.menu:after{
		content : '';
		display: block;
		clear: both;
	}
	
	/*
		
	*/
	
	div#content{
		padding-top : 50px;
		text-align : center;
		width: 100%;
		height : 1200px;
		background-image: url('/MyCGV/image/adminlogin.png');
	}
	div#content th{
		text-align: center;
	}
	div#content #admintitle{
		font-size: 25px;
		font-weight: bold;
		color : white;
	}
	div#content #adminlogin{
		box-sizing : border-box;
		margin : auto;
 		line-height : 50px; 
		width: 500px;
		height: 300px;
		border : 5px solid black;
		border-radius : 0px 20px;
	}
	div#content #adminlogin #logintop{
		z-index : 0;
		height : 15%;
		font-size : 20px;
		padding-left : 20px;
		background-color: black;
		color : white;
		font-weight: bold;
		text-decoration: none;
		text-align: left;
	}
	
	div#content #adminlogin #dvadminid{
		padding-top : 30px;
		height : 25%;
		width: 100%;
	}
	div#content #adminlogin #dvadminid input[type='text']{
		width : 200px;
		height: 40px;
		border : 5px solid skyblue;
		border-radius: 10px;
	}
	div#content #adminlogin #dvadminpwd{
		height : 15%;
		width: 100%;
	}
	div#content #adminlogin #dvadminpwd input[type='password']{
		width : 200px;
		height: 40px;
		border : 5px solid skyblue;
		border-radius: 10px;
	}
	div#content #adminlogin #loginbtn{
		height : 30%;
		width: 100%;
	}
	div#content #adminlogin #dvloginbtn input[type='submit']{
		color : white;
		font-size : 16px;
		font-weight : bold;
		margin-top : 20px;
		width : 200px;
		height : 40px;
		border-radius : 15px;
		background-color: #123c7c;
	}
	div#content #adminlogin #dvloginbtn input[type='submit']:hover{
		background-color: #0e2c5b;
		text-decoration: underline;
	}
	div#content #adminlogin #loginbottom{
		border-radius : 0 15px;
		height : 15%;
		background-color : lightgray;
		text-align: right;
		padding-right: 5px;
	}
	div#content #adminlogin #loginbottom a{
		color: #0f2d5b;
		text-decoration: none;
	}
	div#content #adminlogin #loginbottom a:hover{
		text-decoration: underline;
		color: #071428;
	}
</style>

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
			<a href = "/MyCGV/admin/adminMain/adminMain.do"><img src = "/MyCGV/image/logo/moviet_logo2.png"></a>
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
						<li><a href = "#">스토어관리</a></li>
					</ul>
				</li>
				<li id = "a">
						
			</ul>
		</div>
	</div>