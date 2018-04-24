<%@page import="reserve.bean.ReserveDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>극장목록</title>
<style type="text/css">
#subjectA:link {color:black; text-decoration:none;}
#subjectA:visited {color:black; text-decoration:none;}
#subjectA:hover {color:green; text-decoration:underline;}
#subjectA:active {color:black; text-decoration:none;}
#currentPaging {color:red; text-decoration: underline;}
#paging {color:blue; text-decoration: none;}
</style>

 <script type="text/javascript">
function isLogin(show_present_code) {	
		 location.href="theaterView.do?show_present_code=" + show_present_code + "&pg=" + ${pg};
}
</script> 

</head>
<body>
<table border="1" cellspacing="0" cellpadding="5" >
	<tr bgcolor="#A6A6A6">
		<th width="70">극장코드</th>
		<th width="200">극장명</th>
		<th width="100">극장사진주소</th>
		<th width="100">극장연락처</th>
	</tr>
	
	
	
<c:forEach var="reserveDTO" items="${requestScope.list }">
	<tr bgcolor="#D5D5D5">
		<td align="center">${ reserveDTO.show_present_code }</td>
		<td align="center"><a id="subjectA" href="#" onclick="isLogin(${ reserveDTO.show_present_code })">
			${ reserveDTO.show_present_code }</a></td>
		<td align="center">${ reserveDTO.show_present_code }</td>
		<td align="center">${ reserveDTO.show_present_code }</td>
	</tr>
</c:forEach>

	<!-- 페이징 -->
	 <tr>
		<td colspan=5 align=center>
		<c:if test="${startPage>3 }">
			[<a id="paging" href="theaterList.do?pg=${startPage-1 }">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i==pg }">
			[<a id="currentPaging" href="theaterList.do?pg=${i }">${i }</a>]
			</c:if>
			<c:if test="${i!=pg }">
			[<a id="paging" href="theaterList.do?pg=${i }">${i }</a>]
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalP }">
			[<a id="paging" href="theaterList.do?pg=${endPage+1 }">다음</a>]
		</c:if>
		</td> 
	</tr>
</table>
<a href="theaterInsertForm.do">극장등록</a><br>
</body>
</html>