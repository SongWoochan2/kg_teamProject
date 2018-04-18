<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="4">
				<font size="5">상영관명 : ${showPlaceVO.show_place_name }</font>
			</td>
		</tr>
		<tr>
			<td>코드 : ${showPlaceVO.show_place_code }</td>
			<td>좌석수 : ${showPlaceVO.seat_num }</td>
			<td>기본가격 : ${showPlaceVO.default_cost }</td>
		</tr>
		<tr>
			<td colspan="4" height="200" valign="top">
				<img alt="상영관 이미지" src="${showPlaceVO.show_place_photo_addr }">
			</td>
		</tr>
	</table>
	
	<input type="button" value="뒤로" onclick="history.back(); return false;">
	<c:if test="${admin_id != null }">
		<input type="button" value="수정" onclick="location.href='showPlaceModifyForm.do?theater_code=${param.theater_code}&sp_code=${showPlaceVO.show_place_code}'">
		<input type="button" value="삭제" onclick="location.href='showPlaceDelete.do?theater_code=${param.theater_code}&sp_code=${showPlaceVO.show_place_code}'">
	</c:if>
</body>
</html>


























