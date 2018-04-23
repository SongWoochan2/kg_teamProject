<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#paging {
		color: blue;
	}
		
	#currentPaging {
		color: red;
	}
	
	#entity{
		width: 33%;
		height: 250px;
		float: left;
		margin-left : 3px;
		margin-bottom: 5px;
	}
	#entity #movie_trailer_code{
		border-radius : 20px 20px 0px 0px;
		background-color : #e5fcd4;
		width: 100%;
		height: 8%;
		font-weight: bold;
	}
	#entity #movie_trailer_name{
		width: 100%;
		height: 12%;
		font-size : 18px;
		background-color : lightgray;
		font-weight: bold;
	}
	#entity #movie_trailer_name:hover{
		background-color: #ffffff;
	}
	#entity #movie_trailer_addr{
		width: 100%;
		height: 60%;
	}
	#entity #upload_date{
		font-size : 16px;
		padding-top : 2px;
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
		<div id="contain">
			<a id="admintitle">영화 트레일러 목록</a>
			<hr>
			<c:forEach var="movieTrailerDTO" items="${requestScope.list }" >
			<div id = "entity" class="warning">
				<div id = "movie_trailer_code">${movieTrailerDTO.movie_trailer_code}</div>
				<div id = "movie_trailer_name"><span class="glyphicon glyphicon-film"></span> ${movieTrailerDTO.movie_trailer_name}</div>
				<div id = "movie_trailer_addr">
						<iframe src="${movieTrailerDTO.movie_trailer_addr}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
				<div id = "upload_date"><span class="glyphicon glyphicon-time"></span> ${movieTrailerDTO.upload_date} &nbsp;&nbsp;&nbsp;&nbsp;
				<a href="movieTrailerDelete.do?movie_trailer_code=${movieTrailerDTO.movie_trailer_code}&movie_code=${requestScope.movie_code}&pg=${moviePage.pg }" 
				class="btn btn-info btn-lg">
         		<span class="glyphicon glyphicon-remove"></span> 삭제</a> </div>
			</div>
			</c:forEach>
			<table class="table table-hover">
				<tbody>
				<tr>
						<th colspan="5"><c:if test="${moviePage.startPage>1 }">
				[<a id="paging" href="movieTrailer.do?pg=${moviePage.startPage-1}&movie_code=${requestScope.movie_code}">이전</a>]
				</c:if> <c:forEach var="i" begin="${moviePage.startPage}"
								end="${moviePage.endPage}" step="1">
								<c:if test="${moviePage.startPage==i }">
				[<a id="currentPaging" href="movieTrailer.do?pg=${i }&movie_code=${requestScope.movie_code}">${i }</a>]
				</c:if>
								<c:if test="${moviePage.startPage!=i }">
				[<a id="paging" href="movieTrailer.do?pg=${i }&movie_code=${requestScope.movie_code}">${i }</a>]
				</c:if>
								<!-- el표현식에는 자바코드가 들어갈수없음 -->
							</c:forEach> <c:if test="${moviePage.endPage<moviePage.totalPage}">
				[<a id="paging" href="movieTrailer.do?pg=${moviePage.endPage+1}&movie_code=${requestScope.movie_code}">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 --></th>
				</tr>
				</tbody>
			</table>

			<a href="../movieTrailer/movieTrailerInsertForm.do?pg=${moviePage.pg }&movie_code=${requestScope.movie_code}"
				class="btn btn-primary">트레일러 등록</a>
		</div>
	</div>
</body>
</html>