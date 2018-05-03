<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/main/main/header.jsp"/>
		<div id="productRealBody">
			<div>
				자주 찾는 질문
			</div>
			<div>
				회원님들께서 가장 자주하시는 질문을 모았습니다. 
				궁금하신 내용에 대해 검색해보세요
			</div>
			<jsp:include page="qnaList.jsp"/>
		</div>
	<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>