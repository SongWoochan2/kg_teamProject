<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		height: 300px;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp" />
	<div id="content" align="center">
		<div id="contain">
			<form method="post" action="moviePhotoModifyForm.do">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th colspan="3">영화 사진 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="warning">영화 사진명</th>
							<td><input type="text" class="form-control" maxlength="30"
								value="${moviePhotoDTO.movie_photo_name }" disabled></td>
						</tr>
						<tr>
							<td><input type="hidden" name="pg"
								value="${requestScope.pg }"></td>
							<td><input type="hidden" name="movie_code"
								value="${moviePhotoDTO.movie_photo_code }"></td>
						</tr>
						<tr>
							<th class="warning">영화 사진</th>
							<td>
								<img src ="../image/storage/moviephoto/${moviePhotoDTO.movie_photo_code }">
							</td>
						</tr>
						<tr>
							<th class="warning">업로드날짜</th>
							<td><input type="text" class="form-control" name="upload_date"
								value="${moviePhotoDTO.upload_date }" disabled></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit"
								class="btn btn-primary pull-left" value="수정">
								<a href="moviePhotoDelete.do?movie_photo_code=${moviePhotoDTO.movie_photo_code}&pg=${requestScope.pg}"
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