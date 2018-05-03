<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<form name="memberWriteForm" method="post" action="memberWrite.do">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id">
					<input type="button" value="중복 확인" onclick="checkId()">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" placeholder="이름 입력"></td>
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
				<!-- <input type="date" name="member_birth"> -->
				<td>
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
					<input type="radio" name="member_gender" value="남자">남자
					<input type="radio" name="member_gender" value="여자">여자
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<input type="radio" name="member_agency" value="SKT">SKT
					<input type="radio" name="member_agency" value="KT">KT
					<input type="radio" name="member_agency" value="LGU+">LGU+
					<input type="radio" name="member_agency" value="알뜰폰">알뜰폰<br>
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
					<input type="reset" value="다시 작성">
					<input type="button" value="회원가입" onclick="javascript:checkWrite()">
				</td>
			</tr>
		</table>

		<input type="button" value="MoveIt 첫화면으로" onclick="location.href='index.do'">
	</form>
</body>
</html>


