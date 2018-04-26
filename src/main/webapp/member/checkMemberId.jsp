<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose(){
		opener.memberWriteForm.member_id.value = '${member_id}';
		window.close();
		opener.memberWriteForm.member_name.focus();
	}
</script>
</head>
<body>
<form name="" method="post" action="checkMemberId.do">
<c:if test="${exist > 0}">
	${ member_id }는 사용 중입니다.<br><br>
	아이디 <input type="text" name="member_id">
		<input type="submit" value="중복 확인">
</c:if>
<c:if test="${exist == 0}">
	${ member_id }는 사용 가능합니다.<br><br>
	<input type="button" value="사용" onclick="checkIdClose()">
</c:if>
</form>
</body>
</html>