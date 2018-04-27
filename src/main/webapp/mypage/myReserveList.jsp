<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="../main/main/header.jsp"></jsp:include>
	<div id="mypageBody">
	<jsp:include page="./myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
			<div id="content-detail">
				<div class="sect-register booking">
					<div class="tit-mypage">
						<h3>나의 예매내역</h3>
						<a href=""><span>내가 본 영화</span></a>
					</div>
					<div class="lst-item">
						<p>
							<strong>현장에서 발권하실 경우 꼭 <em>예매번호</em>를 확인하세요.
							</strong> <span>티켓판매기에서 예매번호를 입력하면 티켓을 발급받을 수 있습니다.</span>
						</p>
						<div class="box-set-info nodata">고객님의 최근 예매내역이 존재하지 않습니다.</div>
					</div>
				</div>
				<div class="sect-mypage-cancle">
					<div class="tit-mypage">
						<h4>MY 취소내역</h4>
						<p>상영일 기준 지난 7일 동안의 취소내역입니다.</p>
					</div>

					<div class="tbl-data">
						<table summary="상영일 기준 지난 7일 동안의 취소내역">
							<caption>MY 취소내역</caption>
							<thead>
								<tr>
									<th scope="col">관람 영화</th>
									<th scope="col">관람CGV</th>
									<th scope="col">관람 일시</th>
									<th scope="col">취소일</th>
									<th scope="col">결제취소 금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5" class="nodata">고객님의 최근 취소내역이 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="sect-box-descri">
					<h4>CGV 예매 관련 정책 안내</h4>
					<div class="box-polaroid">
						<div class="box-inner">
							<ul>
								<li>
									<dl>
										<dt>이용안내</dt>
										<dd>
											<ul>
												<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
												<li>영수증은 상영 시간 전까지 My CGV 에서 출력하실 수 있습니다. 단, 신용카드로 예매하신
													경우만 한합니다.</li>
												<li>상영 시간 이후 관람하신 영화의 영수증 출력을 원하실 경우, 1544-1122로 문의 주시기
													바랍니다.</li>
												<li>취소하신 내역이 나타나지 않거나 궁금하신 사항이 있으시면, 고객센터로 문의해 주시기
													바랍니다.</li>
											</ul>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>티켓 교환방법</dt>
										<dd>
											<ul>
												<li>
													<p>
														<strong>티켓판매기(ATM)에서 발권하실 경우</strong><br>예매번호 또는
														고객인증번호 (법정생년월일 6자리 + 휴대폰번호 뒷 7~8자리)를 입력하시면 티켓을 편하게 발권하실 수
														있습니다.
													</p>
												</li>
												<li>
													<p>
														<strong>매표소에서 발권하실 경우</strong><br>티켓교환권을 출력하여 매표소에
														방문하시면 티켓으로 교환하실 수 있습니다.<br> (티켓교환권 출력이 어려운 경우, 예매번호와
														신분증을 지참하시면 매표소에서 티켓을 수령하실 수 있습니다.)
													</p>
												</li>
											</ul>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>예매 취소 안내</dt>
										<dd>
											<ul>

												<li>
													<p>
														<strong>신용카드</strong><br> 결제 후 3일 이내 취소 시 승인 취소 가능,
														3일 이후 매입 취소시 영업일 기준 3~5일 소요
													</p>
												</li>
												<li>
													<p>
														<strong>체크카드</strong><br>결제 후 3일 이내 취소 시 당일 카드사에서
														환불처리. 3일 이후 매입 취소 시 카드사에 따라 3~10일 이내 카드사에서 환불
													</p>
												</li>
												<li>
													<p>
														<strong>휴대폰 결제</strong><br> 결제 일자 기준 당월(1~말일)취소만 가능.
														익월 취소 관련 문의는 CGV고객센터(1544-1122) 연락 요망<br> 예매취소 후 당일
														환불이 원칙이나 현장 취소 시 경우에 따라 익일 처리 될 수 있음.
													</p>
												</li>
												<li>
													<p>
														<strong>계좌이체</strong><br> 1. 예매일 이후 7일 이내 취소 시<br>
														- 자동 환불 은행: 취소 후 즉시 처리가능<br> - 조흥, 신한, 외한, 한미, 우리,
														우체국, 전북, 경남, 광주, 대구, 새마을, 제주<br> - 우리은행의 경우 당일 취소분만
														즉시 처리 가능<br> - 수동 환불 은행: 농협(취소 후 2~3일 이내 입금),
														부산/제일/우리(취소 후 3~5일 이내 입금)<br>
														<br> 2. 예매 7일 이후~상영시간 30분 전 취소 시(단, 일부 당일 취소 불가 행사의
														경우 전일 취소 시)<br> - 환불은 환불 요청일로부터 7일 이상 소요됨<br>
														<br> ※ 기타 환불 관련 문의는 CGV고객센터 1544-1122로 연락바랍니다.
													</p>
												</li>
											</ul>
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>환불 규정 안내</dt>
										<dd>
											<ul>
												<li>
													<p>
														<strong>현장 취소를 하는 경우</strong><br>상영시간 이전까지만 가능하며,
														상영시간 이후 취소나 환불은 되지 않습니다.
													</p>

												</li>
												<li>
													<p>
														<strong>홈페이지에서 예매 취소할 경우</strong><br>부분 취소는 불가능합니다.
														(ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)<br>홈페이지 예매 취소는
														상영시간 20분전까지 가능합니다.<br>상영시간 이후 취소나 환불은 되지 않습니다
													</p>
												</li>
												<li>
													<p>
														<strong>모바일 앱/웹(m.cgv.co.kr)에서 예매 취소할 경우</strong><br>부분
														취소는 불가합니다.(ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)<br> 모바일
														앱/웹 예매 취소는 상영시간 15분전까지 가능합니다.<br> 상영시간 이후 취소나 환불은 되지
														않습니다.
													</p>
												</li>
												<li>
													<p>
														<strong>단, 일부 행사의 경우 행사 당일 취소, 변경 불가 합니다.</strong>
													</p>
												</li>
											</ul>
										</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
<form name="targetform" id="targetform" method="post" novalidate="novalidate">
	<input type="hidden" name="reverse_no" id="reverse_no">
	<input type="hidden" name="theater_code" id="theater_code">
</form>
</body>
</html>



