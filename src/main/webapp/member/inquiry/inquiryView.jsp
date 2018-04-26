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
	<form id="form" name="inquiryView" method="post" action="inquiryAnswer.do" >
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td colspan="3">
					<c:if test="${admin_id != null }">
						<span style="color: #9d40b7;">[답변 완료]</span>
					</c:if>
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
			<c:if test="${admin_id != null }">
				<tr>
					<th>답변 이메일</th>
					<td colspan="3"><input type="text" id="answer_email" value="${member_email }" name="answer_email">
					</td>
				</tr>
				<tr>
					<th>답변 제목</th>
					<td colspan="3"><input type="text" id="answer_title" placeholder="답변 제목을 입력해주세요" name="answer_title">
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
		<input type="button" value="목록" onclick="location.href='inquiryList.do?pg=${param.pg}'">
		<c:if test="${inquiry_id == inquiryDTO.inquiry_id }">
			<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
		</c:if>
		<c:if test="${admin_id != null }">
			<input type="submit" value="답변" onclick="location.href='answer.do'">
		</c:if>
		<br><br>
		<input type="button" value="메인으로" onclick="location.href='/MyCGV/admin/clientCenter/clientCenterMain.jsp'">
		<input type="button" value="뒤로" onclick="history.back(); return false;">
	</form>
</body>
</html>


























