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
				<font size="5">${noticeItemDTO.notice_item_title }</font>
			</td>
		</tr>
		<tr>
			<td>글번호 : ${noticeItemDTO.notice_item_code }</td>
			<td>공지 종류 : ${noticeItemDTO.notice_item_type }</td>
			<td>작성자 : ${noticeItemDTO.admin_id }</td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
				<pre>${noticeItemDTO.notice_item_content }</pre>
			</td>
		</tr>
	</table>
	
	
	<input type="button" value="목록" onclick="location.href='noticeItemList.do?pg=${param.pg}'">
	<c:if test="${admin_id == noticeItemDTO.admin_id }">
		<input type="button" value="수정" onclick="location.href='noticeItemModifyForm.do?notice_item_code=${noticeItemDTO.notice_item_code}'">
		<input type="button" value="삭제" onclick="location.href='noticeItemDelete.do?notice_item_code=${noticeItemDTO.notice_item_code}'">
	</c:if>
	<br><br>
	<input type="button" value="메인으로" onclick="location.href='../clientCenter/clientCenterMain.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>


























