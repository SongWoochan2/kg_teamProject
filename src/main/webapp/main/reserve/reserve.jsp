<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<link rel="stylesheet" href="../../css/reserve/reserve.css" />
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<div class="div_top">
	<div id="top_movie">
		영화
	</div>
	<div id="top_theater">
		극장
	</div>
	<div id="top_date">
		날짜
	</div>
	<div id="top_time">
		시간
	</div>
</div>

<div class="div_bottom">
	<div id="bottom_photo_title">
		영화사진<br>
		영화제목
	</div>
	<div id="bottom_pack">
		극장 @
		일시 @
		상영관 @
		인원 @
	</div>
	<div id="bottom_seat">
		좌석선택
		//이미지처리
	</div>
	<div id="bottom_pay">
		결제
		//이미지처리
	</div>
	<div id="bottom_seat_choice">
		좌석선택->
	</div>
</div>
<br><br><br>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>