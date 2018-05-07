<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="../../script/productboardScript.js"></script>
<style type="text/css">
div#big_form {
    padding-top: 50px;
    text-align: center;
    width: 100%;
    height: 1200px;
    background-image: url(/MyCGV/image/adminlogin.png);
}

body{
	white;
}
</style>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp" />
<div id="big_form">
	<form action="productboardWrite.do" method="post" name="productboardWriteForm" enctype="multipart/form-data">
		<table border="1" align="center">
			<tr bgcolor="#D0F5A9">
				<th width="150">상품명</th>
				<td><input type="text" name="product_name" size="59"></td>
			</tr>
			
			<tr bgcolor="#D0F5A9">
				<th width="150">상품가격</th>		
				<td><input type="text" name="product_cost" size="59"></td>
			</tr>
			
			<tr bgcolor="#D0F5A9">
				<th width="150">상품분류</th>		
				<td><input type="text" name="product_type" size="59"></td>
			</tr>
			
			<tr bgcolor="#D0F5A9">
				<th width="150">상품분류사진</th>		
				<td colspan="2"><input type="file" name="img" size="50"></td>
			</tr>
			
			<tr bgcolor="#D0F5A9">
				<td colspan="2" align="center">
					<input type="button" value="상품 등록" onclick="checkProductBoardWrite()">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>









