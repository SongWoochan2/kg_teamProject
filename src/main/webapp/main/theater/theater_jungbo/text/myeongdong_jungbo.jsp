<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subject{
	color: orange;
}
</style>
</head>
<body>
 <img alt="" src="../../image/theater/witch.png">
		<div id="map"></div>
		<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.563424, 126.982857), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new daum.maps.Map(container, options);
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(37.563424, 126.982857);

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 마커가 드래그 가능하도록 설정합니다 
	marker.setDraggable(false);

	var iwContent = '<div style="padding:5px;">명동CGV', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(37.563424, 126.982857); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	
	 // 마커를 생성합니다
    marker.setPosition(markerPosition);  
    
  /*   // 인포윈도우 표시하기
    iwPosition = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());  //인포윈도우 표시 위치입니다
    infowindow.setPosition(iwPosition); */
</script>
<div>
<img alt="" src="../../image/theater/jungbo.png"><br>
		극장명 : CGV 명동점<br>
		도로명주소 : 서울특별시 중구 명동길 14(명동)<br>
		구주소 : 서울특별시 중구 명동2가 83-5번지 눈스퀘어 8층<br>
		전화번호 : 1544-1322<br>
		홈페이지 : www.cgv.com<br>		
		</div><br><br>
		
		<img alt="" src="../../image/theater/koytong.png">
		<div>
		<strong class="subject">버스</strong><br>
		[광역] 9401, 9401B, 9710, M5107, M4102, M4108, M4101, 9701, 2500 <br> 
		[직행] 5005, 1150, 5007, 5000, 9301, 9000, 5500-1, 5500-3, 5500, 5500-2 <br> 
		[급행] 8100, 8600 <br>
		[간선] 202, 143, 151, 152, 405, 702A, 702B, 261, 262, 500 <br> 
		[지선] 7021, 7017, 7022, 7011, 8000, 7013A, 7013B, 1711, 7016, 7018 <br> 
		[공항] 6015, 6001, 6701, 6005 <br>
		[순환] 05, 90S투어, 03, 91S투어, 02 <br>
		[일반] 1002, 111 <br>
		[마을] 종로09, 종로11 <br>
		<br><br>
		<strong class="subject">지하철</strong><br>
		2호선 | 을지로 입구역 6번 출구
		</div><br><br><br>
</body>
</html>