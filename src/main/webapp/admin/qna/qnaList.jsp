<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
		#currentPaging { color:red; text-decoration: underline;}
		#paging { color: blue; text-decoration: none;}
	</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
		<table border="1" cellspacing="0" cellpadding="5" align="center">
			<tr bgcolor="ffff00">
				<th width="50">번호</th>
				<th width="50">구분</th>
				<th width="300">제목</th>
				<th width="50">등록일</th>
			</tr>
			<c:forEach var="qnaDTO" items="${list}">
				<tr bgcolor="ffffcc">
					<td align="center">${qnaDTO.qna_code}</td>
					<td align="center">${qnaDTO.qna_type }</td>
					<td>
						<a id="titleA" href="qnaView.do?qna_code=${qnaDTO.qna_code}&pg=${param.pg}" >
							${qnaDTO.qna_title}
						</a>
					</td>
					<td align="center">${qnaDTO.qna_date}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="center">
					<c:if test="${startPage > 3 }">
						[<a id="paging" href="qnaList.do?pg=${startPage-1}">이전</a>]
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i == param.pg }">
							[<a id="currentPaging" href="qnaList.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${i != param.pg }">
							[<a id="paging" href="qnaList.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
					
					<c:if test="${endPage < totalP }">
						[<a id="paging" href="qnaList.do?pg=${endPage+1}">다음</a>]
					</c:if>
				</td>
			</tr>
		</table>
		
		<c:if test="${admin != null }">
			<input type="button" value="새 글 등록" onclick="location.href='qnaWriteForm.do'">
		</c:if>
	</div>
</body>
</html>























