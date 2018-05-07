<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>목록 보기</title>
	<style type="text/css">
		#subjextA:link { color:black; text-decoration: none;}
		#subjextA:visited { color:black; text-decoration: none;}
		#subjextA:hover { color:green; text-decoration: underline;}
		#subjextA:achive { color:black; text-decoration: none;}
		
		#currentPaging { color:red; text-decoration: underline;}
		#paging { color: blue; text-decoration: none;}
		#tb_div{
			margin: auto;
			width: 800px;
			height: 1000px;
		}
		#inq_table{
			border-bottom: 1px;
		}
	</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id = "content" align="center">
		<div id="tb_div" align="center">
			<table id= "inq_table"  cellspacing="0" cellpadding="5" >
				<tr bgcolor="#c9c9c9">
					<th width="50">번호</th>
					<th width="50">구분</th>
					<th width="500">제목</th>
					<th width="50">상태</th>
					<th width="50">등록일</th>
				</tr>
				<c:forEach var="inquiryDTO" items="${list}">
					<tr bgcolor="white">
						<td align="center">${inquiryDTO.inquiry_code}</td>
						<td align="center">${inquiryDTO.inquiry_type }</td>
							<td>
								<a id="titleA" href="inquiryViewAdmin.do?inquiry_code=${inquiryDTO.inquiry_code}&pg=${param.pg}">
									${inquiryDTO.inquiry_title}
								</a>
							</td>
						<c:if test="${inquiryDTO.inquiry_status == 0}">
							<td align="center"><span style="color: #2f538e;">[답변 미완료]</span></td>
						</c:if>
						
						<c:if test="${inquiryDTO.inquiry_status > 0}">
							<td align="center"><span style="color: #9d40b7;">[답변 완료]</span></td>
						</c:if>
						<td align="center">${inquiryDTO.inquiry_date}</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="5" align="center">
						<c:if test="${startPage > 3 }">
							[<a id="paging" href="inquiryListAdmin.do?pg=${startPage-1}">이전</a>]
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i == param.pg }">
								[<a id="currentPaging" href="inquiryListAdmin.do?pg=${i }">${i }</a>]
							</c:if>
							<c:if test="${i != param.pg }">
								[<a id="paging" href="inquiryListAdmin.do?pg=${i }">${i }</a>]
							</c:if>
						</c:forEach>
						
						<c:if test="${endPage < totalP }">
							[<a id="paging" href="inquiryListAdmin.do?pg=${endPage+1}">다음</a>]
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>























