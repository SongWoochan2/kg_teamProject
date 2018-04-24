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
	</style>
	<script type="text/javascript">
		function isLogin(notice_item_code){
			<c:if test="${admin_id == null }">
				alert("먼저 로그인 하세요.");
			</c:if>
			<c:if test="${admin_id != null }">
				location.href="noticeItemView.do?notice_item_code=" + notice_item_code + "&pg=${param.pg}"
			</c:if>
		}
	</script>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr bgcolor="ffff00">
			<th width="50">번호</th>
			<th width="50">구분</th>
			<th width="300">제목</th>
			<th width="50">등록일</th>
		</tr>
		<c:forEach var="noticeItemDTO" items="${list}">
			<tr bgcolor="ffffcc">
				<td align="center">${noticeItemDTO.notice_item_code}</td>
				<td align="center">${noticeItemDTO.notice_item_type }</td>
				<td>
					<a id="titleA" href="#" onclick="isLogin(${noticeItemDTO.notice_item_code})">
						${noticeItemDTO.notice_item_title}
					</a>
				</td>
				<td align="center">${noticeItemDTO.notice_item_date}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">
				<c:if test="${startPage > 3 }">
					[<a id="paging" href="noticeItemList.do?pg=${startPage-1}">이전</a>]
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i == param.pg }">
						[<a id="currentPaging" href="noticeItemList.do?pg=${i }">${i }</a>]
					</c:if>
					<c:if test="${i != param.pg }">
						[<a id="paging" href="noticeItemList.do?pg=${i }">${i }</a>]
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage < totalP }">
					[<a id="paging" href="noticeItemList.do?pg=${endPage+1}">다음</a>]
				</c:if>
			</td>
		</tr>
	</table>
	<input type="button" value="메인으로" onclick="location.href='../clientCenter/clientCenterMain.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>























