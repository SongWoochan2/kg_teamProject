<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		window.onload = function(){
			alert("작성하신 글을 저장하였습니다.");
			location.href = "noticeItemList.do?pg=1";
		}
	</script>
</head>
<body>
	<c:if test="${su > 0 }">
		작성한 글을 저장하였습니다.
	</c:if>
	<c:if test="${su <= 0 }">
		작성한 글을 저장하지 못했습니다.
	</c:if>%>
</body>
</html>