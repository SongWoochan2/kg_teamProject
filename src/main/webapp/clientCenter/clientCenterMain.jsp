<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/clientcenter/clientcenter_main.css" />
<link rel="stylesheet" type="text/css" href="../css/clientcenter/clientcenterMenu.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		$(".clientcenter_menu li").click(function(){
			$(this).addClass("selected");
			$(".clientcenter_menu li").not(this).removeClass("selected");
		});
	});
</script>
</head>
<body>
<jsp:include page="/main/main/header.jsp"></jsp:include>
	<div class="clientmain_fullscreen">
		<div class="clientmain_left">
			<div class="left_menubar">
				<ul class="clientcenter_menu">
					<li  class="selected" id=""><a href="#" ><strong>고객센터 메인</strong></a></li>
					<li  id=""><a href="#"><strong>자주찾는 질문</strong> </a></li>
					<li  id=""><a href="#"><strong>공지/뉴스</strong></a></li>
					<li  id=""><a href="#"><strong>이메일 문의</strong></a></li>				
				</ul>
			</div>
		</div>
		<div class="clientmain_rigth">
		<div class="center_box_div">
			<div id="main_questions_div">
				<strong>자주찾는 질문</strong><br>
			</div>
			<div id="main_email_div">
				<strong>이메일 문의</strong><br>
					24시간 365일 언제든지 문의해주세요.<br>
				<a id="" href=""><span style="padding:0 20px;">문의하기</span></a>
			</div>
			<div id="main_breakdown_div">
					<strong>내 상담 내역 확인</strong><br>
					<span>문의하신 내용을 확인하실 수 있습니다.</span><br>
					<a href="" target="_blank" title="새창열기"><span style="padding:0 20px;">
					문의내역 조회</span></a>
	            </div>
			</div>
			</div>
		</div>
		<jsp:include page="/main/main/footer.jsp"></jsp:include>
				<!-- 
				
			</div>
			<div id="center_bot">
				<div id = "service">
					<span>자주찾는 서비스</span>
					<ul id="list">
	                       로그아웃일 경우에만 링크 
	                       <li id=""><a>아이디/<br>비밀번호 찾기&gt;</a></li>
	                       로그아웃일 경우에만 링크 
							<li><a href="">예매/<br>취소내역 확인</a></li>
	                       로그아웃일 경우에만 링크  
	                       <li id=""><a>비회원<br>예매/취소</a></li>
	                       로그아웃일 경우에만 링크 
						<li><a href="">멤버십포인트<br>사용안내</a></li>
					</ul>
				</div>
				<div id="noti">
	                   <a href="">
					    <span>공지/뉴스</span>
	                   </a>
					<ul id="txt">
		                <li><a href="">[기타] 영화 관람가격 변경 안내드립니다.</a><span id="day">2018.04.06</span></li>
		                <li><a href="">[시스템점검] 4월 정기 시스템 안내</a><span id="day">2018.04.03</span></li>
		                <li><a href="">[기타] OK캐시백 적립율 변경 안내 (4/1, 00:00 ~)</a><span id="day">2018.02.28</span></li>
		                <li><a href="">[기타] CGV 개인정보처리방침 개정 공지</a><span id="day">2018.01.24</span></li>
		                <li><a href="">[기타] CGV 이용약관 개정안내</a><span id="day">2018.01.16</span></li>
					</ul>
					<a href="">공지/뉴스 더보기</a>
				</div>
				<div id="event">
					<a href="#">CGV PREVIEW 시사회/무대인사</a><br>(준비중)</br>
					<a href="#">DISCOUNT INFO 할인카드 및 혜택 안내</a><br>(준비중)</br>
				</div>
			</div>
		</div>
	</div> -->
</body>
</html>