<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   $(function() {
/*         $('#go_edit_profile').on('click', function () {
            var win = window.open("./editProfileForm.do", "profile", "left=0,top=o,width=445,height=440,toolbar=no,scrollbars=no");
            win.focus();
        }); */

        var originImgAddr = $("#origin_img_addr").val();
        if(originImgAddr == null || originImgAddr == 'none.png' || originImgAddr.includes("none.")) {
        	$(".profileImg > img").attr('src', '../image/profile/none.png');
        } else {
        	$(".profileImg > img").attr('src', '../image/profile/'+$(this));
        }
    });
</script>
</head>
<body>
		<div id="my-info-wrap">
			<div class="profile">
				<div class="profileImg">
					<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
					<img src="" alt="${memberDTO.member_name}님 프로필 사진" 
					onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				</div>
				<div class="profileInfo">
					<div class="personInfo">
						<strong>${memberDTO.member_name}님</strong>&nbsp;<em>${memberDTO.member_id}</em>
						&nbsp;<span>닉네임 : <i>${memberDTO.nick_name}</i></span>&nbsp;
						<a href="editProfileForm.do">나의 프로필 수정</a>
					</div>
					<div class="gradeInfo">
						<p style="margin-bottom:4px;color: #342929;
						font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;
						font-size: 20px;line-height: 20px;">                     
	                         	고객님은 <strong class="txt-purple">${memberDTO.member_grade}</strong>등급 입니다.             
	                    </p>
                    </div>
				</div>
			</div>
			<div class="benefit">
				<div class="point">
					<h3>MoveIt POINT</h3>
	        		<a href="myPointList.do">MoveIt POINT 더보기</a>
	        		<ul>
	        			<li>
	        				<strong>사용가능 MoveIt 포인트</strong>
	        				<span><em class="txt-maroon">${memberDTO.saving_point}</em> 점</span>
	        			</li>
	        		</ul>
        		</div>
				<div class="favorite-theater">자주가는 영화관</div>
			</div>
		</div>

</body>
</html>