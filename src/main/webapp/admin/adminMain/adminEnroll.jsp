<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			if($("#admin_pwd").val()=="" &&  $("#admin_repwd").val()==""){
				$("#passwordmessage").css("color","red");
				$("#passwordmessage").text("");	
			}else if($("#admin_pwd").val() == $("#admin_repwd").val()){
				$("#passwordmessage").css("color","blue");
				$("#passwordmessage").text("비밀번호가 일치합니다.");
			}else{
				$("#passwordmessage").css("color","red");
				$("#passwordmessage").text("비밀번호가 일치하지 않습니다.");	
			}
		}
		
		$("#admin_pwd").keyup(function(){check();})
		$("#admin_repwd").keyup(function(){check();})
		
		if(${requestScope.id_check == 'true'} == true){
			$("#admin_id").attr("disabled",true);
		}
		
		$("#admin_id_check").click(function(){
			alert($("#admin_id").val());
			var url = "adminIdCheck.do?admin_id="+$("#admin_id").val()
					+"&admin_name="+$("#admin_name").val();
			$(location).attr('href',url);
		});
		
		
		$("#enroll_submit").click(function(){
			if ($("#check").text() != "중복 체크 완료") {
				alert("아이디 중복검사를 하세요.");
			} else if ($("#passwordmessage").text() != "비밀번호가 일치합니다.") {
				alert("비밀번호가 불일치합니다.");
			} else if ($("#admin_name").val() == '') {
				alert($("#admin_pwd").val().length);
				alert("이름을 입력하세요.");
			} 
// 			else if ($("#admin_pwd").val().length > 13 || ($("#admin_pwd").val().length < 6) {
// 				alert("비밀번호는 6~12자로 입력해주세요.");
// 			} 
			else{
				$("#admin_id").attr("disabled",false);
				document.adminEnrollForm.submit();
			}
			
		});


	});
</script>
<style>
	#adminenroll{
		width : 500px;
		margin : auto;
	}
	#adminenroll div{
		padding-top : 10px;
		padding-bottom : 10px;
		background-color: lightgray;
	}
	#adminenroll #enrolltitle{
		background-color : #b6f25c;
		border-radius : 20px 20px 0px 0px;
		width : 100%;
		font-weight: bold;
		font-size: 19px;
/* 		text-align: center; */
	}
	#adminenroll #enrolltitle:hover{
		background-color : #ffffff;
	}
	#adminenroll #enrollsmalltitle{
		font-size: 16px;
		width : 100%;
		font-weight: bold;
	}
	#adminenroll #passwordmessage{
		color : blue;
	}
	#adminenroll #enrollsubmit{
		border-top : 1px solid black;
	}
	#adminenroll #enrollsubmit #enroll_submit{
		width: 100%;
	}
	#adminenroll #checkmessage{
		border-radius : 0px 0px 20px 20px;
		color : blue;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id="content" align="center">
		<div id="adminenroll">
			<form action="adminEnrollRequest.do" method="post" name="adminEnrollForm">
				<div id="enrolltitle">관리자 등록</div>
				<div id="enrollsmalltitle">관리자 아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type = "button" class="btn btn-info btn-lg" id = "admin_id_check"><span class = "glyphicon glyphicon-search"></span> 중복 검사</button></div>
				<div id=""><input type="text" class="form-control"
								placeholder="관리자 아이디" maxlength="30" name="admin_id" id="admin_id"
								required="required" autocomplete="off" value="${requestScope.admin_id }"></div>
				<div id="enrollsmalltitle">관리자 이름</div>
				<div id=""><input type="text" class="form-control"
								placeholder="관리자 이름" maxlength="20" name="admin_name" id="admin_name"
								required="required" autocomplete="off" value="${requestScope.admin_name }"></div>
				<div><label id="enrollsmalltitle">관리자 비밀번호</label></div>
				<div id=""><input type="password" class="form-control"
								placeholder="관리자 비밀번호" maxlength="25" name="admin_pwd" id="admin_pwd"
								required="required" autocomplete="off" ></div>
				<div id="enrollsmalltitle">관리자 비밀번호 확인</div>
				<div id=""><input type="password" class="form-control"
								placeholder="관리자 비밀번호" maxlength="25" name="admin_repwd" id="admin_repwd"
								required="required" autocomplete="off" ></div>
				<div id="passwordmessage"></div>
				<div id="enrollsubmit">
				<button type = "button" class="btn btn-info btn-lg" id = "enroll_submit">
         		<span class="glyphicon glyphicon-file"></span> 등록 신청</button>
				</div>
				<div id="checkmessage">
					<label id="check"><c:if test="${requestScope.id_check == 'true'}">중복 체크 완료</c:if></label>
					<label id="check"><c:if test="${requestScope.id_check == 'false'}">
						중복 체크를 해주세요.
					</c:if>
					</label>
				</div>
			</form>
		</div>
	</div>
	<%-- <jsp:include page="/admin/adminMain/footer_admin.jsp"/> --%>
</body>
</html>