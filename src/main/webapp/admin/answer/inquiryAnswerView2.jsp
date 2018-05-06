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
<%-- 	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
		<jsp:include page="../../main/inquiry/inquiryView.jsp"/> --%>	
		<%-- <table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td colspan="3">
					${inquiryDTO.inquiry_title }
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
			<tr>
				<th>답변 제목</th>
				<td colspan="3"><input type="text" id="answer_title" value=" ${answerDTO.answer_title }" name="answer_title">
				</td>
			</tr>
			<tr>
				<th>답변 내용<span id="star">*</span></th>
				<td colspan="3">
					<textarea cols="60" rows="5" id="answer_content" name="answer_content"
					style="height: 94px;">${answerDTO.answer_content }</textarea>
				</td>
			</tr>
		</table>
		<c:if test="${inquiry_id == inquiryDTO.inquiry_id }">
		<input type="button" value="목록" onclick="location.href='inquiryListMember.do?pg=${param.pg}'">
			<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
		</c:if>
		<c:if test="${admin_id != null }">
			<input type="button" value="목록" onclick="location.href='inquiryListAdmin.do?pg=${param.pg}'">
		</c:if> --%>
	<!-- </div> -->
</body>
</html>


























