// html 태그를 name 속성으로 제어하는 방법
function checkProductPay() {
	alert("결제를 진행합니다!");

    var senderPhoneNumber =  $("#ctl00_bodyPlaceHolder_sender_phone1").val()+ $("#ctl00_bodyPlaceHolder_sender_phone2").val() + $("#ctl00_bodyPlaceHolder_sender_phone3").val();
    var receivePhoneNumber1 =  $("#ctl00_bodyPlaceHolder_receiver1_phone1").val()+ $("#ctl00_bodyPlaceHolder_receiver1_phone2").val() + $("#ctl00_bodyPlaceHolder_receiver1_phone3").val();
    var receivePhoneNumber2 =  $("#ctl00_bodyPlaceHolder_receiver2_phone1").val()+ $("#ctl00_bodyPlaceHolder_receiver2_phone2").val() + $("#ctl00_bodyPlaceHolder_receiver2_phone3").val();
    var receivePhoneNumber3 =  $("#ctl00_bodyPlaceHolder_receiver3_phone1").val()+ $("#ctl00_bodyPlaceHolder_receiver3_phone2").val() + $("#ctl00_bodyPlaceHolder_receiver3_phone3").val();

	if(senderPhoneNumber !=""){
		if(senderPhoneNumber.length < 9){
        	alert("보내는 사람의 전화번호가 잘못 되었습니다.");
            $("#ctl00_bodyPlaceHolder_sender_phone2").focus();
           	return false;	
        }
   	}
        
    if(receivePhoneNumber1 !=""){
		if(receivePhoneNumber1.length < 9){
			alert("받는사람 전화번호가 잘못 되었습니다.");
			$("#ctl00_bodyPlaceHolder_receiver1_phone2").focus();
            return false;	
        }
    }
        
    if(receivePhoneNumber2 !=""){
		if(receivePhoneNumber2.length < 9){
			alert("받는사람 전화번호가 잘못 되었습니다.");
			$("#ctl00_bodyPlaceHolder_receiver2_phone2").focus();
			return false;	
       	}
    }

    if(receivePhoneNumber3 !=""){
		if(receivePhoneNumber3.length < 9){
			alert("받는사람 전화번호가 잘못 되었습니다.");
            $("#ctl00_bodyPlaceHolder_receiver3_phone2").focus();
            return false;	
        }
    }
    else{
    	document.productPay.submit();
    }
}