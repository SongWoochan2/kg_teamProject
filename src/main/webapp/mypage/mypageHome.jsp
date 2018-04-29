<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MoveIt HOME</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypageHome.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
});
</script>
</head>
<body>
<jsp:include page="../main/main/header.jsp"></jsp:include>
		<jsp:include page="./myInfoWrap.jsp"></jsp:include>
		<div id="mypageBody">
		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
				<div id="content-detail">
				<div class="sect-content-movie">
					<div class="box-inner">
						<div class="box-innerwishlist">
							<a href="" title="위시리스트">
								<span id="home_span1">보고 싶은 영화들을 <br>미리 담아두고 싶다면?</span>
							</a>
						</div>
						<div class="box-innerwatched">
							<a href="" title="내가 본 영화">
								<span id="home_span2">관람한 영화들을 <br>한번에 모아 보고 싶다면?</span>
							</a>
						</div>
						<div class="box-innermvdiary">
            				<a href="" title="무비다이어리">
                				<span id="home_span3">관람 후 내 감상평을 적어 <br>추억하고 싶다면?</span>
           					 </a>
        				</div>
					</div>
				</div>
				<div class="mypage_bottom_div">
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
	</div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>