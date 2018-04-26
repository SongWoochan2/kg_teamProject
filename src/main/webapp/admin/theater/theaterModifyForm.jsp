<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장수정</title>
<style type="text/css">
	#after{
		width: 200px;
		height: 200px;
	}
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
		<form name="theaterModifyForm" method="post" action="theaterModify.do" enctype="multipart/form-data">
		<div>
		<ul class="">
			<li>
			<h1>극장수정</h1>
			</li>
			<li hidden="">
				극장코드 : <input type="text" name="theater_code" value="${theaterDTO.theater_code }" >
			</li>
			<li>
				극장제목 : <input type="text" name="theater_name" value="${theaterDTO.theater_name }" >
			</li>
			<li>
				변경전 극장사진 : <img id="after" alt="" src="/MyCGV/image/theater_juso/${theaterDTO.theater_photo_addr }">
			</li>
			<li>
				변경할 극장사진주소 : <input type="file" name="theater_photo_addr" value="${theaterDTO.theater_photo_addr }">
			</li>
			<li>
				극장번호 : <input type="text" name="theater_phone" value="${theaterDTO.theater_phone }" >
			</li>
			<li id="headerMenu">
				<input type="submit" value="수정">
				<input type="reset" value="수정전으로돌아가기">
				<input type="button" value="목록" onclick="location.href='theaterList.do?pg=${pg}'">
			</li>
		</ul>
		</div>
		</form>
	</div>
</div>
</body>
</html>