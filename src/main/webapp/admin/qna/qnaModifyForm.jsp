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
</head>
<body>
	<form id="form" name="qnaModifyForm" method="post" action="qnaModify.do">
		<div>
			<input type="hidden" name="qna_code" value="${qnaDTO.qna_code }">
			<table border="1">
				<tr>
					<th scope="row">질문 종류</th>
					<td colspan="3">
						<input type="radio" name="qna_type" value="[예매/관람권]" checked="checked" ><label>[예매/관람권]</label>
						<input type="radio" name="qna_type" value="[영화관이용]"><label>[영화관이용]</label>
						<input type="radio" name="qna_type" value="[홈페이지]"><label>[홈페이지]</label>
						<input type="radio" name="qna_type" value="[기타]"><label>[기타]</label>
					</td>
				</tr>
				<tr>
					<th width="50">제목</th>
					<td><input id="title" type="text" name="qna_title" size="59" value="${qnaDTO.qna_title }"></td>
				</tr>
				<tr>
					<th width="50">내용</th>
					<td><textarea id="content" name="qna_content" rows="15" cols="45">${qnaDTO.qna_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글수정">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>