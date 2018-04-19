<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>목록 보기</title>
	<style type="text/css">
		#subjextA:link { color:black; text-decoration: none;}
		#subjextA:visited { color:black; text-decoration: none;}
		#subjextA:hover { color:green; text-decoration: underline;}
		#subjextA:achive { color:black; text-decoration: none;}
		
	</style>
	<c:if test="${admin_id == null }">
		<script type="text/javascript">
			function isLogin(seq){
				alert("먼저 로그인 하세요.");
			}
		</script>
	</c:if>
	<c:if test="${admin_id != null }">
		<script type="text/javascript">
			function isLogin(sp_code){
				location.href="showPlaceView.do?theater_code=${param.theater_code}&sp_code=" + sp_code;
			}
		</script>
	</c:if>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr bgcolor="ffff00">
			<th width="70">코드</th>
			<th width="200">상영관명</th>
			<th width="100">좌석수</th>
			<th width="100">기본가격</th>
		</tr>
		<c:forEach var="showPlaceVO" items="${list }">
			<tr bgcolor="ffffcc">
				<td align="center">${showPlaceVO.show_place_code}</td>
				<td>
					<a id="subjectA" href="#" onclick="isLogin(${showPlaceVO.show_place_code})">
						${showPlaceVO.show_place_name}
					</a>
				</td>
				<td align="center">${showPlaceVO.seat_num }</td>
				<td align="center">${showPlaceVO.default_cost }</td>
			</tr>
		</c:forEach>
		
		
	</table>
	<input type="button" value="메인으로" onclick="location.href='../adminMain/adminIndex.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>























