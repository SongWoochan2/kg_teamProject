<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/unit.css" />
<script src="../js/controller.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<style type="text/css">
.div_border{ border: 1px solid black; text-align: center;}
#div_mid { border: 1px solid red; }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="div_border">
	<div>
	자주가는 영화관
	</div>
	<div>지역정보</div>
	<div class="slide">
	<button class="prev" type="button"><img src="../image/twit.png" alt=""></button>
	<!-- <a href="#"><img src="../image/CGVgangnam.jpg"></a> -->
	<ul>
		<li><img src="../image/face.png" alt="" /></li>
		<li><img src="../image/insta.png" alt="" /></li>
		<li><img src="../image/face.png" alt="" /></li>
		<li><img src="../image/insta.png" alt="" /></li>
	</ul>
	<button class="next" type="button"><img src="../image/twit.png" alt=""></button>
	</div>
	<div>상영시간표</div>
	<div id="div_mid">
		<div>상영시간표</div>
		<div>교통안내</div>
	</div>
	<div>지도</div>
	<div>교통편</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>