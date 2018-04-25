<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
	object.value = object.value.slice(0, object.maxLength);
 	}
}
</script>
<style type="text/css">
thead {
	background-color: lightgray;
}

tbody {
	background-color: lightgray;
}	
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp" />
	<div id="content" align="center">
		<div id="contain">
			<form method="post" action="movieModify.do">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th colspan="3">영화 수정</th>
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
								value="${requestScope.pg }">
								<input type="hidden" name="movie_code"
								value="${requestScope.movie_code }"></td>
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control"
									placeholder="영화 줄거리" maxlength="1500"
									style="height: 300px; resize: none;" name="movie_content"
									required="required"></textarea></td>
						</tr>
						<tr>
							<td><input type="text" placeholder="제작국가" maxlength="15" name="make_nation" required="required"></td>
							<td><input type="text" placeholder="영화감독" maxlength="15"
								name="movie_director" required="required"></td>
							<td><input type="number" placeholder="영화재생시간" maxlength="3"
								name="movie_recycle_time" required="required" oninput = "maxLengthCheck(this);"></td>
						</tr>
						<tr>
							<td><select name="movie_show_grade_name">
									<option value="all">전체이용가
									<option value="7years">7세 시청가
									<option value="12years">12세 이용가
									<option value="18years">청소년 이용불가
									<option value="limitedrelease">제한 상영가
							</select></td>
							
							<td colspan="2"><input type="date" name="movie_open_date" required="required"></td>
						</tr>
						<tr>
							<td><select name="movie_type1">
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
							<td><select name="movie_type2">
									<option value="">--장르2--
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
							<td><select name="movie_type3">
									<option value="">--장르3--
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
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control"
									placeholder="출연배우진" maxlength="1500"
									style="height: 300px; resize: none;" name="appear_actor"
									required="required"></textarea></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit"
								class="btn btn-primary pull-right" value="수정하기"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>