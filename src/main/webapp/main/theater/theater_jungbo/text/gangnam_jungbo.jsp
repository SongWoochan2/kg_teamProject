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
		center: new daum.maps.LatLng(37.501670, 127.026293), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new daum.maps.Map(container, options);
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(37.501670, 127.026293);

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 마커가 드래그 가능하도록 설정합니다 
	marker.setDraggable(false);

	var iwContent = '<div style="padding:5px;">강남CGV', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(37.501670, 127.026293); //인포윈도우 표시 위치입니다

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
		극장명 : CGV 강남점<br>
		도로명주소 : 서울특별시 강남구 강남대로 438 (역삼동)<br>
		구주소 : 서울특별시 강남구 역삼동814-6 스타플렉스<br>
		전화번호 : 1544-1122<br>
		홈페이지 : www.cgv.com<br>		
		</div><br><br>
		
		<img alt="" src="../../image/theater/koytong.png">
		<div>
		<strong class="subject">버스</strong><br>
		분당지역<br>
		[좌석] 1005-1, 1005-2, 6800, 5500-2 <br>
		[간선] 408, 462 <br>
		[광역] 9404, 9408 <br><br>
 	
 		강북지역 <br>
		[간선] 140, 144, 145, 471 <br><br>
		
		강서지역 <br>
		[좌석] 1500, 간선버스 360 <br><br>
		
		강동지역 <br>
		[간선] 402, 420, 470, 407 <br><br>
		
		인근경기지역 <br>
		[좌석] 3030, 2002, 2002-1 <br>
		[광역] 9409, 9500, 9501, 9503, 9700, 9711
		<br><br><br>
		<strong class="subject">지하철</strong><br>
		2호선 | 강남역 11번 출구 <br>
		9호선 | 신논현역 5번출구
		</div><br><br><br>
</body>
</html>