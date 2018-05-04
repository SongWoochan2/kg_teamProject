<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
<style type="text/css">
	#notice_item_content{
		margin: auto;
	    width: 30%;
	}
	#title, #notice_item_code, #notice_item_type{
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
		${noticeItemDTO.notice_item_title }
	</div>
	<div id="notice_item_code">
		글번호 : ${noticeItemDTO.notice_item_code }
	</div>
	<div id="notice_item_type">
		공지 종류 : ${noticeItemDTO.notice_item_type }
	</div>
	<div id="notice_item_content">
		<pre>${noticeItemDTO.notice_item_content }</pre>
	</div>
	<div>
		<input type="button" value="목록" onclick="location.href='noticeItemList.do?pg=${param.pg}'">
		<c:if test="${admin_id != null }">
			<input type="button" value="수정" onclick="location.href='noticeItemModifyForm.do?notice_item_code=${noticeItemDTO.notice_item_code}'">
			<input type="button" value="삭제" onclick="location.href='noticeItemDelete.do?notice_item_code=${noticeItemDTO.notice_item_code}'">
		</c:if>
	</div>
</body>
</html>


























