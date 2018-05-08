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
					<li  class="selected" id=""><a href="/MyCGV/clientCenter/clientCenterMain.do?pg=1" ><strong>고객센터 메인</strong></a></li>
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
						<a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1"><img id="rigth_mid_rigthdiv_top_img" src="/MyCGV/image/clientCenter/+_img.png"></a>
						<div class="rigth_mid_rigthdiv_top_ul">
							<table cellspacing="0" cellpadding="5" align="center" >
								<c:forEach var="noticeItemDTO" items="${list}">
									<tr bgcolor="white">
										<td width="300px">
											<a id="titleA" href="../admin/noticeItem/noticeItemView.do?notice_item_code=${noticeItemDTO.notice_item_code}&pg=${param.pg}" >
												[${noticeItemDTO.notice_item_type }] ${noticeItemDTO.notice_item_title}
											</a>
										</td>
										<td align="center" width="200px">${noticeItemDTO.notice_item_date}</td>
									</tr>
								</c:forEach>
							</table>
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