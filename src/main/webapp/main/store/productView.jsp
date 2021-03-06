<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productView</title>
    
<link rel="stylesheet" media="all" type="text/css" href="../../css/store/productView.css">

</head>

<body class="" style="">
<jsp:include page="/main/main/header.jsp"/>

<div id="cgvwrap">
	
	<!-- Contaniner -->
	<div id="contaniner" class="">

		<!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			
			<div class="wrap-cultureshop">
    			<br>
				<div class="menu_list">
					<figure class="snip1581"><img src="../../image/storeStorage/set.jpg" alt="profile-sample2"/>
					  <figcaption>
					    <h3 class="title3">Combo Set</h3>
					  </figcaption><a href="store.do?type=set"></a>
					</figure>
					<figure class="snip1581"><img src="../../image/storeStorage/popcorn.jpg" alt="profile-sample7"/>
					  <figcaption>
					    <h3 class="title3">Popcorn</h3>
					  </figcaption><a href="store.do?type=popcorn"></a>
					</figure>
					<figure class="snip1581"><img src="../../image/storeStorage/beverage.jpg" alt="profile-sample6"/>
					  <figcaption>
					    <h3 class="title3">Beverage</h3>
					  </figcaption><a href="store.do?type=beverage"></a>
					</figure>
					<figure class="snip1581"><img src="../../image/storeStorage/snack.jpg" alt="profile-sample6"/>
					  <figcaption>
					    <h3 class="title3">Snack</h3>
					  </figcaption><a href="store.do?type=snack"></a>
					</figure>
				</div>
			
			
			
			
			
			<!-- *****상품 상세 정보 표시***** -->
			
			<div class="tit-heading-wrap">
       			<h3>상품정보</h3>
   			</div>

    		<div class="sect-cultureshopdetail">
		        <div class="box-image">
			        <img src="../../image/productStorage/${productboardDTO.product_photo_addr}">
		        </div>
		        
	        	<div class="box-contents">
		            <div class="title">
		                <strong>${productboardDTO.product_name}</strong>
		            </div>
	           		<div class="price">
		                <strong><em>판매가</em>
		                    <i>${productboardDTO.product_cost}</i>원
		                </strong>
	            	</div>
	       		</div>
	       		
	        	<div class="box-spec">
		            <dl>
		                <dt>사용가능극장</dt>
		                <dd>서울CGV/경기CGV/인천CGV</dd>
		                
		                <dt>유효기간</dt>
		                <dd>구매 후 6개월 이내</dd>
		                
		                <dt>상품교환</dt>
		                <dd>관람 예정 극장의 매점</dd>
		            </dl>
	        	</div>
	        	
       			<div class="box-btn">
		            <a href="store.do?type=set" class="round_menu"><span>목록으로</span></a>
		            <a class="round_gift" href="productPay.do?product_code=${productboardDTO.product_code}"><span>선물하기</span></a>
		            <a class="round_pay" href="productPay.do?product_code=${productboardDTO.product_code}"><span>구매하기</span></a>
        		</div>
    		</div>

			<div class="cols-content">
				<div class="col-detail">
           			 <div class="sect-cultureshopnote">
		                <h4>상품이용안내</h4>
		               		<ul class="note">
		                        <li>MovieT 기프트콘으로는 매점상품 및 영화관람권을 구매/이용하실 수 있습니다.</li>
		                        <li><strong>구매 후 전송 받으신 기프트콘 중,</strong><br>
		                        <em>매점상품:</em> 매점상품은 각 영화관의 매점에서 실제 상품으로 교환하실 수 있습니다.<br>
		                        (각 영화관 매점에서 기프트콘 제시 &gt; 해당 매점 제품으로 교환)<br>
		                       	콤보 中 팝콘을 고소팝콘 이외의 팝콘으로 바꿀 경우, 추가 비용이 발생합니다.<br>
		
		                        
		                        <em>영화관람권:</em> 영화관람권은 MovieT홈페이지,모바일, 또는 영화관 매표소를 통해 영화를 예매하실 수 있습니다.<br>
		                        (홈페이지 빠른예매 &gt; 결제 수단 &gt; '할인/무료/포인트' 선택 &gt; 'MovieT기프트콘' 선택 &gt; 기프트콘 번호 입력)</li>
		                        
		                       
		                       <li><strong>기프트콘 상품은 일부극장에서 사용이 불가능합니다.</strong>
		                      
						                   결제가 완료된 기프트콘 중 사용내역이 전혀 없으신 경우, ‘My 구매정보’ 에서 취소하실 수 있습니다. <br>
		                        (단, 기프트콘 상품은 현금으로 환불은 불가능합니다.)</li>
		                        <li><strong>기프트콘은 부분 환불이 불가합니다.</strong><br>
		                        (예: 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 사용하신 쿠폰이 있는 경우 미사용 쿠폰의 환불은 불가합니다.)</li>
		                        <li>기프트콘의 사용기한은 기프트콘 발송일로부터 6개월입니다.</li>
		                        <li>매점상품 기프트콘은 극장매점에서 기프트콘 사용 후 수령한 영수증으로 포인트 적립이 가능합니다. </li>
		              	  </ul>
		                <ol class="step">
		                    <li>
		                        <strong><img src="../../image/storeStorage/step01.gif"></strong>
		                        <img src="../../image/storeStorage/이용안내_step01.jpg">
		                        <em>기프트콘 구매/선물</em>
		                        <p>기프트콘 선택 후 선물 받는 사람 <br>
						                  또는 본인의 핸드폰번호를 입력하여 <br>
						                  결제합니다.</p>
		                    </li>
		                    <li>
		                        <strong><img src="../../image/storeStorage/step02.gif"></strong>
		                        <img src="../../image/storeStorage/이용안내_step02.jpg">
		                        <em>기프트콘 MMS 수신</em>
		                        <p>결제가 완료 되면 입력한 번호로 <br>
		                       	구매한 상품의 MMS가 전송됩니다.</p>
		                    </li>
		                    <li>
		                        <strong><img src="../../image/storeStorage/step03.gif"></strong>
		                        <img src="../../image/storeStorage/이용안내_step03.jpg">
		                        <em>MovieT매점에서 상품 교환</em>
		                        <p>수신된 MMS로 MovieT홈페이지/모바일 앱,<br>
						                  현장매표소에서 예매 또는 MovieT매점에서<br>
						                  해당 제품으로 교환합니다.</p>
		                    </li>
		               	</ol>
						</div>
        			</div>
   				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>