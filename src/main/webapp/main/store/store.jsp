<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store</title>

<link rel="stylesheet" media="all" type="text/css" href="../../css/store/store.css">

<script type="text/javascript">
	function isLogin(product_code) {
			location.href="productView.do?product_code=" + product_code;
	}
</script>

</head>
<body>
<jsp:include page="/main/main/header.jsp"/>
<div id="productRealBody">
	<div id="body_top">
		<ul>
			<div class="wrapper" align="center">
				<button onclick="location.href='store.do?type=set'">COMBO SET</button>
				<button onclick="location.href='store.do?type=popcorn'">POPCORN</button>
				<button onclick="location.href='store.do?type=beverage'">BEVERAGE</button>
				<button onclick="location.href='store.do?type=snack'">SNACK</button>
			</div>
		</ul>
		<br>
		<p align="center">
			<img src="../../image/storeStorage/store_main_img.jpg"/>
		</p>
		
		<h1 align="center">Menu</h1>
	</div>
	<div id="bady_bottom">
		<c:forEach var="productboardDTO" items="${typeList }">
			<div id="list_p">
				<div id="list">
					<a id="subjectA" href="#" onclick="isLogin(${productboardDTO.product_code})"> 
					<img width="250px" height="250px" src="../../image/productStorage/${productboardDTO.product_photo_addr}"></a>
					<br><a align="center">${productboardDTO.product_name }</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>