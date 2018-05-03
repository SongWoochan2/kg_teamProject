<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    (function ($) {
        $(function () {
        	$("#content-aside > ul > li:eq(2)").attr("class", "on");
            $('#period_wrap').datePeriod({
                'start': $('#startdate'),
                'end': $('#enddate'),
                'data': [
                    { 'title': '2주일', 'data-period': 2, 'data-type': 'w' },
                    { 'title': '1개월', 'data-period': 1, 'data-type': 'm' },
                    { 'title': '3개월', 'data-period': 3, 'data-type': 'm' },
                    { 'title': '6개월', 'data-period': 6, 'data-type': 'm' },
                    { 'title': '9개월', 'data-period': 9, 'data-type': 'm' },
                    { 'title': '12개월', 'data-period': 12, 'data-type': 'm' }
                ]
            });

            $('#btn_search').on('click', function () {
                location.href = "./default.aspx?type=1&startdate=" + $("#startdate").val() + "&enddate=" + $("#enddate").val();
            });
        });
    })(jQuery);

</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="mypageBody">
	<jsp:include page="./myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
			<div id="content-detail">			    
				<div class="tit-mypage">
					<h3>MoveIt 스토어</h3>
				</div>
				<div class="tit-mypage">
					<h4>사용가능 매점상품 기프트콘</h4>
				</div>
			<form id="form" novalidate="novalidate">
				<div class="sect-register gift">
					<p>
					    <strong><em>김한빛나</em>고객님의 최근 매점상품 구매내역이 없습니다.</strong>
					    <span>영화와 함께 즐길수 있는 매점상품 기프트콘을 이용해 보세요.</span>
					</p>
					<a href="" class="round red"><span>매점상품 기프트콘 구매하러가기 &gt;</span></a>
				</div>
			
				<div class="tit-mypage">
					<h4>매점상품 기프트콘 구매내역</h4>
				</div>
				<div class="sect-use-expense">
					<div class="box-polaroid">
					    <div class="box-inner">
					        <strong class="period">조회기간</strong>
					        <span id="period_wrap"><button data-period="2" data-type="w" class="round gray"><span>2주일</span></button><button data-period="1" data-type="m" class="round gray"><span>1개월</span></button><button data-period="3" data-type="m" class="round gray"><span>3개월</span></button><button data-period="6" data-type="m" class="round gray"><span>6개월</span></button><button data-period="9" data-type="m" class="round gray"><span>9개월</span></button><button data-period="12" data-type="m" class="round gray"><span>12개월</span></button></span>
						    <p>
					            <label for="startdate">시작일 입력</label><input type="text" id="startdate" name="startdate" value="2018-03-26" datepicker="datepicker" class="hasDatepicker" readonly="readonly"><button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키"><span>시작일 선택</span></button> ~ 
					            <label for="enddate">종료일 입력</label><input type="text" id="enddate" name="enddate" value="2018-04-26" datepicker="datepicker" class="hasDatepicker" readonly="readonly"><button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키"><span>종료일 선택</span></button>
					            <button type="button" id="btn_search" class="round inblack"><span>조회하기</span></button> <!-- type="submit" 확인요청 -->
					        </p>
					    </div>
					</div>
				</div>
			</form>
				<div class="tbl-data">
					<table summary="매점상품 기프트콘 구매일, 상품명, 휴대폰번호,구매수량,결제금액,상태 표기">
						<caption>매점상품 기프트콘 구매내역</caption>
						<colgroup>
						    <col width="12%">
						    <col width="*">
						    <col width="25%">
						    <col width="14%">
						    <col width="14%">
						    <col width="12%">
						</colgroup>
						<thead>
						    <tr>
						        <th scope="col">구매일</th>
						        <th scope="col">상품명</th>
						        <th scope="col">수신 휴대폰번호</th>
						        <th scope="col">구매수량</th>
						        <th scope="col">결제금액</th>
						        <th scope="col">상태</th>
						    </tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" class="nodata">매점상품 기프트콘 구매내역이 존재하지 않습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="paging">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>

<!-- CGV 예매 관련 정책 안내 Box Type -->
<!-- <div class="sect-box-descri">
	<h4>CGV 예매 관련 정책 안내</h4>
	Box Moudle
	<div class="box-polaroid">
	    <div class="box-inner">
	        <ul>
	            <li>
	            	<dl>
	            		<dt>이용안내</dt>
	            		<dd>
                            
	            			<ul>
	            				<li>구매 취소는 상태가 미사용인 상품에 한하여 구매일을 기준으로 60일 이내 취소가 가능하며 부분 환불이 불가합니다.<br>(예 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 그 중 사용하신 쿠폰이 있는 경우 미사용 쿠폰의 환불이 불가합니다.)</li>
	            				<li>MMS(모바일 상품권) <strong>재전송은 최대 3회</strong>까지만 가능하며, 재전송 시에는 SMS형태로 전송됩니다.</li>
	            				<li><strong>기프트콘의 유효 기한은 발송일로부터 6개월입니다.</strong></li>
	            				<li>매점상품 기프트콘 상품은 일부 극장에서 사용이 불가능합니다. (CGV 청주(북문/서문), 둔산, 칠곡, 부평, 진주)</li>
	            			</ul>
                            
	            		</dd>
	            	</dl>
	            </li>
	        </ul>
	    </div>
	</div>
	//Box Moudle
</div> -->
<!-- //CGV 예매 관련 정책 안내 Box Type -->
</body>
</html>