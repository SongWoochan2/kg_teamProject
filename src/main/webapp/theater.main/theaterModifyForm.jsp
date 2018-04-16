<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장수정</title>
<script type="text/javascript" src="../script/theaterdScript.js?v=1"></script>
<style type="text/css">
#headerMenu{
	float: left;
	margin: 10px;
	padding: 10px;
	list-style: none;
}
</style>
</head>
<body>
<form name="theaterModifyForm" method="post" action="theaterModify.do">
<div>
<ul class="">
	<li>
	<h1>극장수정</h1>
	</li>
	<li>
		극장코드 : <input type="text" name="theater_code" value="${theaterDTO.theater_code }" disabled >
	</li>
	<li>
		극장제목 : <input type="text" name="theater_name" value="${theaterDTO.theater_name }" >
	</li>
	<li>
		극장사진주소 : <input type="text" name="theater_photo_addr" value="${theaterDTO.theater_photo_addr }">
	</li>
	<li>
		극장번호 : <input type="text" name="theater_phone" value="${theaterDTO.theater_phone }" >
	</li>
	<li id="headerMenu">
		<input type="button" value="수정" onclick="javascript:checkTheaterModify()">
		<input type="reset" value="취소">
	</li>
</ul>
</div>
</form>
</body>
</html>