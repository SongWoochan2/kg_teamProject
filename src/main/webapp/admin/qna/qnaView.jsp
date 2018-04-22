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
				<font size="5">${qnaDTO.qna_title }</font>
			</td>
		</tr>
		<tr>
			<td>글번호 : ${qnaDTO.qna_code }</td>
			<td>질문 종류 : ${qnaDTO.qna_type }</td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
				<pre>${qnaDTO.qna_content }</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='qnaList.do?pg=${param.pg}'">
	<input type="button" value="수정" onclick="location.href='qnaModifyForm.do?qna_code=${qnaDTO.qna_code}'">
	<input type="button" value="삭제" onclick="location.href='qnaDelete.do?qna_code=${qnaDTO.qna_code}'">
	<br><br>
	<input type="button" value="메인으로" onclick="location.href='/MyCGV/admin/clientCenter/clientCenterMain.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>
