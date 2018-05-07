<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/clientcenter/clientcenterMenu.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/clientcenter/clientCenterMeneAdd.css" />
<style type="text/css">
	#subjextA:link { color:black; text-decoration: none;}
	#subjextA:visited { color:black; text-decoration: none;}
	#subjextA:hover { color:green; text-decoration: underline;}
	#subjextA:achive { color:black; text-decoration: none;}
	#currentPaging { color:red; text-decoration: underline;}
	#paging { color: blue; text-decoration: none;}
	#ul{
		padding: 0; margin: 0; width:670; list-style: none;
	}
	/* 목록의 가로배치 */
	#li{
		float: left;
	}
	#noti_top_title{
		font-size: 23;
		font-weight: 900;
	}
	#noti_table td{
		padding: 7px;
	}
	#gettotal{
		color:white;
	}
</style>
</head>
<body>
<jsp:include page="/main/main/header.jsp"/>
		<div id="cont">
		<div id="cont_left">
			<div class="left_menubar">
				<ul class="clientcenter_menu">
					<li  id=""><a href="/MyCGV/clientCenter/clientCenterMain.jsp" ><strong>고객센터 메인</strong></a></li>
					<li  id=""><a href="/MyCGV/admin/qna/qnaList.do?pg=1"><strong>자주찾는 질문</strong> </a></li>
					<li class="selected" id=""><a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1"><strong>공지/뉴스</strong></a></li>
					<li   id=""><a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1"><strong>이메일 문의</strong></a></li>				
				</ul>
			</div>
		</div>
	<div id="cont_right">
			<div id="noti_top">
				<div id="noti_top_title">
					공지/뉴스
				</div>
				<div id="noti_top_ment">
					<br>
					CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.
					<br><br><br>
				</div>
			</div>
			<div id="tab">
				<ul id="ul">
					<li id="li">
						<a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1">
						<c:if test="${requestScope.type==null }">
							<img src="../../image/type/전체-red.png" width="100px" height="50px" alt="전체"/>
						</c:if>
						<c:if test="${requestScope.type!=null }">
							<img src="../../image/type/전체-gray.png" width="100px" height="50px" alt="전체"/>
						</c:if>
						</a>
					</li>
					<li id="li">
						<a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1&type=시스템점검">
						<c:if test="${requestScope.type!='시스템점검' }">
							<img src="../../image/type/시스템점검-gray.png" width="100px" height="50px" alt="시스템점검"/>
						</c:if>
						<c:if test="${requestScope.type=='시스템점검' }">
							<img src="../../image/type/시스템점검-red.png" width="100px" height="50px" alt="시스템점검"/>
						</c:if>
							
						</a>
					</li>
					<li id="li">
						<a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1&type=극장">
						<c:if test="${requestScope.type!='극장' }">
							<img src="../../image/type/극장-gray.png" width="100px" height="50px" alt="극장"/>
						</c:if>
						<c:if test="${requestScope.type=='극장' }">
							<img src="../../image/type/극장-red.png" width="100px" height="50px" alt="극장"/>
						</c:if>
						</a>
					</li>

				</ul>
			</div>
			<br><br><br><br>
			<div id="noti_table">
				<table cellspacing="0" cellpadding="5" align="center" style="border-bottom: 1px solid black;">
					<tr>
						<td colspan="2"><font>총  ${requestScope.totalA}건이 검색 되었습니다.</font></td>
					</tr>
					<tr bgcolor="#c9c9c9">
						<th width="100">번호</th>
						<th width="150">구분</th>
						<th width="390">제목</th>
						<th width="150">등록일</th>
					</tr>
					<c:forEach var="noticeItemDTO" items="${list}">
						<tr bgcolor="white">
							<td align="center">${noticeItemDTO.notice_item_code}</td>
							<td align="center">${noticeItemDTO.notice_item_type }</td>
							<td>
								<a id="titleA" href="noticeItemView.do?notice_item_code=${noticeItemDTO.notice_item_code}&pg=${param.pg}" >
									${noticeItemDTO.notice_item_title}
								</a>
							</td>
							<td align="center">${noticeItemDTO.notice_item_date}</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="5" align="center">
							<c:if test="${startPage > 3 }">
								<a id="paging" href="noticeItemList.do?pg=${startPage-1}&type=${requestScope.type}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == param.pg }">
									<a id="currentPaging" href="noticeItemList.do?pg=${i }&type=${requestScope.type}">${i }</a>
								</c:if>
								<c:if test="${i != param.pg }">
									<a id="paging" href="noticeItemList.do?pg=${i }&type=${requestScope.type}">${i }</a>
								</c:if>
							</c:forEach>
							<c:if test="${endPage < totalP }">
								<a id="paging" href="noticeItemList.do?pg=${endPage+1}&type=${requestScope.type}">다음</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>	
	</div>
	<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>