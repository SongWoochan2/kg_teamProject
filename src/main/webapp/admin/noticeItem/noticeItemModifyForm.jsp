<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form").submit(function() {
			if (!$("#title").val()) {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if (!$("#content").val()) {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
		});
	});
</script>
<style type="text/css">
	#title, #qna_type{
		color: #c7d6a0;
	}
	#title{
		font-size: 30;
		font-weight: 900;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
		<form id="form" name="noticeItemModifyForm" method="post" action="noticeItemModify.do">
			<input type="hidden" name="notice_item_code" value="${noticeItemDTO.notice_item_code }">
			<div>
				<div id="title">
					공지사항 수정
				</div>
				<div id="notice_item_type">
					공지 종류:
					<input type="radio" name="notice_item_type" value="[시스템 점검]" checked="checked" ><label>[시스템 점검]</label>
					<input type="radio" name="notice_item_type" value="[극장]"><label>[극장]</label>
					<input type="radio" name="notice_item_type" value="[이벤트/행사]"><label>[이벤트/행사]</label>
					<input type="radio" name="notice_item_type" value="[기타]"><label>[기타]</label>
				</div>
				<div>
					<input id="notice_item_title" type="text" name="notice_item_title" size="80" value="${noticeItemDTO.notice_item_title }">
				</div>
				<div>
					<textarea id="notice_item_content" name="notice_item_content" rows="15" cols="82">${noticeItemDTO.notice_item_content }</textarea>
				</div>
				<div>
					<input type="submit" value="글수정">
					<input type="reset" value="다시 작성">
				</div>
			</div>
		</form>
	</div>
</body>
</html>