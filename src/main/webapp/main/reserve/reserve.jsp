<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/MyCGV/css/reserve/reserve.css" />
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
// 					alert(JSON.stringify(json.movies));
	
					var tmdpl = $("#movieTT").tmpl(json.movies);
					$("#top_movie_div2").empty().append(tmdpl); 

					$("input[name='movie_code'][value='"+movie_code+"']").prop("checked", true);
					
					
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
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
// 					alert(JSON.stringify(json.theaters));
	
					var tmdpl = $("#theaterTT").tmpl(json.theaters);
					$("#top_theater_div2").empty().append(tmdpl); 
					$("input[name='theater_code'][value='"+theater_code+"']").prop("checked", true);
					
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
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
// 					alert(JSON.stringify(json));
// 					alert(JSON.stringify(json.shows));

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
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
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
						console.log(JSON.stringify(json));
						var place_count = 0;
						$("#top_time_div2").empty();
						

						for(var i = 0; i < json.shows.length; i++){
							var show = json.shows[i];
							var show_place_code = Number(show.show_place_code);
							if(place_count != show_place_code){
								place_count = show_place_code;
								$("<div>").addClass("place_label").html(show.show_place_name).appendTo($("#top_time_div2"));
								$("<div>").addClass("place_totalSeat").html(" 총 " +show.totalSeat + "석").appendTo($("#top_time_div2"));
							}
							var tmpl = $("#showTT").tmpl(show);
							$("#top_time_div2").append(tmpl);
						} 
					},
					error : function(xhr, textStatus, errorThrown){
						alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
					}
				});
			}
		}
		function getSeatSelector(show_present_code){
			$.ajax({
				url : "/MyCGV/SeatView_ForReserve.do", // 나중에 사이트 url로 바뀜
				type : "get", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : {
					"show_present_code" : show_present_code,
				},
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#my_popup_div #popup_main").empty().append(html);
					
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
				}
			});
		}
		function chooseCount(){
			var count = 0;
			for(var i = 1; i <= 8; i++){
				if($("input[name='seat" + i + "']").val()){
					count++;
				}
			}
			return count;
		}
		function getTotalCost(){
			var box = $("#frame_bottom .inner_middle").empty();
			box.append("<strong></strong><br>");
			var totalCost = 0;
			
			for(var i = 1; i <= 8; i++){
				var seatOne = $("#reservingForm > input[name='seat"+i+"']");
				if(seatOne.attr("cost")){
					var seatCost = Number(seatOne.attr("cost"))
					box.append(" + " +seatOne.val() + " 좌석 가격 : " + seatCost + "<br>");
					totalCost += seatCost;
				}
			}
			
			box.find("strong").append("<strong>총 가격 : " + totalCost + "</strong>");
		}
	</script>
	<script type="text/javascript">
		var choose_count = 0;
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
			$(document).on("click", "input.show_choice", function(){
				getMovie();
				getTheater();
				getDateList();
			}); 
			
			getMovie();
			getTheater();
			getDateList();
			
			$(".b05_3d_roll").click(function(){
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
			
			var last_select;
			
			$(document).on("click", ".show_item input[name='show_present_code']", function(){
				last_select = $(this).parent().parent().attr("data");
				getSeatSelector(last_select);
				$("#my_popup_shadow").show(0);
				$("#my_popup_div").show(0);
			});

			$("#renew_my_popup").click(function(){
				getSeatSelector(last_select);
				$("#my_popup_shadow").show(0);
				$("#my_popup_div").show(0);
			});

			$("#close_my_popup, #my_popup_shadow").click(function(){
				$("#my_popup_shadow").hide(0);
				$("#my_popup_div #popup_main").empty();
				$("#my_popup_div").hide(0);
			});
			

			// 좌석을 눌렀을떄 처리
			$(document).on("click","#seatView div[name='seat']", function(){

				if($(this).attr("class") == "reserved" || $(this).attr("class") == "empty"){
					return;
				}
				
				var x_index= $(this).attr("col_number");
				var y_index= $(this).attr("row_number");
				
				//alert($(this).attr("choose"));    //seat_select_frame
				if($(this).attr("choose") == "y"){
					$("#reservingForm input[x_index='"+x_index+"'][y_index='"+y_index+"']").attr({
						"x_index": "",
						"y_index": "",
						"cost": ""
					}).val("");
					$(this).attr("choose", "n");
				} else {
					var full_count = $("input[name='total_seat_num']:checked").val();
					if(full_count == chooseCount()){
						alert("인원 수를 초과하였습니다.");
						return;
					}
					var cost = Number($("#seat_select_frame input[name='time_add_cost']").val()) +  Number($(this).attr("add_cost"));
					
					$(this).attr("choose", "y");
					$("#reservingForm input[x_index=''][y_index='']:eq(0)").attr({
						"x_index": x_index,
						"y_index": y_index,
						"cost": cost
					}).val(y_index + "-" + x_index);
				}
				
				console.log("count : " + chooseCount());
				
				getTotalCost();
				
				return;
				
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
				<label><input type="button" class="show_choice" name="show_present_code" value="\${show_time }시 \${show_minute }분">\${remainSeat }석</label>
			</div>
		</div>
	</script>
</head>
<body>
	<jsp:include page="/main/main/header.jsp"></jsp:include>

	<div class="div_top">
			<div id="top_movie">
				<div id="top_movie_div1">
					<p class="top_movie_div1_title"><strong>영화</strong></p>
				</div>
				<div id="top_movie_reset">
					<div class="button_base b05_3d_roll">
     					<div>선택해제</div>
        				<div>선택해제</div>
    				</div>
				</div>
				<div id="top_movie_div2">
	
				</div>
			</div>
			<div id="top_theater">
				<div id="top_theater_div1">
					<p class="top_movie_div1_title"><strong>극장</strong></p>
				</div>
				<div id="top_theater_reset">
					<div class="button_base b05_3d_roll">
     					<div>선택해제</div>
        				<div>선택해제</div>
    				</div>
				</div>
				<div id="top_theater_div2">
				
				</div>
			</div>
			<div id="top_date">
				<div id="top_date_div1">
					<p class="top_movie_div1_title"><strong>날짜</strong></p>
				</div>
				<div id="top_date_reset">
					<div class="button_base b05_3d_roll">
     					<div>선택해제</div>
        				<div>선택해제</div>
    				</div>
				</div>
				<div id="top_date_div2">
					
				</div>
			</div>
			<div id="top_time">
				<div id="top_time_div1">
					<p class="top_movie_div1_title"><strong>시간</strong></p>
				</div>
				<div id="top_time_div2">
				
				</div>
			</div>
	</div>

	<div id="my_popup_div">
		<div id="popup_title">
			<input type="button" id="renew_my_popup">
			<input type="button" id="close_my_popup">
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