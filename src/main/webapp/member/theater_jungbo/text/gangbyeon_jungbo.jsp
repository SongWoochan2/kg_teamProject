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
 <img alt="" src="../image/theater/witch.png">
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
    
  /*   // 인포윈도우 표시하기
    iwPosition = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());  //인포윈도우 표시 위치입니다
    infowindow.setPosition(iwPosition); */
</script>
<div>
<img alt="" src="../image/theater/jungbo.png"><br>
		극장명 : CGV 강변점<br>
		도로명주소 : [05116] 서울특별시 광진구 광나루로56길 85<br>
		구주소 : (구의동, 테크노마트 10층)<br>
		전화번호 : 1544-1234<br>
		홈페이지 : www.cgv.com<br>		
		</div><br><br>
		
		<img alt="" src="../image/theater/koytong.png">
		<div>
		<strong class="subject">버스</strong><br>
		[마을] 강동01, 광진01, 광진05, 광진03, 광진04 <br>
		[공항] 6705, 여주터미널-인천공항 <br>
		[일반] 93, 1-6, 15, 97, 1115-2, 2000-3, 1, 2000-1, 2000-2, 96 <br> 
		[직행] 11, 100, 1113-1, 1113, 1660, 1113-10, 1650, 1112, 1117, 1113-11 <br> 
		[지선] 3212, 3214, 2224 <br>
		<br><br>
		<strong class="subject">지하철</strong>
		2호선 | 강변역 1번 출구
		</div><br><br><br>
</body>
</html>