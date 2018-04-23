<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<!-- 유효성 검사 (영문,숫자 포함 입력,공백없게) / 모든 필드 글자수 제한 걸기 -->
<!-- 회원정보 수정이랑 탈퇴 전에 비밀번호 확인 창 만들기 -->
<script type="text/javascript">
	$(function(){		
		// 불러온 값 표시하기 -------
		// 생년월일
		var splitBirth = $("#birthView").val().split('-');
		$("input[type=text][name=yy]").val(splitBirth[0]);
		$("select[name=mm]").val(splitBirth[1]);
		$("input[type=text][name=dd]").val(splitBirth[2]);
		
		// 성별
		if ($("#genderView").val() == "남자") {
			$("#gender_m").attr("checked", "checked");
		} else {
			$("#gender_f").attr("checked", "checked");
		}

		// 통신사
		if ($("#agencyView").val() == "SKT") {
			$("#agc_s").attr("checked", "checked");
		} else if ($("#agencyView").val() == "KT") {
			$("#agc_k").attr("checked", "checked");
		} else if ($("#agencyView").val() == "LGU+") {
			$("#agc_l").attr("checked", "checked");
		} else {
			$("#agc_a").attr("checked", "checked");
		}

		// 휴대전화
		var member_phone = $("#phoneView").val();
		var phone1 = member_phone.substring(0,3);
		$("select[name=phone1]").val(phone1);
		if(member_phone.length > 10) {
			var phone2 = member_phone.substring(3,7);
			var phone3 = member_phone.substring(7,11);
		} else {
			var phone2 = member_phone.substring(3,6);
			var phone3 = member_phone.substring(6,10);
		}
		$("input[type=text][name=phone2]").val(phone2);
		$("input[type=text][name=phone3]").val(phone3);
		
		// 이메일
		var splitEmail = $("#emailView").val().split('@');
		$("input[type=text][name=email1]").val(splitEmail[0]);
		$("#email2").val(splitEmail[1]).attr("readonly", true);
		
		
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
		
		// 수정 취소시
		$("#cancle_btn").click(function(){
			var result = confirm('수정하신 정보는 저장되지 않습니다.\n수정을 취소하시겠습니까?'); 
			if(result) { //yes 
				location.replace('../index.jsp'); 
			} else {
				
			}
		});
	});
</script>
</head>
<body>
	<form name="memberModifyForm" method="post" action="memberModify.do">
		<table>
			<tr>
				<th>아이디</th>
				<td>${memberDTO.member_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberDTO.member_name }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="member_repwd"></td>
			</tr>
			<tr>
				<!-- <th>법정생년월일(6자리)</th> -->
				<th>법정생년월일</th>
				<td>
					<input type="hidden" id="birthView" value="${memberDTO.member_birth}">
					<input type="text" name="yy" maxlength="4" value="" placeholder="년(4자)"> 
					<select name="mm">
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
					<input type="text" name="dd" maxlength="2" value="" placeholder="일"> 			
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="hidden" id="genderView" value="${memberDTO.member_gender}">
					<input type="radio" name="member_gender" id="gender_m" value="남자">남자
					<input type="radio" name="member_gender" id="gender_f" value="여자">여자
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<input type="hidden" id="agencyView" value="${memberDTO.member_agency}">
					<input type="radio" name="member_agency" id="agc_s" value="SKT">SKT
					<input type="radio" name="member_agency" id="agc_k" value="KT">KT
					<input type="radio" name="member_agency" id="agc_l" value="LGU+">LGU+
					<input type="radio" name="member_agency" id="agc_a" value="알뜰폰">알뜰폰<br>
					
					<input type="hidden" id="phoneView" value="${memberDTO.member_phone}">
					<select name="phone1" style="width:70px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>-
					<input type="text" name="phone2" maxlength="4" size="10">-
					<input type="text" name="phone3" maxlength="4" size="10">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="hidden" id="emailView" value="${memberDTO.member_email}">
					<input type="text" name="email1">@
					<input type="text" id="email2" name="email2">
					<select id="email3" name="email3" style="width:100px;">
						<option value="0">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="1">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="취소" id="cancle_btn">
					<input type="button" value="수정" onclick="javascript:checkModify()">
				</td>
			</tr>
		</table>

		<a href="../index.jsp">메인으로</a>
		<input type="button" value="메인으로" onclick="location.href='../index.jsp'">
	</form>
</body>
</html>


