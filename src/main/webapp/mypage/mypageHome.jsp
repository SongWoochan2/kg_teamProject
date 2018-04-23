<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt HOME</title>
<script type="text/javascript" src="../script/mypageScript.js?v=1"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="../main/main/header.jsp"></jsp:include>
		<div id="#mypageBody">
			<div id="my-info-wrap">
				<div class="profile">
					<div class="profileImg">
					</div>
					<div class="personInfo">
					<h2>${memberDTO.member_name}님</h2>&nbsp;<h5>${memberDTO.member_id}<br>
					닉네임 : ${memberDTO.nick_name}</h5>
					<a href="">프로필변경하기</a>
					</div>
					<div class="gradeInfo">
					${memberDTO.member_grade}
					</div>
				</div>
				<div class="benefit">
					<div class="point">
					${memberDTO.saving_point}
					</div>
					<div class="favorite-theater">
					자주가는 영화관
					</div>
				</div>
			</div>
			<div id="my-content-wrap">
				<div id="content-aside">
				<ul>
					<li><a href="mypageHome.do">MY MoveIt HOME</a></li>
					<li><a href="myReserveList.do">My 예매내역</a></li>
					<li><a href="myPoint.do">My 포인트</a></li>
					<li><a href="myStore.do">My 스토어</a></li>
					<li><a href="myWatchedMovieList.do">내가 본 영화</a></li>
					<li><a href="../member/confirmPwdModify.do">회원정보</a>
						<ul>
							<li><a href="../member/confirmPwdModify.do">개인정보 변경</a></li>
							<li><a href="../member/confirmPwdDelete.do">회원탈퇴</a></li>
						</ul>
					</li>
					<li><a href="myProfile.do">프로필 관리</a></li>
					<li><a href="">My 문의내역</a></li>
				</ul>
				</div>
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
						</div>
					</div>
					<div class="sect-content-reserve">
						<div class="title-mypage">
							<h3>MY 예매내역</h3>
							<p><em>건</em><a href="">예매내역 더보기</a></p>
							<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
						</div>
						<div class="box-inner">
						
						</div>
					</div>
					<div class="sect-content-buying">
						<div class="title-mypage">
							<h3>MY Q&amp;A</h3>
							<p><em>건</em><a href="">MY Q&amp;A 더보기</a></p>
						</div>
						<div class="box-inner">
						
						</div>
					</div>
					<div class="sect-content-inquiry">
						<div class="title-mypage">
		        			<h3>MY 구매정보</h3>
		        			<span>현재 사용하실 수 있는 쿠폰정보입니다. 상품명을 클릭하시면 내역조회페이지로 이동합니다.</span>
		   				</div>
						<div class="box-inner">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>