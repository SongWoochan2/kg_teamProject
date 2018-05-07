<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:include page="/main/main/header.jsp"/>
	<div class="clientmain_fullscreen">
		<div class="clientmain_left">
			<div class="left_menubar">
				<ul class="clientcenter_menu">
					<li  class="selected" id=""><a href="/MyCGV/clientCenter/clientCenterMain.jsp" ><strong>고객센터 메인</strong></a></li>
					<li  id=""><a href="/MyCGV/admin/qna/qnaList.do?pg=1"><strong>자주찾는 질문</strong></a></li>
					<li  id=""><a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1"><strong>공지/뉴스</strong></a></li>
					<li  id=""><a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1"><strong>이메일 문의</strong></a></li>				
				</ul>
			</div>
		</div>
		<div class="clientmain_rigth">
			<div class="center_box_top">
				<a href="/MyCGV/admin/qna/qnaList.do?pg=1">
					<div id="main_questions_div">
						<img alt="" src="/MyCGV/image/clientCenter/search.png">
						<h2 class="clientmain_rigth_h2_1">자주찾는 질문</h2><br>
						<p id="clientmain_rigth_p1">무엇이 궁금하신가요?</p><br>
						<div class="center_box_top_div1"><p id="center_box_top_div1_p">자주찾는 질문</p></div>
					</div>
				</a>
				<a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1">
					<div id="main_email_div">
						<img id="main_email_div_img" alt="" src="/MyCGV/image/clientCenter/email_img.png">
						<h2 class="clientmain_rigth_h2_2">이메일 문의</h2><br>
							<p class="clientmain_rigth_p2">24시간 365일 언제든지 문의해주세요.</p><br>
						<div class="center_box_top_div2"><p id="center_box_top_div2_p">문의하기</p></div>
					</div>
				</a>
				<a href="/MyCGV/main/inquiry/inquiryListMember.do?pg=1">
					<div id="main_breakdown_div">
						<img id="main_breakdown_div_img" alt="" src="/MyCGV/image/clientCenter/breakdown.png">
						<h2 class="clientmain_rigth_h2_2">내 상담 내역 확인</h2><br>
						<p class="clientmain_rigth_p2">문의하신 내용을 확인하실 수 있습니다.</p><br>
						<div class="center_box_top_div3"><p id="center_box_top_div3_p">문의내역 조회</div>
			        </div>
			    </a>
			</div>
			<div class="clientmain_rigth_mid">
				<div id="rigth_mid_leftdiv">
					<div>
						<strong>자주찾는 서비스<br><br></strong>
					</div>
					<div class="rigth_mid_leftdiv_tong">
						<a href="#">
							<div id="leftdiv_id_pw">
								<strong>아이디/<br>비밀번호 찾기</strong>
							</div>
						</a>
						<a href="#">
							<div id="leftdiv_reservation">
								<strong>예매/<br>취소내역 확인</strong>
							</div>
						</a>
						<a href="#">
							<div id="leftdiv_cancellation">
								<strong>비회원<br>예매/취소</strong>
							</div>
						</a>
						<a href="#">
							<div id="leftdiv_point">
								<strong>멤버십포인트<br>사용안내</strong>
							</div>
						</a>
					</div>
				</div>
				<div class="rigth_mid_rigthdiv">
					<div id="rigth_mid_rigthdiv_top">
						<strong id="rigth_mid_rigthdiv_top_strong">공지/뉴스</strong>
						<a href="#"><img id="rigth_mid_rigthdiv_top_img" src="/MyCGV/image/clientCenter/+_img.png"></a>
						<div class="rigth_mid_rigthdiv_top_ul">
							<ul>
								<li>
									<div class="rigth_mid_rigthdiv_top_ul_text">
										<!-- 밑에 텍스트들은 DB쪽에서 데이터 꺼내와야함 임시로 텍스트넣은거임  -->
										<a href="#">[기타] 영화 관람가격 변경 안내드립니다.</a>
									</div>
									<div class="rigth_mid_rigthdiv_top_ul_date">
										2018.04.06
									</div>
								</li>
								<li>
									<div class="rigth_mid_rigthdiv_top_ul_text">
										<a href="#">[시스템점검] 4월 정기 시스템 안내</a>
									</div>
									<div class="rigth_mid_rigthdiv_top_ul_date">
										2018.04.03
									</div>
								</li>
								<li>
									<div class="rigth_mid_rigthdiv_top_ul_text">
										<a href="#">[기타] OK캐시백 적립율 변경 안내 (4/1, 00:00 ~)</a>
									</div>
									<div class="rigth_mid_rigthdiv_top_ul_date">
										2018.02.28
									</div>
								</li>
								<li>
									<div class="rigth_mid_rigthdiv_top_ul_text">
										<a href="#">[기타] CGV 개인정보처리방침 개정 공지</a>
									</div>
									<div class="rigth_mid_rigthdiv_top_ul_date">
										2018.01.24
									</div>
								</li>
								<li>
									<div class="rigth_mid_rigthdiv_top_ul_text">
										<a href="#">[기타] CGV 이용약관 개정안내</a>
									</div>
									<div class="rigth_mid_rigthdiv_top_ul_date">
										2018.01.16
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div id="rigth_mid_rigthdiv_bottom">
						<img src="/MyCGV/image/clientCenter/bottom_img.png">
					</div>
				</div>
			</div>
			<div class="clientmain_rigth_bottom">
				<img alt="" src="../image/clientCenter/clientmain_rigth_bottom_img.png">
			</div>
		</div>
	</div>
<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>