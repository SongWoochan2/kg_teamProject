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
	<form id="form" name="inquiryView" method="post" action="../../admin/answer/inquiryAnswer.do
	?pg=${param.pg}&inquiry_code=${inquiryDTO.inquiry_code}&member_id=${inquiryDTO.inquiry_id}">
		<table border="1" cellspacing="0" cellpadding="5">
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
			
			<c:if test="${inquiryDTO.inquiry_file != null}">
			<tr>
				<td colspan="3">
					첨부파일 : <a href="../../image/inquiry/${inquiryDTO.inquiry_file }">${inquiryDTO.inquiry_file }</a>
				</td>
			</tr>
			</c:if>
			<c:if test="${inquiryDTO.inquiry_file == null}">
			<tr>
				<td colspan="3">
					첨부파일 : <span>없음</span>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="3" height="200" valign="top">
					<pre>${inquiryDTO.inquiry_content }</pre>
				</td>
			</tr>
			<c:if test="${admin_id != null }">
				<tr>
					<th>답변 이메일</th>
					<td colspan="3"><input type="text" id="answer_email" value="${memberDTO.member_email }" name="answer_email">
					</td>
				</tr>
				<tr>
					<th>답변 제목</th>
					<td colspan="3"><input type="text" id="answer_title" value="CGV의 고객 ${memberDTO.member_name }님께" name="answer_title">
					</td>
				</tr>
				<tr>
					<th>답변 내용<span id="star">*</span></th>
					<td colspan="3">
						<textarea cols="60" rows="5" id="answer_content" name="answer_content"
						style="height: 94px;" placeholder="답변 내용을 입력해주세요"></textarea>
					</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${inquiry_id == inquiryDTO.inquiry_id }">
		<input type="button" value="목록" onclick="location.href='inquiryListMember.do?pg=${param.pg}'">
			<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
		</c:if>
		<c:if test="${admin_id != null }">
			<input type="button" value="목록" onclick="location.href='../../admin/answer/inquiryListAdmin.do?pg=${param.pg}'">
			<input type="submit" value="답변">
		</c:if>
		<br><br>
		<input type="button" value="메인으로" onclick="location.href='/MyCGV/admin/clientCenter/clientCenterMain.jsp'">
		<input type="button" value="뒤로" onclick="history.back(); return false;">
	</form>
</body>
</html>


























