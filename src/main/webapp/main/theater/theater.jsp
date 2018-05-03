<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/theater/commons.css" />
<link rel="stylesheet" href="../../css/theater/unit.css" />
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad3142c660a77d28b590ef79689d4549"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.4/TweenMax.min.js"></script>
<link href="themes/1/js-image-slider.css" rel="stylesheet"
	type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
<link href="../../css/theater/generic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
/* $(function() {
	// 링크가 클릭된 경우
	$("#slider > a").click(function() {
		var index = $(this).index()-1;
		alert(index + ".");
		var image = ['../image/theater/CGVgangbyeon.jpg', '../image/theater/CGVgangnam.jpg', 
			'../image/theater/CGVmyeongdong.jpg'];
		// 클릭된 링크의 조상들 중에서 <div> 태그를 검색하여 CSS 배경이미지 설정
		$(this).parents("div").css({
			"background-image" : "url('" + image[index] + "')"
		});
	
		return false;
	});
}); */
$(function(){
	$("#gangbyeon_click").click(function(){
		$.ajax({
			url : "theater_jungbo/text/gangbyeon_jungbo.jsp", // 나중에 사이트 url로 바뀜
			type : "get", // 최종적으로 서버에 요청함
			dataType : "text",
			timeout : 30000, // 30초 (단위는 ms)
			cache : false,
			
			// 파일 읽기에 성공한 경우
			success : function(data){
				// dataType값이 text일 경우에는 단순히 내용에 대한 문자열이므로,
				// 직접 HTML요소에 출력할 수 있다.
					$("#result").html(data);
			},
			// 파일 읽기에 실패한 경우 (주소 오타, 웹서버 중지 등)
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>" + textStatus
					+"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
			}
		});
	});
	
	$("#gangnam_click").click(function(){
		$.ajax({
			url : "theater_jungbo/text/gangnam_jungbo.jsp", // 나중에 사이트 url로 바뀜
			type : "get", // 최종적으로 서버에 요청함
			dataType : "text",
			timeout : 30000, // 30초 (단위는 ms)
			cache : false,
			// 파일 읽기에 성공한 경우
			success : function(data){
				// dataType값이 text일 경우에는 단순히 내용에 대한 문자열이므로,
				// 직접 HTML요소에 출력할 수 있다.
					$("#result").html(data);
			},
			// 파일 읽기에 실패한 경우 (주소 오타, 웹서버 중지 등)
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>" + textStatus
					+"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
			}
		});
	});
	
	$("#myeongdong_click").click(function(){
		$.ajax({
			url : "theater_jungbo/text/myeongdong_jungbo.jsp", // 나중에 사이트 url로 바뀜
			type : "get", // 최종적으로 서버에 요청함
			dataType : "text",
			timeout : 30000, // 30초 (단위는 ms)
			cache : false,
			
			// 파일 읽기에 성공한 경우
			success : function(data){
				// dataType값이 text일 경우에는 단순히 내용에 대한 문자열이므로,
				// 직접 HTML요소에 출력할 수 있다.
					$("#result").html(data);
			},
			// 파일 읽기에 실패한 경우 (주소 오타, 웹서버 중지 등)
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>" + textStatus
					+"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
			}
		});
	});
});
</script>
<style type="text/css">
#test{
	background-color: #FFFFFB;
}
</style>
</head>
<body id="test">
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="div_border">
		<img alt="" src="../../image/theater/frequent_top.png">
		<img alt="" src="../../image/theater/frequent.png">
		<br><br><br><br> 
		<img alt="" src="../../image/theater/theater.png">
		<div id="sliderFrame">
			<div id="slider">
				<a href="#" id="gangbyeon_click"> <img src="../../image/theater/CGVgangbyeon.jpg" alt="#gangbyeon" /></a>
				<a href="#" id="gangnam_click"> <img src="../../image/theater/CGVgangnam.jpg" alt="#gangnam" /></a>
				<a href="#" id="myeongdong_click"> <img src="../../image/theater/CGVmyeongdong.jpg" alt="#myeongdong" /></a>
			</div>
			<div id="gangbyeon" style="display: none;">
				<em>CGV</em> 강변점으로 오세요! <a href="#">강변CGV</a>.
			</div>
			<div id="gangnam" style="display: none;">
				<em>CGV</em> 강남점으로 오세요 !<a href="#">강남CGV</a>.
			</div>
			<div id="myeongdong" style="display: none;">
				<em>CGV</em> 명동점으로 오세요 ! <a href="#">명동CGV</a>.
			</div>
		</div>
		<br>
		<br><br><br>
		<br>
		<br>
		<br>
		<br>
		<div class="console" id="result"></div>
		</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>