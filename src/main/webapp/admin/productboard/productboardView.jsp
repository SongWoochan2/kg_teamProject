<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp" />
<table border="1" cellpadding="5">
	<tr>
		<td colspan="3">
			<font size="5">상품명 : ${productboardDTO.product_name}</font>
		</td>
	</tr>
	
	<tr>
		<td width="150" align="center">상품코드 : ${productboardDTO.product_code}</td>
		<td width="150" align="center">상품가격 : ${productboardDTO.product_cost}</td>
		<td width="150" align="center">상품분류 : ${productboardDTO.product_type}</td>
	</tr>
	
	<tr>
		<td colspan="3" height="200" valign="top">
			<img alt="" src="../../image/productStorage/${productboardDTO.product_photo_addr}">
		</td>
	</tr>
</table>
<input type="button" value="상품 목록" onclick="location.href='productboardList.do?pg=${pg}'">
<input type="button" value="상품 수정" onclick="location.href='productboardModifyForm.do?product_code=${productboardDTO.product_code}'">
<input type="button" value="상품 삭제" onclick="location.href='productboardDelete.do?product_code=${productboardDTO.product_code}'">
</body>
</html>











