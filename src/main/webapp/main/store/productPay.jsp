<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Pay</title>

<link rel="stylesheet" href="../../css/store/productPay.css">

<script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
<script src="http://img.cgv.co.kr/common/js/jquery.cycle2.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="../../script/productpayScript.js"></script>

<body>
<jsp:include page="/main/main/header.jsp"/>
<form action="productPayComplete.do?product_code=${param.product_code }" method="post" name="productPay">
	
    <!--원가 -->
<input type="hidden" name="ctl00$bodyPlaceHolder$hidPrice" id="ctl00_bodyPlaceHolder_hidPrice" value="${productboardDTO.product_cost }">
<input type="hidden" name="ctl00$bodyPlaceHolder$hidMMSImgSel" id="ctl00_bodyPlaceHolder_hidMMSImgSel">

<div class="giftshop_wrap">
	<div class="order_section">
		<img src="../../image/storeStorage/title_order.png" alt="주문 정보 입력" width="104" height="18">
		
		<!-- 상품 정보 -->
		<div class="order_detail cf">
			<img src="../../image/productStorage/${productboardDTO.product_photo_addr}" id="ctl00_bodyPlaceHolder_imgProductImg" alt="상품명" width="153" height="161"> 
			<dl>
				<dt class="blind_txt">상품</dt>
				<dd class="item_name">${productboardDTO.product_name }</dd>
				
				<dt class="blind_txt">가격</dt>
				<dd id="ctl00_bodyPlaceHolder_price_normal" class="price_normal">${productboardDTO.product_cost }원</dd>
			</dl>		
		</div>
	</div>
		
	<!-- 보내는/받는 사람 -->
	<div class="contact_section">
		<div class="title">
			<img src="../../image/storeStorage/연락처 입력.png" alt="연락처를 입력해 주세요" width="171" height="17">
		</div>
		
		<!-- 보내는 이 입력-->
		<div class="sender">
			<img src="../../image/storeStorage/title_02_01.png" alt="선물 하는 분" width="68" height="13">
			<dl class="sender_row">
				<dt class="col_label name">
					<img src="../../image/storeStorage/label_name.png" width="22" height="13" alt="이름">
				</dt>
				<dd class="col_sender_name">${member_id } 님</dd>
				<dt class="col_label phone">
					<img src="../../image/storeStorage/label_phone.png" width="60" height="13" alt="휴대폰 번호">
				</dt>
				<dd class="col_phone1"> 
					<div class="select_phone1_wrap">
						<select name="ctl00$bodyPlaceHolder$sender_phone1" id="ctl00_bodyPlaceHolder_sender_phone1" class="select_phone1">
							<option selected="selected" value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>					
					<div class="select_phone1_over"><span>010</span></div>
				</dd>
					<dt class="blind_txt"></dt>
					<dd class="col_phone2">
						<span class="dash">-</span>
						<input name="ctl00$bodyPlaceHolder$sender_phone2" type="text" id="ctl00_bodyPlaceHolder_sender_phone2" maxlength="4" onkeydown="allowOnlyNumeric()" class="phone2">
						<span class="dash">-</span>
						<input name="ctl00$bodyPlaceHolder$sender_phone3" type="text" id="ctl00_bodyPlaceHolder_sender_phone3" maxlength="4" onkeydown="allowOnlyNumeric()" class="phone2">
					</dd>
						<dt class="blind_txt"></dt>
						<dd class="change_info">* 번호 변경시에도 회원정보에 반영되지 않습니다.</dd>
			</dl>
		</div>
		<!-- //보내는이 입력-->
		
		<div class="line_sp_contact"></div>
		<div class="receiver">
			<img src="../../image/storeStorage/title_02_02.png" alt="선물 받는 분" width="68" height="13">
			<!-- 받는분 리스트 요소 -->
			<dl class="receiver_row">
				<dt></dt>
				<dd class="col_receiver_num">1</dd>
				<dt class="col_label phone">
					<img src="../../image/storeStorage/label_phone.png" width="60" height="13" alt="휴대폰 번호">
				</dt>
				<dd class="col_phone1"> 
					<div class="select_phone1_wrap">
						<select name="ctl00$bodyPlaceHolder$receiver1_phone1" id="ctl00_bodyPlaceHolder_receiver1_phone1" class="select_phone1" onchange="calculate()">
							<option value="">선택하세요</option>
							<option selected="selected" value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>					
					<div class="select_phone1_over"><span>010</span></div>
				</dd>
				<dt class="blind_txt"></dt>
				<dd class="col_phone2">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver1_phone2" type="text" id="ctl00_bodyPlaceHolder_receiver1_phone2" maxlength="4" onkeydown="allowOnlyNumeric()" onkeyup="calculate()" class="phone2">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver1_phone3" type="text" id="ctl00_bodyPlaceHolder_receiver1_phone3" maxlength="4" onkeydown="allowOnlyNumeric()" onkeyup="calculate()" class="phone2">
				</dd>
				<dt class="col_label qty">
					<img src="../../image/storeStorage/label_num.png" width="24" height="13" alt="수량">
				</dt>
				<dd class="col_qty">
					<div class="select_qty_wrap">
                        <select name="ctl00$bodyPlaceHolder$qty1" id="ctl00_bodyPlaceHolder_qty1" class="select_qty" onchange="calculate()">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>						
					</div>					
					<div class="select_qty_over"><span>1</span></div>				
				</dd>
			</dl>
			<!-- //받는분 리스트 요소-->
			<!-- 받는분 리스트 요소 -->
			<dl class="receiver_row">
				<dt></dt>
				<dd class="col_receiver_num">2</dd>
				<dt class="col_label phone">
					<img src="../../image/storeStorage/label_phone.png" width="60" height="13" alt="휴대폰 번호">
				</dt>
				<dd class="col_phone1"> 
					<div class="select_phone1_wrap">
						<select name="ctl00$bodyPlaceHolder$receiver2_phone1" id="ctl00_bodyPlaceHolder_receiver2_phone1" class="select_phone1" onchange="calculate()">
							<option selected="selected" value="">선택하세요</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>					
					<div class="select_phone1_over"><span>선택하세요</span></div>
				</dd>
				<dt class="blind_txt"></dt>
				<dd class="col_phone2">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver2_phone2" type="text" id="ctl00_bodyPlaceHolder_receiver2_phone2" maxlength="4" onkeydown="allowOnlyNumeric()" onkeyup="calculate()" class="phone2">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver2_phone3" type="text" id="ctl00_bodyPlaceHolder_receiver2_phone3" maxlength="4" onkeydown="allowOnlyNumeric()" onkeyup="calculate()" class="phone2">
				</dd>
				<dt class="col_label qty">
					<img src="../../image/storeStorage/label_num.png" width="24" height="13" alt="수량">
				</dt>
				<dd class="col_qty">
					<div class="select_qty_wrap">
                        <select name="ctl00$bodyPlaceHolder$qty2" id="ctl00_bodyPlaceHolder_qty2" class="select_qty" onchange="calculate()">
							<option value="" selected="selected"></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>						
					</div>					
					<div class="select_qty_over"><span>1</span></div>				
				</dd>
			</dl>
			<!-- // 받는분 리스트 요소 -->
			<!-- 받는분 리스트 요소 -->
			<dl class="receiver_row">
				<dt></dt>
				<dd class="col_receiver_num">3</dd>
				<dt class="col_label phone">
					<img src="../../image/storeStorage/label_phone.png" width="60" height="13" alt="휴대폰 번호">
				</dt>
				<dd class="col_phone1"> 
					<div class="select_phone1_wrap">
						<select name="ctl00$bodyPlaceHolder$receiver3_phone1" id="ctl00_bodyPlaceHolder_receiver3_phone1" class="select_phone1" onchange="calculate()">
							<option selected="selected" value="">선택하세요</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>					
					<div class="select_phone1_over"><span>선택하세요</span></div>
				</dd>
				<dt class="blind_txt"></dt>
				<dd class="col_phone2">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver3_phone2" type="text" id="ctl00_bodyPlaceHolder_receiver3_phone2" maxlength="4" class="phone2" onkeydown="allowOnlyNumeric()" onkeyup="calculate()">
					<span class="dash">-</span>
					<input name="ctl00$bodyPlaceHolder$receiver3_phone3" type="text" id="ctl00_bodyPlaceHolder_receiver3_phone3" maxlength="4" class="phone2" onkeydown="allowOnlyNumeric()" onkeyup="calculate()">
				</dd>
				<dt class="col_label qty">
					<img src="../../image/storeStorage/label_num.png" width="24" height="13" alt="수량">
				</dt>
				<dd class="col_qty">
					<div class="select_qty_wrap">
                        <select name="ctl00$bodyPlaceHolder$qty3" id="ctl00_bodyPlaceHolder_qty3" class="select_qty" onchange="calculate()">
							<option value="" selected="selected"></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>						
					</div>					
					<div class="select_qty_over"><span>1</span></div>				
				</dd>
			</dl>
			<!-- // 받는분 리스트 요소 -->
			
            <p class="alert">※ 전기통신사업법에 의거하여 MMS수신 시, 발신번호는 CGV고객센터(1111-1111)로 발송됩니다.</p>							
		</div>
		<div class="line_sp_contact"></div>		
		<!-- 결제 금액 -->
		<div class="sum">
			<p><br>
				<%-- <span id="dc">총 결제 금액
					 <b>${productboardDTO.product_cost }</b>
				</span> --%>
			</p>
         <span id="ctl00_bodyPlaceHolder_UpdatePanel1">
			<a onclick="checkProductPay()" id="ctl00_bodyPlaceHolder_lnkResult" href="#">
				<img src="../../image/storeStorage/btn_pay.png" width="122" height="39" alt="결제하기">
			</a>
		</span>
        </div>
	</div>
	<!-- //결제 금액 -->
	
     <div id="ctl00_bodyPlaceHolder_pnGfit">
		
		<div class="guide_area">
			<h4 class="guide_title">이용안내</h4>
			<div class="guide_sp_line"></div>
			<ul class="guide_txt">
				<li>최대 3명에게 발송할 수 있습니다.</li>
				<li id="ctl00_bodyPlaceHolder_theaterInfo2">기프트콘 상품은 다른 극장에서 사용이 불가능합니다. </li>
				
				<li id="ctl00_bodyPlaceHolder_theaterInfo3" class="gs2_ls_none"></li>
	            <li>결제 확인 및 취소는 MY 구매내역에서 가능합니다.</li>
			</ul>	
		</div>
	</div>
</div>

    
	<script>
	    $(document).ready(function () {

	        $(".select_phone1_over span").each(function () {
	            $(this).text($(this).parent().prev().find(":selected").text());
	        });

	        $(".select_qty_over span").each(function () {
	            $(this).text($(this).parent().prev().find(":selected").text());
	        });


	        $(".select_phone1_wrap select").change(function () {
	            var value = $(this).find(":selected").text();
	            $(this).parent().next().find("span").text(value);
	        });

	        $(".select_qty_wrap select").change(function () {
	            var value = $(this).find(":selected").text();
	            $(this).parent().next().find("span").text(value);
	        });

	        $(".receiver_row").last().css("border-bottom", "0px");

	        $(".btn_reset").click(function () {
	            $(this).parent().parent().find(":text").val("").end().find("option:eq(0)").attr("selected", "selected").parent().change();
	            $(this).parent().parent().find(".select_qty option:eq(0)").attr("selected", "selected").parent().change();
	            return false;
	        });
	    });	      		
	</script>
    
<jsp:include page="/main/main/footer.jsp"/>
</form>
</body>
</html>