<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myContentAside.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypageHome.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    (function ($) {
        $(function () {
        	$("#content-aside > ul > li:eq(2)").attr("class", "on");
        	
			$(".pay-cancle-btn").click(function(){
    			var result = confirm('선택하신 내역을 구매 취소하시겠습니까?'); 
    			if(result) { //yes 
        			var product_pay_code = $("#product_pay_code").val();
        			      			
                	$.ajax({
                		url: "./productPayCancle.do?product_pay_code="+product_pay_code,
                		type: "get",
                		dataType: "html",
                		cache: false,
                		timeout: 30000,
                		success: function(data) {
                			$("#resultAlert").html(data);
                		},
                		error: function(xhr, textStatus, errorThrown) {
        					$("div.tbl-form").html("<div>" + textStatus 
      							  + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
      					}
                	});
    			} else {
    				
    			}	
    		});


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
				<div class="tit-mypage-store">
					<h3>나의 MovieT 스토어</h3><br>
					<h4>사용가능 매점상품 기프트콘</h4>
				</div>
			
				<c:if test="${empty payList}">
					<div class="sect-register-gift">
						<p style="margin-bottom: 20px;">
						    <strong style="font-size: 25px;">${memberDTO.member_name} 고객님의 최근 매점상품 구매내역이 없습니다.</strong>
						    <br><span>영화와 함께 즐길수 있는 매점상품 기프트콘을 이용해 보세요.</span>
						</p>
						<a href="" class="round_red">
						<span>매점상품 기프트콘 구매하러가기 &gt;</span></a>
					</div>
				</c:if>
				<c:if test="${not empty payList}">
					<div class="tbl-data" style="height: auto;">
					<table summary="매점상품 기프트콘 구매일, 상품명, 휴대폰번호,구매수량,결제금액,상태 표기">
						<colgroup>
						    <col width="12%">
						    <col width="*">
						    <col width="25%">
						    <col width="10%">
						    <col width="15%">
						    <col width="15%">
						</colgroup>
						<thead>
						    <tr>
						        <th scope="col">구매일</th>
						        <th scope="col">상품명</th>
						        <th scope="col">수신 휴대폰번호</th>
						        <th scope="col">구매수량</th>
						        <th scope="col">결제금액</th>
						        <th scope="col">관리</th> 
						    </tr>
						</thead>
						<tbody style="border-bottom: ">
						<c:forEach var="productPayListDTO" items="${payList}">
							<tr>
								<td>${productPayListDTO.pay_time}</td>
			                	<td>
									<c:if test="${productPayListDTO.pay_type == 'pay'}">
									<em>구매</em>&nbsp;&nbsp;<strong>${productPayListDTO.product_name}</strong>
			                		</c:if>
			                		<c:if test="${productPayListDTO.pay_type == 'gift'}">
			                		<em>선물</em>&nbsp;&nbsp;<strong>${productPayListDTO.product_name}</strong>
			                		</c:if>
			                	</td>
			                	<td style="text-align: center;padding:10px 0 10px 0;">
			                		${productPayListDTO.buy_phone}
			                		<c:if test="${productPayListDTO.gift_phone2!=null}">
			                			<br>${productPayListDTO.gift_phone2}
			                		</c:if>	
			                		<c:if test="${productPayListDTO.gift_phone3!=null}">
			                			<br>${productPayListDTO.gift_phone3}
			                		</c:if>	
			                	</td>
			                	<td style="text-align: center;padding:10px 0 10px 0;">
			                		${productPayListDTO.order_num1}매
			                		<c:if test="${productPayListDTO.order_num2!=0}">
			                			<br>${productPayListDTO.order_num2}매
			                		</c:if>	
			                		<c:if test="${productPayListDTO.order_num3!=0}">
			                			<br>${productPayListDTO.order_num3}매
			                		</c:if>	
			                	</td>
								<td style="text-align: center;padding:0;">
									<strong><c:out 
									value="${productPayListDTO.product_cost
										*(productPayListDTO.order_num1
			                			+productPayListDTO.order_num2
			                			+productPayListDTO.order_num3)}"></c:out></strong>원
								</td>
								<td style="text-align: center;padding:0;">
									<input type="hidden" id="product_pay_code" value="${productPayListDTO.product_pay_code}">
									<button type="button" class="pay-cancle-btn" data-status="1" class="round black cancel"><span>취소</span></button>
								</td>	
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
		
				<div class="tit-mypage" style="height: 30px;margin-top: 70px;margin-bottom: 10px;">
					<h4>매점상품 기프트콘 구매내역</h4>
				</div>
<!-- 			<form id="form" novalidate="novalidate">
				<div class="sect-use-expense">
					<div class="box-polaroid">
					    <div class="box-inner">
					        <strong class="period">조회기간</strong>
					        <span id="period_wrap"><button data-period="2" data-type="w" class="round gray"><span>2주일</span></button><button data-period="1" data-type="m" class="round gray"><span>1개월</span></button><button data-period="3" data-type="m" class="round gray"><span>3개월</span></button><button data-period="6" data-type="m" class="round gray"><span>6개월</span></button><button data-period="9" data-type="m" class="round gray"><span>9개월</span></button><button data-period="12" data-type="m" class="round gray"><span>12개월</span></button></span>
						    <p>
					            <label for="startdate">시작일 입력</label><input type="text" id="startdate" name="startdate" value="2018-03-26" datepicker="datepicker" class="hasDatepicker" readonly="readonly"><button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키"><span>시작일 선택</span></button> ~ 
					            <label for="enddate">종료일 입력</label><input type="text" id="enddate" name="enddate" value="2018-04-26" datepicker="datepicker" class="hasDatepicker" readonly="readonly"><button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키"><span>종료일 선택</span></button>
					            <button type="button" id="btn_search" class="round inblack"><span>조회하기</span></button> type="submit" 확인요청
					        </p>
					    </div>
					</div>
				</div>
			</form> -->
				<div class="tbl-data">
					<table summary="매점상품 기프트콘 구매일, 상품명, 휴대폰번호,구매수량,결제금액,상태 표기">
						<colgroup>
						    <col width="12%">
						    <col width="*">
						    <col width="25%">
						    <col width="10%">
						    <col width="15%">
						    <col width="15%">
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
							<c:if test="${empty allPayList}">
							<tr>
								<td colspan="6" class="nodata">매점상품 기프트콘 구매내역이 존재하지 않습니다.</td>
							</tr>
							</c:if>
							<c:if test="${not empty allPayList}">
								<c:forEach var="productPayListDTO" items="${allPayList}">
							<tr>
								<td>${productPayListDTO.pay_time}</td>
								<td>
									<c:if test="${productPayListDTO.pay_type == 'pay'}">
									<em>구매</em>&nbsp;&nbsp;<strong>${productPayListDTO.product_name}</strong>
			                		</c:if>
			                		<c:if test="${productPayListDTO.pay_type == 'gift'}">
			                		<em>선물</em>&nbsp;&nbsp;<strong>${productPayListDTO.product_name}</strong>
			                		</c:if>
			                	</td>
			                	<td style="text-align: center;padding:10px 0 10px 0;">
			                		<c:if test="${productPayListDTO.pay_type eq 'pay'}">
			                		${productPayListDTO.buy_phone}
			                		</c:if>
			                		<c:if test="${productPayListDTO.pay_type eq 'gift'}">
			                			<c:if test="${!empty productPayListDTO.gift_phone1}">
				                			${productPayListDTO.gift_phone1}<br>
				                		</c:if>	
				                		<c:if test="${!empty productPayListDTO.gift_phone2}">
				                			${productPayListDTO.gift_phone2}<br>
				                		</c:if>	
				                		<c:if test="${!empty productPayListDTO.gift_phone3}">
				                			${productPayListDTO.gift_phone3}
				                		</c:if>	
			                		</c:if>
			                	</td>
			                	<td style="text-align: center;padding:10px 0 10px 0;">
			                		${productPayListDTO.order_num1}매
			                		<c:if test="${productPayListDTO.order_num2!=0}">	
			                			<br>${productPayListDTO.order_num2}매
			                		</c:if>	
			                		<c:if test="${productPayListDTO.order_num3!=0}">
			                		<br>${productPayListDTO.order_num3}매
			                		</c:if>	
			                	</td>
								<td style="text-align: center;padding:0;">
									<strong><c:out 
									value="${productPayListDTO.product_cost
										*(productPayListDTO.order_num1
			                			+productPayListDTO.order_num2
			                			+productPayListDTO.order_num3)}"></c:out></strong>원
								</td>
								<td style="text-align: center;padding:0;">
									<c:if test="${productPayListDTO.pay_cancle_able=='N' && productPayListDTO.valid=='Y'}">
    									<strong style="color:red;">미사용</strong>
    								</c:if>
									<c:if test="${productPayListDTO.pay_cancle_able=='N' && productPayListDTO.valid=='N'}">
										<strong style="color:gray;">유효기한 초과</strong>
									</c:if>
									<c:if test="${productPayListDTO.pay_cancle_able=='Y'}">
										<strong style="color:gray">구매취소</strong>
									</c:if>
								</td>
							</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="paging">
						<c:if test="${startPageVal>5 }">
							<a id="paging" href="myReserveList.do?p=${startPageVal-1 }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${startPageVal}" end="${endPageVal}">
							<c:if test="${i==p }">
							<a id="currentPaging" href="myReserveList.do?p=${i }">${i }</a>
							</c:if>
							<c:if test="${i!=p }">
							<a id="paging" href="myReserveList.do?p=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPageVal < totalPVal }">
							<a id="paging" href="myReserveList.do?p=${endPageVal+1 }">다음</a>
						</c:if>	
				</div>
				<div class="sect-box-descri">
					<div class="box-polaroid" style="height: 200px;">
					    <div class="box-inner">
					        <ul>
					            <li>
					            	<dl>
					            		<dt>이용안내</dt>
					            		<dd>		                            
					            			<ul>
					            				<li>구매 취소는 상태가 미사용인 상품에 한하여 구매일을 기준으로 60일 이내 취소가 가능하며 부분 환불이 불가합니다.<br>(예 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 그 중 사용하신 쿠폰이 있는 경우 미사용 쿠폰의 환불이 불가합니다.)</li>		
					            				<li><strong>기프트콘의 유효 기한은 발송일로부터 6개월입니다.</strong></li>
					            				<li>매점상품 기프트콘 상품은 일부 극장에서 사용이 불가능합니다.</li>
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
	<jsp:include page="../main/footer.jsp"></jsp:include>
	
<div id="resultAlert"></div>
</body>
</html>