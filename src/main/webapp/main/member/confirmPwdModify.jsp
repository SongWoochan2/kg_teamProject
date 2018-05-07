<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 - 회원정보 수정</title>
<link rel="stylesheet" media="all" type="text/css" href="/MyCGV/css/memberConfirm/confirm.css">
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li:eq(6)").attr("class", "on");	
        $('.confirm_btn').on('click', function () {
			var memberPwdObj = $('#member_pwd');
			if(memberPwdObj.val()==""){
	    		alert("비밀번호를 입력하세요.");
	    		memberPwdObj.focus();
	    		return false;
	    	} else if(memberPwdObj.val().includes(" ")){
	    		alert("입력한 비밀번호를 다시 확인하세요.");
	    		memberPwdObj.focus();
	    		return false;
	    	}  else {
/* 	    		$.ajax({
	        		url: "./confirmPwdModify.do",
	        		type: "post",
	        		dataType: "html",
	        		cache: false,
	        		async: false,
	        		timeout: 30000,
	        		success: function(data) {
	        			$("#resultAlert").html(data);
	        		},
	        		error: function(xhr, textStatus, errorThrown) {
						
					}
	        	}); */
	    		$("#confirmMemberPwd").submit();
	    	}
        });
        $('.main_btn').on('click', function () {
        	location.href = '/MyCGV/main/main/index.jsp';
        });
	});
})(jQuery);
</script>
</head>
<body>
<jsp:include page="/main/main/header.jsp"></jsp:include>
	<div id="mypageBody">
		<jsp:include page="/main/mypage/myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="/main/mypage/myContentAside.jsp"></jsp:include>
			<div id="content-detail">			
			<div class="tit-mypage" style="height: 50px; padding: 5px;">
				<h2>비밀번호 확인 </h2>
			</div>
			<p class="info-com">고객님의 개인정보 보호를 위한 절차이오니, MovieT 로그인 시 사용하는 비밀번호를 입력해 주세요.</p>
<form id="confirmMemberPwd" name="confirmMemberPwd" method="post" action="confirmPwdModify.do">

<div class="info_box">
		<div class="info_table">	
		<table>
			<tr>
				<th>아이디</th>
				<td><strong>${sessionScope.memId}</strong></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pwd" id="member_pwd"
					style="height: 30px;"></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td colspan="2" align="center"  style="padding-left: 20px;">
					<input class="confirm_btn" type="button" value="확인">
					<input class="main_btn" type="button" value="MovieT Main">
		 		</td>
			</tr>
		</table>
		</div>

		<div class="info_img">
			<img class="modify_img" src="/MyCGV/image/memberModify/infoConfirm.jpg"/>
		</div>
	</div>


</form>
</div>
</div>
</div>
<jsp:include page="/main/main/footer.jsp"/>
<div id="resultAlert"></div>
</body>
</html>