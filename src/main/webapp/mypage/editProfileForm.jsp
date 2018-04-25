<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		var originNick = $("#origin_nick").val();
		if(originNick!=null) {
			$("#nick_name").val(originNick);
		} else {
			$("#nick_name").val("");
		}
		
		var img_addr = $("#img_addr").val();
		if(img_addr!=null) {
			$("#profile_image").attr("src", "../image/profile/\${memberDTO.profile_img_addr}");
			var button = $("<input type='button'>"); 
			button.attr('id','delete_image');
			button.val('프로필이미지 삭제');
			$(".profile-mask").append(button);
		} else {
			$("#profile_image").attr("src", "../image/profile/none.png");
		}
		
        $('#delete_image').on('click', function () {
            if (!confirm('설정된 프로필 이미지를 삭제 하시겠습니까?'))
                return;

            $('#profile_image').attr('src', '');
            /* $('#user_small_image').val(''); */
            $('#img_addr').val('');
            $('#delete_image').remove();
        });
		

    

        $('#check_duplication').on('click', function () {
            var _this = $(this);
            var nickNameObj = $('#nick_name');
            var newNick = nickNameObj.val();
            
            if (nickNameObj.val() == '') {
                alert('닉네임을 입력해 주세요.');
                return nickNameObj.focus();
            }
            
            $.ajax({
				url: "./checkNickName.do",
				type: "get",
				data: {"nickName": nickNameObj.val()},
				dataType: "json",
				cache: false,
				timeout: 30000,
				success: function(responseData){
					//nickNameObj.remove();

		           	var data = responseData.json;
		           
		            if(data=="-1"){
		                alert("오류가 발생하였습니다.");
		                _this.attr('data', 0);
		                return false;
		            } else if(data=="0"){
		            	alert('이미 사용중인 닉네임입니다.');
		            	nickNameObj.focus();
			            _this.attr('data', 0);
		           	} else if(data=="1"){
		           	 	alert('사용가능한 닉네임입니다.');
		           	 	_this.attr('data', 1);
		           	 	nickNameObj.val(newNick);
		           	}
		           /*  var html = "";
		            html += "<input type='text' id='nick_name' name='nick_name' value=''
						required='required' maxlength='10'>";
		            
		            $("#origin_nick").after(html); */
				},
				error: function(xhr, textStatus, errorThrown) {
					$("div .profile-modify").html("<div>" + textStatus 
							  + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
    

        });

        $('#save').on('click', function () {
            if ($('#origin_nick').val() != $('#nick_name').val() && $('#check_duplication').attr('data') != 1) {
                alert('닉네임 중복확인 해주세요.');
                $('#check_duplication').focus();
                return false;
            }
        });


	});

	
</script>
</head>
<body>
<form name="editProfileForm" action="editProfile.do" method="post" enctype="multipart/form-data" novalidate="novalidate">
<div class="tbl-form">
    <table summary="나의프로필정보 이름,아이디, 닉네임,프로필이미지 표기">
        <caption>나의프로필정보</caption>
        <colgroup>
        <col width="19%">
        <col width="*">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row">이름</th>
                <td><strong>김한빛나</strong></td>
            </tr>
            <tr>
                <th scope="row">아이디</th>
                <td><strong>hanstar1215</strong></td>
            </tr>
            <tr>
                <th scope="row"><label for="nick_name">닉네임</label></th>
                <td>
                    <p>한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</p>
                    <input type="hidden" id="old_nick_name" name="old_nick_name" value="봄빛"> 
                    <input type="text" id="nick_name" name="nick_name" value="봄빛" required="required" maxlength="10" class="s-medium"> 
                    <button id="check_duplication" type="button" class="round gray"><span>중복확인</span></button>
                </td>
            </tr>
            
            <tr>
                <th scope="row">프로필이미지</th>
                <td>
                    <p class="profile-info">각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 등록하신 대표이미지가 노출됩니다.<br>프로필 이미지 종류를 선택해 주세요.</p>
                    <input type="hidden" id="user_image" name="user_image" value="http://img.cgv.co.kr/MyCGV/Profile/2018/0424/2018042404472439.jpg">
                    <input type="hidden" id="user_small_image" name="user_small_image" value="http://img.cgv.co.kr/MyCGV/Profile/2018/0424/Thumb/2018042404472439.jpg">
                    <div class="sect-profile-img">
                        <div class="box-image">
                            <span class="thumb-image">
                                <img id="img_userprofileimage" src="http://img.cgv.co.kr/MyCGV/Profile/2018/0424/Thumb/2018042404472439.jpg" alt="김한빛나님 프로필 사진" onerror="errorImage(this, {type:'profile'})">
                                <span class="profile-mask"></span>
                                
                                <button type="button" id="delete_image" class="btn-del">프로필이미지 삭제</button>
                                
                            </span>
                        </div>
                        <div class="box-contents">
                            
                            
                            
                            <p>jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
                            <input type="file" id="profile_upload_file" name="profile_upload_file" title="내용">
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="set-btn aright"><button type="submit" id="set_profile" class="round inred on"><span>등록하기</span></button></div>
</form>
</body>
</html>