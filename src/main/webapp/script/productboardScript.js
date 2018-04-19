// html 태그를 name 속성으로 제어하는 방법
function checkProductBoardWrite() {
	if(document.productboardWriteForm.product_name.value == "") {
		alert("상품명을 입력하세요");
		document.productboardWriteForm.subject.focus();
	} else if (document.productboardWriteForm.product_cost.value == ""){
		alert("상품가격을 입력하세요");
		document.productboardWriteForm.content.focus();
	} else if (document.productboardWriteForm.product_type.value == ""){
		alert("상품분류를 입력하세요");
		document.productboardWriteForm.content.focus();
	} else {
		document.productboardWriteForm.submit();
	}	
}
function checkProductBoardModify() {
	if(document.productboardModifyForm.product_name.value == "") {
		alert("상품명을 입력하세요");
		document.productboardModifyForm.subject.focus();
	} else if (document.productboardModifyForm.product_cost.value == ""){
		alert("상품가격을 입력하세요");
		document.productboardModifyForm.content.focus();
	} else if (document.productboardModifyForm.product_type.value == ""){
		alert("상품분류를 입력하세요");
		document.productboardModifyForm.content.focus();
	} else {
		document.productboardModifyForm.submit();
	}	
}