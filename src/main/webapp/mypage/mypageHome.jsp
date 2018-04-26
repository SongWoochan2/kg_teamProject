<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt HOME</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
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
<<<<<<< HEAD

	<div id="#mypageBody">
		<div id="my-info-wrap">
			<div class="profile">
				<div class="profileImg">
					<input type="hidden" id="origin_img_addr" value="${memberDTO.profile_img_addr}">
					<img src="" alt="${memberDTO.member_name}님 프로필 사진" 
					onerror="errorImage(this, {'type':'profile'})" width="100px" height="100px">
				</div>
				<div class="profileInfo">
	<jsp:include page="../main/main/header.jsp"></jsp:include>
		<div id="#mypageBody">
			<div id="my-info-wrap">
				<div class="profile">
					<div class="profileImg">
					</div>
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
=======
	<jsp:include page="../main/main/header.jsp"></jsp:include>
	<div id="mypageBody">
	<jsp:include page="./myInfoWrap.jsp"></jsp:include>

>>>>>>> defdca56c32fd898989186adf4ee0b6b9c0db13c
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
<<<<<<< HEAD

	<jsp:include page="../main/main/footer.jsp"></jsp:include>

=======
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
>>>>>>> defdca56c32fd898989186adf4ee0b6b9c0db13c
</body>
</html>