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
        if(originImgAddr == "" || originImgAddr == "none") {
        	$(".profileImg > img").attr("src", "/MyCGV/image/profile/none.png");
        } else {
        	$(".profileImg > img").attr("src", "/MyCGV/image/profile/"+originImgAddr);
        }
    });
})(jQuery);
</script>
</head>
<body>
		<div id="my-info-wrap">
			<div class="profile">
				<div class="profileImg">
					<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
					<img id="profile_img" src="" alt="${memberDTO.member_name}님 프로필 사진" 
					onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				</div>
				<div class="profileInfo">
					<div class="personInfo">
						<strong style="font-size: 40px;">${memberDTO.member_name}님</strong>&nbsp;
						<em>${memberDTO.member_id}</em><br><br>
						&nbsp;<span>닉네임 : ${memberDTO.nick_name}</span>&nbsp;
						<a href="myProfileForm.do"><strong>나의 프로필 수정</strong></a>
					</div>
					<div class="gradeInfo">
						<p>                     
	                         	고객님은 <strong class="txt-purple">${memberDTO.member_grade}</strong>등급 입니다.             
	                    </p>
                    </div>
				</div>
			</div>
			<div class="benefit">
				<div class="point">
					<div>
					<strong style="float: left;font-size: 35px;">MovieT POINT</strong>
			        <a href="myPointList.do?p=1" title="MovieT POINT 더보기">
			        <img alt="MovieT POINT 더보기" src="/MyCGV/image/mypage/1+.PNG"
			        		style="float:left;margin: 5px;margin-left: 5px;">
			        </a>
			        </div>
					<strong style="font-size: 20px;">사용가능 MovieT 포인트
					&nbsp;&nbsp;${memberDTO.saving_point}점</strong>
        		</div>	        
        		<!-- 자주가는 극장명 select count -->
		        <div class="col-favorite-theater">
	        		<h2>자주가는 MovieT</h2>
		    		<div class="sect-favorite">
			            <ul>
	                        <li><a href="#"><span>1</span>CGV남주안</a></li>
	                        <li><a href="#"><span>2</span>CGV인천</a></li>
	                        <li><a href="#"><span>3</span>CGV인천터미널</a></li>
	                        <li><a href="#"><span>4</span>CGV피카디리1958</a></li>
	                        <li><a href="#"><span>5</span></a></li>                       
			            </ul>       
			        </div>
	        	</div>
			</div>
		</div>
</body>
</html>