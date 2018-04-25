<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieChart.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	$(function(){
		$("#chart").hover(function(){
			$("#off").attr("display","none");
			$("#on").attr("display","block");			
		},function(){
			$("#off").attr("display","block");
			$("#on").attr("display","none");			
		});
		$("#show").hover(function(){
			$("#show #off").attr("display","none");
			$("#show #on").attr("display","block");			
		},function(){
			$("#show #off").attr("display","block");
			$("#show #on").attr("display","none");			
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "moviechart">
		<div id="chart-title">
			<div id="title-name">
				무비차트
			</div>
			<div id="chart-type">
				<ul>
					<li id="chart"><a id = "off">무비차트</a><a id = "on">▶무비차트</a></li>				
					<li id="show"><a id = "off">상영예정작</a><a id = "on">▶상영예정작</a></li>
				</ul>
			</div>
		</div>
		<div id="chart-select">
			<div id = "select1">
				<input type = "checkbox" value=""> 현재 상영작만 보기
			</div>
			<div id = "select2">
				<select name = "chart_type">
					<option value="">예매율순</option>
					<option value="">평점순</option>
					<option value="">관람객순</option>					
				</select>
				<input type="button" value = "go" >
			</div>
		</div>
		<div id = "movierank">
			<div class="chart-hr">
				<hr>
			</div>
				<div id = "movie_top_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id = "entity-name">곡성</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "movie_top_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/Before I Go to Sleep_1.jpg">
					</div>
					<div id = "entity-name"><a href ="#">내가 잠들기 전에</a></div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "movie_top_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/img_1.jpg">
					</div>
					<div id = "entity-name"><a href ="#">파라노말 액티비티</a></div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "promotion">
					<img src = "../../image/storage/promotion.jpg">
				</div>
				<div class="chart-hr">
					<hr>
				</div>
				<div id = "movie_bottom_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id = "entity-name">곡성</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "movie_bottom_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id = "entity-name">곡성</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "movie_bottom_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id = "entity-name">곡성</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
				<div id = "movie_bottom_entity">
					<div id = "movie-rank">NO.</div>
					<div id = "movie-poster">
						<img src = "../../image/storage/moviephoto/the wailing_1.jpg">
					</div>
					<div id = "entity-name">곡성</div>
					<div id = "entity-reserve"><font>예매율</font> 0.0 %</div>
					<div id = "entity-opendate">2018.04.12 개봉</div>
					<div id = "entity-like">
						<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a> <b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
					</div>
				</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>