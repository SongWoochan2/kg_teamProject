function checkTheaterInsert(){
	if (document.theaterInsertForm.theater_name.value == ""){
		alert("극장제목 입력하세요.");
		document.theaterInsertForm.theater_name.focus();
	}else if (document.theaterInsertForm.theater_photo_addr.value == ""){
		alert("극장사진주소를 입력하세요.");
		document.theaterInsertForm.theater_photo_addr.focus();
	}else if (document.theaterInsertForm.theater_phone.value == ""){
		alert("극장번호를 입력하세요.");
		document.theaterInsertForm.theater_phone.focus();
	} else {
		document.theaterInsertForm.submit();
	}
}

function checkTheaterModify(){
	if (document.theaterModifyForm.theater_name.value == ""){
		alert("극장제목 입력하세요.");
		document.theaterModifyForm.theater_name.focus();
	}else if (document.theaterModifyForm.theater_photo_addr.value == ""){
		alert("극장사진주소를 입력하세요.");
		document.theaterModifyForm.theater_photo_addr.focus();
	}else if (document.theaterModifyForm.theater_phone.value == ""){
		alert("극장번호를 입력하세요.");
		document.theaterModifyForm.theater_phone.focus();
	} else {
		document.theaterModifyForm.submit();
	}
}

