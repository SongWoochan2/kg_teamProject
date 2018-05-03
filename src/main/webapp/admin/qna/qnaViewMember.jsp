<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cont{
		padding: 15px;
		margin: 0 auto;
		margin-bottom: 200px;
		width: 800px;
	} 
	#qna_top_title{
		font-size: 23;
		font-weight: 900;
	}
	#qna_button{
		margin-top: 5px;
	}
	#qna_td{
		padding: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="/main/main/header.jsp"/>
	<div id="productRealBody">
		<div id="cont">
			<div id="qna_top">
				<div id="qna_top_title">
					자주 찾는 질문
				</div>
				<div id="qna_top_ment">
					<br>
					회원님들께서 가장 자주하시는 질문을 모았습니다.
					<br> 
					궁금하신 내용에 대해 찾아보세요
					<br><br>
				</div>
			</div>
			<div id="qna_table" align="center">
				<table cellspacing="0" cellpadding="5" style="border-bottom: 1px solid black;">
					<tr bgcolor="#c9c9c9" >
						<td id="qna_td" width="600px" align="left" style="font-weight: 700">
							${qnaDTO.qna_type }  ${qnaDTO.qna_title }
						</td>
						<td width="200px" align="center">
							등록일  ${qnaDTO.qna_date }
						</td>
					</tr>
					<tr bgcolor="white" >
						<td colspan="3" height="200" valign="top">
							<pre>${qnaDTO.qna_content }</pre>
						</td>
					</tr>
				</table>
			</div>
			<div id="qna_button" align="right">
				<input type="button" value="목록" onclick="location.href='qnaList.do?pg=${param.pg}'">
			</div>
		</div>
	</div>
	<jsp:include page="/main/main/footer.jsp"/>	
</body>
</html>