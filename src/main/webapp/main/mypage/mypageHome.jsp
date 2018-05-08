<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>MY MovieT HOME</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myContentAside.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypageHome.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li:eq(0)").attr("class", "on");	
		$(".set-btn button").click(function(){
			var result = confirm('예매를 정말 취소하시겠습니까?'); 
			if(result) { //yes 
            	$.ajax({
            		url: "./memReserveCancel.do?reserve_code="+$("#reserveCode").val(),
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
			} else {
				
			}	
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
				<div class="sect-content-movie">
					<div class="box-inner">
						<div class="box-inner-wishlist">
							<a href="myWishList.do" title="위시리스트">
								
							</a>
						</div>
						<div class="box-inner-watched">
							<a href="myWatchedMovie.do?p=1" title="내가 본 영화">
								<strong> </strong>
								
								
							</a>
						</div>
						<div class="box-inner-mystore">
							<a href="myStoreList.do?p=1" title="MY 스토어">
							<img alt="MY 스토어 더보기" src="/MyCGV/image/mypage/storeIcon.png"
							 style="width:'100px'; height:'100px'; margin-top: 10px;">
							<br><strong style="font-size:22px;font-weight: bold;">매점상품 기프트콘</strong>
            				<br>
							<strong style="font-size:22px;font-weight: bold;">${usableCnt}건</strong>
							</a>
        				</div>
						<!-- <div class="box-inner mvdiary">
            				<a href="" title="무비다이어리">
                				<span id="home_span3">관람 후 내 감상평을 적어 <br>추억하고 싶다면?</span>
           					</a>
        				</div> -->
					</div>
				</div>

				<div class="sect-content-reserve">
					<div class="title-mypage">
						<h3>MY 예매내역</h3><h4>${totalVal}건</h4>
						&nbsp;&nbsp;<a href="myReserveList.do?p=1" title="MY 예매내역 더보기">
						<img alt="MY 예매내역 더보기" src="/MyCGV/image/mypage/1+.PNG" style="display:inline;float:left;"></a>
						<p style="float:right;">예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</p>
					</div>
					<div class="box-inner">
						<!-- foreache문 시작 -->						
		                <div class="lst-item">
		                <c:if test="${empty reserveList}">
						<div class="box-set-info-nodata">고객님의 최근 예매내역이 존재하지 않습니다.</div>
						</c:if>
						<c:if test="${not empty reserveList}">
						<c:forEach var="memberReserveListDTO" items="${reserveList}">
						<div class="box-set-info">
		            	    <div class="box-number">
		            		    <strong>예매번호</strong><br>
		            		    <strong style="color:red;">${memberReserveListDTO.reserve_code}</strong><br>
		            		    (${memberReserveListDTO.show_date})
		            	    </div>
			                <div class="box-image">
			            	    <a href="/MyCGV/main/movie/movieDetailView.do?movie_code=${memberReserveListDTO.movie_code}&photo_pg=1&trailer_pg=1">
				            	    <span class="thumb-image"> 
				                        <img src="/MyCGV/image/storage/moviephoto/${memberReserveListDTO.movie_photo_addr}" 
				                        alt="${memberReserveListDTO.movie_name} 포스터" onerror="errorImage(this)"
				                        width="90px" height="130px">
				                    </span>        
				                </a>
			                </div>
			                <div class="box-contents">
			            	    <dl>
			            		    <dt>
	                                    <a href="/MyCGV/main/movie/movieDetailView.do?movie_code=${memberReserveListDTO.movie_code}&photo_pg=1&trailer_pg=1">
	                                    	${memberReserveListDTO.movie_name}</a>                                                                       
	                                </dt>	                            
				        		    <dd>
	                                    <strong>관람극장</strong>&nbsp;
	                                    <strong>${memberReserveListDTO.theater_name}</strong> 
	                                    <!-- <a href="/theaters/?theaterCode=0223">[극장정보]</a> -->
	                                </dd>
				        		    <dd>
	                                    <strong>관람일시</strong>&nbsp;
	                                    <strong>
	                                    	${memberReserveListDTO.show_date}&nbsp;
	                                        ${memberReserveListDTO.show_time}:${memberReserveListDTO.show_minute}
	                                    </strong>
	                                </dd>
			            	    </dl>
			                </div>
			                <div class="box-detail">
			            	    <div class="account-info">
				            	    <dl>
				            		    <dt>${memberReserveListDTO.count_seats}명</dt>
				            		    <dd>
				            		    	<strong style="color:blue;">${memberReserveListDTO.reserve_cost}원</strong>
	                                	</dd> 
				            	    </dl>
			            	    </div>
			            	    <div class="set-btn">
	                        		<input type="hidden" id="reserveCode" value="${memberReserveListDTO.reserve_code}">
	                        		<button type="button" data-status="1" class="round black cancel"><span>예매취소</span></button>     
			            	    </div>
			            	    <!-- 마이페이지 홈에서 예매취소했을 떄 -->
			                </div>
			        	</div>	        	
					</c:forEach>
					</c:if>
		            </div>
		            <!-- foreach문 끝 -->
              	</div>
			</div>
	
				<div class="sect-content-inquiry">
					<div class="title-mypage" style="height: 50px;line-height: 40px;padding-left: 10px;">
					<h3 style="display: inline;float: left;line-height: 40px;">MY Q&amp;A</h3>
						<h4>${totalA}건</h4>
						<a href="/MyCGV/main/inquiry/inquiryListMember.do?pg=1"><img id="title-mypage_em1_img2" src="/MyCGV/image/mypage/1+.PNG"></a>
					</div>
					<div class="box-inner">
						    <div class="tbl-data">
        <table>
		    <colgroup>
		        <col width="10%">
		        <col width="15%">
		        <col width="*">
		        <col width="20%">
		        <col width="15%">
		    </colgroup>
            <thead>
                <tr>
                    <th scope="col"><!-- <input type="checkbox" id="chkAllItem" name="chkAllItem"> -->
                    <label for="chkAllItem">번호</label></th>
                    <th scope="col">유형</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                    <th scope="col">상태</th>
                </tr>
            </thead>
            <tbody id="items">  
            	<c:if test="${empty list}">
            		<tr>
            			<td colspan="7" class="nodata">
							 고객님의 상담 내역이 존재하지 않습니다.
                    	</td>
            		</tr>
            	</c:if>
            	<c:if test="${not empty list}">
                <c:forEach var="inquiryDTO" items="${list}" varStatus="status">
                        <tr>
                            <td>
                                <%-- <input type="checkbox" name="chkItem" value="${inquiryDTO.inquiry_code}" id="chkItem${inquiryDTO.inquiry_code}"> --%>
                                <label for="chkItem${inquiryDTO.inquiry_code}"><em>${status.index+1}</em></label>
                            </td>
                            <td>${inquiryDTO.inquiry_type}</td>
                            <td>
                                <a id="titleA" href="inquiryView.do?inquiry_code=${inquiryDTO.inquiry_code}&pg=${param.pg}">
									${inquiryDTO.inquiry_title}
								</a>
                            </td>
                            <td><em>${inquiryDTO.inquiry_date}</em></td>
                            <td>
                            	<c:if test="${inquiryDTO.inquiry_status == 0}">
	                            <span class="round gray" style="font-weight: bold;color:gray;">
	                            	답변 미완료
	                            </span>
	                            </c:if>						
								<c:if test="${inquiryDTO.inquiry_status > 0}">
								<span class="round red on" style="font-weight: bold;color:red;">
									답변 완료
								</span>
								</c:if>
                            </td>   
                        </tr>
                </c:forEach>   

                </c:if>             
            </tbody>
        </table>
				
			</div>
			</div>
			</div>



        </div>
			</div> 
		</div>

	<div class="sect-base-booking">
	    <div class="box-polaroid">

	    </div>
    </div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
<div id="resultAlert"></div>
</body>
</html>