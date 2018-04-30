<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script type="text/javascript">
	window.onload = function() {		
		if(${su > 0}) {
					alert("작성하신 상품을 등록하였습니다.");
					location.href = "productboardList.do?pg=1";
		} else {
					alert("작성하신 상품을 등록하지 못했습니다.");
					location.href = "productboardWriteForm.do";
		} 
	}
</script>
</head>
<body>
<c:if test="${su > 0 }">
		상품등록 완료!
</c:if>		
<c:if test="${su == 0 }">
		상품등록 실패X
</c:if>
</body>
</html>







