<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제</title>
<script type="text/javascript">
	window.onload = function() {		
		if(${su > 0}) {
					alert("결제가 완료 되었습니다.");
					location.href = "productPay.do?product_code=${productboardDTO.product_code}";
		} else {
					alert("결제를 완료하지 못했습니다.");
					location.href = "productPay.do?product_code=${productboardDTO.product_code}";
		} 
	}
</script>
</head>
<body>

</body>
</html>