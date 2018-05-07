<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 가입</title>

<link rel="stylesheet" media="all" type="text/css" href="/MyCGV/css/memberConfirm/memberJoin.css">

<script type="text/javascript" src="/MyCGV/script/memberScript.js"></script>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<!-- 생년월일은 텍스트 말고 다른 방식으로 -->
<!-- 성별 -->
<!-- 유효성 검사 (영문,숫자 포함 입력,공백없게) / 모든 필드 글자수 제한 걸기 -->
<script type="text/javascript">
	$(function(){		
		// 변경시 이벤트
		$("#email3").change(function() {
			$("#email3 option:selected").each(function() {
				if ($(this).val() == "0") {
					$("#email3 option:eq(0)").replaceWith("<option value='1'>직접입력</option>");
					$("#email3 option:eq(0)").attr("selected", "selected");
					$("#email3 option:eq(6)").remove();
					$("#email2").val('');
					$("#email2").attr("placeholder","이메일 도메인");
					$("#email2").attr("readonly", false);
				} else if ($(this).val()=="1") {
					$("#email2").val('');
					$("#email2").attr("placeholder","이메일 도메인");
					$("#email2").attr("readonly", false);
				} else {
					$("#email2").val($(this).text());
					$("#email2").attr("readonly", true);
				}
			});
		});
		
		// 입력 취소시
		$("#cancel_btn").click(function(){
			var result = confirm('입력하신 정보는 저장되지 않습니다.\n정말 취소하시겠습니까?'); 
			if(result) { //yes 
				location.replace('index.do'); 
			} else {
				
			}
		});

		
		$("#checkId_dupl").on('click', function () {
			var memberIdObj = $("#member_id");
			var memberId = memberIdObj.val();
			
			// 아이디 유효성 검사 (영문 대/소문자,숫자만 허용)
	        for (i = 0; i < memberIdObj.val().length; i++) {
	            ch = memberIdObj.val().charAt(i);
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("아이디는 영문 대/소문자, 숫자만 입력가능합니다.")
	                memberIdObj.focus();
	                return false;
	            }
	        }
			if(memberId == ""){
				alert("먼저 아이디를 입력하세요.");
				return memberIdObj.focus();
			} else if (memberIdObj.val().includes(" ")) {
                alert("아이디에 공백을 사용할 수 없습니다.");
                memberIdObj.focus();
        		return false;
            } else if (memberIdObj.val().length<8 || memberIdObj.val().length>12) {
                alert("아이디를 8 ~ 12자까지 입력해주세요.")
                memberIdObj.focus();
                memberIdObj.select();
                return false;
            } else {
				window.open("checkMemberId.do?member_id=" + memberId,"myId","width=350 height=100 left=500 top=200");
			}

		});
        
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		$("#submit_btn").click(function(){
			var memberIdObj = $("#member_id");
			var memberPwdObj = $('#member_pwd');
			var email = $("#email1").val()+"@"+$("#email2").val();
			
			// 아이디 유효성 검사 (영문 대/소문자,숫자만 허용)
	        for (i = 0; i < memberIdObj.val().length; i++) {
	            ch = memberIdObj.val().charAt(i);
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("아이디는 영문 대/소문자, 숫자만 입력가능합니다.");
	                memberIdObj.focus();
	        		return false;
	            }
	        }
	      	//아이디에 공백 사용하지 않기
	        if (memberIdObj.val().includes(" ")) {
                alert("아이디에 공백을 사용할 수 없습니다.");
                memberIdObj.focus();
        		return false;
            } 
	        
	      	//아이디 길이 체크 (8~12자)
            if (memberIdObj.val().length<8 || memberIdObj.val().length>12) {
                alert("아이디를 8 ~ 12자까지 입력해주세요.")
                memberIdObj.focus();
                memberIdObj.select();
                return false;
            }
            
            L_szKor = $("#member_name").val().length;
    		var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
    		if (kor_check.test($("#member_name").val())) {
				alert("한글만 입력할 수 있습니다.");
				$("#member_name").val('');
				$("#member_name").focus();
    			return false;
    		} else {
    			if(L_szKor < 2) {
					alert("이름은 2글자 이상 입력할 수 있습니다.");
					$("#member_name").val('');
					$("#member_name").focus();
					return false;
    			}
    		}
	      	
			// 비밀번호 유효성 검사 (영문 대/소문자,숫자만 허용)
	        for (i = 0; i < memberPwdObj.val().length; i++) {
	            ch = memberPwdObj.val().charAt(i);
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("비밀번호는 영문 대/소문자, 숫자만 입력가능합니다.");
	                memberPwdObj.focus();
	        		return false;
	            }
	        }
          	// 비밀번호 길이 체크(8~12자 까지 허용)
            if (memberPwdObj.val().length<8 || memberPwdObj.val().length>12) {
                alert("비밀번호를 8~12자까지 입력해주세요.");
                memberPwdObj.focus();
                return false;
            } else if($("#member_repwd").val()=="") {
				alert("비밀번호 확인란을 입력하세요.");
				$("#member_repwd").focus();
				return false;
			} else if(memberPwdObj.val()!=$("#member_repwd").val()) {
				alert("비밀번호를 맞게 입력했는지 다시 확인하세요.");
				return false;
			} 
               	
            if (memberIdObj.val() == memberPwdObj.val()) {
                alert("아이디와 비밀번호가 같습니다.");
                memberPwdObj.focus();
                return false;
            }
            
         	// 년도, 일에 숫자가 아닌 것을 입력한 경우
            if (!$.isNumeric($("#yy").val())) {
              	alert("년도는 숫자로 입력하세요.");
             	$("#yy").val('');
             	$("#yy").focus();
              	return false;
            } 
         	if ($("#yy").val()<1900) { /////////// 년도 1900년 이전, 2008년 이후
              	alert("진심이세요?");
             	$("#yy").val('');
             	$("#yy").focus();
              	return false;
            } else if ($("#yy").val()>2008) { /////////// 년도 1900년 이전, 2008년 이후
              	alert("MovieT에 가입하기엔 너무 어려요...");
             	$("#yy").val('');
             	$("#yy").focus();
              	return false;
            } else if($("#mm option:selected").text()=='월') {
				alert("월을 선택하세요.");
				return false;
			} else if($("#dd").val()=="") {
				alert("일을 입력하세요.");
				return false;
			} else if (!$.isNumeric($("#dd").val())) {
            	alert("일자는 숫자로 입력하세요.");
            	$("#dd").val('');
            	$("#dd").focus();
                return false;
            } else if (!(1<=$("#dd").val() && $("#dd").val()<=31)) { ///// 1~31 사이 숫자만
            	alert("1 ~ 31 사이의 숫자를 입력하세요.")
            	return false;
            } 

            if(!$("input:radio[name='member_gender']").is(':checked')){
            	alert("성별을 체크하세요.");
            	return false;
            };           
            if(!$("input:radio[name='member_agency']").is(':checked')){
            	alert("휴대전화 통신사를 체크하세요.");
            	return false;
            } else if (!$.isNumeric($("#phone2").val())) {
              	alert("휴대전화 입력란에 숫자를 입력하세요.");
				$("#phone2").val('');
				$("#phone2").focus();
              	return false;
            } else if (!$.isNumeric($("#phone3").val())) {
              	alert("휴대전화 입력란에 숫자를 입력하세요.");
				$("#phone3").val('');
				$("#phone3").focus();
              	return false;
            } else if($("#phone2").val().length<3){
            	alert("휴대전화 입력란을 확인하세요.");
            	$("#phone2").focus();
            	return false;
            } else if($("#phone3").val().length<4){
            	alert("휴대전화 입력란을 확인하세요.");
            	$("#phone3").focus();
            	return false;
            } 

            
			if($("#member_id").val()=="") {
				alert("아이디를 입력하세요.");
				return false;
			} else if($("#member_name").val()=="") {
				alert("이름을 입력하세요.");
				return false;
			}else if($("#phone2").val()=="" || $("#phone3").val()=="") {
				alert("휴대전화를 입력하세요.");
				return false;
			} else if($("#email1").val()=="" || $("#email2").val()=="") {
				alert("이메일 입력란을 확인하세요.");
				return false;
			} else if($("#email3 option:selected").val()=="0"){
				alert("이메일 도메인을 선택하세요.");
				return false;
			} else if (regex.test(email) == false) {          	
                alert("잘못된 이메일 형식입니다.");
                $("#email1").focus();
                return false;
            } else { 
				$("#memberWriteForm").submit();
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="/main/main/header.jsp"/>
<div class="big_form">
	<div class="join_img">
		<img src="../../image/memberModify/join.jpg">
	</div>
	<div class="join_info">
		<form id="memberWriteForm" name="memberWriteForm" method="post" action="memberWrite.do">
			<fieldset>
				<legend>회원정보 입력</legend>
				<ol>
				  <li>
				    <label>아이디</label>
				    <input class="in" id="member_id" name="member_id" type="text" maxlength="12">
				    <input class="btn" id="checkId_dupl" type="button" value="  중복 확인  ">
				  </li>
				  <li>
				    <label>이름</label>
				    <input class="in" id="member_name" name="member_name" type="text" maxlength="9">
				  </li>
				  <li>
				    <label>비밀번호</label>
				    <input class="in" id="member_pwd" name="member_pwd" type="password" maxlength="12">
				  </li>
				  <li>
				    <label>비밀번호 확인</label>
				    <input class="in" id="member_repwd" name="member_repwd" type="password" maxlength="12">
				  </li>
				  <li>
				  	<label>법정생년월일</label>
				    <input class="in" type="text" id="yy" name="yy" maxlength="4" value="" placeholder="년(4자)"> 
						<select class="in" id="mm" name="mm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					<input class="in" type="text" id="dd" name="dd" maxlength="2" value="" placeholder="일"> 
				  </li>
				  <li>
				  	<label>성별</label>
				  	<input class="in" type="radio" name="member_gender" value="남자">남자
					<input class="in" type="radio" name="member_gender" value="여자">여자
				  </li>
				  <li>
				  	<label>휴대전화</label>
				  	<input class="in" type="radio" name="member_agency" value="SKT">SKT
					<input class="in" type="radio" name="member_agency" value="KT">KT
					<input class="in" type="radio" name="member_agency" value="LGU+">LGU+
					<input class="in" type="radio" name="member_agency" value="알뜰폰">알뜰폰<br>
						<select id="phone1" name="phone1" style="width:70px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>-
					<input class="in" type="text" id="phone2" name="phone2" maxlength="4" size="10">-
					<input class="in" type="text" id="phone3" name="phone3" maxlength="4" size="10">
				  </li>
				  <li>
				  	<label>이메일</label>
				  	<input class="in" type="text" id="email1" name="email1" maxlength="25">@
					<input class="in" type="text" id="email2" name="email2" maxlength="20">
					<select class="in" id="email3" name="email3" style="width:100px;">
						<option value="0">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="1">직접입력</option>
					</select>
				  </li>
				</ol>
			</fieldset>
			<fieldset>
				<div class="Btn">
			  		<input class="btn" id="cancel_btn" type="button" value="  취소  " >
					<input class="btn" type="reset" value="  다시 작성  ">
					<input class="btn" id="submit_btn" type="button" value="  회원가입  ">
				</div>
			</fieldset>
			<fieldset>
				<input class="btn" type="button" value="  MovieT Main  " onclick="location.href='index.do'">
			</fieldset>
		</form>
	</div>
</div>

<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>


