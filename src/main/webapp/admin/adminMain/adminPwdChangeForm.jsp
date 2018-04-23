<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	
	$(function(){
		var check = function(){
			if($("#new_admin_pwd").val()=="" &&  $("#new_admin_repwd").val()==""){
				$("#passwordmessage").css("color","red");
				$("#passwordmessage").text("");	
			}else if($("#new_admin_pwd").val() == $("#new_admin_repwd").val()){
				$("#passwordmessage").css("color","blue");
				$("#passwordmessage").text("비밀번호가 일치합니다.");
			}else{
				$("#passwordmessage").css("color","red");
				$("#passwordmessage").text("비밀번호가 일치하지 않습니다.");	
			}
		}
		
		$("#new_admin_pwd").keyup(function(){check();});
		$("#new_admin_repwd").keyup(function(){check();});
		
		$("#change_submit").click(function(){
			if ($("#passwordmessage").text() != "비밀번호가 일치합니다.") {
				alert("비밀번호가 불일치합니다.");
			}else{
				
				document.adminPwdChange.submit();
			}
		});
	});
</script>
<style>
	#adminchange{
		width : 500px;
		margin : auto;
	}
	#adminchange div{
		padding-top : 10px;
		padding-bottom : 10px;
		background-color: lightgray;
	}
	#adminchange #changetitle{
		background-color : #b6f25c;
		border-radius : 20px 20px 0px 0px;
		width : 100%;
		font-weight: bold;
		font-size: 19px;
/* 		text-align: center; */
	}
	#adminchange #changetitle:hover{
		background-color : #ffffff;
	}
	#adminchange #changesmalltitle{
		font-size: 16px;
		width : 100%;
		font-weight: bold;
	}
	#adminchange #changesubmit{
		border-top : 1px solid black;
		border-radius: 0px 0px 20px 20px;
	}
	#adminchange #changesubmit #change_submit{
		width: 100%;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id="content" align="center">
		<div id="adminchange">
			<form action="adminPwdChange.do" method="post" name="adminPwdChange">
				<div id="changetitle">관리자 비밀번호 변경</div>
				<div><label id="changesmalltitle">현재 관리자 비밀번호</label></div>
				<div id=""><input type="password" class="form-control"
								placeholder="현재 관리자 비밀번호" maxlength="25" name="admin_pwd" id="admin_pwd"
								required="required" autocomplete="off" ></div>
				<div><label id="changesmalltitle">새 관리자 비밀번호</label></div>
				<div id=""><input type="password" class="form-control"
								placeholder="새 관리자 비밀번호" maxlength="25" name="new_admin_pwd" id="new_admin_pwd"
								required="required" autocomplete="off" ></div>
				<div id="changesmalltitle">새 관리자 비밀번호 확인</div>
				<div id=""><input type="password" class="form-control"
								placeholder="새 관리자 비밀번호 확인" maxlength="25" name="new_admin_repwd" id="new_admin_repwd"
								required="required" autocomplete="off" ></div>
				<div id="passwordmessage"></div>
				<div id="changesubmit">
				<button type = "button" class="btn btn-info btn-lg" id = "change_submit">
         		<span class="glyphicon glyphicon-file"></span> 비밀변호 변경</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>