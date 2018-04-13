<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 로그인</title>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#user_name, #user_password").bind({
				"focus" : function(){ $(this).addClass("active") },
				"blur" : function(){ $(this).removeClass("active") }
			});
			
			$("#login").bind("submit", function(){
				if(!$("#user_name").val()){
					alert("아이디를 입력하세요.");
					$("#user_name").focus();
					return false;
				}
				if(!$("#user_password").val()){
					alert("비밀번호를 입력하세요.");
					$("#user_password").focus();
					return false;
				}
				
				$("#login .loader").show();
				
				setTimeout(function(){
					alert("안녕하세요." + $("#user_name").val() + "님");
					$("#login .loader").hide();
				}, 1000);
				
				return false;
			});
		});
	</script>
	<style type="text/css">
		/** 전체 여백 크기 초기화, 기본 글자색 지정 */
		* { padding: 0; margin: 0; color: #333; }
		body { padding: 20px 30px; }
		/** 폼 영역의 크기 및 테두리 */
		#login fieldset {
			width: 270px; padding: 15px;
			border: 1px solid #7BAEB5;
			position: relative;
		}
		/** 입력 항목 제목에 대한 설정 */
		#login label {
			display: inline-block; width: 80px;
			font-size: 14px; font-weight: bold;
			padding-left: 10px; margin-bottom: 10px;
		}
		/** 기본 입력박스의 형태 지정 */
		#login input[type='text'], #login input[type='password'] {
			border: 1px solid #ccc;
			padding: 3px 10px; width: 150px;
			vertical-align: middle;
			font-size: 12px; line-height: 150%;
		}
		/** 버튼의 크기 지정 */
		#login input[type='submit'] { width: 270px; height: 20px }
		/** 활성화 input 에 적용할 스타일 */
		.active {
			border: 1px solid #f00 !important; background-color: #98BF21;
		}
		/** 로딩박스 */
		#login { 
			position: relative; 
		}
		#wrapper{
			margin : auto;
		}
		#login fieldset .loader {
			position: absolute; left: 0; top: 0;
			width: 100%; height: 100%;
			/** 배경색상 투명도는 CSS3 속성이므로, IE8이하는 표시되지 않습니다. */
			background-color: rgba(0, 0, 0, 0.3);
			display: none;
		}
		/** 이미지를 로딩박스 안에서 가운데 배치하기 */
		#login .loader img {
			position: absolute; left: 50%; top: 50%;
			margin-left: -5px; margin-top: -5px;
		}
	</style>
</head>
<body>
<div id="wrapper">
	<h2>관리자 로그인</h2>
	<form action="" id="login">
		<fieldset>
			<legend>로그인</legend>
			<div>
				<label for="user_name">아이디</label>
				<input type="text" name="user_name" id="user_name">
			</div>
			<div>
				<label for="user_password">비밀번호</label>
				<input type="password" name="user_password" id="user_password">
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
			<div class="loader"><img alt="" src="img/loader.gif"></div>
		</fieldset>
	</form>
</div>
</body>
</html>