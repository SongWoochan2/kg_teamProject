<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>
<style type="text/css">
#subjectA:link { color:black; text-decoration: none; }
#subjectA:visited { color:black; text-decoration: none; }
#subjectA:hover { color:green; text-decoration: underline; }
#subjectA:achive { color:black; text-decoration: none; }

#currentPaging { color: red;  text-decoration: underline; }
#paging { color: blue;	text-decoration: none; }

div {
    display: block;
}

#big_form {
    padding-top: 50px;
    text-align: center;
    width: 100%;
    height: 1200px;
    background-image: url(/MyCGV/image/adminlogin.png);
}

div#contain#tab{
	text-align:center;
}
</style>

<script type="text/javascript">
	function isLogin(product_code) {	
		if('${memId}' == null) { 
			alert("먼저 로그인 하세요");
		} else { 
			location.href="productboardView.do?product_code=" + product_code + "&pg=" + ${pg};
		}
	}
</script>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp" />

<div id="big_form">
	<div id="con">
		<div id="tab">
			<table cellpadding="10" align="center">
				<tr bgcolor="#F6CECE">
					<th width="100">상품분류</th>
					<th width="200">상품명</th>
					<th width="100">상품가격</th>
				</tr>
			<c:forEach var="productboardDTO" items="${list }">
				<tr bgcolor="#F5F6CE">
					<td align="center">${productboardDTO.product_type}</td>
					<td><a id="subjectA" href="#" onclick="isLogin(${productboardDTO.product_code})"> 
						${productboardDTO.product_name}</a></td>
					<td align="center">${productboardDTO.product_cost}</td>
				</tr>	
			</c:forEach>
				<!-- 페이징 -->
				<tr>
					<td colspan="5" align="center">
						<c:if test="${ startPage > 3}">			
							[<a id="paging" href="productboardList.do?pg=${startPage-1}">이전</a>]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
								<c:if test="${i==pg}">		
									[<a id="currentPaging" href="productboardList.do?pg=${i }" >${i }</a>]
								</c:if>	
								<c:if test="${i!=pg}">	
									[<a id="paging" href="productboardList.do?pg=${i }" >${i }</a>]
								</c:if>
						</c:forEach>	
					
						<c:if test="${endPage < totalP}">			
								[<a id="paging" href="productboardList.do?pg=${endPage+1}">다음</a>]			
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<a href="productboardWriteForm.do">상품 등록하기</a>
	</div>
</div>
</body>
</html>
