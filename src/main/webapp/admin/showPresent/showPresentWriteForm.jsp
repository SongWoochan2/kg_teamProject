<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/xdomain/jquery.xdomainajax.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
						//alert(JSON.stringify(json));
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
							//alert(JSON.stringify(json));
							var tmpl = $("#itemTemplate").tmpl(json.movie_list)
							$("#movie_select").append(tmpl);
							
						},
						error : function(xhr, textStatus, errorThrown){
							$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
						}
					});
			    }
			});

			$(".DatePicker").datepicker({
				changeYear : true,  // 년도 select 박스
				changeMonth : true,  // 월 select 박스
				showOn : "both",  // 모두 캘린더 표시
				buttonImageOnly : true, // 버튼에 이미지만 표시(... 생략)
				buttonimage : '이미지경로', // 버튼 이미지
				dateFormat : "yyyy-mm-dd", // 날짜 형식
				dayNamesMin : ['월','화','수','목','금','토','일'], // 요일 이름
				monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'], // 월 이름
				onSelect : function(selectedDate) {           // 날짜 선택시 실행(selectDate : 선택 날짜)
					// 선택한 날짜로 다른 datepicker 최소 선택 가능 날짜 설정
					$("#date2").datepicker("option", "minDate", selectedDate);
					// 선택한 날짜로 다른 datepicker 최대 선택 가능 날짜 설정
					$("#date3").datepicker("option", "maxDate", selectedDate); 
				}
			});
			
		});

	</script>
	
	<script type="text/x-jquery-tmpl" id="itemTemplate">
			<div class="movie_box">
				<label for="movie_code">
				<input type="radio" name="movie_code" value="\${movie_code}">
				<div class="movie_name"><h3>\${movie_name}</h3></div><br>
				<div class="movie_director">감독 : \${movie_director}</div><br>
				<div class="movie_recycle_time">상영시간 : \${movie_recycle_time}분</div><br>
				<div class="movie_open_date">개봉일 : \${movie_open_date}</div><br>
				</label>
			</div>
	</script>
	<style type="text/css">
		*{
			padding: 0;
			margin: 0;
		}
		div{
			box-sizing: border-box;
		}
		#movie_list_box{
			margin: 0 auto;
			width: 800px;
		}
		.movie_box{
			float: left;
			width: 50%;
			height: 200px;
			border: 1px solid gray;
			background-color: #DDDDDD;
		}
		
		input[name='movie_code']{
			height: 100%;
			width: 100px;
			float: left;
			
		}
	</style>
</head>
<body>
	<div id="movie_list_box">
		<fieldset>
			<legend>영화</legend>
			<div id="search">
				<label>
					영화검색 : <input type="text" name="movie_name">
					<input type="button" value="검색" id="serat_button">
				</label>
				
				<input type="text" class="DatePicker">
				<input type="text" id="date2">
				<input type="text" id="date3">
			</div>
			<div id="movie_select">
			</div>
		</fieldset>
	</div>
</body>
</html>