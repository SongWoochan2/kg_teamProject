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
			<form method="post" action="../moviePhoto/moviePhotoInsert.do" enctype="multipart/form-data" name="moviephotoWrite">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th colspan="3">영화 사진 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><input type="hidden" name="pg"
								value="${requestScope.pg }">
								<input type="hidden" name="movie_code"
								value="${requestScope.movie_code }">
								</td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" class="form-control"
								placeholder="영화 사진명" maxlength="30" name="movie_photo_name"
								required="required" autocomplete="off"></td>
						</tr>
						
						<tr>
							<td colspan="3"><input type="file" class="form-control"
							 maxlength="30" name="movie_photo_addr"
								required="required" autocomplete="off"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit"
								class="btn btn-primary pull-right" value="사진 등록하기"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>