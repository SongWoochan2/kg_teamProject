<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 링크를 클릭한 경우
		$("a.a").click(function() {
			// 배경 레이어를 화면에 표시한다.
			$("#glayLayer").fadeIn(300);
			// 이미지 레이어를 화면에 표시한다.
			$("#overLayer").fadeIn(200);
			
			$("#overLayer").html("<img src='" + $(this).attr("href") + "' />");
			// 링크의 페이지 이동 중단.
			return false;
		});
		
// 		$("#movie_photo_name").hover(function(){
// 			$("#movie_photo_name").html("gg");
// 		},function(){
// 			$("#movie_photo_name").html("g");
// 		});
		
		
		// (화면에 표시된) 배경 레이어를 클릭한 경우
		$("#glayLayer,#overLayer").click(function(){
			// 배경 레이어의 숨김
			$("#glayLayer").fadeOut(300);
			
			// 이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
		});
	});
</script>
<style type="text/css">
	#paging {
		color: blue;
	}
	
	#currentPaging {
		color: red;
	}
	/** 배경 레이어의 위치, 크기, 투명도 지정 > 기본적으로 표시되지 않도록 설정 */
	div#glayLayer {
		z-index : 2;
		display: none; position: fixed; left: 0; top: 0;
		height: 100%; width: 100%; background: black;
		filter: alpha(opacity=60); opacity: 0.60;
	}
	/** 이미지가 표현될 레이어를 화면 중앙에 배치 > 기본적으로 표시되지 않도록 설정 */ 
	#overLayer {
		height : 650px;
		width : 684px;
		z-index : 2;
		display: none; position: fixed;
		top: 50%; left: 50%;
		text-align: center;
		margin-top : -320px; margin-left: -340px;
	}
</style>

<style type="text/css">
	img{
		width : 100%;
		height : 100%;
	}

	#entity{
		width: 33%;
		height: 250px;
		float: left;
		margin-left : 3px;
		margin-bottom: 5px;
	}
	#entity #movie_photo_code{
		border-radius : 20px 20px 0px 0px;
		background-color : #e5fcd4;
		width: 100%;
		height: 8%;
		font-weight: bold;
	}
	#entity #movie_photo_name{
		width: 100%;
		height: 12%;
		font-size : 18px;
		background-color : lightgray;
		font-weight: bold;
	}
	#entity #movie_photo_name:hover{
		background-color: #ffffff;
	}
	#entity #movie_photo_addr{
		width: 100%;
		height: 60%;
	}
	#entity #upload_date{
		padding-top : 2px;
		font-size : 16px;
		width: 100%;
		height: 20%;
		background-color : #e5fcd4;
		font-weight: bold;
		border-radius: 0px 0px 20px 20px;
	}
	tr{
		background-color: #e5fcd4;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp" />
	<div id="content" align="center">
		<div id="contain" class = "container">
			<a id="admintitle">영화 사진 목록</a>
			<hr>
			<c:forEach var="moviePhotoDTO" items="${requestScope.list }" >
			<div id='glayLayer'></div><div id='overLayer' ></div>
			<div id = "entity" class="warning">
				<div id = "movie_photo_code">${moviePhotoDTO.movie_photo_code}</div>
				<div id = "movie_photo_name"><span class="glyphicon">&#xe060;</span> ${moviePhotoDTO.movie_photo_name} &nbsp;&nbsp;
				<a href="../image/storage/moviephoto/${moviePhotoDTO.movie_photo_addr}" class="a">
         		<span class="glyphicon glyphicon-picture"></span> 자세히보기 </a></div>
				<div id = "movie_photo_addr"><img src = "../image/storage/moviephoto/${moviePhotoDTO.movie_photo_addr}"></div>
				<div id = "upload_date"><span class="glyphicon glyphicon-time"></span> ${moviePhotoDTO.upload_date} &nbsp;&nbsp;&nbsp;&nbsp;
				<a href="moviePhotoDelete.do?movie_photo_code=${moviePhotoDTO.movie_photo_code}&movie_code=${requestScope.movie_code}&pg=${moviePage.pg }" 
				class="btn btn-info btn-lg">
         		<span class="glyphicon glyphicon-remove"></span> 삭제</a>
				</div>
			</div>
			</c:forEach>
			<table class="table table-hover">
				<tbody>
				<tr>
						<th colspan="5"><c:if test="${moviePage.startPage>1 }">
				[<a id="paging" href="moviePhoto.do?pg=${moviePage.startPage-1}&movie_code=${requestScope.movie_code}">이전</a>]
				</c:if> <c:forEach var="i" begin="${moviePage.startPage}"
								end="${moviePage.endPage}" step="1">
								<c:if test="${moviePage.startPage==i }">
				[<a id="currentPaging" href="moviePhoto.do?pg=${i }&movie_code=${requestScope.movie_code}">${i }</a>]
				</c:if>
								<c:if test="${moviePage.startPage!=i }">
				[<a id="paging" href="moviePhoto.do?pg=${i }&movie_code=${requestScope.movie_code}">${i }</a>]
				</c:if>
				<!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:forEach> <c:if test="${moviePage.endPage<moviePage.totalPage}">
				[<a id="paging" href="moviePhoto.do?pg=${moviePage.endPage+1}&movie_code=${requestScope.movie_code}">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 --></th>
					</tr>
				</tbody>
			</table>

			<a href="../moviePhoto/moviePhotoInsertForm.do?pg=${moviePage.pg }&movie_code=${requestScope.movie_code}"
				class="btn btn-primary">사진 등록</a>
		</div>
	</div>
</body>
</html>