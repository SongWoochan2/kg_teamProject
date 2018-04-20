<%@page import="theater.bean.TheaterDTO"%>
<%@page import="theater.dao.TheaterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>극장상세보기</title>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3">
			<font size="5">${theaterDTO.theater_code }</font>
		</td>
	</tr>
	
	<tr>
		<td width="150" align="center">극장이름 : ${theaterDTO.theater_name }</td>
		<td width="150" align="center">극장주소 : ${theaterDTO.theater_photo_addr }</td>
		<td width="150" align="center">극장번호 : ${theaterDTO.theater_phone }</td>
	</tr>
	<tr>
		<td colspan="3" height="200">
			<pre>극장주소 : ${theaterDTO.theater_photo_addr }</pre>
		</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='theaterList.do?pg=${pg}'">
<input type="button" value="수정" onclick="location.href='theaterModifyForm.do?pg=${pg}&theater_code=${theater_code}'">
<input type="button" value="삭제" onclick="location.href='theaterDelete.do?theater_code=${theater_code}'">
</body>
</html>