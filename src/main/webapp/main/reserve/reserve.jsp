<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_movie_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 89%;
				overflow-y: auto;
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
				#top_movie_div2 .movie_item .movie_code label{
					text-align: center;
					width: 100%;
					height: 100%;
					font-weight: bold;
					font-size: 20px;
					line-height: 40px;
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
			#top_theater_reset{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_theater_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 89%;
				overflow-y: auto;
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
				#top_theater_div2 .theater_item .theater_code label{
					text-align: center;
					width: 100%;
					height: 100%;
					font-weight: bold;
					font-size: 20px;
					line-height: 40px;
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
			#top_date_reset{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 5%;
			}
			#top_date_div2{
				background-color:#FFFFF6;
				border : 1px solid #D5D5D5;
				float: left;
				width: 100%;
				height: 89%;
				overflow-y: auto; 
			}
				#top_date_div2 .month_label{
					border-top : 1px solid black;
					width: 100%;
					height: 40px;
					text-align: left;
					font-weight: bold;
					font-size: 20px;
					line-height: 40px;
				}
				#top_date_div2 .date_item{
					width: 100%;
					height: 40px;
				}
				#top_date_div2 .date_item .date_code{
					width: 100%;
					height: 100%;
				}
				#top_date_div2 .date_item .date_code label{
					text-align: center;
					width: 100%;
					height: 100%;
					font-weight: bold;
					font-size: 20px;
					line-height: 40px;
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
				#top_time_div2 .place_label{
					border-top : 1px solid black;
					width: 100%;
					height: 40px;
					text-align: left;
					font-weight: bold;
					font-size: 20px;
					line-height: 40px;
				}
				#top_time_div2 .show_item{
					width: 30%;
					height: 40px;
					float: left;
				}
				#top_time_div2 .show_item .show_present_code{
					width: 100%;
					height: 100%;
					margin-left: 5px; 
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
			
		#my_popup_div{
			position: fixed; 
			top: 50px;
			left: 25%; 
			width: 800px;
			height: 600px;
			z-index: 20;
		}
		#my_popup_div #popup_title{
			color: white;
			font-weight: bold;
			text-align: right;
			width: 100%;
			height: 5%;
		}
		#my_popup_div #popup_main{
			border: 1px solid gray;
			width: 100%;
			height: 95%;
		}
		
		#my_popup_shadow{
			position: fixed; left: 0; top: 0;
			height: 100%; width: 100%; background: black;
			filter: alpha(opacity=60); opacity: 0.60;
			z-index: 10;
		}
		
			
			
	</style>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<script type="text/javascript">
		function getMovie(){				
			$.ajax({
				url : "/MyCGV/movieList_forReserve.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "json",
				data : {
					"show_date" : show_date,
					"movie_code" : movie_code,
					"theater_code" : theater_code
				},
				timeout : 30000, // 30초 (단위는 ms)
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(json){
					//alert(JSON.stringify(json.movies));
	
					var tmdpl = $("#movieTT").tmpl(json.movies);
					$("#top_movie_div2").empty().append(tmdpl); 

					$("input[name='movie_code'][value='"+movie_code+"']").prop("checked", true);
					
					
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		}
		
		
		function getTheater(){				
			$.ajax({
				url : "/MyCGV/theaterList_forReserve.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				data : {
					"show_date" : show_date,
					"movie_code" : movie_code,
					"theater_code" : theater_code
				},
				dataType : "json",
				timeout : 30000, // 30초 (단위는 ms)
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(json){
					//alert(JSON.stringify(json.theaters));
	
					var tmdpl = $("#theaterTT").tmpl(json.theaters);
					$("#top_theater_div2").empty().append(tmdpl); 
					$("input[name='theater_code'][value='"+theater_code+"']").prop("checked", true);
					
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		}
		function getDateList(){				
			$.ajax({
				url : "/MyCGV/dateList_forReserve.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "json",
				timeout : 30000, // 30초 (단위는 ms)
				data : {
					"show_date" : show_date,
					"movie_code" : movie_code,
					"theater_code" : theater_code
				},
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(json){
					//alert(JSON.stringify(json));
					//alert(JSON.stringify(json.shows));
					var month_count = 0;
					var date_count = 0;
					$("#top_date_div2").empty();
					
					for(var i = 0; i < json.shows.length; i++){
						var date = new Date(json.shows[i].show_date);
						//alert( (date.getMonth()+1) + "/" + date.getDate() );
						
						if(month_count != date.getMonth()+1){
							month_count = date.getMonth()+1;
							$("#top_date_div2").append($("<div>").addClass("month_label").html(month_count + "월"));
						}
						if(date_count != date.getDate()){
							date_count = date.getDate();
							var month = month_count +"";
							var day = date_count + "";
							if(month_count < 10){
								month = "0" + month;
							}
							if(date_count < 10){
								day = "0" + day;
							}
							var arg = {
								show_date : date.getFullYear() + month + day,
								show_day : day,
								show_present_code : json.shows[i].show_present_code
							};
					 		var tmdpl = $("#dateTT").tmpl(arg);
							$("#top_date_div2").append(tmdpl);
					 		if(show_date == arg.show_date){
					 			tmdpl.find(".date_choice").prop("checked", true);
					 		}
						}
					} 
					
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		} 
		function getShowList(){	
			if(show_date != "" && movie_code != 0 && theater_code != 00){
				$.ajax({
					url : "/MyCGV/showList_forReserve.do", // 나중에 사이트 url로 바뀜
					type : "post", // 최종적으로 서버에 요청함
					dataType : "json",
					timeout : 30000, // 30초 (단위는 ms)
					data : {
						"show_date" : show_date,
						"movie_code" : movie_code,
						"theater_code" : theater_code
					},
					cache : false,
					// 파일 읽기에 성공한 경우
					success : function(json){
						//alert(JSON.stringify(json.shows));
						var place_count = 0;
						$("#top_time_div2").empty();
						

						for(var i = 0; i < json.shows.length; i++){
							var show = json.shows[i];
							var show_place_code = Number(show.show_place_code);
							if(place_count != show_place_code){
								place_count = show_place_code;
								$("<div>").addClass("place_label").html(show.show_place_name).appendTo($("#top_time_div2"));
							}
							var tmpl = $("#showTT").tmpl(show);
							$("#top_time_div2").append(tmpl);
						} 
					},
					error : function(xhr, textStatus, errorThrown){
						$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
					}
				});
			}
		}
		function getSeatSelector(show_present_code){
			$.ajax({
				url : "/MyCGV/SeatView_ForReserve.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : {
					"show_present_code" : show_present_code
				},
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#my_popup_div #popup_main").empty().append(html);
					
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		}
	</script>
	<script type="text/javascript">
		var show_date = "";
		var movie_code = 0;
		var theater_code = 0;
		
		$(function(){
			$(document).on("click", "input.movie_choice", function(){
				movie_code = $(this).val();
				getTheater();
				getDateList();
				getShowList();
			});
			$(document).on("click", "input.theater_choice", function(){
				theater_code = $(this).val();
				getMovie();
				getDateList();
				getShowList();
			}); 
			$(document).on("click", "input.date_choice", function(){
				show_date = $(this).val();	
				getMovie();
				getTheater();
				getShowList();
			}); 
			
			getMovie();
			getTheater();
			getDateList();
			
			
			
			
			getSeatSelector();
			
			$("input.reset_choice").click(function(){
				var choice = $(this).parent().parent().find("input[type='radio']:checked");
				choice.prop("checked", false);
				
				var div_id = $(this).parent().attr("id");
				if(div_id == "top_movie_reset"){
					movie_code = 0;
					getTheater();
					getDateList();
					getShowList();
				} else if(div_id == "top_theater_reset"){
					theater_code = 0;					
					getMovie();
					getDateList();
					getShowList();
				} else if(div_id == "top_date_reset"){
					show_date = "";				
					getMovie();
					getTheater();
					getShowList();
				}
				$("#top_time_div2").empty();

				//alert(movie_code + " / " + theater_code + " / " + show_date);
			});
			
			
			
		});
	</script>
	
	<script type="text/x-jquery-tmpl" id="movieTT">
		<div class="movie_item">
			<div class="movie_code" data="\${movie_code }">
				<label><input type="radio" class="movie_choice" name="movie_code" value="\${movie_code }">\${movie_name }</label>
			</div>
		</div>
	</script>
	<script type="text/x-jquery-tmpl" id="theaterTT">
		<div class="theater_item">
			<div class="theater_code" data="\${theater_code }">
				<label><input type="radio" class="theater_choice" name="theater_code" value="\${theater_code }">\${theater_name }</label>
			</div>
		</div>
	</script>
	<script type="text/x-jquery-tmpl" id="dateTT">
		<div class="date_item">
			<div class="date_code" data="\${show_date }">
				<label><input type="radio" class="date_choice" name="show_date" value="\${show_date }">\${show_day }일</label>
			</div>
		</div>
	</script>
	<script type="text/x-jquery-tmpl" id="showTT">
		<div class="show_item">
			<div class="show_present_code" data="\${show_present_code }">
				<label><input type="button" class="show_choice" name="show_present_code" value="\${show_time }:\${show_minute }">\${left_seat }석</label>
			</div>
		</div>
	</script>
</head>
<body>
	<jsp:include page="/main/main/header.jsp"></jsp:include>

	<div class="div_top">
		<div id="top_movie">
			<div id="top_movie_div1">
				<strong>영화</strong>
			</div>
			<div id="top_movie_reset">
				<input type="button" class="reset_choice" value="선택 해제">
			</div>
			<div id="top_movie_div2">

			</div>
		</div>
		<div id="top_theater">
			<div id="top_theater_div1">
				<strong>극장</strong>
			</div>
			<div id="top_theater_reset">
				<input type="button" class="reset_choice" value="선택 해제">
			</div>
			<div id="top_theater_div2">
			
			</div>
		</div>
		<div id="top_date">
			<div id="top_date_div1">
				<strong>날짜</strong>
			</div>
			<div id="top_date_reset">
				<input type="button" class="reset_choice" value="선택 해제">
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
	
	<div id="my_popup_div">
		<div id="popup_title">
			<input type="button" value="새로고침">
			<input type="button" value="닫기">
		</div>
		<div id="popup_main">
		</div>
	</div>
	<div id="my_popup_shadow"></div>
	
	<br>
	<br>
	<br>
	<jsp:include page="/main/main/footer.jsp"></jsp:include>
</body>
</html>