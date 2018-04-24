<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<style type="text/css">
	div{
		margin : auto;
		border : 1px solid red;
	}

	
	#moviechart{
		height: 1200px;
		width: 1200px;
	}
	#moviechart .chart-hr{
		border: 4px double darkgray;
	}
	#moviechart #chart-title{
		width: 100%;
		height: 5%;
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
	#moviechart #chart-title #chart-type ul li .on{
		color : red;
		display: none;
		text-decoration : none;
	}
	#moviechart #chart-title #chart-type ul li .of{
		color : lightgray;
		display: block;
	}
	#moviechart #chart-title #chart-type ul li.chart{
		
	}
	#moviechart #chart-title #chart-type ul li.chart:hover{
	}
	#moviechart #chart-title #chart-type ul li.chart:hover > .on{
		display : block;
	}
	#moviechart #chart-title #chart-type ul li.chart:hover > .off{
		display : none;
	}
	#moviechart #chart-title #chart-type ul li.show{

	}
	#moviechart #chart-title #chart-type ul li.show:hover{
	}
	#moviechart #chart-title #chart-type ul li.show:hover > .on{
		display : block;
	}
	#moviechart #chart-title #chart-type ul li.show:hover > .off{
		display : none;
	}
	
	
	
	#moviechart #movierank{
		width: 100%;
		height: 90%;
	}
	#moviechart #movierank #movieentity{
		width: 25%;
		height: 50%;
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
					<li class="chart"><a class = "off">무비차트</a><a class = "on">▶무비차트</a></li>				
					<li class="show"><a class = "off">상영예정작</a><a class = "on">▶상영예정작</a></li>
				</ul>
			</div>
		</div>
		<div id = "movierank">
			<hr class="chart-hr">
				<div id = "movieentity">
					<div id = "movie-rank"></div>
					<div id = "movie-poster"></div>
					<div id = "entity-name"></div>
					<div id = "entity-reserve"></div>
					<div id = "entity-opendate"></div>
					<div id = "entity-like"></div>
				</div>
			<hr class="chart-hr">
				<div id = "movieentity">
					<div id = "movie-rank"></div>
					<div id = "movie-poster"></div>
					<div id = "entity-name"></div>
					<div id = "entity-reserve"></div>
					<div id = "entity-opendate"></div>
					<div id = "entity-like"></div>
				</div>
		</div>
	</div>
</body>
</html>