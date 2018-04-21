<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	#adminenroll #enrollsubmit{
		border-top : 1px solid black;
		border-radius : 0px 0px 20px 20px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id="content" align="center">
		<div id="adminenroll">
			<form action="adminEnrollRequest.do" method="post" name="adminEnrollForm">
				<div id="enrolltitle">관리자 등록</div>
				<div id="enrollsmalltitle">관리자 아이디</div>
				<div id=""><input type="text" class="form-control"
								placeholder="관리자 아이디" maxlength="30" name="admin_id"
								required="required" autocomplete="off"></div>
				<div id="enrollsmalltitle">관리자 이름</div>
				<div id=""><input type="text" class="form-control"
								placeholder="관리자 이름" maxlength="20" name="admin_name"
								required="required" autocomplete="off"></div>
				<div id="enrollsmalltitle">관리자 비밀번호</div>
				<div id=""><input type="password" class="form-control"
								placeholder="관리자 비밀번호" maxlength="25" name="admin_pwd"
								required="required" autocomplete="off"></div>
				<div id="enrollsubmit">
				<button type = "submit" class="btn btn-info btn-lg">
         		<span class="glyphicon glyphicon-file"></span> 등록 신청</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>