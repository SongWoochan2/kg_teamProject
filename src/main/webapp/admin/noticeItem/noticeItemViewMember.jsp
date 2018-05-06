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
	
	#noti_top_title{
		font-size: 23;
		font-weight: 900;
	}
	#noti_button{
		margin-top: 5px;
	}
	#noti_td{
		padding: 5px;
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
					<br><br>
				</div>
			</div>
			<div id="noti_table" align="center">
				<table cellspacing="0" cellpadding="5" style="border-bottom: 1px solid black;">
					<tr bgcolor="#c9c9c9" >
						<td id="noti_td" width="600px" align="left" style="font-weight: 700">
							${noticeItemDTO.notice_item_type }  ${noticeItemDTO.notice_item_title }
						</td>
						<td width="200px" align="center">
							등록일  ${noticeItemDTO.notice_item_date }
						</td>
					</tr>
					<tr bgcolor="white" >
						<td colspan="3" height="200" valign="top">
							<pre>${noticeItemDTO.notice_item_content }</pre>
						</td>
					</tr>
				</table>
			</div>
			<div id="noti_button" align="right">
				<input type="button" value="목록" onclick="location.href='noticeItemList.do?pg=${param.pg}'">
			</div>
		</div>
	</div>
	<jsp:include page="/main/main/footer.jsp"/>	
</body>
</html>