<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
	object.value = object.value.slice(0, object.maxLength);
 	}
}
</script>
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
							<td><input type="text" placeholder="제작국가" name="make_nation" maxlength="15" required="required"></td>
							<td><input type="text" placeholder="영화감독" maxlength="15"
								name="movie_director" required="required"></td>
							<td><input type="number" placeholder="영화재생시간" maxlength="3"
								name="movie_recycle_time" required="required" oninput = "maxLengthCheck(this);"></td>
						</tr>
						<tr>
							<td><select name="movie_show_grade_name">
									<option value="전체이용가">전체이용가
									<option value="7세 시청가">7세 시청가
									<option value="12세 이용가">12세 이용가
									<option value="15세 이용가">15세 이용가
									<option value="청소년 이용불가">청소년 이용불가
									<option value="제한 상영가">제한 상영가
							</select></td>
							
							<td colspan="2"><input type="date" name="movie_open_date" required="required"></td>
						</tr>
						<tr>
							<td><select name="movie_type1">
									<option value="SF">SF
									<option value="스릴러">스릴러
									<option value="호러">호러
									<option value="액션">액션
									<option value="범죄">범죄
									<option value="느와르">느와르
									<option value="드라마">드라마
									<option value="에로">에로
									<option value="멜로">멜로
									<option value="코미디">코미디
									<option value="가족">가족
									<option value="판타지">판타지
									<option value="전쟁">전쟁
									<option value="스포츠">스포츠
									<option value="다큐">다큐
							</select></td>
							<td><select name="movie_type2">
									<option value="">--장르2--
									<option value="SF">SF
									<option value="스릴러">스릴러
									<option value="호러">호러
									<option value="액션">액션
									<option value="범죄">범죄
									<option value="느와르">느와르
									<option value="드라마">드라마
									<option value="에로">에로
									<option value="멜로">멜로
									<option value="코미디">코미디
									<option value="가족">가족
									<option value="판타지">판타지
									<option value="전쟁">전쟁
									<option value="스포츠">스포츠
									<option value="다큐">다큐
							</select></td>
							<td><select name="movie_type3">
									<option value="">--장르3--
									<option value="SF">SF
									<option value="스릴러">스릴러
									<option value="호러">호러
									<option value="액션">액션
									<option value="범죄">범죄
									<option value="느와르">느와르
									<option value="드라마">드라마
									<option value="에로">에로
									<option value="멜로">멜로
									<option value="코미디">코미디
									<option value="가족">가족
									<option value="판타지">판타지
									<option value="전쟁">전쟁
									<option value="스포츠">스포츠
									<option value="다큐">다큐
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
								class="btn btn-primary pull-right" value="등록하기"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>