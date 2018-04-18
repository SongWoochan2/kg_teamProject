<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="../script/boardScript.js"></script>
</head>
<body>
	<form name="boardModifyForm" method="post" action="boardModify.do">
		<div>
			<input type="hidden" name="sp_code" value="${showPlaceVO.show_place_code }">
			<table border="1">
				<tr>
					<th width="50">상영관명</th>
					<td><input type="text" name="name" size="59" value="${boardDTO.subject }"></td>
				</tr>
				<tr>
					<th width="50">내용</th>
					<td><textarea name="content" rows="15" cols="45">${boardDTO.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="글수정" onclick="javascript:checkBoardModify()">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>