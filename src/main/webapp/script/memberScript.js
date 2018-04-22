/**
 * 
 * 
 */

function checkWrite(){
	if(document.memberWriteForm.member_id.value==""){
		alert("아이디를 입력하세요.");
		document.memberWriteForm.member_id.focus();
	}else if(document.memberWriteForm.member_name.value==""){
		alert("이름을 입력하세요.");
		document.memberWriteForm.member_name.focus();
	}else if(document.memberWriteForm.member_pwd.value==""){
		alert("비밀번호를 입력하세요.");
		document.memberWriteForm.member_pwd.focus();
	}else if(document.memberWriteForm.member_pwd.value != document.memberWriteForm.member_repwd.value){
		alert("비밀번호가 맞지 않습니다.");
	}else{
		document.memberWriteForm.submit();
	}
}

function checkId(){
	var sId = document.memberWriteForm.member_id.value;
	
	if(sId == ""){
		alert("먼저 아이디를 입력하세요.");
	} else {
		window.open("checkMemberId.do?member_id=" + sId,"myId","width=350 height=100 left=500 top=200");
	}
}

function checkLogin(){
	if(document.memberLoginForm.member_id.value==""){
		alert("아이디를 입력하세요.");
		document.memberLoginForm.member_id.focus();
	}else if(document.memberLoginForm.member_pwd.value==""){
		alert("비밀번호를 입력하세요.");
	}else{
		document.memberLoginForm.submit();
	}
}

function checkModify(){
	if(document.memberModifyForm.member_pwd.value==""){
		alert("비밀번호를 입력하세요.");
		document.memberModifyForm.member_pwd.focus();
	}else if(document.memberModifyForm.member_pwd.value != document.memberModifyForm.member_repwd.value){
		alert("비밀번호가 맞지 않습니다.");
	}else{
		document.memberModifyForm.submit();
	}
}

function checkMemberPwd(){
	if(document.confirmMemberPwd.member_pwd.value==""){
		alert("비밀번호를 입력하세요.");
	}else{
		document.confirmMemberPwd.submit();
	}
}