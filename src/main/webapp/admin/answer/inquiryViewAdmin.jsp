<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
<style type="text/css">
	#cont table{
		background-color: white;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
		<form id="form" name="inquiryViewAdmin" method="post" action="../../admin/answer/inquiryAnswer.do
		?pg=${param.pg}&inquiry_code=${inquiryDTO.inquiry_code}&member_id=${inquiryDTO.inquiry_id}">
			<div id="cont">
		
				<table border="1" cellspacing="0" cellpadding="5" align="center">
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
					<c:if test="${inquiryDTO.inquiry_status>0 }">
						<tr>
							<th>답변 이메일</th>
							<td colspan="3"><label>${memberDTO.member_email }</label>
							</td>
						</tr>
						<tr>
							<th>답변 제목</th>
							<td colspan="3"><label>${answerDTO.answer_title }</label>
							</td>
						</tr>
						<tr>
							<th>답변 내용</th>
							<td colspan="3">
								<textarea cols="60" rows="5" id="answer_content"
								style="height: 94px;" disabled="disabled">${answerDTO.answer_content }</textarea>
							</td>
						</tr>
					</c:if>
					<c:if test="${inquiryDTO.inquiry_status == 0 }">
						<c:if test="${admin_id != null }">
							<tr>
								<th>답변 이메일</th>
								<td colspan="3"><input type="text" id="answer_email" value="${memberDTO.member_email }" name="member_email">
								</td>
							</tr>
							<tr>
								<th>답변 제목</th>
								<td colspan="3"><input type="text" id="answer_title" value="${memberDTO.member_name }님 문의에 대한 movieT의 답변입니다." name="answer_title">
								</td>
							</tr>
							<tr>
								<th>답변 내용</th>
								<td colspan="3">
									<textarea cols="60" rows="5" id="answer_content" name="answer_content"
									style="height: 94px;" placeholder="답변 내용을 입력해주세요"></textarea>
								</td>
							</tr>
						</c:if>
					</c:if>
				</table>
				<c:if test="${inquiry_id == inquiryDTO.inquiry_id }">
				<input type="button" value="목록" onclick="location.href='inquiryListMember.do?pg=${param.pg}'">
					<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
				</c:if>
				<c:if test="${admin_id != null }">
					<input type="button" value="목록" onclick="location.href='inquiryListAdmin.do?pg=${param.pg}'">
						<c:if test="${inquiryDTO.inquiry_status==0 }">
							<input type="submit" value="답변">
						</c:if>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>


























