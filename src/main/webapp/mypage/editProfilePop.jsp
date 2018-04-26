<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
        $('#btn_cancel').on('click', function () {
            window.close();
        });
		
		var originNick = $("#origin_nick").val();
		if(originNick!=null) {
			$("#nick_name").val(originNick);
		} else {
			$("#nick_name").val("");
		}
		
		var img_addr = $("#img_addr").val();
		alert(img_addr);
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
            $('#img_addr').attr('value', '');
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
})(jQuery);
	
</script>
</head>
<body>
	<h1>나의 프로필 수정</h1>
	<form name="editProfileForm" action="editProfile.do" method="post" enctype="multipart/form-data">
	<div class="sect-profile-modify">
		<div class="profile-name">
			<strong>${session.memName}</strong> 
			<em>${session.memId}</em>
		</div>
		<div class="profile-modify">
			<dl>
				<dt>
					<strong>닉네임</strong>
				</dt>
				<dd>
					<p>한글, 영문, 숫자 혼용 가능(한글 기준 10자 이내)</p>
					<p>
						<input type="hidden" id="origin_nick" name="origin_nick" 
						value="${memberDTO.nick_name}"> 
						<input type="text" id="nick_name" name="nick_name" value=""
							required="required" maxlength="10">
						<input type="button" id="check_duplication" value="중복확인">
					</p>
				</dd>
				<dt>
					<strong>프로필 이미지</strong>
				</dt>
				<dd>
					<input type="hidden" id="img_addr" name="img_addr" value="${memberDTO.profile_img_addr}">
					<!-- <input type="hidden" id="user_small_image" name="user_small_image" value=""> -->
					<div class="profile-mask">
						<img id="profile_image" src=""
							alt="${session.memName}님 프로필 사진" onerror="errorImage(this, {type:'profile'})">
					</div>
					<div class="profile-search">
						<p>JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</p>
						<input id="profile_upload_file" name="img"
							type="file" title="프로필사진 업로드">
					</div>
				</dd>
			</dl>
		</div>
	</div>
	<div class="set-btn">
		<input type="submit" id="save" value="등록하기">
		<input type="button" id="btn_cancel" value="취소">
	</div>
	<div id="checkNickName"></div>
	</form>
	
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt HOME</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
});
</script>
<style type="text/css">
#my-content-wrap > #content-detail {
	float: left;
	width: 80%;
	height: 100%;
}
div.sect-content-movie {
	width: 80%;
	height: 20%;
}
div.sect-content-movie div {
	float: left;
}

</style>
</head>
<body>
	<jsp:include page="../main/main/header.jsp"></jsp:include>
	<div id="mypageBody">
		<jsp:include page="./myInfoWrap.jsp"></jsp:include>

		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
			<div id="content-detail">
				<div class="sect-content-movie">
					<div class="box-inner">
						<div class="box-inner wishlist">
							<a href="" title="위시리스트">
								<h3>위시리스트</h3> 
								<span>보고 싶은 영화들을 <br>미리 담아두고 싶다면?</span>
							</a>
						</div>
						<div class="box-inner watched">
							<a href="" title="내가 본 영화">
								<h3>내가 본 영화</h3> 
								<span>관람한 영화들을 <br>한번에 모아 보고 싶다면?</span>
							</a>
						</div>
						<div class="box-inner mvdiary">
            				<a href="" title="무비다이어리">
                				<h3>무비다이어리</h3> 
                				<span>관람 후 내 감상평을 적어 <br>추억하고 싶다면?</span>
           					 </a>
        				</div>
					</div>
				</div>
				<div class="sect-content-reserve">
					<div class="title-mypage">
						<h3>MY 예매내역</h3>
						<p>
							<em>건</em><a href="">MY 예매내역 더보기</a>
						</p>
						<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
					</div>
					<div class="box-inner"></div>
				</div>
				<div class="sect-content-buying">
					<div class="title-mypage">
						<h3>MY 구매정보</h3>
						<span>현재 사용하실 수 있는 쿠폰정보입니다. 상품명을 클릭하시면 내역조회페이지로 이동합니다.</span>
					</div>
					<div class="box-inner"></div>
				</div>
				<div class="sect-content-inquiry">
					<div class="title-mypage">
						<h3>MY Q&amp;A</h3>
						<p>
							<em>건</em><a href="">MY Q&amp;A 더보기</a>
						</p>
					</div>
					<div class="box-inner"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html> --%>