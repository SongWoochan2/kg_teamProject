<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 qna 목록 보기</title>
<style type="text/css">
	#subjextA:link { color:black; text-decoration: none;}
	#subjextA:visited { color:black; text-decoration: none;}
	#subjextA:hover { color:green; text-decoration: underline;}
	#subjextA:achive { color:black; text-decoration: none;}
	#currentPaging { color:red; text-decoration: underline;}
	#paging { color: blue; text-decoration: none;} 
	#qna_ul{
		padding: 0; margin: 0; width:670; list-style: none;
	}
	#qna_li{
		float: left;
	}
	#cont{
		width: 800px;
		margin: 0 auto;
		padding: 15px;
		margin-bottom: 200px;
	}
	#qna_top_title{
		font-size: 23;
		font-weight: 900;
	}
	#qna_table td{
		padding: 7px;
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
					궁금하신 내용에 대해 찾아 보세요
					<br><br>
				</div>
			</div>
			<div id="qna_tab">
				<ul id="qna_ul">
					<li id="qna_li">
						<a href="#">
							<img src="../../image/type/전체-red.png" width="100px" height="50px" alt="전체"/>
						</a>
					</li>
					<li id="qna_li">
						<a href="#">
							<img src="../../image/type/예매관람권-gray.png"width="100px" height="50px" alt="예매관람권"/>
						</a>
					</li>
					<li id="qna_li">
						<a href="#">
							<img src="../../image/type/영화관이용-gray.png"width="100px" height="50px" alt="영화관이용"/>
						</a>
					</li>
					<li id="qna_li">
						<a href="#">
							<img src="../../image/type/홈페이지-gray.png"width="100px" height="50px" alt="홈페이지"/>
						</a>
					</li>
					<li id="qna_li">
						<a href="#">
							<img src="../../image/type/기타-gray.png"width="100px" height="50px" alt="기타"/>
						</a>
					</li>
				</ul>
			</div>
			<br><br><br><br>
			<div id="qna_table" align="center">
				<table cellspacing="0" cellpadding="10" style="border-bottom: 1px solid black;">
					<tr >
						<td colspan="2">총  ${qnaDTO.qna_code}건이 검색 되었습니다.</td>
					</tr>
					<tr bgcolor="#c9c9c9" cellspacing="15">
						<th width="100">번호</th>
						<th width="150">구분</th>
						<th width="390">제목</th>
						<th width="150">등록일</th>
					</tr>
					<c:forEach var="qnaDTO" items="${list}">
						<tr bgcolor="white">
							<td align="center">${qnaDTO.qna_code}</td>
							<td align="center">${qnaDTO.qna_type }</td>
							<td>
								<a id="titleA" href="qnaView.do?qna_code=${qnaDTO.qna_code}&pg=${param.pg}" >
									${qnaDTO.qna_title}
								</a>
							</td>
							<td align="center">${qnaDTO.qna_date}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="center">
							<c:if test="${startPage > 3 }">
								<a id="paging" href="qnaList.do?pg=${startPage-1}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == param.pg }">
									<a id="currentPaging" href="qnaList.do?pg=${i }">${i }</a>
								</c:if>
								<c:if test="${i != param.pg }">
									<a id="paging" href="qnaList.do?pg=${i }">${i }</a>
								</c:if>
							</c:forEach>
							<c:if test="${endPage < totalP }">
								<a id="paging" href="qnaList.do?pg=${endPage+1}">다음</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div id="qna_wbutton">
				<c:if test="${admin_id != null }">
					<input type="button" value="새 글 등록" onclick="location.href='qnaWriteForm.do'">
				</c:if>
			</div>
		</div>	
	</div>
	<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>