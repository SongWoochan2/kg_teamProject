<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form").submit(function() {
			if (!$("#notice_item_title").val()) {
				alert("제목을 입력하세요.");
				$("#notice_item_title").focus();
				return false;
			}
			if (!$("#notice_item_content").val()) {
				alert("내용을 입력하세요.");
				$("#notice_item_content").focus();
				return false;
			}
		});
	});
</script>
<style type="text/css">
#title, #notice_item_type{
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
		<div id= container>
			<form id="form" name="noticeItemWriteForm" method="post" action="noticeItemWrite.do">
				<div id="title">
					관리자 공지사항 입력
				</div>
				<div id="notice_item_type">
					공지 종류:
					<input type="radio" name="notice_item_type" value="[시스템 점검]" checked="checked" ><label>[시스템 점검]</label>
					<input type="radio" name="notice_item_type" value="[극장]"><label>[극장]</label>
					<input type="radio" name="notice_item_type" value="[기타]"><label>[기타]</label>
				</div>
				<div>
					<input type="text" name="notice_item_title" size="80" id="notice_item_title" placeholder="제목">
				</div>
				<div>
					<textarea name="notice_item_content" rows="15" cols="82" id="notice_item_content" placeholder="내용"></textarea>
				</div>
				<div>
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시 작성">
				</div>
			</form>
		</div>
	</div>
</body>
</html>