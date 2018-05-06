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
		$("#cancle_btn").click(function(){
			var result = confirm('입력하신 정보는 저장되지 않습니다.\n정말 취소하시겠습니까?'); 
			if(result) { //yes 
				location.replace('index.do'); 
			} else {
				
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
		<form name="memberWriteForm" method="post" action="memberWrite.do">
			<fieldset>
				<legend>회원정보 입력</legend>
				<ol>
				  <li>
				    <label>아이디</label>
				    <input class="in" name="member_id" type="text">
				    <input class="btn" type="button" value="  중복 확인  " onclick="checkId()">
				  </li>
				  <li>
				    <label>이름</label>
				    <input class="in" name="member_name" type="text" placeholder="이름 입력">
				  </li>
				  <li>
				    <label>비밀번호</label>
				    <input class="in" name="member_pwd" type="password">
				  </li>
				  <li>
				    <label>비밀번호 확인</label>
				    <input class="in" name="member_repwd" type="password">
				  </li>
				  <li>
				  	<label>법정생년월일</label>
				    <input class="in" type="text" name="yy" maxlength="4" value="" placeholder="년(4자)"> 
						<select class="in" name="mm">
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
					<input class="in" type="text" name="dd" maxlength="2" value="" placeholder="일"> 
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
						<select name="phone1" style="width:70px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>-
					<input class="in" type="text" name="phone2" maxlength="4" size="10">-
					<input class="in" type="text" name="phone3" maxlength="4" size="10">
				  </li>
				  <li>
				  	<label>이메일</label>
				  	<input class="in" type="text" name="email1">@
					<input class="in" type="text" id="email2" name="email2">
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
			  		<input class="btn" type="button" value="  취소  " id="cancle_btn">
					<input class="btn" type="reset" value="  다시 작성  ">
					<input class="btn" type="button" value="  회원가입  " onclick="javascript:checkWrite()">
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


