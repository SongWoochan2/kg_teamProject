<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<style type="text/css">
	div{
		margin : auto;
	}
	
	#moviechart{
		height: 1200px;
		width: 1200px;
	}
	#moviechart #chart-title{
		width: 100%;
		height: 5%;
		
	}
	#moviechart .chart-hr hr{
		border: 4px double darkgray;
	}
	
	#moviechart #chart-title #title-name{
		width :70%;
		height : 100%;
		text-align: left;
		float: left;
		font-weight: bold;
		font-size : 35px;
	}
	#moviechart #chart-title #chart-type{
		padding : 20px 60px;
		width :30%;
		height : 100%;
		text-align: center;
		float: left;
	}
	#moviechart #chart-title #chart-type *{
		margin: 0;
		padding: 0;
	}
	#moviechart #chart-title #chart-type ul{
		width : 100%;
		height : 100%;
		list-style : none;
	}

	#moviechart #chart-title #chart-type ul li{
		float: left;
		width : 50%;
		height : 100%;
		position: relative;
		font-weight: bold;
	}
	#moviechart #chart-title #chart-type ul li #on{
		color : red;
		text-decoration : none;
	}
	#moviechart #chart-title #chart-type ul li #off{
		color : lightgray;
	}
	
	#moviechart #chart-select{
		width: 100%;
		height: 5%;
		float: left;
	}
	#moviechart #chart-select #select1{
		font-weight : bold;
		padding-top : 10px;
		height : 100%;
		width: 70%;
		float: left;
	}
	#moviechart #chart-select #select2{
		padding-top : 10px;
		text-align : center;
		height : 100%;
		width: 30%;
		float: left;
	}
	#moviechart #chart-select #select2 select{
		border-radius : 10px;
		width: 100px;
	}
	#moviechart #chart-select #select2 input[type='button']{
		background-color : white;
		border-radius : 10px;
		border: 3px solid #cccccc;
	}
	#moviechart #movierank{
		width: 100%;
		height: 90%;
	}
	#moviechart #movierank #movie_top_entity,#movie_bottom_entity, #promotion{
		float : left;
		width: 25%;
		height: 43%;
		padding: 10px 20px;
	}
	
	#moviechart #movierank #promotion img{
		padding : 30px 10px;
		background-color : black;
		width: 100%;
		height: 100%;
	}

	#moviechart #movierank #movie_top_entity #movie-rank{
		background-color : red;	
	}

	#moviechart #movierank #movie_bottom_entity #movie-rank{
		background-color : black;	
	}
	#moviechart #movierank *{
		text-align: center;
	}
	
	#moviechart #movierank #movie-rank{
		height: 8%;
		border : 4px double white;
		text-align: center;
		font-weight: bold;
		font-size: 20px;
		color: white;
	}
	#moviechart #movierank #movie-poster{
		height: 60%;
	}
	#moviechart #movierank #movie-poster img{
		width: 100%;
		height: 100%;
	}
	#moviechart #movierank #entity-name{
		font-size : 18px;
		font-weight : bold;	
		height: 6%;
	}
	#moviechart #movierank #entity-name a{
		color: darkgray;
		text-decoration: none;
	}
	#moviechart #movierank #entity-reserve{
		font-size : 14px;
		height: 5%;
	}
	#moviechart #movierank #entity-reserve font{
		font-size : 15px;
		font-weight : bold;	
		color : darkgray;
	}
	#moviechart #movierank #entity-opendate{
		font-weight : bold;
		font-size : 13px;
		height: 4%;
	}
	#moviechart #movierank #entity-like{
		padding-top : 5px;
		font-weight : 200;
		height: 17%;
	}
	#moviechart #movierank #entity-like #reserve-btn{
		width: 40%;
		background-color: #e02c14;
	}
	#moviechart #movierank #entity-like #reserve-btn:hover{
		background-color : red;
	}
</style>
</head>
<body>
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
</body>
</html>