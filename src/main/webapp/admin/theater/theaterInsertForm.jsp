<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장등록</title>
<script type="text/javascript" src="../../script/theaterdScript.js?v=1"></script>
<style type="text/css">
	#headerMenu{
		float: left;
		margin: 10px;
		padding: 10px;
		list-style: none;
	}
	#wrapper{
		width: 1000px;
		margin: 0 auto;
		text-align: center;
		align-items: center;
		background-color: #ffe9ce;
		border: 3px solid black;
		padding: 50px;
	}
	#wrapper table{
			margin : 0 auto;
		background-color: white;
	}
</style>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp"/>
<div id = "content" align="center">
	<div id="wrapper">
		<form name="theaterInsertForm" method="post" action="theaterInsert.do" enctype="multipart/form-data" >
		<div>
		<ul class="">
			<li>
			<h1>극장등록</h1>
			</li>
			<li>
				극장제목 : <input type="text" name="theater_name">
			</li>
			<li>
				극장사진주소 : <input type="file" name="theater_photo_addr">
			</li>
			<li>
				극장번호 : <input type="text" name="theater_phone">
			</li>
			<li id="headerMenu">
				<input type="button" value="등록" onclick="javascript:checkTheaterInsert()">
				<input type="reset" value="취소">
			</li>
		</ul>
		</div>
		</form>
	</div>
</div>
</body>
</html>