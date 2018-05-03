<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
<style type="text/css">
	#qna_content{
		margin: auto;
	    width: 30%;
	}
	#title, #qna_code, #qna_type{
		color: #c7d6a0;
	}
	#title{
		font-size: 30;
		font-weight: 900;
}
</style>
</head>
<body>
	<div id="title">
		${qnaDTO.qna_title }
	</div>
	<div id="qna_code">
		글번호 : ${qnaDTO.qna_code }
	</div>
	<div id="qna_type">
		질문 종류 : ${qnaDTO.qna_type }
	</div>
	<div id="qna_content">
		<pre>${qnaDTO.qna_content }</pre>
	</div>
	<div>
		<input type="button" value="목록" onclick="location.href='qnaList.do?pg=${param.pg}'">
		<c:if test="${admin_id != null }">
			<input type="button" value="수정" onclick="location.href='qnaModifyForm.do?qna_code=${qnaDTO.qna_code}'">
			<input type="button" value="삭제" onclick="location.href='qnaDelete.do?qna_code=${qnaDTO.qna_code}'">
		</c:if>
	</div>
</body>
</html>
