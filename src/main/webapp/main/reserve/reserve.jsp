<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js?v=1"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
<!-- 	<link rel="stylesheet" href="/MyCGV/css/reserve/reserve.css" /> -->
	<script type="text/javascript">
		$(function(){
			function getMovie(){				
				$.ajax({
					url : "/MyCGV/movieList_forReserve.do", // 나중에 사이트 url로 바뀜
					type : "get", // 최종적으로 서버에 요청함
					dataType : "json",
					timeout : 30000, // 30초 (단위는 ms)
					cache : false,
					// 파일 읽기에 성공한 경우
					success : function(json){
						//alert(JSON.stringify(json));

						var tmpl = $("#MovieTemplate").tmpl(json.movies);
						$("#top_movie_div2").append(tmpl);
						
					},
					error : function(xhr, textStatus, errorThrown){
						$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
					}
				});
			}
			
			function getTheater(){
				$.ajax({
					url : "/MyCGV/theaterList_forReserve.do", // 나중에 사이트 url로 바뀜
					type : "get", // 최종적으로 서버에 요청함
					dataType : "json",
					timeout : 30000, // 30초 (단위는 ms)
					cache : false,
					// 파일 읽기에 성공한 경우
					success : function(json){
						//alert(JSON.stringify(json));

						var tmpl = $("#TheaterTemplate").tmpl(json.theaters);
						$("#top_movie_div2").append(tmpl);
					},
					error : function(xhr, textStatus, errorThrown){
						$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
					}
				});				
			}
			
			$.ajax({
				url : "/MyCGV/showList_forReserve.do", // 나중에 사이트 url로 바뀜
				type : "get", // 최종적으로 서버에 요청함
				dataType : "json",
				timeout : 30000, // 30초 (단위는 ms)
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(json){
					//alert(JSON.stringify(json));
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		
			
		});
	</script>
	<style type="text/css">
		div{
			box-sizing: border-box;
		}
		.div_top{
			text-align:center;
			width: 800px;
			height: 600px;
			margin: 0 auto;
			display: block;
		}
		#top_movie{
			margin:1px;
			width: 31%;
			height: 100%;
			float: left;
		}
			#top_movie_div1{
				border:1px solid white;
				background-color:#4C4C4C;
				color: #F3F3F3;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_movie_reset{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				width: 100%;
				height: 5%;
			}
			#top_movie_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 89%;
			}
				#top_movie_div2 .movie_item{
					border : 1px solid black;
					width: 100%;
					height: 40px;
				}
				#top_movie_div2 .movie_item .movie_code{
					width: 100%;
					height: 100%;
				}
				#top_movie_div2 .movie_item .movie_code input{
					text-align: center;
					width: 100%;
					height: 100%;
					font-weight: bold;
					font-size: 30px;
				}
				
		#top_theater{
			margin:1px;
			width: 22%;
			height: 100%;
			float: left;
		}
			#top_theater_div1{
				border:1px solid white;
				background-color:#4C4C4C;
				color: #F3F3F3;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_theater_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 94%;
			}
				#top_theater_div2 .theater_item{
					border : 1px solid black;
					width: 100%;
					height: 40px;
				}
				#top_theater_div2 .theater_item .theater_code{
					width: 100%;
					height: 100%;
				}
				#top_theater_div2 .theater_item .theater_code input{
					text-align: center;
					width: 100%;
					height: 100%;
					font-weight: bold;
					font-size: 30px;
				}
				
		#top_date{
			margin:1px;
			width: 12%;
			height: 100%;
			float: left;
		}
			#top_date_div1{
				border:1px solid white;
				background-color:#4C4C4C;
				color: #F3F3F3;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_date_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 94%;
			}
		#top_time{
			margin:1px;
			width: 34%; /* 여유 14%남음 */
			height: 100%;
			float: left;
		}
		
			#top_time_div1{
				border:1px solid white;
				background-color:#4C4C4C;
				color: #F3F3F3;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_time_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 94%;
			}
		.div_bottom{
			background-color:#242424;
			text-align:center;
			padding: 0% 15% 0% 18%;
			height: 125px;
		}
		#bottom_photo_title{
			color:#A6A6A6;
			border-left : 1px solid #FFFFF6;
			width: 19%;
			height: 100%;
			float: left;
		}
		#bottom_pack{
			color:#A6A6A6;
			border-left : 1px solid #FFFFF6;
			width: 19%;
			height: 100%;
			float: left;
		}
		#bottom_seat{
			color:#A6A6A6;
			border-left : 1px solid #FFFFF6;
			width: 19%;
			height: 100%;
			float: left;
		}
		#bottom_pay{
			color:#A6A6A6;
			border-left : 1px solid #FFFFF6;
			width: 19%;
			height: 100%;
			float: left;
		}
		#bottom_seat_choice{
			color:white;
			border-left : 1px solid #FFFFF6;
			border-right : 1px solid #FFFFF6;
			width: 19%;
			height: 100%;
			float: left;
		}
			
	</style>
	
	<script type="text/x-jquery-tmpl" id="MovieTemplate">
		<div class="movie_item">
			<div class="movie_code" data="\${movie_code }">
				<input type="button" name="movie_choice" value="\${movie_name }">
			</div>
			<div class="movie_show_grade_name" data="\${movie_show_grade_name }"></div>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl" id="TheaterTemplate">
		<div class="theater_item">
			<div class="theater_code" data="\${theater_code }">
				<input type="button" name="theater_choice" value="\${theater_name }">
			</div>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl" id="template">
		<tr>
			<td class="show_time">\${ show_time }시 \${show_minute}분</td>
			<td class="movie_name">\${ movie_name }</td>
			<td class="movie_recycle_time">\${movie_recycle_time} </td>
			<td class="movie_director">\${movie_director}</td>
			<td class="delete"><input type="button" name="delete_button" code="\${show_present_code}" value="삭제 하기"></td>
		</tr>
	</script>
</head>
<body>

	





	<jsp:include page="../main/header.jsp"></jsp:include>
	
	<div class="div_top">
		<div id="top_movie">
			<div id="top_movie_div1">
				<strong>영화</strong>
			</div>
			<div id="top_movie_reset">
				<input type="button" id="" value="전체">
			</div>
			<div id="top_movie_div2">

			</div>
		</div>
		<div id="top_theater">
			<div id="top_theater_div1">
				<strong>극장</strong>
			</div>
			<div id="top_theater_div2">
			
			</div>
		</div>
		<div id="top_date">
			<div id="top_date_div1">
				<strong>날짜</strong>
			</div>
			<div id="top_date_div2">
			
			</div>
		</div>
		<div id="top_time">
			<div id="top_time_div1">
				<strong>시간</strong>
			</div>
			<div id="top_time_div2">
			
			</div>
		</div>
	</div>

	<div class="div_bottom">
		<div id="bottom_photo_title">
			영화사진<br> 영화제목
		</div>
		<div id="bottom_pack">극장 @ 일시 @ 상영관 @ 인원 @</div>
		<div id="bottom_seat">좌석선택 //이미지처리</div>
		<div id="bottom_pay">결제 //이미지처리</div>
		<div id="bottom_seat_choice"><Strong>좌석선택-></Strong></div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>