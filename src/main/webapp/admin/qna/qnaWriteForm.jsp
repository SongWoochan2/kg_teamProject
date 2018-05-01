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
			if (!$("#qna_title").val()) {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if (!$("#qna_content").val()) {
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
		<div id="container">
			<form id="form" name="qnaWriteForm" method="post" action="qnaWrite.do">
				<div id="title">
					자주 묻는 질문 입력
				</div>
					<div id="qna_type">
						질문 종류 :
						<input type="radio" name="qna_type" value="[예매/관람권]" checked="checked" ><label>[예매/관람권]</label>
						<input type="radio" name="qna_type" value="[영화관이용]"><label>[영화관이용]</label>
						<input type="radio" name="qna_type" value="[홈페이지]"><label>[홈페이지]</label>
						<input type="radio" name="qna_type" value="[기타]"><label>[기타]</label>
					</div>
					<div >
						<input type="text" name="qna_title" size="80" id="qna_title" placeholder="제목">
					</div>
					<div>
						<textarea name="qna_content" rows="15" cols="82" id="qna_content" placeholder="내용"></textarea>
					</div>
					<div>
							<input type="submit" value="글 등록">
							<input type="reset" value="다시 작성">
					</div>
				
			</form>
		</div>
	</div>
</body>
</html>