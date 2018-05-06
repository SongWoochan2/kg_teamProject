<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/clientcenter/clientcenterMenu.css" />
<script>
	$(function(){
		$(".clientcenter_menu li").click(function(){
			$(this).addClass("selected");
			$(".clientcenter_menu li").not(this).removeClass("selected");
		});
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="clientmain_left">
		<div class="left_menubar">
			<ul class="clientcenter_menu">
				<li  class="selected" id=""><a href="/MyCGV/clientCenter/clientCenterMain.jsp" ><strong>고객센터 메인</strong></a></li>
				<li  id=""><a href="/MyCGV/admin/qna/qnaList.do?pg=1"><strong>자주찾는 질문</strong> </a></li>
				<li  id=""><a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1"><strong>공지/뉴스</strong></a></li>
				<li  id=""><a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1"><strong>이메일 문의</strong></a></li>				
			</ul>
		</div>
	</div>
</body>
</html>