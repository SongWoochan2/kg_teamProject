<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/theater/commons.css" />
<link rel="stylesheet" href="../css/theater/unit.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad3142c660a77d28b590ef79689d4549"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.4/TweenMax.min.js"></script>
	<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="../css/theater/generic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="div_border">

		자주가는극장

	<br><br><br><br>
	<div id="sliderFrame">
        <div id="slider">
            <a href="#" target="_blank">
                <img src="../image/theater/CGVgangbyeon.jpg" alt="#gangbyeon" />
            </a>
            <a href="#" target="_blank">
            <img src="../image/theater/CGVgangnam.jpg" alt="#gangnam" /></a>
            <a href="#" target="_blank">
            <img src="../image/theater/CGVmyeongdong.jpg" alt="#myeongdong"/></a>
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
    <br><br><br>
	<div id="map"></div>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.535799, 127.095700), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new daum.maps.Map(container, options);
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(37.535799, 127.095700);

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 마커가 드래그 가능하도록 설정합니다 
	marker.setDraggable(false);

	var iwContent = '<div style="padding:5px;">강변CGV', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(37.535799, 127.095700); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	
	 // 마커를 생성합니다
    marker.setPosition(markerPosition);  
    
    // 인포윈도우 표시하기
    iwPosition = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());  //인포윈도우 표시 위치입니다
    infowindow.setPosition(iwPosition);
</script>
<div>교통편</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>