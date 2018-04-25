<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "mainpage">
		<div id = "mainback">
			<div id="main">
				<iframe src="https://www.youtube.com/embed/2nKntXg4KwM?ecver=1&autoplay=1&loop=1"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
		</div>
		<div id = "mainbottomback">
			현재 상영중인 영화 TOP3<hr>
			<div id = "mainbottom">
				<div id="entity">
					<div id="entity-poster">
						<img src = "../../image/storage/moviephoto/memento1.jpg">
					</div>
					<div id="entity-name">
						<a href="#">메맨토</a>
					</div>
					<div id="entity-opendate">
						2018.5.13 개봉
					</div>
					<div id="entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id="entity">
					<div id="entity-poster">
						<img src = "../../image/storage/moviephoto/Before I Go to Sleep_1.jpg">
					</div>
					<div id="entity-name">
						<a href="#">내가 잠들기 전에</a>
					</div>
					<div id="entity-opendate">
						2018.5.13 개봉
					</div>
					<div id="entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id="entity">
					<div id="entity-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id="entity-name">
						<a href="#">곡성</a>
					</div>
					<div id="entity-opendate">
						2018.5.13 개봉
					</div>
					<div id="entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>