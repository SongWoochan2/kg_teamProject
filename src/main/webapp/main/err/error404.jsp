<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 : ERROR</title>
<style type="text/css">
	body{
		background: #FFFFF6;
	}
	div{
		box-sizing: border-box;
	}
	#wrap_frame{
		border: 3px dotted #ff3b0f;
		border-radius: 10px;
		width: 500px;
		height: 550px;
		margin: 70px auto;
		padding: 30px;
	}
	#wrap_frame #logo_img_link{
		width: 100%;
		height: 42%;
	}
	#wrap_frame #logo_img_link img{
		width: 100%;
		height: 100%;
	}
	#wrap_frame #error_comment{
		width: 100%;
		height: 50%;
		padding: 5px
	}
	#wrap_frame #location_button{
		width: 100%;
		height: 8%;
		text-align: center;
		margin: auto;
	}
	p{
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<div id="wrap_frame">
		<div id="logo_img_link">
			<a href="/MyCGV/main/main/index.jsp">
				<img alt="로고이미지" src="/MyCGV/image/logo/moviet_logo.png">
			</a>
		</div>
		<div id="error_comment">
			<h3>
				ERROR CODE : 404
			</h3>
			<h4>
				죄송합니다.<br/>
				요청하신 페이지를 찾을 수 없습니다.
			</h4>
			<p>
				방문하시려는 페이지의 주소가 잘못 입력되었거나,
				페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br><br>
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
			</p>
		</div>
		<div id="location_button">
			<input type="button" value="뒤로가기" onclick="history.back();">
			<input type="button" value="홈으로" onclick="location.href='/MyCGV/main/main/index.jsp'">
		</div>
	</div>
</body>
</html>