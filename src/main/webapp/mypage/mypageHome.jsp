<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MovieT HOME</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="../css/mypage/myContentAside.css" />
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
						<div class="box-inner wishlist">
							<a href="#"  onclick="location.href='myWishList.do'" title="위시리스트">
								<span id="home_span1">보고 싶은 영화들을 <br>미리 담아두고 싶다면?</span>
							</a>
						</div>
						<div class="box-inner watched">
							<a href="" title="내가 본 영화">
								<span id="home_span2">관람한 영화들을 <br>한번에 모아 보고 싶다면?</span>
							</a>
						</div>
						<div class="box-inner mvdiary">
            				<a href="" title="무비다이어리">
                				<span id="home_span3">관람 후 내 감상평을 적어 <br>추억하고 싶다면?</span>
           					</a>
        				</div>
					</div>
				</div>
				<div class="mypage_bottom_div">
				<div class="sect-content-reserve">
					<div class="title-mypage">
						<h3 class="title-mypage_h3">MY 예매내역</h3>
							<em id="title-mypage_em1"> 건</em><a href=""><img id="title-mypage_em1_img1" src="/MyCGV/image/mypage/1+.PNG"></a>
						<div id="mypagehome_border1"><p id="mypagehome_border1_p">예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</p></div>
						<img src="/MyCGV/image/mypage/3.PNG">
					</div>
					<div class="box-inner">
		                <div class="lst-item">
		            	    <div class="box-number">
		            		    <em>예매번호</em>
		            		    <strong>0223-<i>0429-0374-260</i></strong>
		            		    <span>(2018.04.29)</span>
		            	    </div>
			                <div class="box-image">
			            	    <a href="/movies/detail-view/?midx=80585">
				            	    <span class="thumb-image"> 
				                        <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80585/80585_126.jpg" alt="어벤져스-인피니티 워 포스터" onerror="errorImage(this)">
				                    </span>
				                </a>
			                </div>
			                <div class="box-contents">
			            	    <dl>
			            		    <dt>
	                                    <a href="/movies/detail-view/?midx=80585">어벤져스-인피니티 워</a>
	                                                                       
	                                </dt>
	                            
				        		    <dd>
	                                    <em>관람극장</em> 
	                                    <strong>CGV 피카디리1958</strong> 
	                                    <a href="/theaters/?theaterCode=0223">[극장정보]</a>
	                                </dd>
				        		    <dd>
	                                    <em>관람일시</em>
	                                    <strong>2018.04.30(월) 20:00</strong>
	                                </dd>
			            	    </dl>
			                </div>
			                <div class="box-detail">
			            	    <div class="account-info">
				            	    <dl>
				            		    <dt> Prime석 일반 1</dt>
				            		    <dd>
				            		    	<em>신용카드</em>
				            		    	<strong class="txt-lightblue">11,000원</strong>
	                                	</dd> 
				            	    </dl>
			            	    </div>
			            	    <div class="set-btn">
	                                <input type="hidden" class="reserve-no" name="reserve-no" value="s5rlqSlwu7WcGSPnXdV6XfuZ1Gkf5/7ipXUdFHRMM7A=">
	                                <button type="button" title="새창" class="round inblack sendsmspopup"><span>문자보내기</span></button>
	                                <button type="button" data-status="94" class="round black cancel" onclick="noshowYN('N', '20180430' , '00' )"><span>예매취소</span></button>
			            	    </div>
			                </div>
		                </div>
                	</div>
				</div>
				<div class="sect-content-buying">
					<div class="title-mypage">
						<h3 class="title-mypage_h3">MY 구매정보</h3>
						<p id="mypagehome_border2_p">현재 사용하실 수 있는 쿠폰정보입니다. 상품명을 클릭하시면 내역조회페이지로 이동합니다.</p>
					</div>
					<img id="title-mypage_em1_img3_3" src="/MyCGV/image/mypage/5.png">
					<div class="box-inner"></div>
				</div>
				<div class="title-mypage">
						<h3 class="title-mypage_h3">MY Q&amp;A</h3>
							<em id="title-mypage_em2">건</em><a href=""><img id="title-mypage_em1_img2" src="/MyCGV/image/mypage/1+.PNG"></a>
					</div>
					<img id="title-mypage_em1_img2_2" src="/MyCGV/image/mypage/4.PNG">
			
				<div class="sect-content-inquiry">
					
					<div class="box-inner"></div>
				</div>

			</div> 
		</div>

				</div>
				
			</div> 


	<div class="sect-base-booking">
	    <div class="box-polaroid">

	    </div>
    </div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>