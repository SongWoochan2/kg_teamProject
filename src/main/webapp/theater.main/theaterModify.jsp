<
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>극장수정</title>
<script type="text/javascript">
	window.onload = function(){
		if(${result>0}){
		alert("작성하신 글을 수정하였습니다.");
		location.href = "boardList.do?pg=${pg}";
		} else { 
		alert("작성하신 글을 수정하지 못했습니다.");
		location.href = "boardModifyForm.do?seq=${seq}";
		}
	}
</script>
</head>
<body>
<c:if test="${result > 0 }">
	작성하신 글을 저장하였습니다.
</c:if>
<c:if test="${result == 0 }">
	작성하신 글을 저장하지 못했습니다.
</c:if>
</body>
</html>