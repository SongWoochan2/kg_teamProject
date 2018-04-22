<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
thead {
	background-color: lightgray;
}

tbody {
	background-color: lightgray;
}
</style>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp" />
	<div id="content" align="center">
		<div id="contain">
			<form method="post" action="../movie/movieInsert.do">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th colspan="3">영화 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><input type="text" class="form-control"
								placeholder="영화 제목" maxlength="30" name="movie_name"
								required="required" autocomplete="off"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="hidden" name="pg"
								value="${requestScope.pg }"></td>
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control"
									placeholder="영화 줄거리" maxlength="1500"
									style="height: 300px; resize: none;" name="movie_content"
									required="required"></textarea></td>
						</tr>
						<tr>
							<td><input type="text" placeholder="제작국가" name="make_nation" required="required"></td>
							<td><input type="text" placeholder="영화감독"
								name="movie_director" required="required"></td>
							<td><input type="text" placeholder="영화재생시간"
								name="movie_recycle_time" required="required"></td>
						</tr>
						<tr>
							<td><select name="movie_show_grade_name">
									<option value="">--영화 상영 등급--
									<option value="all">전체이용가
									<option value="7years">7세 시청가
									<option value="12years">12세 이용가
									<option value="15years">15세 이용가
									<option value="18years">청소년 이용불가
									<option value="limitedrelease">제한 상영가
							</select></td>
							<td><select name="movie_type">
									<option value="">--영화 장르--
									<option value="SF">SF
									<option value="thriller">스릴러
									<option value="horror">공포/호러
									<option value="action">액션
									<option value="crime">범죄
									<option value="noir">느와르
									<option value="drama">드라마
									<option value="erotic">에로
									<option value="melo">멜로/로맨스
									<option value="comic">코미디
									<option value="family">가족
									<option value="fantasy">판타지
									<option value="war">전쟁
									<option value="sport">스포츠
									<option value="Documentary">다큐
							</select></td>
							<td><input type="date" name="movie_open_date" ></td>
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control"
									placeholder="출연배우진" maxlength="1500"
									style="height: 300px; resize: none;" name="appear_actor"
									required="required" required="required"></textarea></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit"
								class="btn btn-primary pull-right" value="등록하기"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>