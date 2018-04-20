<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
		background-color: lightgray;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp" />
	<div id="content" align="center">
		<div id="contain">
			<form method="post" action="movieModifyForm.do">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th colspan="3">영화 정보 조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="warning">영화 제목</th>
							<td><input type="text" class="form-control" maxlength="30"
								value="${movieDTO.movie_name }" disabled></td>
						</tr>
						<tr>
							<td><input type="hidden" name="pg"
								value="${requestScope.pg }"></td>
							<td><input type="hidden" name="movie_code"
								value="${movieDTO.movie_code }"></td>
						</tr>
						<tr>
							<th class="warning">영화 줄거리</th>
							<td><textarea class="form-control" maxlength="1500"
									style="height: 300px; resize: none;" name="movie_content"
									required="required" disabled>${movieDTO.movie_content }</textarea></td>
						</tr>
						<tr>
							<th class="warning">제작국가</th>
							<td><input type="text" class="form-control" name="make_nation"
								value="${movieDTO.make_nation }" disabled></td>
						</tr>
						<tr>
							<th class="warning">영화감독</th>
							<td><input type="text" class="form-control" name="movie_director"
								value="${movieDTO.movie_director }" disabled></td>
						</tr>
						<tr>
							<th class="warning">영화재생시간</th>
							<td><input type="text" class="form-control" name="movie_recycle_time"
								value="${movieDTO.movie_recycle_time }" disabled></td>
						</tr>
						<tr>
							<th class="warning">영화 상영 등급</th>
							<td><input type="text" class="form-control" name="movie_show_grade_name"
								value="${movieDTO.movie_show_grade_name }" disabled></td>
						</tr>
						<tr>
							<th class="warning">영화 장르</th>
							<td><input type="text" class="form-control" name="movie_type"
								value="${movieDTO.movie_type }" disabled></td>
						</tr>
						<tr>
							<th class="warning">영화 개봉일</th>
							<td><input type="text" class="form-control" name="movie_open_date"
								value="${movieDTO.movie_open_date }" disabled></td>
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control"
									placeholder="출연배우진" maxlength="1500"
									style="height: 300px; resize: none;" name="appear_actor"
									required="required" disabled>${movieDTO.appear_actor }</textarea></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit"
								class="btn btn-primary pull-left" value="수정">
								<a href = "../movieTrailer/movieTrailer.do?movie_code=${movieDTO.movie_code}&pg=1" class="btn btn-primary pull-left">트레일러 목록</a>
								<a href = "../moviePhoto/moviePhoto.do?movie_code=${movieDTO.movie_code}&pg=1" class="btn btn-primary pull-left">사진 목록</a>
								<a href="movieDelete.do?movie_code=${movieDTO.movie_code}&pg=${requestScope.pg}"
								class="btn btn-primary pull-right">삭제</a></td>
						</tr>
					</tbody>
				</table>
				<hr>
				
			</form>
		</div>
	</div>
</body>
</html>