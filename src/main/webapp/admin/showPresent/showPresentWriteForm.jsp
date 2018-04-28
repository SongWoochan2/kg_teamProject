<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/xdomain/jquery.xdomainajax.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			
			$.ajax({
				url : "/MyCGV/searchMovies.do",
				type : "get",
				dataType : "json",
				cache : false,
				timeout : 30000,
				success : function(json){
					//alert(JSON.stringify(json));
					var tmpl = $("#itemTemplate").tmpl(json.movie_list)
					$("#movie_select").append(tmpl);
					
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
			
			$("#serat_button").click(function(){
				$("#movie_select").empty();
				$.ajax({
					url : "/MyCGV/searchMovies.do",
					type : "get",
					dataType : "json",
					cache : false,
					data : {"movie_name" : $("input[name='movie_name']").val()},
					timeout : 30000,
					success : function(json){
						var tmpl = $("#itemTemplate").tmpl(json.movie_list)
						$("#movie_select").append(tmpl);
						
					},
					error : function(xhr, textStatus, errorThrown){
						$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
					}
				});
			});
			$('input[type=text]').on('keyup', function(e) {
			    if (e.which == 13) {
					$("#movie_select").empty();
					$.ajax({
						url : "/MyCGV/searchMovies.do",
						type : "get",
						dataType : "json",
						cache : false,
						data : {"movie_name" : $("input[name='movie_name']").val()},
						timeout : 30000,
						success : function(json){
							var tmpl = $("#itemTemplate").tmpl(json.movie_list);
							$("#movie_select").append(tmpl);
						},
						error : function(xhr, textStatus, errorThrown){
							$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
						}
					});
			    }
			});
			
			var today = new Date();
			
			var dd = today.getDate();
			var mm = today.getMonth();
			var yyyy = today.getFullYear();

    		var search_day = new Date(yyyy, mm, dd+${param.count});
	    	var search_yyyy = search_day.getFullYear();
	    	var search_mm = search_day.getMonth() + 1;
	    	var search_dd = search_day.getDate();
			$("#set_time_box input[name='year']").val(search_yyyy).html(search_yyyy);
			$("#set_time_box input[name='month']").val(search_mm).html(search_mm);
			$("#set_time_box input[name='day']").val(search_dd).html(search_dd);
			
			/* 
			$("#year_select").append( $("<option>").val(yyyy).html(yyyy) );
			$("#year_select").append( $("<option>").val(yyyy+1).html(yyyy+1) );

			var year = Number( $("#year_select > option:selected").val() );
			var month = Number( $("#month_select > option:selected").val() );
			var date = new Date(year, month, 0);
			var last_day = date.getDate();
			$("#day_select").empty();
			for(var i = 1; i <= last_day; i++){
				$("#day_select").append( $("<option>").val(i).html(i) );
			}
			
			$("#year_select, #month_select").change(function(){
				var year = Number( $("#year_select > option:selected").val() );
				var month = Number( $("#month_select > option:selected").val() );
				var date = new Date(year, month, 0);
				var last_day = date.getDate();
				$("#day_select").empty();
				for(var i = 1; i <= last_day; i++){
					$("#day_select").append( $("<option>").val(i).html(i) );
				}
			}); */
			
			
			// hour select 태그 option 생성
			for(var i = 5; i <= 27; i++){
				$("#hour_select").append( $("<option>").val(i).html(i) );
			}
			// minute select 태그 option 생성
			for(var i = 0; i <= 59; i+=5){
				$("#minute_select").append( $("<option>").val(i).html(i) );
			}
			
			// submit 
			$("#present_write_form").submit(function(){
				var result = confirm("등록하시겠습니까?");
				if(result){
					return true;
				} else {
					return false;
				}
			});
			
		});
	</script>
	
	<script type="text/x-jquery-tmpl" id="itemTemplate">
			<div class="movie_box">
				<div class="radio_box">
					<input type="radio" name="movie_code" value="\${movie_code}" required="required">
				</div>
				<div class="movie_name"><h3>\${movie_name}</h3></div><br>
				<div class="detail">
					<div class="movie_director">감독 : \${movie_director}</div><br>
					<div class="movie_recycle_time">상영시간 : \${movie_recycle_time}분</div><br>
					<div class="movie_open_date">개봉일 : \${movie_open_date}</div><br>
				</div>
			</div>
	</script>
	<style type="text/css">
		*{
			padding: 0;
			margin: 0;
		}
		label{
			margin: 30px 30px 30px 30px;
		}
		div{
			box-sizing: border-box;
		}
		#movie_list_box{
			margin: 0 auto;
			width: 800px;
		}
		#set_time_box input{
			width: 70px;
		}
		#movie_list_box fieldset{
			padding: 30px;
		}
		#movie_select{
			width: 100%;
			height: 700px;
			overflow-y: auto;
		}
		.movie_box{
			float: left;
			width: 50%;
			height: 200px;
			padding: 20px;
			border: 1px solid gray;
			background-color: #DDDDDD;
		}
		.movie_box .radio_box{
			height: 160px;
			width: 100px;
			text-align: center;
			line-height: 160px;
			float: left;
		}
		.movie_box input[type='radio']{
			width : 40px;
			height: 40px;
		}
		.movie_box .detail{
			padding-left: 20px;
		}
		#insert_div{
			text-align: right;
			float: right;
		}
		#insert_div > #insert_button{
			width: 80px;
			height: 50px;
			font-size: 30px;
			margin: 5px;
		}
		
	</style>
</head>
<body>
	<div id="movie_list_box">
		<form id="present_write_form" method="post" name="present_write_form" action="/MyCGV/showPresentWrite.do?sp_code=${param.sp_code }">
			<fieldset>
				<div id="insert_div">
					<input type="submit" id="insert_button" value="등록">
				</div>
				<legend>영화</legend>
				<div id="search">
					<label>
						영화검색 : <input type="text" name="movie_name">
						<input type="button" value="검색" id="search_button">
					</label><br>
				</div>
				<div id="set_time_box">
					<label>
						상영날짜 :
						<input type="text" name="year" readonly="readonly"> 년 
						<input type="text" name="month" readonly="readonly"> 월 
						<input type="text" name="day" readonly="readonly"> 일 
<!-- 						<select id="year_select" name="year" required="required"></select> 년  
						<select id="month_select" name="month" required="required">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> 월  
						<select id="day_select" name="day" required="required"></select> 일   -->
					</label><br>
					<label>
						상영시간 :
						<select id="hour_select" name="hour" required="required"></select> 시 
						<select id="minute_select" name=minute required="required"></select> 분 
					</label><br>
				</div>
				<div id="movie_select"></div>
			</fieldset>
		</form>
	</div>
</body>
</html>