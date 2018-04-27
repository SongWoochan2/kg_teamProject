<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 	.container{
 		box-sizing : border-box;
 		/* border : 1px solid red; */
	}
	#main{
		width : 900px;
		height: 700px;
	}
	#main #center_top{
		width : 100%;
		height : 50%;
	}
	#main #fastSearch #fastsearch_tit{
		border : 1px solid red;
		font-weight: bold;
		text-align: center;
		text-decoration: none;
	}
	#main #fastSearch #fastsearch_tit:hover{
		text-decoration: underline;
	} 
	
	#main #center_top #fastSearch{
		width : 297px;
		height : 100%;
		float: left;
	}
	#main #center_top #emailInquiry{
		width : 297px;
		height : 100%;
		float: left;
	}
	#main #center_top #inquiryList{
		width : 297px;
		height : 100%;
		float: left;
	}
	#center_bot #service{
		width : 40%;
		height : 50%;
		float: left;
	}
	#center_bot #not{
		width : 60%;
		height : 50%;
		float: left;
	}
	#main #noti_ban_area{
		width : 60%;
		height : 25%;
		float: left;
	}
	#main ,#side{
		float: left; 
	}
	
	ul{
		list-style: none; 
		position: relative; 
		z-index: 100;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="side">
			<ul>
				<li id=""><a href="">고객센터 메인</a></li>
				<li id=""><a href="">자주찾는 질문 </a></li>
				<li id=""><a href="">공지/뉴스</a></li>
				<li id=""><a href="">이메일 문의<i></i></a></li>					
			</ul>
		</div>
		<div id="main">
			<div id = "center_top">
				<div id="fastSearch">
					<div id="fastsearch_tit">자주찾는 질문 빠른검색</div>
					<div>
						<input id="searchtext" type="text" placeholder="검색어를 입력해 주세요.">
						<button type="button" id="btn_search">검색</button>
					</div>
					<div id="c_qu"> 
					    <a href="#none">현금영수증</a>     
					    <a href="#none">관람권</a>    
					    <a href="#none">홈페이지</a>   
					    <a href="#none">예매</a>       
					    <a href="#none">환불</a>    
					    <a href="#none"></a>                           
					</div>
				</div>
				<div id="emailInquiry">
					<strong>이메일 문의</strong>
					<span id="c_txt">24시간 365일 언제든지 문의해주세요.</span>
					<a id="" href=""><span style="padding:0 20px;">문의하기</span></a>
	            </div>
				<div id="inquiryList">
					<strong>내 상담 내역 확인</strong>
					<span>문의하신 내용을 확인하실 수 있습니다.</span>
					<a href="" target="_blank" title="새창열기"><span style="padding:0 20px;">문의내역 조회</span></a>
	            </div>
			</div>
			<div id="center_bot">
				<div id = "service">
					<span>자주찾는 서비스</span>
					<ul id="list">
	                       <!-- 로그아웃일 경우에만 링크  -->
	                       <li id=""><a>아이디/<br>비밀번호 찾기&gt;</a></li>
	                       <!-- 로그아웃일 경우에만 링크  -->
							<li><a href="">예매/<br>취소내역 확인</a></li>
	                       <!-- 로그아웃일 경우에만 링크  --> 
	                       <li id=""><a>비회원<br>예매/취소</a></li>
	                       <!-- 로그아웃일 경우에만 링크  -->
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
	</div>
</body>
</html>