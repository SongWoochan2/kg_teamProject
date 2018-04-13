<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#paging{
		color : blue;
	}
	#currentPaging{
		color : red;
	}
</style>
<body>
	<a id = "admintitle">영화 관리</a>
	<hr>
	<table class="table table-hover">
		<thead>
			<tr class="success">
				<th>no</th>
				<th>영화명</th>
				<th>감독</th>
				<th>상영등급</th>
				<th>개봉일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "movieDTO" items="${requestScope.list }">
			<tr class="warning">
				<td>${movieDTO.movie_code }</td>
				<td align="left">
				<a href = "movieView.do?movie_code=${movieDTO.movie_code }">${movieDTO.movie_name }</a></td>
				<td>${movieDTO.movie_director }</td>
				<td>${movieDTO.movie_show_grade }</td>
				<td>${movieDTO.movie_open_date }</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="5">
				<c:if test="${moviePage.startPage>1 }">
				[<a id="paging" href="movieAdmin.do?pg=${moviePage.startPage-1}">이전</a>]
				</c:if> 
				
				<c:forEach var="i" begin="${moviePage.startPage}" end="${moviePage.endPage}" step="1">
				<c:if test="${moviePage.startPage==i }">
				[<a id="currentPaging" href="movieAdmin.do?pg=${i }">${i }</a>]
				</c:if>
				<c:if test="${moviePage.startPage!=i }">
				[<a id="paging" href="movieAdmin.do?pg=${i }">${i }</a>]
				</c:if><!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:forEach>

				<c:if test="${moviePage.endPage<moviePage.totalPage}">
				[<a id="paging" href="movieAdmin.do?pg=${moviePage.endPage+1}">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 -->
				</th>
			</tr>
		</tbody>
	</table>

	<a href = "../admin/movieInsertForm.do?pg=${moviePage.startPage }" class = "btn btn-primary">등록</a>
</body>
</html>