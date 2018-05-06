<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>

<link rel="stylesheet" media="all" type="text/css" href="/MyCGV/css/loginForm/loginForm.css">

<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$('#member_id').focus();
		
		// 쿠키값을 가져온다.
		var cookie_user_id = getLogin();
		// 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤 체크박스를 체크상태로 변경
		if(cookie_user_id != "") {
			$("#member_id").val(cookie_user_id);
			$("#save_id").attr("checked", true);
		}
		// 아이디 저장 체크시
		$("#save_id").on("click", function(){
			var isRemember;

			if($(this).is(":checked")) {
			isRemember = 
				confirm("이 PC에 로그인 정보를 저장하시겠습니까?\nPC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

				if(!isRemember)    
					$(this).attr("checked", false);
			}
		});
		
		// saveLogin : 로그인 정보 저장 : @param id
		function saveLogin(id) {
			if(id != "") {
			// memberId 쿠키에 id 값을 7일간 저장
			setSave("memberId", id, 7);
			}else{
			// memberId 쿠키 삭제
			setSave("memberId", id, -1);
			}
		}
		
		// setSave : Cookie에 member_id를 저장
		// @param name,@param value,@param expiredays
		function setSave(name, value, expiredays) {
			var today = new Date();
			today.setDate( today.getDate() + expiredays );
			document.cookie = name + "=" + escape( value ) 
			+ "; path=/; expires=" + today.toGMTString() + ";"
		}
		// getLogin : 쿠키값을 가져온다.
		// @returns {String}
		function getLogin() {
			// memberId 쿠키에서 id 값을 가져온다.
			var cook = document.cookie + ";";
			var idx = cook.indexOf("memberId", 0);
			var val = "";

			if(idx != -1) {
				cook = cook.substring(idx, cook.length);
				begin = cook.indexOf("=", 0) + 1;
				end = cook.indexOf(";", begin);
				val = unescape(cook.substring(begin, end));
			}
			return val;
		}
		
		
		
        $('#submit').on('click', function () {
        	var memberIdObj = $('#member_id');
        	var memberPwdObj = $('#member_pwd');
        	
			if($("#save_id").is(":checked")){ // 저장 체크시
				saveLogin(memberIdObj.val());
			}else{ // 체크 해제시는 공백
				saveLogin("");
			}
/*             // 아이디 유효성 검사 (영문 대/소문자,숫자만 허용)
            for (i = 0; i < memberIdObj.val().length; i++) {
                ch = memberIdObj.val().charAt(i);
                if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                    alert("아이디는 영문 대/소문자, 숫자만 입력가능합니다.")
                    memberIdObj.focus();
            		return false;
                }
            }
            if (memberIdObj.val().includes(" ")) {
        		//아이디에 공백 사용하지 않기
                alert("아이디에 공백을 사용할 수 없습니다.");
                memberIdObj.focus();
        		return false;
            } 
            
            
            //아이디 길이 체크 (4~12자)
            if (memberIdObj.val().length<8 || document.f.my_id.value.length>12) {
                alert("아이디를 8 ~ 12자까지 입력해주세요.")
                document.f.my_id.focus()
                document.f.my_id.select()
                return false;
            } */
           
            
        	if(memberIdObj.val()==""){ 
        		alert("아이디를 입력하세요.");
        		memberIdObj.focus();
        		return false;
        	} else if(memberIdObj.val().includes(" ")){
        		alert("입력한 아이디를 다시 확인하세요.");
        		memberIdObj.focus();
        		return false;
        	} else if(memberPwdObj.val()==""){
        		alert("비밀번호를 입력하세요.");
        		memberPwdObj.focus();
        		return false;
        	} else if(memberPwdObj.val().includes(" ")){
        		alert("입력한 비밀번호를 다시 확인하세요.");
        		memberPwdObj.focus();
        		return false;
        	}  else {
        		/* $.ajax({
            		url: "./memberLogin.do",
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
        	}
        });
	});
})(jQuery);
</script>
   
<body>
<jsp:include page="/main/main/header.jsp"/>
						<!-- ********************* 비밀번호 5회 오류시 ??? ********************* -->
<div id="contaniner">
	<div id="contents">
    	<div class="wrap-login">
        	<div class="sect-login">
          		<div class="box-login login_1408">
                <h3 class="hidden">회원 로그인</h3>
                    <form id="form2_capcha" name="memberLoginForm" method="post" action="/MyCGV/main/member/memberLogin.do" novalidate="novalidate" style="display:block;">
                 		<fieldset>
                 		
                 			<!-- 페이지 이동시 파라미터  저장 -->
                			<input type="hidden" name="origin_uri" value="${origin_uri }">
                			<c:forEach var="pre_param" items="${param_map }">
		               			<c:forEach var="pre_value" items="${pre_param.value }">
		               				<input type="hidden" name="pre_${pre_param.key }" value="${pre_value }">
		               			</c:forEach>
                			</c:forEach>
                			
                			<div class="txt_wrap">
                            	<img height="200px" width="200px" src="/MyCGV/image/loginForm/loginMain.png">
                            </div>
                           	<div class="login">
                                <input type="text" title="아이디" id="member_id" name="member_id" data-title="아이디를 " data-message="입력하세요." required="required">
                            	<input type="password" title="패스워드" id="member_pwd" name="member_pwd" data-title="패스워드를 " data-message="입력하세요." required="required">
                            </div>
                            <button type="submit" id="submit" title="로그인">
                            	<span>로그인</span>
                            </button>
                            <input type="checkbox" id="save_id">
							<label for="save_id">아이디 저장</label>
							<br>
							<br>
							<a href="#">아이디 찾기</a> / 
							<a href="#">비밀번호 찾기</a>
						</fieldset>
					</form>
				</div>
        	</div>
        </div>
		<div class="sect-loginguide">
        	<div class="box-useguide">
            	<strong>movieT 회원이 아니신가요?</strong>
              	<span>회원가입하시고 다양한 서비스를 즐기세요!</span>
              	<button class="join_btn" onclick="location.href='/MyCGV/main/member/memberWriteForm.do'" id="submit">MovieT 회원가입하기</button>
            </div>
        </div>
       	<div class="sect-loginad" style="background:#d2cbbe">
            <div>
            	<img src="/MyCGV/image/loginForm/cinema.jpg" width="350" height="250" frameborder="0"/>
        	</div>
    	</div>
	</div>
</div>

<jsp:include page="/main/main/footer.jsp"/>
<div id="resultAlert"></div>
</body>
</html>