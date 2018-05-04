<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 관리</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myContentAside.css" />
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li:eq(4)").attr("class", "on");
		var oldNick = $("#old_nick_name").val();
		if(oldNick!=null) {
			$("#nick_name").val(oldNick);
		} else {
			$("#nick_name").val("");
		}
		
		var img_addr = $("#img_addr").val();
		if(img_addr==null || img_addr=='none.png' || img_addr.includes("none.")) {
			$("#img_memprofileimage").attr("src", "/MyCGV/image/profile/none.png");	
		} else {
			$("#img_memprofileimage").attr("src", "/MyCGV/image/profile/"+img_addr);
			var button = $("<button type='button'>프로필이미지 삭제</button>"); 
			button.attr('id','delete_image');
			$(".profile-mask").append(button);
		}
		
        $('#delete_image').click(function () {
            if (!confirm('설정된 프로필 이미지를 삭제 하시겠습니까?'))
                return;

            $.ajax({
            	url: "./deleteProfileImg.do",
        		type: "post",
        		dataType: "html",
        		cache: false,
        		timeout: 30000,
        		success: function(data) {
                    $('#img_memprofileimage').attr('src', '/MyCGV/image/profile/none.png');
                    /* $('#user_small_image').val(''); */
                   	$("#img_addr").val("none.png");
                    $('#delete_image').remove();
                    $("#resultAlert").html(data);
        		},
        		error: function(xhr, textStatus, errorThrown) {
					$("div.tbl-form").html("<div>" + textStatus 
							  + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
            });
        });

        $('#check_duplication').on('click', function () {
            var _this = $(this);
            var nickNameObj = $('#nick_name');
            var newNick = nickNameObj.val();
            
            if (newNick == '') {
                alert('닉네임을 입력해 주세요.');
                return nickNameObj.focus();
            } else if (newNick == oldNick){
            	alert('입력하신 닉네임 정보는 사용가능한 정보 입니다.');
            } else {
            	$.ajax({
            		url: "./checkNickName.do?nick_name="+newNick,
            		type: "get",
            		dataType: "html",
            		cache: false,
            		timeout: 30000,
            		success: function(data) {
            			$("#resultAlert").html(data);
            		},
            		error: function(xhr, textStatus, errorThrown) {
    					$("div.tbl-form").html("<div>" + textStatus 
  							  + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
  					}
            	});
            }

        });
       /*  && $('#check_duplication').attr('data') != 1 */
        $('#set_profile').on('click', function () {
/*             if (oldNick != $('#nick_name').val()) {
                alert('닉네임 중복확인 해주세요.');
                $('#check_duplication').focus();
                return false;
            } */
        });


	});
})(jQuery);
	
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="mypageBody">
		<jsp:include page="./myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
			<div id="content-detail">
				<div class="tit-mypage" style="margin:10px;">
				    <h3>프로필 관리</h3>
				</div>
				<div class="tit-mypage" style="margin:10px;margin-top: 20px;">
				    <h4>나의 프로필 정보</h4>
				</div>
				<form name="myProfileForm" action="myProfile.do" method="post" enctype="multipart/form-data">
				<div class="tbl-form">
				    <table summary="나의 프로필정보:이름,아이디,닉네임,프로필이미지 표기"
				    style="line-height: 35px;">
				        <colgroup>
				        <col width="15%">
				        <col width="*">
				        </colgroup>
				        <tbody>
				            <tr>
				                <th scope="row">이름</th>
				                <td><strong>${memberDTO.member_name}</strong></td>
				            </tr>
				            <tr>
				                <th scope="row">아이디</th>
				                <td><strong>${memberDTO.member_id}</strong></td>
				            </tr>
				            <tr>
				                <th scope="row"><label for="nick_name">닉네임</label></th>
				                <td>
				                    <p>한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</p>
				                    <input type="hidden" id="old_nick_name" name="old_nick_name" value="${memberDTO.nick_name}"> 
				                    <input type="text" id="nick_name" name="nick_name" value="" required="required" maxlength="10"> 
				                    <button id="check_duplication" type="button"><span>중복확인</span></button>
				                </td>
				            </tr>
				            
				            <tr>
				                <th scope="row">프로필이미지</th>
				                <td>
				                    <p class="profile-info">
				                    	각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 등록하신 대표이미지가 노출됩니다.<br>프로필 이미지 종류를 선택해 주세요.</p>
				                    <input type="hidden" id="img_addr" name="img_addr" value="${memberDTO.profile_img_addr}">
				                    <div class="sect-profile-img">
				                        <div class="box-image">
				                            <span class="profile-image">
				                                <img id="img_memprofileimage" src="" width="150px" height="150px"
				                                alt="${memberDTO.member_name}님 프로필 사진" onerror="errorImage(this, {type:'profile'})">
				                                <span class="profile-mask"></span>
				                                
				                                
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
				<div class="set-btn aright" style="text-align: right;margin:10px;padding-right: 30px;">
				<button type="submit" id="set_profile"><span>등록하기</span></button>
				</div>
				<div id="resultAlert"></div>

				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>