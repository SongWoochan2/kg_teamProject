<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
   $(function() {
/*         $('#go_edit_profile').on('click', function () {
            var win = window.open("./editProfileForm.do", "profile", "left=0,top=o,width=445,height=440,toolbar=no,scrollbars=no");
            win.focus();
        }); */
        
        var originImgAddr = $("#origin_img_addr").val();
        if(originImgAddr == null || originImgAddr == "none.png" || originImgAddr.includes("none.")) {
        	$(".profileImg > img").attr("src", "../image/profile/none.png");
        } else {
        	$(".profileImg > img").attr("src", "../image/profile/"+originImgAddr);
        }
    });
})(jQuery);
</script>
</head>
<body>
		<div id="my-info-wrap">
			<img src="">
			<div class="profile">
				<div class="profileImg">
					<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
					<img id="profile_img" src="" alt="${memberDTO.member_name}님 프로필 사진" 
					onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				</div>
				<div class="profileInfo">
					<div class="personInfo">
						<strong id="strong_tag1">${memberDTO.member_name}</strong><strong>님</strong>&nbsp;<em>${memberDTO.member_id}
						</em>
						&nbsp;<span>닉네임 : <i>${memberDTO.nick_name}</i></span>&nbsp;
						<a class="a_tag1" href="myProfileForm.do"><strong>나의 프로필 수정</strong></a>
					</div>
					<div class="gradeInfo">
						<p id="p_tag1">                     
	                         	고객님은 <strong class="txt-purple">${memberDTO.member_grade}</strong>등급 입니다.             
	                    </p>
                    </div>
				</div>
			</div>
			<div class="benefit">
				<div class="point">
	        		<a class="a_tag1" href="myPointList.do?p=1">MoveIt POINT 더보기</a>
	        		<ul>
	        			<li>
	        				<strong>사용가능 MoveIt 포인트</strong>
	        				<span><em class="txt-maroon">${memberDTO.saving_point}</em> 점</span>
	        			</li>
	        		</ul>
        		</div>
        		<div id="theater_class_bottom">
				<div class="favorite-theater"><strong>자주가는 영화관</strong></div>
				
				<div class="theater_class">
					<div class="theater_class_left">
						<div id="div_theater1">테스트1</div>
						<div id="div_theater3">테스트3</div>
						<div id="div_theater5">테스트5</div>
					</div>
				
					<div class="theater_class_rigth">
						<div id="div_theater2">테스트2</div>
						<div id="div_theater4">테스트4</div>
						<div id="div_theater6"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>