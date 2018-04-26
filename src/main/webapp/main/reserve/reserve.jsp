<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<link rel="stylesheet" href="../../css/reserve/reserve.css" />
<script type="text/javascript">
	$(function(){
		$("#tem_1").click(function(){
			$.ajax({
				url : "reserve_jungbo/reserve.jsp", // 나중에 사이트 url로 바뀜
				type : "get", // 최종적으로 서버에 요청함
				dataType : "text",
				timeout : 30000, // 30초 (단위는 ms)
				cache : false,
				
				// 파일 읽기에 성공한 경우
				success : function(data){
					// dataType값이 text일 경우에는 단순히 내용에 대한 문자열이므로,
					// 직접 HTML요소에 출력할 수 있다.
						$("#bottom_photo_title").html(data);
				},
				// 파일 읽기에 실패한 경우 (주소 오타, 웹서버 중지 등)
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus
						+"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
		});
	});
	
		$("#tem_2").click(function(){
			$.ajax({
				url : "reserve_jungbo/reserve.jsp",
				type : "get",
				dataType : "text",
				timeout : 30000,
				cache : false,
				
				success : function(data){
						$("#bottom_photo_title").html(data);
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus
						+"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
		});
	});
});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="div_top">
		<div id="top_movie">
			<div id="top_movie_div1">
				<strong>영화</strong>
			</div>
			<div id="top_movie_div2">
				<a id="tem_1" href="#">테스트</a>
			</div>
		</div>
		<div id="top_theater">
			<div id="top_theater_div1">
				<strong>극장</strong>
			</div>
			<div id="top_theater_div2">DB</div>
		</div>
		<div id="top_date">
			<div id="top_date_div1">
				<strong>날짜</strong>
			</div>
			<div id="top_date_div2">
				DB
				<div class="date" show_date="1">25일</div>
				<div class="date" show_date="2">26일</div>
				<div class="date" show_date="3">27일</div>
				<div class="date" show_date="4">28일</div>
				<div class="date" show_date="5">29일</div>
				<div class="date" show_date="6">30일</div>
				<div class="date" show_date="7">1일</div>
				<div class="date" show_date="8">2일</div>
				<div class="date" show_date="9">3일</div>
				<div class="date" show_date="10">4일</div>
				<div class="date" show_date="20180505">5일</div>
			</div>
		</div>
		<div id="top_time">
			<div id="top_time_div1">
				<strong>시간</strong>
			</div>
			<div id="top_time_div2">DB</div>
		</div>
	</div>

	<div class="div_bottom">
		<div id="bottom_photo_title">
			영화사진<br> 영화제목
		</div>
		<div id="bottom_pack">극장 @ 일시 @ 상영관 @ 인원 @</div>
		<div id="bottom_seat">좌석선택 //이미지처리</div>
		<div id="bottom_pay">결제 //이미지처리</div>
		<div id="bottom_seat_choice">좌석선택-></div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>