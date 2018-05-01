<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store</title>
<style type="text/css">
#list_p{
	align:center;
}

#list{
	width:25%;
	float:left;
}

body{
	background-color:#FDFCF0;
}

p.img{
	border:1px solid black;
	width:800px;
	height:300px;
	float:center;
}

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
#productRealBody{
	border : 1px solid red;
	margin: 30px auto;
	width:  1200px;
	display: block;
}
#productRealBody #body_top{
	border : 1px solid red;
	width:  100%;
	height:  350px;
}

#productRealBody #bady_bottom{
	border : 1px solid red;
	width:  100%;
	height: 100%;
	padding: 50px;
	overflow: auto;
}
#list_p{
	display: inline;
}


</style>

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
					<img width="250px" height="300px" src="../../image/productStorage/${productboardDTO.product_photo_addr}"></a>
					<br><a align="center">${productboardDTO.product_name }</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>