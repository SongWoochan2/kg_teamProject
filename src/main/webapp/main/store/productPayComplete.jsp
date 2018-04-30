<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<script type="text/javascript">
	window.onload = function() {		
		if(${su > 0}) {
					alert("상품 결제가 완료되었습니다.");
					location.href = "store.do?type=set";
		} else {
					alert("상품 결제에 실패하였습니다.");
					/* location.href = "productPay.do"; */
		} 
	}
</script>
</head>
<body>
</body>
</html>