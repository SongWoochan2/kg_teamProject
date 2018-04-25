<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div{
		margin : auto;
	}

	a{
		color:black;
	}
	
	#moviepage{
		background-image : url('../../image/storage/movieInfo.png');
		width: 1000px;
		height: 1800px;
	}
	#moviepage #pagenevi{
		padding-left : 10px;
		width: 100%;
		height: 1%;
		background-color: lightgray;
	}
	#moviepage #head-title{
		padding-top : 5px;
		font-size : 35px;
		font-weight : bold;
		width: 100%;
		height: 5%;
	}
	#moviepage #head-title hr{
		border-width: 4px;
		border-style: outset;
	}
	
	#moviepage #middle{
		width: 100%;	
		height: 16%;
	}
	
	#moviepage #middle #movieposter{
		padding : 3px;
		width: 20%;
		height: 100%;
		float: left;
	}
	#moviepage #middle #movieposter img{
		width: 100%;
		height: 100%;
	}
	#moviepage #middle #movieinfo{
		width: 79%;
		height: 100%;
		float: left;
	}
	#moviepage #middle #movieinfo *{
		padding-top : 7px;
		padding-left : 5px;
	}
	#moviepage #middle #movieinfo #movietitle{
		width: 100%;
		height: 25%;
	}
	#moviepage #middle #movieinfo #movietitle #title-font{
		font-size: 25px;
		font-weight: bold;
	}
	#moviepage #middle #movieinfo #moviescore{
		width: 100%;
		height: 25%;
	}
	#moviepage #middle #movieinfo #spec{
		font-size : 13px;
		font-weight : bold;
		width: 100%;
		height: 25%;
	}
	#moviepage #middle #movieinfo #like{
		width: 100%;
		height: 25%;
	}
	#moviepage #movietrailer{
		width: 100%;
		height: 20%;
	}
	#moviepage #movietrailer #trailer-title{
		padding-top : 10px;
		margin : 10px 30px;
		text-align : center;
		width: 94%;
		height: 18%;
		background-color: #cccccc;
	}
	#moviepage #movietrailer #trailer-content{
		width: 100%;
	}
	#moviepage #moviesteelcut{
		width: 100%;
		height: 30%;		
	}
	#moviepage #moviesteelcut #steelcut-title{
		padding-top : 10px;
		margin : 10px 30px;
		text-align : center;
		background-color: #cccccc;
		width: 94%;
		height: 12%;
	}
	#moviepage #moviesteelcut #steelcut-content{
		width: 100%;
	}
	#moviepage #moviereview{
		width: 100%;
		height: 28%;
	}
	#moviepage #moviereview #review-title{
		width: 100%;
		height: 7%;
	}
	#moviepage #moviereview #review-title *{
		height: 100%;
		font-weight : bold;
		font-size : 13px;
		padding-top: 5px;
	}
	#moviepage #moviereview #review-title #left{
		text-align : center;
		color : white;
		width:20%;
		float: left;
		background-color: darkgray;
	}
	#moviepage #moviereview #review-title #right{
		text-align : right;
		width:80%;
		float: right;
		background-color: lightgray;
	}
	#moviepage #moviereview #review-content{
		height: 93%;
		width: 100%;
	}
	#moviepage #moviereview #review-content #review-info{
		text-align :inherit;
		height: 50%;
		width: 50%;
		float: left;
	}
</style>
</head>
<body>
	<div id="moviepage">
		<div id = "pagenevi">
			<span class="glyphicon glyphicon-home"></span>
			<a href = "#">홈</a> > 영화 > <b>영화 상세</b>
		</div>
		<div id="head-title">
			 &nbsp;영화상세
			<hr>
		</div>
		<div id="middle">
			<div id="movieContent">
				<div id="movieposter">
					<img src="../../image/storage/moviephoto/img_1.jpg">
				</div>
				<div id=movieinfo>
					<div id="movietitle"> <div id = "title-font">램 페이지</div></div>
					<div id="moviescore"><font color="gray"><b>예매율 : </b></font>8%(실 관람객 : 20,000 명)</div>
					<div id="spec">감독 : / 배우 : <br>
					장르 : / 연령제한 : / 상영 시간 : / 제작국가 : <br>
					개봉 : </div>
					<div id="like">
						<a href="#" class="btn btn-info btn-lg">
          				<span class="glyphicon glyphicon-thumbs-down"></span> unLike 
          				<span class="glyphicon glyphicon-thumbs-up"></span> Like
       					 </a> <b>20,204</b> 명 &nbsp;&nbsp;&nbsp;
       					 <a href="#" class="btn btn-info btn-lg"><span class = "glyphicon glyphicon-phone-alt"></span> 예매하기</a>
					</div>
				</div>
			</div>
		</div>
		<div id="movietrailer">
			<div id = "trailer-title">
			<a href="#" class="btn btn-info btn-lg">
         		 <span class="glyphicon glyphicon-menu-left"></span>
        	</a>
			&emsp;<b>트레일러</b>&emsp;
			<a href="#" class="btn btn-info btn-lg">
          		<span class="glyphicon glyphicon-menu-right"></span>
        	</a>
			</div>
			<div id = "trailer-content"></div>
		</div>
		<div id="moviesteelcut">
			<div id = "steelcut-title">
			<a href="#" class="btn btn-info btn-lg">
         		 <span class="glyphicon glyphicon-menu-left"></span>
        	</a>
			&emsp;<b>스틸컷</b>&emsp;
			<a href="#" class="btn btn-info btn-lg">
          		<span class="glyphicon glyphicon-menu-right"></span>
        	</a>
			</div>
			<div id = "steelcut-content"></div>
		</div>
		<div id="moviereview">
			<div id = "review-title">
				<div id = "left">실관람객평점 ▶</div><div id="right">영화를 보시고 평점을 남겨주세요. <a href="#" class="btn btn-info btn-lg">평점 작성</a></div>
			</div>
			<div id = "review-content">
				<!-- 반복문 구간 -->
				<div id = "review-info">
					
				</div>
				<div id = "review-info">
				</div>
				<div id = "review-info">
				</div>
				<div id = "review-info">
				</div>
			</div>
		</div>
	</div>

</body>
</html>