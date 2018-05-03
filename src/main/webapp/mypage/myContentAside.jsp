<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li").on('click', function(){
			$(this).attr("class", "on");	
		});
	});
})(jQuery);
</script>
</head>
<body>
	<div id="content-aside">
		<ul>
			<li><a href="mypageHome.do">My MovieT Home</a></li>
			<li><a href="myReserveList.do?p=1">나의 예매내역</a></li>
			<li><a href="myStoreList.do">나의 스토어</a></li>
			<li><a href="myPointList.do?p=1">나의 포인트</a></li>
			<li><a href="myProfileForm.do">나의 프로필</a></li>
			<li><a href="../main/inquiry/inquiryListMember.do">나의 문의내역</a></li>
			<li><a href="../member/confirmPwdModify.do">나의 정보 변경</a></li>
			<li><a href="../member/confirmPwdDelete.do">회원탈퇴</a></li>	
		</ul>
	</div>
</body>
</html>