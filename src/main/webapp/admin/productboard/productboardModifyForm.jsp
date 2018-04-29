<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="../../script/productboardScript.js"></script>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp" />
<form action="productboardModify.do" method="post" name="productboardModifyForm" enctype="multipart/form-data">
	<input type="hidden"  name="product_code" value="${productboardDTO.product_code}">
	<table border="1">
		<tr>
			<th width="150">상품명</th>		
			<td><input type="text" name="product_name" size="59" value="${productboardDTO.product_name}"></td>
		</tr>
		
		<tr>
			<th width="150">상품가격</th>		
			<td><input type="text" name="product_cost" size="59" value="${productboardDTO.product_cost}"></td>
		</tr>
		
		<tr>
			<th width="150">상품분류</th>		
			<td><input type="text" name="product_type" size="59" value="${productboardDTO.product_type}"></td>
		</tr>
		
		<tr>
			<th width="150">상품분류사진</th>		
			<td colspan="2"><input type="file" name="img" size="50"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="상품 수정" onclick="checkProductBoardModify()">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>