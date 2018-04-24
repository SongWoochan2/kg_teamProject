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
			<td colspan="3">
				<font size="5">${inquiryDTO.inquiry_title }</font>
			</td>
		</tr>
		<tr>
			<td>글번호 : ${inquiryDTO.inquiry_code }</td>
			<td>공지 종류 : ${inquiryDTO.inquiry_type }</td>
			<td>작성자 : ${inquiryDTO.inquiry_id }</td>
		</tr>
		<tr>
			<td colspan="3">
				첨부파일 : <a href="../../image/inquiry/${inquiryDTO.inquiry_file }">${inquiryDTO.inquiry_file }</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
				<pre>${inquiryDTO.inquiry_content }</pre>
			</td>
		</tr>
	</table>
	
	
	<input type="button" value="목록" onclick="location.href='inquiryList.do?pg=${param.pg}'">
	<c:if test="${inquiry_id == inquiryDTO.inquiry_id }">
		<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
	</c:if>
	<br><br>
	<input type="button" value="메인으로" onclick="location.href='/MyCGV/admin/clientCenter/clientCenterMain.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>


























